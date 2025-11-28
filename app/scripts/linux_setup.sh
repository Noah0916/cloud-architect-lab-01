#!/usr/bin/env bash
# scripts/linux_setup.sh
# Basic setup script for an Ubuntu VM to run the Flask API

set -e

echo "[*] Updating apt..."
sudo apt-get update -y

echo "[*] Installing Python3 and pip..."
sudo apt-get install -y python3 python3-venv python3-pip

echo "[*] Creating app directory..."
mkdir -p ~/cloud-api
cd ~/cloud-api

echo "[*] Creating virtual environment..."
python3 -m venv venv
source venv/bin/activate

echo "[*] Installing Flask..."
pip install --upgrade pip
pip install flask

echo "[*] Writing simple app.py file (optional if copied from GitHub)..."
cat > app.py << 'EOF'
from flask import Flask, jsonify

app = Flask(__name__)

@app.route("/health", methods=["GET"])
def health():
    return jsonify({"status": "ok-from-vm"}), 200

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000)
EOF

echo "[*] Starting Flask app in background..."
nohup python app.py > app.log 2>&1 &

echo "[*] Setup completed. API should be listening on port 5000."
