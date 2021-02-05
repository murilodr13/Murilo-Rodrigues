#!/bin/bash

#############################################################
# Script para Configuração Inicial de Servidor CentosOS 7.x #
#-----------------------------------------------------------#
# v.1.0 - Criação do script.                                #
# v.1.0.1 - Adicionado o comando yum.                       #
# v.1.0.2 - Adicionado variáveis para cores                 #
# v.1.0.3 - Adicionado layout de pular linhas               #
# v.1.0.4 - Adicionado comandos para instalar rede          #
# v.1.0.5 - Instalação SUDO e alteração de cores            #
# v.1.0.6 - Instalação SUDO e alteração de cores            #
# v.1.0.7 - Instalação SUDO e alteração de cores            #
#############################################################

###########
BLUEL="\033[1;34m"
BLUE="\033[0;34m"
GREEN="\033[0;32m"
YELLOW="\033[1;33m"
NC="\033[0m"
$WHOAMI=whoami
$HOSTNAME=hostname

echo ""
echo ""

echo -e " ${BLUEL} ====== Script para Configuração Inicial de Servidor CentosOS 7.x ====== ${NC}"

echo ""

echo -e " ${YELLOW} ====== Verificando Hostname ====== ${NC}"
hostname

echo ""

echo -e " ${YELLOW} ====== Instalação do SUDO ====== ${NC}"
yum -y install sudo

echo ""

sleep 3

echo -e " ${YELLOW} ====== Instalando Dependências para Configuração de Rede ====== ${NC}"
sudo yum -y install net-tools

sleep 3

echo ""

echo -e " ${YELLOW} ====== Verificação de Usuário ====== ${NC} "

echo ""

whoami

if [ "$WHOAMI" != "root" ]
then
echo -e " ${RED} ====== Você não está logado como ROOT ! Digite a senha do ROOT para prosseguir  ====== ${NC} "

echo ""

su

else

echo ""

fi

if [ "$HOSTNAME" != "" ]
then
echo -e " ${YELLOW} ====== Iniciando configuração de Hostname ====== ${NC} "

echo ""

sleep 3

hostnamectl set-hostname localhost_centos7

sleep 3

systemctl restart systemd-hostnamed

echo ""

echo -e " ${YELLOW} ====== Confirmando Alteração de Hostname ====== ${NC} "

echo ""

hostname

else

echo " ${GREEN} O hostname já está configurado, caso queira alterar, faça manualmente ! ${NC} "

echo ""

hostname

sleep 1

echo ""

fi

echo ""

echo -e " ${BLUE} ====== Iniciando atualizações do Sistema (Sem Atualizações de Kernel) ====== ${NC}"

sudo yum --exclude=kernel* update

sleep 5

echo""

echo -e " ${GREEN} ====== Fim do Script ====== ${NC}"

echo ""
echo ""
