#!/bin/bash

##############################################################
# Script para Configuração Inicial de Servidor CentosOS 7.x  #
#------------------------------------------------------------#
# v.1.0    - Criação do script.                              #
# v.1.0.1  - Adicionado o comando yum.                       #
# v.1.0.2  - Adicionado variáveis para cores                 #
# v.1.0.3  - Adicionado layout de pular linhas               #
# v.1.0.4  - Adicionado comandos para instalar rede          #
# v.1.0.5  - Instalação SUDO e alteração de cores            #
# v.1.0.6  - Instalação net-tools                            #
# v.1.0.7  - Adicionado comando SU e reboot serviço host     #
# v.1.0.8  - Adicionado correção (-y) no comando yum update  #
# v.1.0.9  - Correção de variáveis e lógica                  #
# v.1.0.10 - Adicionado a função que habilita repos          #
##############################################################

##########################
# Definição de Variáveis #
##########################
BLUEL="\033[1;34m"
BLUE="\033[0;34m"
GREEN="\033[0;32m"
YELLOW="\033[1;33m"
RED="\033[0;31m"
NC="\033[0m"
MYUSER=$(whoami)
MYHOSTNAME=$(hostname)
CHECK_SUDO_PACKAGE=$(yum list installed | grep -i "sudo")
TIMESTAMP=$(date "+%m%d%Y-%H%M%S")
##########################

function enabling_repos() {
    cd /etc/yum.repos.d/
    sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-*
    sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-*
    cd -
}

function check_root() {
    echo ""
    echo -e " ${YELLOW} ====== Verificação de Usuário ====== ${NC} "
    echo $MYUSER
    
    if [ $MYUSER != "root" ]
    then
        echo -e " ${RED} Você não está logado como ROOT ! Digite a senha do ROOT para prosseguir ${NC} "
        echo ""
        echo "Digite a senha: "
        su
    else
        echo ""
        echo -e " ${GREEN} Você já está logado como ROOT! Continuando a configuração do servidor... ${NC} "
        echo ""
        sleep 2
    fi
}

function config_hostname() {
    echo -e " ${YELLOW} ====== Verificando Hostname ====== ${NC}"
    echo $MYHOSTNAME
    echo ""
    if [ "$MYHOSTNAME" != "" ] || [ "$MYHOSTNAME" != "localhost_centos7" ]
    then
        echo -e " ${YELLOW} ====== Iniciando configuração de Hostname ====== ${NC} "
        sleep 3
        hostnamectl set-hostname localhost_centos7
        sleep 3
        systemctl restart systemd-hostnamed
        sleep 3
        #bash
        echo ""
        echo -e " ${YELLOW} ====== Confirmando Alteração de Hostname ====== ${NC} "
        echo ""
        echo $MYHOSTNAME
    else
        echo " ${GREEN} O hostname já está configurado, caso queira alterar, faça manualmente ! ${NC} "
        echo ""
        hostname
        sleep 2
        echo ""
    fi
}

function check_if_have_sudo() {
    echo -e " ${YELLOW} ====== Instalação do SUDO ====== ${NC}"
    echo ""
    if [[ $CHECK_SUDO_PACKAGE = "" ]]
    then
        echo -e " ${YELLOW} O servidor não possui o pacote sudo instalado. Instalando o pacote sudo... ${NC}"
        sleep 2
        echo ""
        yum -y install sudo
        echo ""  
    else
        echo ""
        echo -e " ${GREEN} O pacote sudo já está instalado no servidor. Continuando a configuração do servidor... ${NC}"
        echo ""
    fi
}

#echo ""
echo ""

echo -e " ${BLUEL} ====== Script para Configuração Inicial de Servidores CentosOS 7 & 8 ====== ${NC}"
echo ""

echo -e " ${YELLOW} ====== Habilitando Repositórios ====== ${NC}"
enabling_repos
echo ""

#echo -e " ${YELLOW} ====== Verificando Hostname ====== ${NC}"
#echo $MYHOSTNAME
#echo ""

check_if_have_sudo

#echo -e " ${YELLOW} ====== Instalação do SUDO ====== ${NC}"
#yum -y install sudo
#echo ""

#sleep 3

echo -e " ${YELLOW} ====== Instalando/Atualizando Dependências para Configuração do Servidor ====== ${NC}"
echo ""
sudo yum -y install yum-utils bind-utils net-tools vim
sleep 3

#echo ""
#echo -e " ${YELLOW} ====== Verificação de Usuário ====== ${NC} "
#echo ""
#echo $MYUSER

check_root

config_hostname

#if [ $MYUSER != "root" ]
#then
#    echo -e " ${RED} ====== Você não está logado como ROOT ! Digite a senha do ROOT para prosseguir  ====== ${NC} "
#    echo ""
#    su
#    else
#    echo ""
#fi

#if [ "$MYHOSTNAME" != "" || "$MYHOSTNAME" != "localhost_centos7" ]
#then
#    echo -e " ${YELLOW} ====== Iniciando configuração de Hostname ====== ${NC} "
#    echo ""
#    sleep 3
#    hostnamectl set-hostname localhost_centos7
#    sleep 3
#    systemctl restart systemd-hostnamed
#    sleep 3
#    bash
#    echo ""
#    echo -e " ${YELLOW} ====== Confirmando Alteração de Hostname ====== ${NC} "
#    echo ""
#    echo $MYHOSTNAME
#else
#    echo " ${GREEN} O hostname já está configurado, caso queira alterar, faça manualmente ! ${NC} "
#    echo ""
#    hostname
#    sleep 2
#    echo ""
#fi

echo ""
echo -e " ${BLUE} ====== Iniciando atualizações do Sistema (Sem Atualizações de Kernel) ====== ${NC}"
sudo yum -y --exclude=kernel* update
sleep 5

echo ""
echo -e " ${GREEN} ====== Fim do Script ====== ${NC}"
echo ""
echo ""
