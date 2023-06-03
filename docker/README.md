## Descrição
Implementação com Docker

## Imagens
Para esta implementação utilizamos as imagens oficiais a seguir:

- [alkacon/opencms-docker](alkacon/opencms-docker)
- [postgres](https://hub.docker.com/_/postgres)
- [nginx](https://hub.docker.com/_/nginx)

## CLI

Vamos utilizar containers docker mas vamos criar os containers pela CLI, ou seja,
comando por comando.

### Configurações gerais

Vamos começar criando a rede e os volumes necessários, é importante que os containers estejam na mesma rede
pois assim será possível estabelecer conexão entre eles utilizando o nome deles diretamente.
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
Aqui foi preciso vincular uma porta do docker host porque eu desejo acessa-lo
para ter acesso ao OpenCMs através dele.

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
docker host, porque há razão acessar esse recurso pelo localhost.

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
Também fiz uma implementação usando o Docker Compose para automatizar o processo.
>:bulb: O código pode ser lido [aqui](./compose.yaml)




