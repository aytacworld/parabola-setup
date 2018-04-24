#!/bin/bash
APP_NAME=rambox
EXECUTABLE_NAME=rambox
APP_VERSION=0.5.16
ZIPFILE=Rambox-${APP_VERSION}-x64.zip
GIT_REPO=saenzramiro/rambox/releases/download/${APP_VERSION}/${ZIPFILE}
INSTALL_FOLDER=/usr/local/lib/${APP_NAME}
BIN_EXECUTABLE=/usr/local/bin/${APP_NAME}
ZIP_ROOT_FOLDER_NAME=linux-unpacked
ICON_NAME=256x256.png
ICON_URL=https://raw.githubusercontent.com/saenzramiro/rambox/${APP_VERSION}/resources/logo/${ICON_NAME}

# Create tempfolder if not exists
[ ! -d ./temp ] && mkdir ./temp
cd ./temp

# Download zip file
wget https://github.com/${GIT_REPO}

# Unpack and move to lib folder
unzip ${ZIPFILE}
sudo mv ${ZIP_ROOT_FOLDER_NAME} ${INSTALL_FOLDER}

# Get icon
wget ${ICON_URL}
sudo mv ${ICON_NAME} ${INSTALL_FOLDER}/${ICON_NAME}

# Download desktop file
sudo cp ../desktop/${APP_NAME}.desktop /usr/share/applications/

# Create Terminal shortcut
printf '#!/bin/bash\nnohup ${INSTALL_FOLDER}/${EXECUTABLE_NAME} &' | sudo tee ${BIN_EXECUTABLE} > /dev/null
sudo chmod 755 ${BIN_EXECUTABLE}

echo "${APP_NAME} ${APP_VERSION} installed"

cd ..
