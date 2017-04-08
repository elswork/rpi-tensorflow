# Supercharged Machine Learning ToolBox for ARM

A [Docker](http://docker.com) image for ARM devices with  [Tensorflow 1.0](https://www.tensorflow.org/) an open source software library for numerical computation using data flow graphs that will let you play and learn distinct Machine Learning techniques over [Jupyter Notebook](http://jupyter.org/) an open-source web application that allows you to create and share documents that contain live code, equations, visualizations and explanatory text. Computational Narratives as the Engine of Collaborative Data Science.   

> Be aware! You should read carefully the usage documentation of every tool! 

## Details
- [Source Repository](https://hub.docker.com/r/elswork/rpi-tensorflow/)
- [Deft.Work my personal blog](http://deft.work/tensorflow_for_raspberry)

## My Real Usage Example

In order everyone could take full advantages of the usage of this docker container, I'll describe my own real usage setup.
```sh
$ docker run -d -p 8888:8888 \
    -v ~/myNotebooks:/notebooks/myNotebooks \ elswork/rpi-tensorflow:latest

```
Point your browser to `http://localhost:8888`.

