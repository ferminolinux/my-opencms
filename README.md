# my-opencms

## Descrição 
Neste projeto foram realizadas algumas implementações do OpenCMS, foram 
utilizadas diversas abordagens desde a manual até algumas mais sofisticadas como
o uso de containers Docker, por exemplo.

>:bulb: Caso queira saber mais sobre o OpenCMS você pode encontrar mais detalhes
[aqui](https://documentation.opencms.org/opencms-documentation/introduction/get-started/)

### Problema
Realizar a implementação do OpenCMS utilizando um banco de dados PostgreSQL
e tendo o Nginx como proxy reverso.

## Implementação

### Implementação manual
Utilizou-se do [Oracle VM Virtualbox](https://www.virtualbox.org/manual/UserManual.html)
para a criação das máquinas virtuais na infraestrutura local.

#### **Design**
Foi criada uma rede virtual e duas VM's conectadas a ela, a primeira possuindo a a instalação do OpenCMS e o próprio Nginx e a outra o banco de dados Postgresql.

**A rede possui as seguintes características:**
|tipo| cidr|
|----|-----------------|
|host-only|172.23.1.0/24|

**As VM's possuem as seguintes características:**
| VM | endereço ip | memória | cpus |
|----|-------------|---------|------|
|opencms|172.23.1.10|2048|1
|psql|172.23.1.20|1024|1

#### Virtualbox
Eu comecei criando a rede que seria responsável por interligar as VM's, 
seguindo os passos a seguir:
1. Acessei o VirtualBox:
![Imagem 1 - Acessando o VirtualBox](imagens/imp-manual-1.png)
2. Naveguei até as definições de rede:
![Imagem 2 - Selecionando as definições](imagens/imp-manual-2.png)
![Imagem 3 - Selecionando as definições de rede](imagens/imp-manual-3.png)
![Imagem 4 - Definições de rede](imagens/imp-manual-4.png)
3. Criei a nova rede
![Imagem 5 - Criando uma nova rede](imagens/imp-manual-5.png)
4. Alterei o o bloco CIDR padrão dela para o que eu deseja:
![Imagem 6 - Selecionando a rede](imagens/imp-manual-6.png)
![Imagem 7 - Alterando o bloco cidr da rede](imagens/imp-manual-7.png)
5. Criei as VMs adicionando as informações presentes na tabela anterior.
![Imagem 8 - Selecionando a rede](imagens/imp-manual-8.png)
![Imagem 9 - Criando nova VM](imagens/imp-manual-9.png)
![Imagem 10 - Criação 1](imagens/imp-manual-10.png)
![Imagem 11 - Criação 2](imagens/imp-manual-11.png)
![Imagem 12 - Criação 3](imagens/imp-manual-12.png)

>:bulb: Agora é só realizar a instalação do Almalinux, ela pode ser feita seguindo
o  [guia de instalação do AlmaLinux](https://wiki.almalinux.org/documentation/installation-guide.html#installation) presente na documentação oficial.

#### Linux
















