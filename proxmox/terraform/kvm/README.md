Subir um cluster kubernetes utilizando terraform no proxmox

provisionar as vms com terraform
```bash
terraform init
terraform apply
```

baixar o repo do kubespray
```bash
git git@github.com:kubernetes-sigs/kubespray.git
```

Instalar o ansible  para executar o kubespray
```bash
VENVDIR=kubespray-venv
KUBESPRAYDIR=kubespray
python3 -m venv $VENVDIR
source $VENVDIR/bin/activate
cd $KUBESPRAYDIR
pip install -U -r requirements.txt
```

Executar playbook do kubespray baseado no inventário criado no terraform
```bash
ansible-playbook -i inventory.ini kubespray/cluster.yml
```