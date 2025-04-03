#!/usr/bin/env bash

#Author: Sergio Roales, Diego Vargas
#Fecha de creacion: abr 03 2025
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

# Función para verificar si el usuario es root (Para poder hacer correctamente el script)
verificar_root() {
  if [[ "$UID" -eq 0 ]]; then
    return 0
  else
    echo -e "${ROJO}Debe ejecutar este script bajo los privilegios de usuario root.${RESET}"
    exit 0
  fi
}

# Función para verificar que dispositivo de bloque hay instalado en el sistema y devuelve el resultado
establecer_dispositivo() {
  read -p "Dime el dispositivo de bloque que tienes instalado: " dev
  if [[ -e /dev/$dev ]]; then    # Verifica que exista el archivo del dispositivo de bloque
    echo $dev
  else
    return 1
  fi
}

# Función que genera 128 particiones
generar_particiones() {
  dev=$(establecer_dispositivo)
  echo -e "g\nw" | fdisk /dev/$dev &>/dev/null    # Establece la tabla de particionado en GPT
  for a in {1..128}; do
    echo -e "n\n\n\n+2M\nw" | fdisk /dev/$dev &>/dev/null    # Crea 128 particiones de 2M cada una
  done
}

# Función que elimina las 128 particiones
eliminar_particiones() {
  dev=$(establecer_dispositivo)
  for a in {1..128}; do
    echo -e "d\n$a\nw" | fdisk /dev/$dev &>/dev/null    # Elimina todas las particiones del dispositivo en bloque asignado
  done
}

# Función que genera un menú y ejecuta las funciones
menu() {
echo -e "1. Crear 128 particiones (2M cada una)"
echo -e "2. Eliminar todas las particiones de un disco"
echo -e "3. Salir"
read -p "Selecciona una opción: " opcion
case $opcion in
  1)
    $(generar_particiones)
  ;;
  2)
    $(eliminar_particiones)
  ;;
  *)
    exit 0
  ;;
esac
}

# Función que recopila el programa entero
main() {
  verificar_root
  menu
}
