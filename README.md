# homelab

A two-host homelab platform built to practice IaC and Kubernetes operations. A 3-node k3s cluster runs on Proxmox and RHEL 10, provisioned with Terraform and configured with Ansible (including Vault-encrypted secrets). A fourth x86 VM runs a mirrored ZFS pool exported over NFS, mounted persistently by the whole cluster and by the second host. The second host (Apple M1, via VMware Fusion) runs a reverse proxy and a planned monitoring node.

## Stack

- Proxmox VE (virtualization, x86 host)
- VMware Fusion (virtualization, Apple M1 host)
- RHEL 10.2 (x86_64 and aarch64)
- Terraform (provisioning on the x86 host)
- Ansible + Ansible Vault (configuration, secrets, across both hosts)
- k3s (3-node cluster)
- ZFS (mirrored pool) + NFS (persistent, cross-architecture export)

## Architecture & Design

Full design doc, including requirements, architecture diagram, and decision history: [docs/design.md](docs/design.md)

## Status

Working:
- RHEL 10.2 template, generalized and cloned via Terraform
- 3-node k3s cluster (1 control plane, 2 workers), provisioned and configured, verified live
- Mirrored ZFS pool on a repurposed x86 VM, exported over NFS
- NFS share mounted persistently (survives reboot) on all k3s nodes and the reverse proxy host, across both x86 and ARM

In progress / not started:
- Application workloads on the cluster
- Monitoring (Prometheus/Grafana) on the M1's `monitor-01` VM
- Reverse proxy configuration on `web-01`
- CI/CD pipeline
- TLS with a real domainTest commit to verify contribution graph
Verifying commit author fix
