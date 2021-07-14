# bart-docker

A docker container with [bart](https://github.com/mrirecon/bart), [jupyter](https://jupyter.org/) and related python packages.

## Build

`make`

## Run

`docker run -it --rm -p 8888:8888 pwighton/bart-docker`

Then, inside the container
```
jupyter notebook --ip 0.0.0.0 --no-browser
```
