#!/bin/sh

# https://ungoogled-software.github.io/ungoogled-chromium-wiki/faq#downloading-the-crx-file

CHROMIUM_VERSION=$1
EXTENSION_ID=$2
URL="https://clients2.google.com/service/update2/crx?response=redirect&acceptformat=crx2,crx3&prodversion=${CHROMIUM_VERSION}&x=id%3D${EXTENSION_ID}%26installsource%3Dondemand%26uc"

echo $URL
wget -O ${EXTENSION_ID}.crx $URL

# 1. go to chrome://extensions/
# 2. enable developer mode and refresh if first time
# 3. drag and drop the crx file

# ublock origin:    cjpalhdlnbpafiamejdnhcphjbkeiagm
# dark reader:      eimadpbcbfnmbkopoojfekhnkhdbieeh
# vimium:           dbepggeogbaibhgnhhndojpepiihcmeb
# refined github:   hlepfoohegkhhmjieoechaddaejaokhf
