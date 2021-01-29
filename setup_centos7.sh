#!/bin/bash

#Script para Configuração Inicial de Servidor CentosOS 7.x

echo ""

echo -e " \033[1;34m ====== Script para Configuração Inicial de Servidor CentosOS 7.x ====== \033[0m "

echo ""

echo -e " \033[0;34m Verificando Hostname \033[0m "
hostname

sleep 3

echo ""

echo -e " \033[0;34m Verificando Usuário \033[0m "
whoami

sleep 3

echo ""

echo -e " \033[0;34m Iniciando atualizações do Sistema (Sem Atualizações de Kernel) \033[0m "

yum --exclude=kernel* update

sleep 5

yes

echo -e " \033[0;32m Fim do Script \033[0m "
