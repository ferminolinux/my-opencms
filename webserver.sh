#!/usr/bin/env bash

config_tomcat() {
    # função: config_tomcat
    # argumentos: 
    # execução:
    #   Faz as configurações para que o Tomcat consiga executar o OpenCMS
    #
    local tmpdir='/tmp/tomcat'
    local url='http://www.opencms.org/downloads/opencms/opencms-15.0.zip'

    mkdir $tmpdir

    curl -fsSLo $tmpdir/opencms.zip $url
    unzip -d $tmpdir $tmpdir/opencms.zip
    sudo chown tomcat:tomcat $tmpdir/opencms.war
    sudo mv $tmpdir/opencms.war /var/lib/tomcat/webapps/opencms.war

    sudo systemctl restart tomcat 
}

config_nginx() {
    # função: config_nginx
    # argumentos: 
    # execução:
    #   Faz as configurações para que o Nginx atue como Proxy Reverso
    #
    sudo setenforce 0

sudo cat <<EOF > /etc/nginx/conf.d/opencms.conf
server {
    listen 80;

    location / {
        proxy_pass http://172.23.1.10:8080/opencms/ ;
    }

    location /demo {
        proxy_pass http://172.23.1.10:8080/opencms/mercury-demo/home/ ; 
    }

    server_name 172.23.1.10;
}
EOF

sudo systemctl restart nginx
}



pkgs=(
    java-11-openjdk
    java-11-openjdk-devel
    java-11-openjdk-javadoc
    tomcat
    nginx
)

sudo yum install -y ${pkgs[*]}

config_tomcat
config_nginx