#!/bin/bash
#@JCGAMESCLASSICOS
# Excluir todos  os containers a primeira linha 




#docker stop $(docker ps -aq) && docker rm $(docker ps -aq)
#Instalando o Docker e o Firefox Nyghtly
curl -L docker.batocera.pro | bash
curl -L ffnightly.batocera.pro | bash



# Criar diretório para os arquivos que vão ser chamados
mkdir -p /userdata/roms/microsoft
mkdir -p /userdata/roms/microsoft/windows7

# Definir ID do arquivo
curl -L -o /userdata/roms/microsoft/windows7/docker-compose.yml "https://github.com/JeversonDias/janelas/blob/main/roms/microsoft/Windows7/docker-compose.yml"
curl -o /userdata/roms/microsoft/windows7/Windows7.sh https://raw.githubusercontent.com/JeversonDias/Windows/main/roms/microsoft/Windows7/Windows7.sh
chmod +x /userdata/roms/microsoft/windows7/Windows7.sh

# Verificar se docker-compose está instalado
if ! command -v docker-compose &> /dev/null
then
    echo "docker-compose não está instalado. Instale docker-compose e tente novamente."
    exit 1
fi
#Baixar e mover ES para a pasta 
curl -o /userdata/system/configs/emulationstation/es_systems_microsoft.cfg https://raw.githubusercontent.com/JeversonDias/Windows/main/es_systems_microsoft.cfg

cd /userdata/roms/microsoft/windows7 && docker-compose up & 
sleep 10

# Abrir Firefox com o endereço localhost
/userdata/system/pro/ffnightly/Launcher http://localhost:8006

pkill xterm

# Excluir todos  os containers 

