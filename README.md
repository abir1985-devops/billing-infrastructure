# Billing Infrastructure

Infrastructure definition and deployment orchestration for the Billing API service.

This repository describes how the service is provisioned, configured and updated in a reproducible environment using Infrastructure as Code and automated configuration management.

Application source code:  
https://github.com/abir1985-devops/billing-api

---

## System Behavior

The infrastructure guarantees:

- deterministic server provisioning
- idempotent configuration
- automated application rollout
- zero manual server modification after bootstrap
- consistent runtime state across redeployments

The server is treated as disposable: it can be destroyed and recreated without affecting deployment correctness.

---

## Deployment Model

Application delivery follows an immutable deployment approach.

1. Source code change triggers CI
2. Tests validate application behavior
3. Container image is built and published
4. Server pulls the new image
5. Services restart automatically

The server never builds application code and does not depend on Git state.

---

## Runtime Architecture

Public traffic enters through a reverse proxy.

Client → Nginx → API Container → PostgreSQL Container

Properties:

- only the proxy is publicly reachable
- application is private inside container network
- database is not externally exposed
- configuration separated from image
- service restart safe (persistent storage)

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