#!/bin/bash
cat << EOF
################################################
Welcome to the Anaconda Auto Downloader
This script will allow you to download and install
Anaconda
################################################
EOF

sleep 5

LOCAL="$(pwd)/Downloads"
ANACONDA_DONLOAD_CHECK="find $LOCAL -name Anaconda3-5.1.0-Linux-x86_64.sh"
ANACONDA_VERSION="3-5.1.0"

if [[ -d "$LOCAL" && "$ANACONDA_DONLOAD_CHECK" ]];  then
echo "Directory exists prepairing to install Anaconda"
bash $LOCAL/Anaconda$ANACONDA_VERSION-Linux-x86_64.sh
echo "Sourcing content from bashrc"
source ~/.bashrc
elif [ "$LOCAL" ]; then 
echo "making directory $LOCAL"
sleep 1
mkdir $LOCAL
cd $LOCAL
echo "Downloading Annacona for python code testing"
wget https://repo.continuum.io/archive/Anaconda$ANACONDA_VERSION-Linux-x86_64.sh
echo "checking the sha256 checksum"
sha256sum $LOCAL/Anaconda$ANACONDA_VERSION-Linux-x86_64.sh
echo "sourcing Anaconda$ANACONDA_VERSION-Linux-x86_64 install script"
bash $LOCAL/Anaconda$ANACONDA_VERSION-Linux-x86_64.sh
source ~/.bashrc
fi


