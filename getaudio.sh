#!/bin/bash

# Get Music

if [ "$1" == "" ]; then
	echo "Uso: $0 [liga youtube] [Video ID] [nombre rola]"
	exit 1
fi

if [ "$3" == "" ]; then
	echo "Uso: $0 [liga youtube] [Video ID] [nombre rola]"
	exit 1
fi

if [ "$2" == "" ]; then
	echo "Uso: $0 [liga youtube] [Video ID] [nombre rola]"
	exit 1
fi

youtube-dl --id "$1"

video=""

if [  -f ${2}.webm ]; then
	video=${2}.webm
elif [  -f ${2}.mp4 ]; then
	video=${2}.mp4
elif [  -f ${2}.mkv ]; then
	video=${2}.mkv
else 
	echo "ERROR el mundo será destruido. FIN"
	exit 1
fi


mplayer -vc null -vo null -ao pcm:file=${3}.pcm ${video}
lame ${3}.pcm ${3}.mp3
echo
echo "Listo ${3}.mp3"
echo "-=-=-=-=-=-=-=-=-=-=-=-="
echo
echo "Limpiando"
sleep 1
rm -f ${video}
rm -f ${3}.pcm
