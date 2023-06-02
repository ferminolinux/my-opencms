#!/usr/bin/env bash

pg_data='/var/lib/pgsql/data'

########### DECLARAÇÃO DE FUNÇÕES
install() {
    # função: install 
    # argumentos: 
    # execução:
    #   Instala o PostgreSQL, inicializa o banco criando seus arquivos
    #     e habilita o seu serviço. 
    #
    sudo yum install -y postgresql-server
    sudo postgresql-setup --initdb
    sudo systemctl enable --now postgresql
}

config() {
    # função: config 
    # argumentos: 
    #   $1 - Usuário do banco de dados
    #   $2 - Banco de dados
    #   $3 - IP do host que se deseja permitir a conexão
    # execução:
    #   Configura um host remoto para acessar o banco de dados 
    #
    sudo echo "host    $1    $2    $3    md5" >> $pg_data/pg_hba.conf
    sudo echo "listen_addresses = '*'" >> $pg_data/postgresql.conf
    sudo systemctl restart postgresql
}

run_sql() {
    # função: run_sql 
    # argumentos: 
    #   $1 - Comando SQL
    # execução:
    #   Executa um comando SQL no banco utilizando o usuário padrão administrador do postgres
    sudo su -c "psql -c \"$1\"" - postgres
}
########### FIM DA DECLARAÇÃO DE FUNÇÕES




########### EXECUÇÃO
install
config 'all' 'all' '192.168.100.10/32'

## Cria os recursos do banco de dados
run_sql "CREATE DATABASE opencms;"
run_sql "CREATE USER opencms_user WITH PASSWORD '123010203';"
run_sql "GRANT ALL PRIVILEGES ON DATABASE opencms TO opencms_user;"
