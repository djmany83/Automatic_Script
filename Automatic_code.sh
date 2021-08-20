#!/bin/bash

# Author: djmany

#Colours
greenColour="\e[0;32m\033[1m"
endColour="\033[0m\e[0m"
redColour="\e[0;31m\033[1m"
blueColour="\e[0;34m\033[1m"
yellowColour="\e[0;33m\033[1m"
purpleColour="\e[0;35m\033[1m"
turquoiseColour="\e[0;36m\033[1m"
grayColour="\e[0;37m\033[1m"

function helpPanel(){
	echo -e "\n${yellowColour}(${endColour}${grayColour}Hecho por ${endColour}${blueColour}djmany${endColour}${yellowColour})${endColour}${redColour}"
	echo -e "\n${grayColour}Uso:${endColour}"
	echo -e "\t${redColour}[-r]${endColour}${blueColour} Modo de ejecución${endColour}${yellowColour} ./update-code.sh -r /PATH ${endColour}"
	echo -e "\t${redColour}[-h]${endColour}${blueColour} Mostrar este panel de ayuda${endColour}\n"
	exit 1
}

function ejecutar(){
DIR=$ruta
for i in "$DIR"/*; do
	if [ "$i" != "." -a "$i" != ".." ];
	then
		if [ -d "$i" ];
        then
			echo $i
			cd $i
			npm run pull && npm run build
			cd ..
		fi
     fi
done
wait
}

parameter_counter=0; while getopts "r:h:" arg; do
	case $arg in
		r) ruta=$OPTARG; let parameter_counter+=1;;
		h) HelpPanel;;	
	esac
done

if [ $parameter_counter -eq 0 ]; then
	helpPanel
else
	ejecutar $ruta
fi
