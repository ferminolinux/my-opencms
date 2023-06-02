## Descrição
As duas abordagens anteriores a manual e com o Vagrant utilizam VM's
que demandam um maior uso de recursos e mais configurações por se tratarem da 
virtualização de todos os aspectos de uma máquina, nesta abordagem vamos utilizar 
Containers do Docker, que são uma camada de abstração que nos permite abstrair 
apenas o sistema operacional escolhido deixando os demais aspectos para que a 
Engine responsável por prover os containers se preocupe com isso.

## Imagens
O Docker possui um repositório de imagens chamado Docker Hub que possui
várias imagens de sistemas ou de sistemas com aplicações especificas disponíveis
para download.
Para esta implementação utilizamos as imagens oficiais a seguir:

- [alkacon/opencms-docker](alkacon/opencms-docker)
- [postgres](https://hub.docker.com/_/postgres)
- [nginx](https://hub.docker.com/_/nginx)

## CLI

Vamos utilizar containers docker mas vamos criar os containers pela CLI, ou seja,
comando por comando.

### Configurações gerais

Vamos começar criando a rede e os volumes necessários
```bash
docker network create opencms 
docker volume create pgdata 
docker volume create opencms 
```

### OpenCMS
Criei um container do OpenCMS, não precisei vincular nenhuma porta dele
ao host do docker, porque pretendia que ele fosse acessado pelo proxy reverso. 

```bash
docker run \
  --name opencms \
  -v opencms:/usr/local/tomcat/webapps/ \
  --network opencms \
  -d \
  alkacon/opencms-docker
```

### NGINX
Criei um container do NGINX adicionando a minha pasta de configuração a ele.
Aqui foi preciso vincular uma porta do docker host ao container para
acessar o conteúdo dele através do nosso docker host.

```bash
docker run \
  --name nginx \
  -p 80:80 \
  --network opencms \
  -v ./conf.d:/etc/nginx/conf.d \
  -d \
  nginx
```
### Postgres
Criei um container do PostgreSQL definindo as informações de usuário, banco de dados e senha através das variáveis de ambiente, não é necessário vincular uma porta dele ao
docker host, porque há razão acessar esse recurso pelo docker host.

```bash
docker run \
  --name postgres \
  --network opencms \
  -d \
  -v pgdata:/var/lib/postgresql/data \
  -e "POSTGRES_USER=opencms_user" \
  -e "POSTGRES_DB=opencms_user" \
  -e "POSTGRES_HOST_AUTH_METHOD=md5" \
  -e "POSTGRES_PASSWORD=opencms1234" \
  postgres
```

## Compose
A maioria das instalações do Docker em ambientes de desenvolvimento conta com
o compose, que é uma ferramenta para executar aplicações multi-serviço executando
docker, eu utilizei esta ferramenta para refazer a mesma implementação que tinha
feito pela linha de comando só que agora tudo de maneira mais automatizada e sem
a necessidade de enviar comandos, é só descrever o nosso projeto em um arquivo
do tipo yaml.

>:bulb: O código pode ser lido [aqui](./compose.yaml)




