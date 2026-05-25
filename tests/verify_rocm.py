import torch

def verify_environment():
    print("Testing Environment Setup...")

    # 1. Check if PyTorch is installed and accessible
    print(f"PyTorch Version: {torch.__version__}")

    # 2. Check for CUDA/ROCm availability
    if torch.cuda.is_available():
        print("GPU is available!")
        print(f"Device Count: {torch.cuda.device_count()}")
        print(f"Device Name: {torch.cuda.get_device_name(0)}")

        # 3. Check specifically for ROCm (HIP)
        if torch.version.hip:
            print(f"ROCm (HIP) Version: {torch.version.hip}")
            print("SUCCESS: ROCm is correctly integrated with PyTorch!")
        else:
            print("WARNING: PyTorch is using CUDA, not ROCm. This might run via translation layers but is not native AMD ROCm.")
    else:
        print("ERROR: GPU is NOT available. PyTorch cannot detect ROCm/CUDA.")
        print("Troubleshooting: Check 'rocminfo' and ensure the correct PyTorch version (with ROCm support) is installed.")

    print("\nNext Steps:")
    print("If successful, proceed to Phase 2: Local AI Model Selection.")

if __name__ == "__main__":
    verify_environment()
