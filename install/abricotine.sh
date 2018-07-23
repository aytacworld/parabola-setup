#!/bin/bash
APP_NAME=abricotine
APP_VERSION=0.6.0
FILE_NAME=Abricotine-${APP_VERSION}-linux-x64
TAR_FILE=${FILE_NAME}.tar.gz
URL_STABLE=https://github.com/brrd/Abricotine/releases/download/${APP_VERSION}/${TAR_FILE}
EXTRACT_FOLDER_NAME=Abricotine-linux-x64
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
