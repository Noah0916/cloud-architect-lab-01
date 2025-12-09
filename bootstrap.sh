#!/bin/bash
set -e

echo "=== Bootstrap (WSL) starting ==="

# Ga naar je projectmap
cd /mnt/c/Users/swane/cloud-architect-lab-01
echo "Working directory:"
pwd

# Gebruik een aparte venv voor Linux/WSL
VENV_DIR=".venv_wsl"

if [ ! -d "$VENV_DIR" ]; then
  echo "Creating virtual environment in $VENV_DIR..."
  python3 -m venv "$VENV_DIR"
else
  echo "Virtual environment $VENV_DIR already exists"
fi

# Activeer de WSL-venv
source "$VENV_DIR/bin/activate"

echo "Virtual environment activated:"
python --version

echo "Installing dependencies..."
pip install --upgrade pip
pip install -r api/requirements.txt

echo "Starting Flask API..."
nohup python api/app.py > app.log 2>&1 &

echo "=== Bootstrap (WSL) finished ==="
cd ~
pwd

xpwd

