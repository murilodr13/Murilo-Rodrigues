#!/bin/bash

#############################################################
# Script para Configuração Inicial de Servidor CentosOS 7.x #
#-----------------------------------------------------------#
# v.1.0 - Criação do script.                                #
# v.1.0.1 - Adicionado o comando yum.                       #
# v.1.0.2 - Adicionado variáveis para cores                 #
#############################################################

###########
BLUEL="\033[1;34m"
BLUE="\033[0;34m"
GREEN="\033[0;32m"
NC="\033[0m"

echo ""
echo ""

echo -e " ${BLUEL} ====== Script para Configuração Inicial de Servidor CentosOS 7.x ====== ${NC}"

echo ""

echo -e " ${BLUE} ====== Verificando Hostname ====== ${NC}"
hostname

sleep 3

echo ""

echo -e " ${BLUE} ====== Verificando Usuário ====== ${NC}"
whoami

sleep 3

echo ""

echo -e " ${BLUE} ====== Iniciando atualizações do Sistema (Sem Atualizações de Kernel) ====== ${NC}"

sudo yum --exclude=kernel* update

sleep 5

echo -e " ${GREEN} ====== Fim do Script ====== ${NC}"
