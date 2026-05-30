.PHONY: setup env test clean

VENV = .venv
PYTHON = $(VENV)/bin/python
PIP = $(VENV)/bin/pip

env:
	python3 -m venv $(VENV)
	$(PIP) install --upgrade pip
	# Force pip to use the ROCm index URL
	$(PIP) install torch torchvision torchaudio --index-url https://download.pytorch.org/whl/rocm6.0

test-rocm: env
	$(PYTHON) tests/verify_rocm.py

setup:
	sudo bash setup/setup_env.sh

clean:
	rm -rf $(VENV)
	rm -rf __pycache__
	rm -rf .pytest_cache
