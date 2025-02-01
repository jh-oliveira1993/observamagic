Subir um cluster kubernetes utilizando terraform no proxmox

1 - Não esqueça de exportar as credenciais do proxmox, no diretŕio anterior informa no README.md
```bash
source .env
```

2 - Provisionar as vms com terraform
```bash
terraform init
terraform apply
```

3 - Baixar o repo do kubespray
```bash
git git@github.com:kubernetes-sigs/kubespray.git
```

4 - Instalar o ansible  para executar o kubespray
```bash
VENVDIR=kubespray-venv
KUBESPRAYDIR=kubespray
python3 -m venv $VENVDIR
source $VENVDIR/bin/activate
cd $KUBESPRAYDIR
pip install -U -r requirements.txt
```

5 - Executar playbook do kubespray baseado no inventário criado no terraform
```bash
ansible-playbook -i inventory.ini kubespray/cluster.yml
```