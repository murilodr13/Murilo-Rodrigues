#!/bin/bash

#############################################################
# Script para Configuração Inicial de Servidor CentosOS 7.x #
#-----------------------------------------------------------#
# v.1.0 - Criação do script.                                #
# v.1.0.1 - Adicionado o comando yum.                       #
#############################################################

###########
BLUEL="\033[1;34m"
BLUE="\033[0;34m"
GREEN="\033[0;32m"


echo ""
echo ""

echo -e " ${BLUEL} ====== Script para Configuração Inicial de Servidor CentosOS 7.x ======  "

echo ""

echo -e " ${BLUE} ====== Verificando Hostname ====== "
hostname

sleep 3

echo ""

echo -e " ${BLUE} ====== Verificando Usuário ====== "
whoami

sleep 3

echo ""

echo -e " ${BLUE} ====== Iniciando atualizações do Sistema (Sem Atualizações de Kernel) ====== "

sudo yum --exclude=kernel* update

sleep 5

echo -e " ${GREEN} ====== Fim do Script ====== "
