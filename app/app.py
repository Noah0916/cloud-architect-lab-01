# app/app.py
# Simple Flask API to suggest an Azure VM size based on CPU and memory

from flask import Flask, request, jsonify

app = Flask(__name__)


@app.route("/health", methods=["GET"])
def health():
    return jsonify({"status": "ok"}), 200


def suggest_vm(cpu_cores: int, memory_gb: int) -> str:
    """
    Very simple, hardcoded mapping of CPU + RAM to an Azure VM size.
    This is NOT official sizing, just an example of reasoning.
    """
    if cpu_cores <= 1 and memory_gb <= 2:
        return "Standard_B1s (1 vCPU, 1 GB RAM)"
    elif cpu_cores <= 2 and memory_gb <= 4:
        return "Standard_B2s (2 vCPU, 4 GB RAM)"
    elif cpu_cores <= 4 and memory_gb <= 16:
        return "Standard_D4s_v5 (4 vCPU, 16 GB RAM)"
    else:
        return "Consider a larger D- or E-series VM"


@app.route("/vm-size", methods=["GET"])
def vm_size():
    """
    Example:
    GET /vm-size?cpu=2&memory=4
    """
    try:
        cpu = int(request.args.get("cpu", "1"))
        memory = int(request.args.get("memory", "2"))
    except ValueError:
        return jsonify({"error": "cpu and memory must be integers"}), 400

    suggestion = suggest_vm(cpu, memory)
    return jsonify({
        "cpu": cpu,
        "memory_gb": memory,
        "suggested_size": suggestion
    }), 200


if __name__ == "__main__":
    # For local testing
    app.run(host="0.0.0.0", port=5000)
