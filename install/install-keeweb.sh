#!/bin/bash
APP_NAME=keeweb
EXECUTABLE_NAME=KeeWeb
APP_VERSION=1.6.3
ZIPFILE=KeeWeb-${APP_VERSION}.linux.x64.zip
GIT_REPO=keeweb/keeweb/releases/download/v${APP_VERSION}/${ZIPFILE}
INSTALL_FOLDER=/usr/local/lib/${APP_NAME}
BIN_EXECUTABLE=/usr/local/bin/${APP_NAME}

# Create tempfolder if not exists
[ ! -d ./temp ] && mkdir ./temp
cd ./temp

# Download zip file
wget https://github.com/${GIT_REPO}

# Unpack and move to lib folder
unzip ${ZIPFILE} -d ${APP_NAME}
sudo mv ${APP_NAME} ${INSTALL_FOLDER}

# Download desktop file
sudo cp ../desktop/${APP_NAME}.desktop /usr/share/applications/

# Create Terminal shortcut
printf '#!/bin/bash\nnohup ${INSTALL_FOLDER}/${EXECUTABLE_NAME} &' | sudo tee ${BIN_EXECUTABLE} > /dev/null
sudo chmod 755 ${BIN_EXECUTABLE}

echo ${APP_NAME} (${APP_VERSION}) installed

cd ..
