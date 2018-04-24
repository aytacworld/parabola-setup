#!/bin/bash
APP_NAME=keeweb
APP_VERSION=1.6.3
ZIP_FILE=KeeWeb-${APP_VERSION}.linux.x64.zip
GIT_REPO=keeweb/keeweb/releases/download/v${APP_VERSION}/${ZIP_FILE}
INSTALL_FOLDER=/usr/local/lib/${APP_NAME}

# Create tempfolder if not exists
[ ! -d ./temp ] && mkdir ./temp
cd ./temp

# Download zip file
wget https://github.com/${GIT_REPO}

# Unpack and move to lib folder
unzip ${ZIP_FILE} -d ${APP_NAME}
sudo mv ${APP_NAME} ${INSTALL_FOLDER}

# Download desktop file
sudo cp ../desktop/${APP_NAME}.desktop /usr/share/applications/

echo ${APP_NAME} ${APP_VERSION} installed

cd ..
