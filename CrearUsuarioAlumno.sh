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

sudo groupadd $group

sudo usermod -ag $group

