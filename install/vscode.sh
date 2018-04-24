#!/bin/bash
APP_NAME=vscode
APP_VERSION=1.22.2
FILE_NAME=code-stable-code_${APP_VERSION}-1523551015_amd64
URL_STABLE=https://az764295.vo.msecnd.net/stable/
URL_HASH=3aeede733d9a3098f7b4bdc1f66b63b0f48c1ef9/
TAR_FILE=${FILE_NAME}.tar.gz
EXTRACT_FOLDER_NAME=VSCode-linux-x64
INSTALL_FOLDER=/usr/local/lib/${APP_NAME}

# Create temp folder if not exists
[ ! -d ./temp ] && mkdir ./temp
cd ./temp

# Download file
wget ${URL_STABLE}${URL_HASH}${TAR_FILE}

# Extract file
tar -xvzf ./${TAR_FILE}

# move to lib folder
sudo mv ${EXTRACT_FOLDER_NAME} ${INSTALL_FOLDER}

# Download desktop file
sudo cp ../desktop/${APP_NAME}.desktop /usr/share/applications/

echo ${APP_NAME} ${APP_VERSION} installed

cd ..
