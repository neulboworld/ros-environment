#!/bin/bash


cp /etc/apt/sources.list /etc/apt/source.list.bak

MIRROR_DOMAIN=$(sed -n '/ubuntu-ports/p' /root/KR.txt | sed -e 's/\/ubuntu-ports\///g' | sed -e 's/:\/\//:\\\/\\\//g')
OPTION=s/http:\\\/\\\/ports.ubuntu.com/${MIRROR_DOMAIN}/g
sed -i $OPTION /etc/apt/sources.list
