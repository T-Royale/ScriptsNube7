#!/bin/bash

#define variables globales
usr="nube7"
psw="nube7123"
group="alumnado"

#Comprueba si el usuario existe
if id $usr &> /dev/null; then
	echo "El usuario ya existe"
	exit 1
fi

sudo useradd -m $usr 
if grep -q "^$usr" /etc/passwd; then
	echo "Usuario creado con éxito"
else
	echo "ERROR: al crear el usuario"
	exit 0
fi

if ! echo "$usr:$psw" | sudo chpasswd &> /dev/null; then
	echo "ERROR: al asignar contraseña al usuario nuevo"
else
	echo "Contraseña asignada para el nuevo usuario con éxito"
fi

if ! sudo groupadd $group &> /dev/null; then
	echo "ERROR: al crear el nuevo grupo"
else
	echo "Nuevo grupo creado con éxito"
fi

if ! sudo usermod -aG $group $usr &> /dev/null; then
	echo "ERROR: al añadir el nuevo grupo al usuario"
else
	echo "Grupo añadido al usuario con exito"
fi

