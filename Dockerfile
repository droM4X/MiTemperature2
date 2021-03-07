FROM python:3-slim

WORKDIR /usr/src/app

# http://bugs.python.org/issue19846
# > At the moment, setting "LANG=C" on a Linux system *fundamentally breaks Python 3*, and that's not OK.
ENV LANG C.UTF-8

RUN apt update
RUN apt -y --no-install-recommends install build-essential python3-dev python3-pip libglib2.0-dev bluetooth libbluetooth-dev python3-setuptools

RUN /usr/bin/pip3 install requests
RUN /usr/bin/pip3 install wheel
RUN /usr/bin/pip3 install bluepy
RUN /usr/bin/pip3 install pybluez

COPY LYWSD03MMC.py LYWSD03MMC.py 
COPY sendToFile.sh sendToFile.sh
COPY bluetooth_utils.py bluetooth_utils.py

ENTRYPOINT service dbus start
ENTRYPOINT while true; do /usr/bin/python3 LYWSD03MMC.py -a --battery -df sensors.ini -odl --callback sendToFile.sh; sleep 2; done
