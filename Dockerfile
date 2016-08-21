FROM debian:testing

MAINTAINER Gaston.martinez.90@gmail.com

RUN echo "deb http://mirrors.dcarsat.com.ar/debian/ testing main contrib non-free \ndeb-src http://mirrors.dcarsat.com.ar/debian/ testing main contrib non-free" > /etc/apt/sources.list

RUN apt-get update -y && \
	apt-get install -y --no-install-recommends \
		gcc \
		build-essential \
		python3-pip \
		python3-setuptools \
	&& rm -rf /var/lib/apt/lists/*

RUN pip3 install --no-cache-dir jupyter && \
	pip3 install --no-cache-dir bash_kernel && \
	python3 -m bash_kernel.install

ADD https://raw.githubusercontent.com/brendan-rius/jupyter-c-kernel/master/c_spec/kernel.json c_kernel/kernel.json

RUN pip3 install --no-cache-dir jupyter-c-kernel && \
	jupyter-kernelspec install c_kernel/
