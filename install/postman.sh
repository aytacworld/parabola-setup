#!/bin/bash
APP_NAME=postman
APP_VERSION=6.1.4
FILE_NAME=Postman-linux-x64-${APP_VERSION}.tar.gz
URL_STABLE=https://dl.pstmn.io/download/latest/linux64
TAR_FILE=${FILE_NAME}.tar.gz
EXTRACT_FOLDER_NAME=Postman
INSTALL_FOLDER=/usr/local/lib/${APP_NAME}

# Create temp folder if not exists
[ ! -d ./temp ] && mkdir ./temp
cd ./temp

# Download file
wget ${URL_STABLE}

# Extract file
tar -xvzf ./${TAR_FILE}

# move to lib folder
sudo mv ${EXTRACT_FOLDER_NAME} ${INSTALL_FOLDER}

# Download desktop file
sudo cp ../desktop/${APP_NAME}.desktop /usr/share/applications/

echo ${APP_NAME} ${APP_VERSION} installed

cd ..
