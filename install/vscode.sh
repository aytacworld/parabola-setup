#!/bin/bash
APP_NAME=vscode
EXECUTABLE_NAME=code .
FILE_NAME=code-stable-code_1.22.2-1523551015_amd64
URL_STABLE=https://az764295.vo.msecnd.net/stable/
URL_HASH=3aeede733d9a3098f7b4bdc1f66b63b0f48c1ef9/
TAR_FILE=${FILE_NAME}.tar.gz
EXTRACT_FOLDER_NAME=VSCode-linux-x64
INSTALL_FOLDER=/usr/local/lib/${APP_NAME}
BIN_EXECUTABLE=/usr/local/bin/${APP_NAME}

# Create temp folder if not exists
[ ! -d ./temp ] && mkdir ./temp
cd ./temp

# Download file using iceweasel
iceweasel ${URL_STABLE}${URL_HASH}${TAR_FILE}

# Wait for download
read -p "Make sure you download the file to ./temp, after download finishes, press any key to continue the installation."

# Exit if file is not in ./temp or ~/Downloads
[ ! -f ./${TAR_FILE} ] && [ ! -f ~/Downloads/${TAR_FILE} ] && echo "Please download the file inside ./temp or ~/Downloads folder" && exit 0

# if file is in ~/Downloads then move to ./temp
[ ! -f ./${TAR_FILE} ] && [ -f ~/Downloads/${TAR_FILE} ] && mv ~/Downloads/${TAR_FILE} ./${TAR_FILE}

# Extract file
tar -xvzf ./${TAR_FILE}

# move to lib folder
sudo mv ${EXTRACT_FOLDER_NAME} ${INSTALL_FOLDER}

# Download desktop file
sudo cp ../desktop/${APP_NAME}.desktop /usr/share/applications/

# Create Terminal shortcut
printf '#!/bin/sh\nnohup ${INSTALL_FOLDER}/${EXECUTABLE_NAME} &' | sudo tee ${BIN_EXECUTABLE} > /dev/null
sudo chmod 755 ${BIN_EXECUTABLE}

echo ${APP_NAME} installed

cd ..
