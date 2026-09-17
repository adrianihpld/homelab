# homelab

A two-host homelab platform built to practice IaC and Kubernetes operations. A 4-node k3s cluster runs on Proxmox and RHEL 10, provisioned with Terraform and configured with Ansible (including Vault-encrypted secrets). The second host will add storage and an internal web server. Currently, the cluster is live and verified, with application workloads and CI/CD still in progress.

## Stack

- Proxmox VE (virtualization)
- RHEL 10.2
- Terraform (provisioning)
- Ansible + Ansible Vault (configuration, secrets)
- k3s

## Architecture & Design

Full design doc, including requirements and architecture diagram: [docs/design.md](docs/design.md)

## Status

Working:
- RHEL 10.2 template, generalized and cloned via Terraform
- 4-node k3s cluster, provisioned and configured, verified live

In progress:
- Application workloads
- Storage + web tier on the second host
- CI/CD pipeline
- Observability
