import argparse
import sys
from .models import MODEL_REGISTRY, search_models, get_models_by_category
from .hardware import probe_hardware
from .tui import interactive_menu, run_model, list_installed_models, update_installed_models, show_models_table

def main():
    parser = argparse.ArgumentParser(
        prog="ollama-menu",
        description="Cross-Platform AI Model Selector & Interactive Launcher for Ollama (SOTA 2026)"
    )
    subparsers = parser.add_subparsers(dest="command")
    
    subparsers.add_parser("list", help="List all local installed Ollama models")
    subparsers.add_parser("update", help="Pull and update all local installed models")
    
    run_p = subparsers.add_parser("run", help="Run a specific model")
    run_p.add_argument("model", help="Model ID or name (e.g. deepseek-r1:8b, qwen2.5-coder:7b)")
    
    search_p = subparsers.add_parser("search", help="Search model registry")
    search_p.add_argument("query", help="Search keyword (e.g. reasoning, vision, coding, 14b)")
    
    args = parser.parse_args()
    
    if args.command == "list":
        list_installed_models()
    elif args.command == "update":
        update_installed_models()
    elif args.command == "run":
        run_model(args.model)
    elif args.command == "search":
        hw = probe_hardware()
        res = search_models(args.query)
        show_models_table(res, hw, f"Search Results for '{args.query}'")
    else:
        interactive_menu()

if __name__ == "__main__":
    main()
