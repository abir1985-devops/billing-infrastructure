## Overview

This repository defines the operational environment of a backend service in a cloud system without manual server interaction.

The deployment lifecycle is fully automated:

Code change → tests → container build → registry publish → remote rollout

The server never builds application code and is not manually modified after bootstrap.  
All runtime state is declared and reproducible.

Application source:
https://github.com/abir1985-devops/billing-api

---

## What this project demonstrates

Focus of this repository is system operation, not application logic.

It implements:

- reproducible infrastructure
- automated configuration
- immutable deployments
- controlled service rollout
- separation of build and runtime responsibilities

The objective is reliable software operation.

---

## System Behavior

The infrastructure provides:

- deterministic provisioning
- idempotent configuration
- automated deployment
- absence of configuration drift
- consistent state after redeployment

The server is replaceable without affecting system correctness.

---

## Deployment Model

Application delivery follows an immutable model:

1. Source change triggers CI
2. Tests validate behavior
3. Container image is produced
4. Server pulls new artifact
5. Services restart

The runtime environment does not depend on repository state.

---

## Runtime Architecture


Client → Nginx → API Container → PostgreSQL Container

Properties:

- only reverse proxy is publicly reachable
- application network is private
- database is isolated
- configuration external to image
- persistent storage survives restart

---

## Infrastructure Provisioning

Terraform defines the infrastructure lifecycle:

- compute instance
- network rules
- remote access

The environment can be recreated using:

terraform apply

No manual cloud configuration is required.

---

## Configuration Management

Ansible configures the server to a known state:

- Docker installation
- runtime directories
- environment variables
- service definition
- application startup

Execution is idempotent: repeated runs do not change a correct system.

ansible-playbook deploy_compose.yml

---

## Continuous Delivery Integration

The infrastructure is designed to be driven by CI/CD:

- server accepts deployments only through image updates
- configuration remains stable
- deployment does not require SSH interaction
- rollout time depends only on image pull time

---

## Operational Characteristics

- reproducible environment
- no configuration drift
- minimal downtime restarts
- separation of build and runtime responsibility
- safe redeployment after failure

---

## Design Principles

- Infrastructure as Code
- Immutable application artifacts
- Declarative configuration
- Automated rollout
- Least privilege exposure
- Replace instead of repair