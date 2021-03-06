FROM ubuntu:16.04

RUN apt-get update
RUN apt-get install -y -q wget curl
RUN apt-get install -y -q build-essential
RUN apt-get install -y -q libtool autoconf
RUN apt-get install -y -q cmake git libgtk2.0-dev pkg-config
RUN apt-get install -y -q libavcodec-dev libavformat-dev libswscale-dev
RUN apt-get install -y -q python-dev python-numpy libtbb2 libtbb-dev libjpeg-dev
RUN apt-get install -y -q libpng-dev libtiff-dev libjasper-dev libdc1394-22-dev
RUN apt-get install -y -q python2.7 python2.7-dev python-pip
RUN apt-get install -y -q libleptonica-dev
RUN apt-get install -y -q tesseract-ocr
RUN apt-get install -y -q tesseract-ocr-kir
RUN pip install cython
RUN pip install numpy
ADD build.sh	/build.sh

RUN /bin/sh /build.sh
RUN rm -rf /build.sh
COPY . /webapp
WORKDIR /webapp
RUN pip install -r requirements.txt
ENTRYPOINT ["python"]

CMD ["server.py"]

