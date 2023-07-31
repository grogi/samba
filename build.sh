#!/bin/bash

docker pull alpine:latest
docker build -t dperson/samba:latest .

SMB_VER=$(docker run -it dperson/samba:latest /usr/sbin/smbd -V | awk '{print $2}' | sed 's/[^ -~]//g')
docker tag dperson/samba:latest dperson/samba:"$SMB_VER"
