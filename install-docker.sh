#!/bin/bash
# Script de instalación de Docker en Ubuntu 24.04

# Actualizar el índice de paquetes e instalar dependencias necesarias
sudo apt-get update
sudo apt-get install -y apt-transport-https ca-certificates curl gnupg lsb-release

# Agregar la clave GPG oficial de Docker
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

# Configurar el repositorio estable de Docker
echo "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

# Actualizar nuevamente el índice de paquetes para incluir el repositorio Docker
sudo apt-get update

# Instalar Docker Engine, CLI y containerd, además del plugin docker-compose
sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-compose-plugin

# Habilitar e iniciar el servicio Docker
sudo systemctl enable docker --now

echo "Docker se ha instalado correctamente en Ubuntu 24.04."