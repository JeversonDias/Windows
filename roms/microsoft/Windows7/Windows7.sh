#!/bin/bash

# Navegar até o diretório e subir os containers
cd /userdata/roms/microsoft/windows7 && docker-compose up & sleep 10

# Abrir Firefox com o endereço localhost
/userdata/system/pro/ffnightly/Launcher http://localhost:8006