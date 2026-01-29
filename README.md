# Cloud Architect Lab 01 – Secure Python API on Azure

## Overview
This project demonstrates the design and deployment of a secure cloud architecture on Microsoft Azure, including:

- A Python-based REST API
- A Linux Virtual Machine
- Azure Virtual Network and Subnets
- Network Security Groups (NSG)
- Managed Identity and RBAC
- Secure access to Azure resources

The goal of this lab is to practice real-world Cloud Engineer / Cloud Architect skills:
infrastructure design, security, identity, and documentation.

# Cloud Foundation Project – Python API + Linux Automation

![Architecture](A_README_document_showcases_a_cloud_foundation_pro.png)

## Introductie

Dit was mijn eerste cloud foundation project.  
Ik focuste bewust op Linux, Git en automation in plaats van features.  
De API is simpel — maar het doel was deployability, troubleshooting en cloud-basisvaardigheden laten zien.

---

## Doel van het project

Dit project laat zien dat ik:

- met Linux kan werken  
- een Python API (Flask) kan bouwen  
- een Linux bootstrap script kan schrijven dat automatisch dependencies installeert  
- een project gestructureerd kan opzetten  
- GitHub kan gebruiken zoals een Cloud Engineer  

---

## Architectuur Diagram

```txt
 +------------------+         +------------------------+        +-----------------------------+
 |    Developer     | ----->  |     GitHub Repo        | -----> |   Linux Environment (WSL)   |
 |  (local machine) |         |  cloud-foundation-lab   |        |   or Azure Linux VM         |
 +------------------+         +------------------------+        +-----------------------------+
                                          |                                   |
                                          |                                   |
                                          |                         +-------------------------+
                                          |                         |   bootstrap.sh script    |
                                          |                         | - Installeert Python     |
                                          |                         | - Creëert virtual env    |
                                          |                         | - Installeert packages   |
                                          |                         | - Start Flask API        |
                                          |                         +-------------------------+
                                          |
                                          ↓
                                +---------------------+
                                |   Flask API (app)   |
                                | - /health           |
                                | - /vm-size          |
                                +---------------------+
API Endpoints
Health check
GET /health


Response:

{ "status": "ok" }

VM Size Recommendation
POST /api/v1/recommend-vm


Body:

{
  "cpu_cores": 2,
  "memory_gb": 4,
  "workload_type": "web"
}

Installatie (lokaal)
python -m venv .venv
.venv\Scripts\activate   # Windows

pip install -r api/requirements.txt
python api/app.py

Wat ik geleerd heb

Werken met Flask

Opzetten van Linux virtual environments

Schrijven van een eigen bootstrap script

Debuggen met PowerShell, Ubuntu/WSL en VS Code

Git commit / push workflow

Volgende stappen / Roadmap

Azure Bicep template toevoegen

Deployment naar een echte Azure VM

Pipeline via GitHub Actions

Docker-versie van de app


---













