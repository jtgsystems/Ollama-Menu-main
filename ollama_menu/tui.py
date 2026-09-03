import sys
import subprocess
import shutil
from rich.console import Console
from rich.panel import Panel
from rich.table import Table
from rich.prompt import Prompt
from .models import MODEL_REGISTRY, get_categories, get_models_by_category, search_models
from .hardware import probe_hardware, evaluate_model_fit

console = Console()

def render_banner(hw):
    vram_str = f"{hw.vram_free_gb:.1f} GB Free / {hw.vram_total_gb:.1f} GB Total" if hw.gpu_vendor != "CPU" else f"{hw.available_ram_gb:.1f} GB RAM Free"
    console.print(Panel.fit(
        f"[bold cyan]🦙 OLLAMA MODEL SELECTOR & LAUNCHER (v4.0 SOTA 2026)[/bold cyan]\n"
        f"[bold white]GPU:[/bold white] [green]{hw.gpu_name}[/green] ({hw.gpu_vendor}) | [bold white]VRAM:[/bold white] [yellow]{vram_str}[/yellow] | [bold white]RAM:[/bold white] [magenta]{hw.available_ram_gb:.1f}/{hw.total_ram_gb:.1f} GB[/magenta]\n"
        f"[dim white]Developed by JTG Systems • https://jtgsystems.com[/dim white]",
        border_style="cyan"
    ))

def list_installed_models():
    console.print("\n[bold green]📦 Installed Local Ollama Models:[/bold green]")
    try:
        subprocess.run(["ollama", "list"])
    except Exception as e:
        console.print(f"[bold red]Error running ollama list: {e}[/bold red]")

def update_installed_models():
    console.print("\n[bold yellow]🔄 Updating Installed Models...[/bold yellow]")
    try:
        out = subprocess.check_output(["ollama", "list"], text=True)
        lines = out.strip().splitlines()[1:]
        for l in lines:
            if not l.strip(): continue
            model_name = l.split()[0]
            console.print(f"[cyan]Pulling latest {model_name}...[/cyan]")
            subprocess.run(["ollama", "pull", model_name])
        console.print("[bold green]✓ All installed models are up-to-date![/bold green]")
    except Exception as e:
        console.print(f"[bold red]Error updating models: {e}[/bold red]")

def run_model(model_id: str):
    console.print(f"\n[bold green]🚀 Launching {model_id}...[/bold green]\n")
    try:
        subprocess.run(["ollama", "run", model_id])
    except Exception as e:
        console.print(f"[bold red]Error running model {model_id}: {e}[/bold red]")

def show_models_table(models, hw, title="Available AI Models"):
    table = Table(title=f"[bold green]{title}[/bold green]", border_style="blue")
    table.add_column("No.", style="cyan", justify="center")
    table.add_column("Model Name", style="bold white")
    table.add_column("Size", style="yellow", justify="center")
    table.add_column("Hardware Fit", justify="center")
    table.add_column("Ollama ID", style="magenta")
    table.add_column("Description", style="dim white")
    
    for idx, m in enumerate(models, 1):
        fit_status = evaluate_model_fit(m.min_vram_gb, hw)
        table.add_row(str(idx), m.name, m.params, fit_status, m.id, m.description)
        
    console.print(table)
    return models

def browse_category(cat: str, hw):
    models = get_models_by_category(cat)
    displayed = show_models_table(models, hw, f"{cat} Models")
    
    choice = Prompt.ask(f"[bold cyan]Enter model number to launch (1-{len(displayed)}) or [q] Back[/bold cyan]", default="q").strip()
    if choice.lower() != "q":
        try:
            idx = int(choice) - 1
            if 0 <= idx < len(displayed):
                run_model(displayed[idx].id)
        except ValueError:
            pass

def interactive_menu():
    hw = probe_hardware()
    while True:
        console.clear()
        render_banner(hw)
        
        categories = get_categories()
        
        menu_table = Table(border_style="bright_blue", title="[bold yellow]Model Categories & Tools[/bold yellow]")
        menu_table.add_column("Key", style="bold green", justify="center")
        menu_table.add_column("Category / Action", style="bold white")
        menu_table.add_column("Count", style="cyan", justify="center")
        
        for idx, cat in enumerate(categories, 1):
            count = len(get_models_by_category(cat))
            menu_table.add_row(str(idx), cat, f"{count} models")
            
        menu_table.add_row("s", "[bold yellow]Search All Models (by keyword/tag)[/bold yellow]", f"{len(MODEL_REGISTRY)} models")
        menu_table.add_row("l", "[bold cyan]List Installed Local Models (`ollama list`)[/bold cyan]", "-")
        menu_table.add_row("u", "[bold magenta]Update All Installed Models (`ollama pull`)[/bold magenta]", "-")
        menu_table.add_row("q", "[dim]Quit[/dim]", "-")
        
        console.print(menu_table)
        
        choice = Prompt.ask("[bold cyan]Enter selection[/bold cyan]", default="1").strip().lower()
        
        if choice == "q":
            console.print("[cyan]Goodbye![/cyan]")
            break
        elif choice == "l":
            list_installed_models()
            Prompt.ask("\nPress Enter to return to menu")
        elif choice == "u":
            update_installed_models()
            Prompt.ask("\nPress Enter to return to menu")
        elif choice == "s":
            q = Prompt.ask("[bold yellow]Enter search keyword (e.g. reasoning, coder, vision, 7b)[/bold yellow]").strip()
            res = search_models(q)
            if res:
                show_models_table(res, hw, f"Search Results for '{q}' ({len(res)} matches)")
                sel = Prompt.ask(f"[bold cyan]Enter model number to launch (1-{len(res)}) or [q] Back[/bold cyan]", default="q")
                if sel.lower() != "q":
                    try:
                        idx = int(sel) - 1
                        if 0 <= idx < len(res):
                            run_model(res[idx].id)
                    except ValueError:
                        pass
            else:
                console.print("[red]No matching models found.[/red]")
                Prompt.ask("Press Enter to continue")
        else:
            try:
                cat_idx = int(choice) - 1
                if 0 <= cat_idx < len(categories):
                    browse_category(categories[cat_idx], hw)
            except ValueError:
                pass
