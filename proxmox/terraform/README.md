<b>Criar um usuário no proxmox com as permissões para o terraform.

Criando a role
```bash
pveum role add TerraformProv -privs "Datastore.AllocateSpace Datastore.AllocateTemplate Datastore.Audit Pool.Allocate Sys.Audit Sys.Console Sys.Modify VM.Allocate VM.Audit VM.Clone VM.Config.CDROM VM.Config.Cloudinit VM.Config.CPU VM.Config.Disk VM.Config.HWType VM.Config.Memory VM.Config.Network VM.Config.Options VM.Migrate VM.Monitor VM.PowerMgmt SDN.Use"
```
Criando o usuário
```bash
pveum user add terraform-prov@pve --password <password>
```
Atribuindo o usuário a role.
```bash
pveum aclmod / -user terraform-prov@pve -role TerraformProv
```

Paara criar um token de autenticação para o usuário criado.
Na interface web do proxmox, vá em:

Datacenter => Permissions => API Tokens => Add => desmarcar Privilege Separation.

Com isso irá gerar o "<token secret>" para conectar na API.

Copie esse código e vamos utlizar no "<token secret>".

Coloque essas credenciais dentro de um arquivo `.env`. Como boa pratica, deve-se colocar o .env no gitignore.

```bash
export PM_API_TOKEN_ID="<token id>"
export PM_API_TOKEN_SECRET="<token secret>"
```

Então, você só precisa garantir que essas variáveis existam onde você for executar o Terraform. Para usar localmente, eu costumo fazer o seguinte:

```bash
source .env
terraform init
terraform apply
```

Fonte utilizada => https://github.com/mateusmuller/mateusmullerme-youtube/tree/main/kubernetes/02_kubernetes_production_ready/terraform