#! /bin/bash

# Standard machine upgrade
sudo apt update && sudo apt upgrade -y && sudo apt dist-upgrade -y && sudo apt autoremove -y

#! /bin/bash

# Install vscode-oss
wget -O script.deb.sh https://packagecloud.io/install/repositories/headmelted/codebuilds/script.deb.sh 
sudo bash script.deb.sh
wget -O vscodeInstall.sh https://code.headmelted.com/installers/apt.sh
sudo bash vscodeInstall.sh
echo 'alias code="code-oss"' >> ~/.bashrc
source ~/.bashrc
rm -f script.deb.sh
rm -f vscodeInstall.sh

# Install dev dependencies
#! /bin/bash

sudo apt install \
    curl \
	libssl1.0.0 \
    libgstreamer1.0-0 \
    gstreamer1.0-tools \
    gstreamer1.0-plugins-good \
    gstreamer1.0-plugins-bad \
    gstreamer1.0-plugins-ugly \
    gstreamer1.0-libav \
    libgstrtspserver-1.0-0 \
    libgstreamer-plugins-base1.0-dev \
    libjansson4=2.11-1 \
    librdkafka1=0.11.3-1build1 \
    xclip \
    -y

# Get deepstream SDK
#! /bin/bash

wget https://developer.download.nvidia.com/assets/Deepstream/Deepstream_4.0.2/deepstream_sdk_v4.0.2_jetson.tbz2 -O deepstream_sdk_v4.0.2_jetson.tbz2 
tar -xpvf deepstream_sdk_v4.0.2_jetson.tbz2
cd deepstream_sdk_v4.0.2_jetson
sudo tar -xvpf binaries.tbz2 -C /
sudo ./install.sh
sudo ldconfig
sudo nvpmodel -m 0 
sudo jetson_clocks
cd ..
rm deepstream_sdk_v4.0.2_jetson.tbz2

