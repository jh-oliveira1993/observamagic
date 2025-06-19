
Project Overview

This collaborative project provides a practical and engaging way for participants to enhance their skills in monitoring and automation.

Requirements

A Proxmox instance running on a dedicated physical machine, configured with one of the following:

Ubuntu cloud-init template

LXC container (preferably Ubuntu)

VPN connectivity between all participating environments (e.g., between Douglas and José’s networks)

The project is designed to run one LXC container per participant.

Scaling Policy

Only the proxy container group is designed to be scalable automatically. All other container groups require manual scaling and management.