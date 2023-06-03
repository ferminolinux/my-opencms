## Descrição
Fiz uma implementação automatizada utilizandos VMs, optei por utilizar o Vagrant
porque ele é capaz de automatizar o processo de criação das VMs no Virtualbox
e também escrevi scripts bash para automatizar a entrega das configurações do sistema.

![Arquitetura Vagrant](../imagens/imp-vagrant-arq.png)

## Vagrant
As configurações do Vagrant são descritas num arquivo chamado Vagrantfile, que
pode ser acessado [aqui](./Vagrantfile) permitindo
automatizar todo o processo de criação das VMs, com ele não é preciso
instalar o sistema operacional porque ele disponibiliza várias imagens
prontas de vários sistemas(chamadas de boxes) e nesse arquivo  também é possível 
configurar os aspectos relacionados a uma ou mais máquinas virtuais, como memória,
cpu e conexões de rede. 
Além disso é nele que fica descrito como as configurações serão 
entregues, no caso desse projeto através de Scripts Bash.

## Scripts
Foram desenvolvidos três scripts bash, são eles:
- **disable.sh**: Responsável por desabilitar o Firewalld e o SELinux para que não
bloqueiem as conexões das aplicações, clique [aqui](./disable.sh) para vê-lo.
- **opencms.sh**: Responsável por fazer a instalação do Tomcat, o download
e configuração do OpenCMS além de preparar o NGINX como proxy reverso, 
clique [aqui](./opencms.sh) para vê-lo.
- **psql.sh**: Responsável por fazer a instalação do postgresql, a inicialização
dos seus arquivos de configuração e ainda faz todo o processo para que ele
possa escutar as comunicações vindas da máquina do OpenCMS, clique [aqui](././psql.sh) 
para vê-lo.









