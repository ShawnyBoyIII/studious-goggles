# Phase 6: Fine-Tuning & Hardening

## Personalizing the Model (LoRA)
Because we have an AMD 7800XT (16GB VRAM), full fine-tuning of a 7B model is impossible. We must use **LoRA (Low-Rank Adaptation)** or **QLoRA (Quantized LoRA)**.

1. **Data Collection**: The agent framework will track every piece of code you approve and commit. Over a year, this builds a massive dataset of *your* exact coding style.
2. **Training**: Using libraries like `unsloth` or `peft`, we will train a LoRA adapter on your personal dataset. This typically takes a few hours on a 7800XT.
3. **Inference**: The LoRA weights are merged into the base model (e.g., Qwen 2.5) during startup.

## Hardening (Offline Testing)
The true test of the 1.5-year plan.
- **The Disconnect Test**: Physically disconnect the ethernet/wifi from the host machine for 2 weeks.
- Use the agent to build an entirely new project.
- Monitor for any crashes caused by hardcoded external API dependencies in the UI or Python scripts.
- Ensure the Docker image cache is fully local so the sandbox can spawn without needing DockerHub.
