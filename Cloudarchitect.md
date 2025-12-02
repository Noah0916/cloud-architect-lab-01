# Cloud Architect Lab 01 – Python API + Azure Infra + Linux Setup

This project is a hands-on cloud architecture lab that combines:

- A small Python REST API (Flask)
- Infrastructure-as-Code for Azure (Bicep)
- A Linux setup script to configure a VM

The goal is to demonstrate skills that are relevant for a future Cloud Engineer / Cloud Architect role:
designing, automating and documenting a small cloud-native workload.

---

## Scenario

You are a Cloud Engineer and you need to design a simple workload for a customer:

- A small Python API that can suggest an Azure VM size
- The API must run on a Linux VM in Azure
- The infrastructure must be described as code (Bicep)
- A Linux shell script should prepare the VM (install Python, dependencies, run the app)

This repo contains:

- `app/app.py` – Python Flask API
- `infra/main.bicep` – Azure infrastructure definition
- `scripts/linux_setup.sh` – Linux configuration script

