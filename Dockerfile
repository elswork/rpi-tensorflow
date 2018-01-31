FROM arm32v7/ubuntu:16.04

LABEL mantainer="Eloy Lopez <elswork@gmail.com>"

RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    curl \
    libfreetype6-dev \
    libpng12-dev \
    libzmq3-dev \
    pkg-config \
    python \
    python-dev \
    python-pillow \
    python-h5py \
    python-scipy \
    rsync \
    software-properties-common \
    unzip \
    git \
    && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN curl -O https://bootstrap.pypa.io/get-pip.py && \
    python get-pip.py && \
        rm get-pip.py

 RUN pip --no-cache-dir install \
     matplotlib \
     sklearn \
     pandas \
     ipykernel \
     jupyter \
     && \
     python -m ipykernel.kernelspec

# ADD tensorflow-1.3.0-cp27-none-linux_armv7l.whl .

RUN pip --no-cache-dir install http://ci.tensorflow.org/view/Nightly/job/nightly-pi/lastSuccessfulBuild/artifact/output-artifacts/tensorflow-1.5.0-cp27-none-any.whl	&& \
    rm -f tensorflow-1.5.0-cp27-none-any.whl

COPY jupyter_notebook_config.py /root/.jupyter/

# Copy sample notebooks.
COPY notebooks /notebooks

COPY run_jupyter.sh /
RUN chmod +x /run_jupyter.sh

# TensorBoard & Jupyter
EXPOSE 6006 8888

WORKDIR "/notebooks"

CMD ["/run_jupyter.sh", "--allow-root"]
