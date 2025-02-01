Subir um cluster kubernetes utilizando terraform no proxmox

Obs.: Como boa pratica, deve-se colocar os diretórios "kubespray" e "kubespray-venv" além claro do o arquivo .env no gitignore, que serão utilizados a seguir.

1 - Coloque essas credenciais dentro de um arquivo `.env`. Como boa pratica, deve-se colocar o .env no gitignore.

```bash
export PM_API_URL="https://<IP>:<PORT>/api2/json"
export PM_TLS_INSECURE=true
export PM_API_TOKEN_ID="<token id>"
export PM_API_TOKEN_SECRET="<token secret>"
```

2 - Provisionar as vms com terraform:
```bash
source .env
terraform init
terraform apply
```

3 - Baixar o repo do kubespray:
```bash
git git@github.com:kubernetes-sigs/kubespray.git
```

4 - Instalar o ansible  para executar o kubespray:
```bash
VENVDIR=kubespray-venv
KUBESPRAYDIR=kubespray
python3 -m venv $VENVDIR
source $VENVDIR/bin/activate
cd $KUBESPRAYDIR
pip install -U -r requirements.txt
```

5 - Executar playbook do kubespray baseado no inventário criado no terraform:
```bash
ansible-playbook -i ../inventory.ini -b cluster.yml
```

6 - Destroir, basta apenas rodar o:
```bash
terraform destroy
```