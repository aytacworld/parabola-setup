#!/bin/bash
VS_FILE_NAME=code-stable-code_1.21.1-1521038896_amd64
VS_FILE=${VS_FILE_NAME}.tar.gz

# Create temp folder if not exists
[ ! -d ./temp ] && mkdir ./temp
cd ./temp

# Download vscode using iceweasel
iceweasel https://az764295.vo.msecnd.net/stable/79b44aa704ce542d8ca4a3cc44cfca566e7720f1/${VS_FILE}

# Wait for download
read -p "Make sure you download the file to ./temp, after download finishes, press any key to continue the installation."

# Exit if file is not in ./temp or ~/Downloads
[ ! -f ./${VS_FILE} ] && [ ! -f ~/Downloads/${VS_FILE} ] && echo "Please download the file inside ./temp or ~/Downloads folder" && exit 0

# if file is in ~/Downloads then move to ./temp
[ ! -f ./${VS_FILE} ] && [ -f ~/Downloads/${VS_FILE} ] && mv ~/Downloads/${VS_FILE} ./${VS_FILE}

# Extract file
tar -xvzf ./${VS_FILE}

# move to lib folder
# sudo mv 
