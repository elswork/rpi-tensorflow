# Supercharged Machine Learning ToolBox for ARM

A [Docker](http://docker.com) image for ARM devices with [Tensorflow 1.2.1](https://www.tensorflow.org/) an open source software library for numerical computation using data flow graphs that will let you play and learn distinct Machine Learning techniques over [Jupyter Notebook](http://jupyter.org/) an open-source web application that allows you to create and share documents that contain live code, equations, visualizations and explanatory text. Computational Narratives as the Engine of Collaborative Data Science.   

> Be aware! You should read carefully the usage documentation of every tool!

## Latest Changes
- Upgraded from Tensorflow 1.1.0 to 1.2.1

## Details
- [Docker Hub](https://hub.docker.com/r/elswork/rpi-tensorflow/)
- [Deft.Work my personal blog](http://deft.work/tensorflow_for_raspberry)

## Thanks to

- [Romilly Cocking for the idea](https://github.com/romilly/rpi-docker-tensorflow)
- [Pi tensorflow whl file](https://github.com/samjabrahams/tensorflow-on-raspberry-pi/releases/download/v1.1.0/tensorflow-1.1.0-cp27-none-linux_armv7l.whl) from [Sam Abrahm's Github project](https://github.com/samjabrahams/tensorflow-on-raspberry-pi)

## My Real Usage Example

In order everyone could take full advantages of the usage of this docker container, I'll describe my own real usage setup.
```sh
$ docker run -d -p 8888:8888 elswork/rpi-tensorflow:latest

```
A more complex sample:
```sh
$ docker run -d -p 8888:8888 \
 -p 0.0.0.0:6006:6006 \
 -v ~/myNotebooks:/notebooks/myNotebooks \
 --restart=unless-stopped \
 elswork/rpi-tensorflow:latest

```
Point your browser to `http://localhost:8888`

With the second example you can run TensorBoard executing this command in the container:
```sh
$ tensorboard --logdir=path/to/log-directory --host=0.0.0.0

```
And pointing your browser to `http://localhost:6006`
