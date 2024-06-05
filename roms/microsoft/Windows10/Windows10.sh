#!/bin/bash

cd /userdata/roms/microsoft/windows10 && docker-compose up & sleep 10

# Abrir Firefox com o endereço localhost
/userdata/system/pro/ffnightly/Launcher http://localhost:8006
