#!/usr/bin/env bash

########### DECLARAÇÃO DE FUNÇÕES
disable_firewalld() {
    # função: disable_firewalld
    # argumentos: 
    # execução:
    #   Desabilita o firewalld do sistema
    #
    sudo systemctl disable --now firewalld
}

disable_selinux() {
    # função: disable_selinux
    # argumentos: 
    # execução:
    #   Desabilita o SELinux
    #  
sudo cat << EOF > /etc/selinux/config
SELINUX=disabled
SELINUXTYPE=targeted
EOF
}
########### FIM DA DECLARAÇÃO DE FUNÇÕES



########### EXECUÇÃO
disable_firewalld
disable_selinux