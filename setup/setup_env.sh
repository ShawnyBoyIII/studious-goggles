#!/bin/bash

# Phase 1: Environment Setup Script
# This script is meant to be run on an Ubuntu 24.04 (or 22.04) host.

set -e

echo "Starting Environment Setup for AMD 7800XT Local AI..."

echo "1. Updating system packages..."
sudo apt update && sudo apt upgrade -y

echo "2. Installing essential dependencies..."
sudo apt install -y wget curl git python3-venv python3-pip build-essential htop lsof tmux

echo "3. Installing AMD ROCm drivers..."
# Instructions for ROCm typically depend on the specific Ubuntu version.
# Users should refer to official AMD documentation:
# https://rocm.docs.amd.com/en/latest/deploy/linux/index.html
echo "Please manually install ROCm using official AMD documentation for your OS version."
echo "Suggested steps for Ubuntu 22.04:"
echo "  sudo apt install "linux-headers-$(uname -r)" "linux-modules-extra-$(uname -r)""
echo "  wget https://repo.radeon.com/amdgpu-install/6.1.1/ubuntu/jammy/amdgpu-install_6.1.60101-1_all.deb"
echo "  sudo apt install ./amdgpu-install_6.1.60101-1_all.deb"
echo "  sudo amdgpu-install --usecase=rocm"

echo "4. Installing Docker for sandboxing..."
# Add Docker's official GPG key:
sudo apt-get update
sudo apt-get install -y ca-certificates curl
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc

# Add the repository to Apt sources:
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update
sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

# Post-install steps for Docker (so you don't need sudo)
sudo usermod -aG docker $USER || true

echo "Setup script completed! Please reboot your machine and verify ROCm installation using 'rocminfo'."
