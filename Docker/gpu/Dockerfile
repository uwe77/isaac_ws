FROM nvcr.io/nvidia/isaac-sim:4.0.0

ARG DEBIAN_FRONTEND=noninteractive 

# Set environment variables
ENV ROS_DISTRO=noetic \
    SHELL=/bin/bash \
    NB_USER=uwe \
    NB_UID=1001 \
    NB_GID=1001 \
    XLA_PYTHON_CLIENT_PREALLOCATE=false \
    HF_HUB_ENABLE_HF_TRANSFER=1

ENV HOME=/home/${NB_USER}

# Timezone and basic setup
RUN echo 'Etc/UTC' > /etc/timezone && \
    ln -s /usr/share/zoneinfo/Etc/UTC /etc/localtime

# Create the user
RUN adduser --disabled-password --gecos "Default user" --uid ${NB_UID} ${NB_USER} \
    && echo "root:root" | chpasswd \
    && echo "${NB_USER}:111111" | chpasswd

# Install basic tools
RUN apt-get -o Acquire::ForceIPv4=true update && apt-get -yq dist-upgrade && \
    apt-get -o Acquire::ForceIPv4=true install -yq --no-install-recommends \
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
    software-properties-common \
    ruby libfltk1.3-dev \
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
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Install Python 3.8
RUN apt-get update && apt-get install -y \
    software-properties-common \
    && add-apt-repository ppa:deadsnakes/ppa \
    && apt-get update && apt-get install -y \
    python3.8 \
    python3.8-venv \
    python3.8-dev \
    python3-tk \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* \
    && update-alternatives --install /usr/bin/python3 python3 /usr/bin/python3.8 1

# Ensure pip3 is linked correctly to Python 3.8 and install essential Python packages
# Fix pip cache directory permission issue
RUN python3.8 -m ensurepip --upgrade && \
    python3.8 -m pip install --upgrade pip setuptools wheel && \
    mkdir -p /home/${NB_USER}/.local/lib/python3.8/site-packages && \
    mkdir -p /home/${NB_USER}/.cache/pip && \
    chown -R ${NB_USER}:${NB_GID} /home/${NB_USER}/.local && \
    chown -R ${NB_USER}:${NB_GID} /home/${NB_USER}/.cache/pip

RUN python3.8 -m pip install \
    numpy \
    matplotlib \
    pandas \
    gdown \
    pyautogui \
    pytest \
    Pillow \
    tensorboard \
    swig

RUN python3.8 -m pip install --no-cache-dir --ignore-installed PyYAML \
    && python3.8 -m pip install \
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

# Install Isaac Gym
# RUN wget https://developer.nvidia.com/isaac-gym-preview-4 -O /tmp/isaac-gym-preview-4.tar && \
#     tar -xvf /tmp/isaac-gym-preview-4.tar -C /opt/ && \
#     rm /tmp/isaac-gym-preview-4.tar && \
#     cd /opt/isaacgym/python && \
#     python3.8 -m pip install -e . && \
#     chown -R ${NB_USER}:${NB_GID} /opt/isaacgym

# Allow sudo for the created user
RUN echo "root ALL=(ALL) ALL" >> /etc/sudoers \
    && echo "${NB_USER} ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

# Switch to the user for further operations
USER ${NB_USER}

# Set the working directory
WORKDIR ${HOME}/isaac_ws

# Setup complete
CMD ["/bin/bash"]
