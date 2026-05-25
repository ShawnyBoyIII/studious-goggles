# Local AI Model Deployment Guide (AMD ROCm)

Because you have an AMD 7800XT with 16GB of VRAM, we must carefully select models and inference engines that natively support ROCm.

## Recommended Inference Engines
1. **Ollama (ROCm build)**: Easiest to get started with. Great for GGUF models.
   ```bash
   docker run -d --device /dev/kfd --device /dev/dri -v ollama:/root/.ollama -p 11434:11434 --name ollama rocm/ollama
   ```
2. **vLLM**: Extremely fast for production use, but requires more setup for ROCm.
   ```bash
   pip install vllm
   ```

## Model Selection (16GB VRAM Constraint)
- **Llama-3 (8B)**: Extremely capable general-purpose model. Fits in ~8GB at 8-bit quantization.
- **Qwen 2.5 Coder (7B)**: State-of-the-art coding model. Highly recommended for this project.
- **DeepSeek Coder (6.7B or 1.3B)**: Great alternatives for strict coding tasks.

*Note: Models larger than 14B parameters (e.g., Command R 35B, Llama-3 70B) will either completely fail to load or require aggressive offloading to your 64GB system RAM, which drastically reduces generation speed.*
