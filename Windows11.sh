#!/bin/bash
#@JCGAMESCLASSICOS
# Excluir todos  os containers a primeira linha 



#docker stop $(docker ps -aq) && docker rm $(docker ps -aq)
#Instalando o Docker e o Firefox Nyghtly
curl -L docker.batocera.pro | bash
curl -L ffnightly.batocera.pro | bash



# Criar diretório para os arquivos que vão ser chamados
mkdir -p /userdata/roms/microsoft
mkdir -p /userdata/roms/microsoft/windows11

curl -L -o /userdata/roms/microsoft/windows11/docker-compose.yml "https://raw.githubusercontent.com/JeversonDias/Windows/main/roms/microsoft/windows11/docker-compose.yml"
curl -o /userdata/roms/microsoft/windows11/Windows11.sh https://raw.githubusercontent.com/JeversonDias/Windows/main/roms/microsoft/windows11/Windows11.sh
chmod +x /userdata/roms/microsoft/windows11/Windows11.sh

# Verificar se docker-compose está instalado
if ! command -v docker-compose &> /dev/null
then
    echo "docker-compose não está instalado. Instale docker-compose e tente novamente."
    exit 1
fi
#Baixar e mover ES para a pasta 
curl -o /userdata/system/configs/emulationstation/es_systems_microsoft.cfg https://raw.githubusercontent.com/JeversonDias/Windows/main/es_systems_microsoft.cfg

# Navegar até o diretório e subir os containers
cd /userdata/roms/microsoft/windows11 && docker-compose up  
pkill xterm

# Abrir Firefox com o endereço localhost
/userdata/system/pro/ffnightly/Launcher http://localhost:8006









