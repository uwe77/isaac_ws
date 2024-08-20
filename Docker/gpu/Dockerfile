FROM nvcr.io/nvidia/isaac-sim:4.0.0

ARG DEBIAN_FRONTEND=noninteractive 
    
ENV ROS_DISTRO=noetic \
    SHELL=/bin/bash \
    NB_USER=uwe \
    NB_UID=1001

RUN echo 'Etc/UTC' > /etc/timezone && \
    ln -s /usr/share/zoneinfo/Etc/UTC /etc/localtime

###################################### user #####################################
RUN adduser --disabled-password \
    --gecos "Default user" \
    --uid ${NB_UID} \
    ${NB_USER} 

RUN echo "root:root" | chpasswd \
    && echo "${NB_USER}:111111" | chpasswd

ENV HOME=/home/${NB_USER}

##################################### basic tools #####################################
RUN apt-get -o Acquire::ForceIPv4=true update && apt-get -yq dist-upgrade \
    && apt-get -o Acquire::ForceIPv4=true install -yq --no-install-recommends \
    curl \
    vim \
    wget \
    sudo \
    cmake \
    gedit \
    gnupg2 \
    gtk+-3.0 \
    locales \
    dirmngr \
    mercurial \
    net-tools \
    lsb-release \
    openssh-client \
    build-essential \
    libcanberra-gtk-module \
    libcanberra-gtk3-module \
    libpcap-dev \
    libusb-1.0 \
    tzdata \
    libglfw3-dev \
    libmetis-dev \
    python3-tk \
    software-properties-common \
    ruby \
    python3-pip \
    python3-setuptools \
    python3-numpy \
    python3-empy  \
    python3-opencv \
    python3-dbg \
    python3-venv \
    python3-dev \
    python3-tk \
    python3-yaml \
    libfltk1.3-dev \ 
    freeglut3-dev \ 
    libpng-dev \ 
    libjpeg-dev \
    libxft-dev \ 
    libxinerama-dev \ 
    libtiff5-dev \ 
    librapidxml-dev \
    netbase \ 
    fluid \
    xterm \
    scrot \
    g++ \
    subversion \
    libtiff-dev \
    espeak \
    qtbase5-dev \
    ifstat \
    iperf3 \
    && apt-get update && apt-get install -y git \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

####################################### pip3 ###########################################

RUN python3 -m pip install --upgrade pip \
    && pip3 install \
    matplotlib \
    pandas \
    gdown \
    pyautogui \
    pytest \
    Pillow \
    tensorboard \
    swig

RUN pip3 install --ignore-installed PyYAML \
    && pip3 install \
    torch \
    torchaudio \
    torchvision \
    gymnasium \
    stable-baselines3 \
    openai==0.27.0 \
    trajectopy-core \
    huggingface-sb3 \
    huggingface_hub \
    transformers \
    datasets \
    hf_transfer \
    opencv-python-headless \
    timm


RUN echo "root ALL=(ALL)  ALL" >> /etc/sudoers

ENV XLA_PYTHON_CLIENT_PREALLOCATE=false
ENV HF_HUB_ENABLE_HF_TRANSFER=1