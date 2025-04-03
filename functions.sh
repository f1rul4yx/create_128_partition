#!/bin/bash

#Author: Sergio Roales, Diego Vargas
#Fecha de creacion: 03 abr 2025
#Version: 1.0

#--------------------VARIABLES--------------------#

# COLORES

# Resetear todos los atributos
RESET="\e[0m"

# Estilos
NEGRITA="\e[1m"
ATENUADO="\e[2m"
CURSIVA="\e[3m"
SUBRAYADO="\e[4m"
PARPADEO="\e[5m"
PARPADEO_INTENSO="\e[6m"
INVERTIDO="\e[7m"
OCULTO="\e[8m"
TACHADO="\e[9m"

# Colores de texto
NEGRO="\e[30m"
ROJO="\e[31m"
VERDE="\e[32m"
AMARILLO="\e[33m"
AZUL="\e[34m"
MORADO="\e[35m"
CIAN="\e[36m"
GRIS="\e[37m"
BLANCO="\e[38m"

# Colores de fondo
FONDO_NEGRO="\e[40m"
FONDO_ROJO="\e[41m"
FONDO_VERDE="\e[42m"
FONDO_AMARILLO="\e[43m"
FONDO_AZUL="\e[44m"
FONDO_MORADO="\e[45m"
FONDO_CIAN="\e[46m"
FONDO_GRIS="\e[47m"
FONDO_BLANCO="\e[48m"

#--------------------FUNCIONES--------------------#

# Funcion para verificar si el usuario es root (Para poder hacer correctamente el script)
verificar_root() {
  if [[ "$UID" -eq 0 ]]; then
    return 0
  else
    return 1
  fi
}

# Funcion para verificar que dispositivo de bloque hay instalado en el sistema
establecer_dispositivo() {
  read -p "Dime el dispositivo de bloque que tienes instalado: " dev
  if [[ -z $(find /dev/ -name "$dev") ]]; then
    return 1
  else
    return dev
  fi
}

# Función que genera 128 particiones
generar_particiones() {
  dev = establecer_dispositivo()
  echo -e "g\nw" | fdisk /dev/$dev &>/dev/null
  for a in {1..128}; do
    echo -e "n\n\n\n+2M\nw" | fdisk /dev/$dev &>/dev/null
  done
}

# Función que elimina las 128 particiones
eliminar_particiones() {
  for a in {1..128}; do
    echo -e "d\n$a\nw" | fdisk /dev/$dev &>/dev/null
  done
}
