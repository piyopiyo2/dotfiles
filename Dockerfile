FROM ubuntu:20.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    ssh \
    wget \
    vim \
    git \
    tree

# install python
RUN apt-get update && \
    apt-get install software-properties-common -y --no-install-recommends && \
    add-apt-repository ppa:deadsnakes/ppa && \
    apt-get install -y --no-install-recommends python3.8 python3-pip 
RUN ln -s /usr/bin/pip3 /usr/bin/pip
RUN ln -s /usr/bin/python3.8 /usr/bin/python
RUN python -m pip install --upgrade pip
RUN pip install \
    numpy \
    opencv-python \
    black \
    mypy \
    flake8 \
    isort \
    pytest
RUN pip install torch==1.8.0+cu111 torchvision==0.9.0+cu111 torchaudio==0.8.0 -f https://download.pytorch.org/whl/torch_stable.html
RUN pip install tensorflow

RUN apt-get clean
RUN rm -rf /var/lib/apt/lists/*

# vim
RUN wget https://github.com/piyopiyo2/dotfiles/blob/master/.vimrc -O /.vimrc

# git
RUN git config --global user.name "piyopiyo2"
RUN git config --global user.email "79834290+piyopiyo2@users.noreply.github.com"
RUN git config --global core.editor "vim"
RUN git config --global core.filemode false
