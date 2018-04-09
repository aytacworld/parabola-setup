#!/bin/bash
KEEWEB_VERSION=1.6.3
KEEWEB_ZIP=KeeWeb-${KEEWEB_VERSION}.linux.x64.zip

# Create tempfolder if not exists
[ ! -d ./temp ] && mkdir ./temp
cd ./temp

# Download Keeweb unpack
wget https://github.com/keeweb/keeweb/releases/download/v${KEEWEB_VERSION}/${KEEWEB_ZIP}

# Unpack and move to lib folder
unzip ${KEEWEB_ZIP} -d keeweb
sudo mv keeweb /usr/lib/keeweb

# Download desktop file
sudo cp ../desktop/keeweb.desktop /usr/share/applications/

# Create Terminal shortcut
printf '#!/bin/bash\nnohup /usr/lib/keeweb/KeeWeb &' | sudo tee /usr/bin/keeweb > /dev/null
sudo chmod 755 /usr/bin/keeweb

echo Keeweb (${KEEWEB_VERSION}) installed

cd ..
