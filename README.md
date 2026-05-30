# Local Offline AI Coding Agent (AMD Optimized)

Welcome to the 1.5-year project to build a fully offline, autonomous AI coding agent tailored specifically for AMD hardware (Ryzen 5800X, Radeon 7800XT, 64GB RAM).

This repository contains the roadmap, architecture documentation, and execution scripts to build the agent from the ground up.

## Quick Start (Phase 1 Execution)

To get started on your host machine, follow these instructions to set up the Linux environment, install Docker for sandboxing, and configure PyTorch for your AMD GPU.

### Prerequisites
- Ubuntu 24.04 LTS (Recommended) or 22.04 LTS.
- An AMD Radeon 7800XT GPU.

### Step-by-Step Instructions

**1. Clone the repository**
```bash
git clone <your-repo-url>
cd <repo-directory>
```

**2. Install System Dependencies & Docker**
This script will update your system, install necessary tools, and set up Docker so the agent can safely test its code in an isolated sandbox.
```bash
make setup
```
*(Note: You may be prompted for your sudo password).*

**3. Install AMD ROCm Drivers Manually**
Because ROCm driver installations depend heavily on your specific OS kernel version, you must install them manually. Follow the instructions printed at the end of the `make setup` script, or visit the official guide:
👉 [AMD ROCm Installation Guide for Linux](https://rocm.docs.amd.com/en/latest/deploy/linux/index.html)

**4. Reboot Your Machine**
After installing the ROCm drivers, reboot your machine to ensure the kernel modules are loaded.
```bash
sudo reboot
```

**5. Set up the Python Environment**
Once rebooted, navigate back to this repository and run:
```bash
make env
```
This will create a Python virtual environment (`.venv`) and install PyTorch configured explicitly for ROCm 6.0.

**6. Verify the Installation**
Finally, test that PyTorch can successfully communicate with your 7800XT:
```bash
make test-rocm
```
If successful, you should see output confirming that `ROCm (HIP)` is available and your device is recognized!

---

## Documentation
Please refer to the `docs/` directory for detailed architectural plans:
- `ROADMAP.md` - The comprehensive 1.5-year multi-phase plan.
- `model_deployment.md` - Strategy for running 16GB VRAM models locally.
- `rag_architecture.md` - Offline documentation retrieval system.
- `agent_architecture.md` - Core logic and safe Docker execution loops.
- `ui_architecture.md` - Web interface plans.
- `finetuning_and_hardening.md` - Long-term personalization and offline testing.
