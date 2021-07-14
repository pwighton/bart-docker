FROM python:3.6-slim-buster

RUN apt-get update && \
    apt-get -yy install \
      make \
      git \
      gcc \
      libfftw3-dev \
      liblapacke-dev \
      libpng-dev \
      libopenblas-dev

COPY requirements.txt /tmp/requirements.txt
RUN pip install --upgrade pip && \
    pip install --no-cache-dir -r /tmp/requirements.txt

RUN git clone https://github.com/mrirecon/bart /opt/bart && \
    cd /opt/bart && \
    make && \
    make install

ENV PYTHONPATH /opt/bart/python

RUN useradd -ms /bin/bash bart-user
USER bart-user
WORKDIR /home/bart-user

ENTRYPOINT /bin/bash
