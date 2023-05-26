# my-opencms
    
Neste projeto eu fiz uma implementação automatizada do OpenCMS utilizando VM's Alma Linux.

>:bulb: Para uma implementação manual leia o [guia de implementação manual](./manual_implementation.odt).

## Descrição
Este projeto foi feito, usando um servidor do banco de dados postgresql e outro com o tomcat para a execução do OpenCMS e com o Nginx para ser utilizado como proxyu reverso.

Para automatizar essa implementação foi desenvolvido dois scripts bash e para simplificar o processo de criação das VMs e a execução deles optou-se pelo uso do Vagrant.

## Requisitos
### **Ferramentas**
- Principais
    - Virtualbox
    - Bash
    - Vagrant

### **VM's**
As VM's foram implementadas seguindo a tabela a seguir:

|IP|HOSTNAME|SISTEMA OPERACIONAL|MEMÓRIA|CPUS|
|-|-|-|-|-|
|172.23.1.10|webserver|RHEL/AlmaLinux9|2048|1|
|172.23.1.20|database|RHEL/AlmaLinux9|512|1|










