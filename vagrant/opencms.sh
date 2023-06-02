#!/usr/bin/env bash


########### DECLARAÇÃO DE FUNÇÕES
config_tomcat() {
    # função: config_tomcat
    # argumentos: 
    # execução:
    #   Faz o download do OpenCMS e as configurações para que o Tomcat consiga 
    #   executa-lo.
    #
    local tmpdir='/tmp/tomcat'
    local url='http://www.opencms.org/downloads/opencms/opencms-15.0.zip'

    mkdir $tmpdir

    curl -fsSLo $tmpdir/opencms.zip $url
    unzip -d $tmpdir $tmpdir/opencms.zip
    sudo chown tomcat:tomcat $tmpdir/opencms.war
    sudo mv $tmpdir/opencms.war /var/lib/tomcat/webapps/opencms.war

    sudo systemctl enable --now tomcat
    sudo systemctl restart tomcat 
}

config_nginx() {
    # função: config_nginx
    # argumentos: 
    # execução:
    #   Faz as configurações para que o Nginx atue como Proxy Reverso
    #

sudo cat <<EOF > /etc/nginx/conf.d/opencms.conf
server {
    listen 80;

    location / {
        proxy_pass http://192.168.100.10:8080/ ;
    }

    server_name opencms.net;
}
EOF

sudo systemctl enable --now nginx
sudo systemctl restart nginx
}

########### FIM DA DECLARAÇÃO DE FUNÇÕES




########### EXECUÇÃO
pkgs=(
    java-11-openjdk
    java-11-openjdk-devel
    java-11-openjdk-javadoc
    unzip
    tomcat
    nginx
)

sudo yum install -y ${pkgs[*]}

config_tomcat
config_nginx