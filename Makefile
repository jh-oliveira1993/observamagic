SHELL := /bin/bash
.DEFAULT_GOAL := init

# Variáveis de caminho
ROOT_DIR := /home/douglas/Documents/git/observamagic
TF_DIR := $(ROOT_DIR)/proxmox/terraform/lxc
ANSIBLE_DIR := $(ROOT_DIR)/ansible
INVENTORY_FILE := $(TF_DIR)/inventory.ini
ENV_FILE := $(TF_DIR)/.env

lxc-init: lxc-create lxc-pre lxc-database lxc-zabbix

lxc-destroy:
	@cd $(TF_DIR) && \
	source $(ENV_FILE) && \
	terraform destroy -auto-approve

lxc-create:
	@cd $(TF_DIR) && \
	source $(ENV_FILE) && \
	terraform init && \
	terraform apply -auto-approve && \
	sleep 300s

lxc-pre:
	@cd $(ANSIBLE_DIR) && \
	python3 -m venv venv && \
	source venv/bin/activate && \
	pip install -r $(ANSIBLE_DIR)/requirements.txt && \
	pip install --upgrade pip && \
	ansible-playbook -v pre.yml

lxc-database:
	@cd $(ANSIBLE_DIR) && \
	python3 -m venv venv && \
	source venv/bin/activate && \
	pip install -r $(ANSIBLE_DIR)/requirements.txt && \
	pip install --upgrade pip && \
	ansible-playbook -v database.yml

lxc-zabbix:
	@cd $(ANSIBLE_DIR) && \
	python3 -m venv venv && \
	source venv/bin/activate && \
	pip install -r $(ANSIBLE_DIR)/requirements.txt && \
	pip install --upgrade pip && \
	ansible-playbook -v zabbix.yml