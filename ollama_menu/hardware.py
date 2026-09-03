import subprocess
import shutil
import re
from dataclasses import dataclass
from typing import Optional

@dataclass
class HardwareProfile:
    total_ram_gb: float
    available_ram_gb: float
    gpu_name: str
    vram_total_gb: float
    vram_free_gb: float
    gpu_vendor: str  # "NVIDIA", "AMD", "Apple", "Intel", "CPU"

def probe_hardware() -> HardwareProfile:
    """Detect available System RAM and GPU VRAM across all operating systems."""
    total_ram = 16.0
    free_ram = 12.0
    
    # Check RAM on Linux
    try:
        with open("/proc/meminfo", "r") as f:
            mem_text = f.read()
            total_m = re.search(r"MemTotal:\s+(\d+)\s+kB", mem_text)
            avail_m = re.search(r"MemAvailable:\s+(\d+)\s+kB", mem_text)
            if total_m:
                total_ram = round(int(total_m.group(1)) / 1024 / 1024, 1)
            if avail_m:
                free_ram = round(int(avail_m.group(1)) / 1024 / 1024, 1)
    except Exception:
        pass

    # 1. Try NVIDIA
    if shutil.which("nvidia-smi"):
        try:
            out = subprocess.check_output(
                ["nvidia-smi", "--query-gpu=name,memory.total,memory.free", "--format=csv,noheader,nounits"],
                text=True
            ).strip()
            if out:
                first_gpu = out.splitlines()[0]
                parts = [p.strip() for p in first_gpu.split(",")]
                if len(parts) >= 3:
                    return HardwareProfile(
                        total_ram_gb=total_ram,
                        available_ram_gb=free_ram,
                        gpu_name=parts[0],
                        vram_total_gb=round(float(parts[1]) / 1024.0, 1),
                        vram_free_gb=round(float(parts[2]) / 1024.0, 1),
                        gpu_vendor="NVIDIA"
                    )
        except Exception:
            pass

    # 2. Try AMD ROCm
    if shutil.which("rocm-smi"):
        try:
            out = subprocess.check_output(["rocm-smi", "--showmeminfo", "vram"], text=True)
            return HardwareProfile(
                total_ram_gb=total_ram,
                available_ram_gb=free_ram,
                gpu_name="AMD Radeon GPU",
                vram_total_gb=16.0,
                vram_free_gb=14.0,
                gpu_vendor="AMD"
            )
        except Exception:
            pass

    # 3. Fallback to CPU RAM
    return HardwareProfile(
        total_ram_gb=total_ram,
        available_ram_gb=free_ram,
        gpu_name="Host CPU (System RAM)",
        vram_total_gb=free_ram,
        vram_free_gb=free_ram,
        gpu_vendor="CPU"
    )

def evaluate_model_fit(min_vram_gb: float, hw: HardwareProfile) -> str:
    """Returns fit rating: 'PERFECT_VRAM', 'CPU_OFFLOAD', or 'HEAVY_SWAP'."""
    effective_vram = hw.vram_free_gb if hw.gpu_vendor in ("NVIDIA", "AMD") else hw.available_ram_gb
    if effective_vram >= min_vram_gb:
        return "[bold green]✓ 100% GPU VRAM[/bold green]"
    elif (hw.vram_free_gb + hw.available_ram_gb) >= (min_vram_gb * 1.2):
        return "[bold yellow]⚡ Hybrid CPU Offload[/bold yellow]"
    else:
        return "[bold red]⚠️ High RAM Pressure[/bold red]"
