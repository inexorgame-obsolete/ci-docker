FROM ubuntu:17.04

## FRIENDLY REMINDER: Don't push breaking changes to the master branch, without using it in code/master

## Try to run everything in one step, this will reduce the docker image size dramatically
## Docker is working with diffs, every step is creating a new diff, one step means just one diff
## therefore unnecessary interim stages are not saved


RUN apt-get update \
    && apt-get -y install sudo autoconf binutils build-essential cmake doxygen git libtool nasm clang-3.5 clang-3.9 gcc-6 g++-6 wget \
    && apt-get -y --no-install-recommends install python-dev libgtk2.0-dev libgtkglext1-dev libnss3 libgconf-2-4 libxss1 libasound2 libxtst6 \
    && wget https://bootstrap.pypa.io/get-pip.py \
    && python get-pip.py \
    && python -m pip install conan \
    && apt-get -y purge wget \
    && apt-get -y clean \
    && apt-get -y autoremove \
    && rm -rf /usr/share/man/* \ 
    && rm -rf /usr/share/doc/* \
    && rm -rf /var/log/* \
    && rm -rf /var/tmp/* \
    && rm -rf /var/lib/apt/mirrors/* \
    && rm -rf /var/lib/apt/lists/*


# TODO: Can we get rid of the CEF related deps? (libgtk2.0-dev + libgtkglext1-dev + libnss3)
