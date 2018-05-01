FROM ubuntu:16.04

LABEL mantainer="Eloy Lopez <elswork@gmail.com>"
ARG ARMV7_WHL_URL=https://github.com/ericflores/rpi-python2-wheels/releases/download/v1.7.1/
ARG ARMV7_WHL_FILE=wheels.tar.gz
ARG TF_URL=http://ci.tensorflow.org/view/Nightly/job/nightly-pi/lastSuccessfulBuild/artifact/output-artifacts/
ARG TF_FILE=tensorflow-1.7.0-cp27-none-any.whl

COPY pip.conf /etc/pip.conf

RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    gfortran \
    curl \
    libfreetype6-dev \
    libpng12-dev \
    libzmq3-dev \
    pkg-config \
    python \
    python-dev \
    python-pip \
    python-setuptools \
    python-h5py \
    python-pil \
    rsync \
    software-properties-common \
    unzip \
    git \
    libatlas3-base && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* && \
    mkdir /wheels && \
    cd /wheels && \
    curl --retry 10 -Y 500 -O -SL ${TF_URL}${TF_FILE} && \
    curl --retry 10 -Y 500 -O -SL ${ARMV7_WHL_URL}${ARMV7_WHL_FILE} && \
    tar  -vxzf ${ARMV7_WHL_FILE} 

# RUN pip install --upgrade pip && \ # Replaced as ericflores suggested https://github.com/DeftWork/rpi-tensorflow/issues/5#issuecomment-381374497
RUN pip install --upgrade pip==9.0.3 && \
     pip install --upgrade \
     grpcio==1.11.0 \
     kiwisolver==1.0.1  \
     MarkupSafe==1.0 \
     pyzmq==17.0.0 \
     scandir==1.7 \
     subprocess32==3.2.7 \
     tornado==5.0.2 \
     numpy==1.14.2 \
     scipy==1.0.1 \
     matplotlib==2.2.2 \
     pandas==0.22.0 \
     scikit_learn==0.19.1 \
     tensorflow==1.7.0 \
     ipykernel \
     jupyterlab && \
     python -m ipykernel.kernelspec && \
     rm -rf /wheels

COPY jupyter_notebook_config.py /root/.jupyter/

# Copy sample notebooks.
COPY notebooks /notebooks

# TensorBoard & Jupyter
EXPOSE 6006 8888

WORKDIR "/notebooks"

CMD jupyter lab --ip=* --no-browser --allow-root
