# MiTemperature2 Docker with ATC mode usage

MiTemperature2: https://github.com/JsBergbau/MiTemperature2

ATC MiThermometer: https://github.com/atc1441/ATC_MiThermometer

---

## Usage

1. Image building: `sudo docker build -t mitempatc https://github.com/droM4X/MiTemperature2.git`

2. Edit mi-sensors.ini file, set your devices MAC address/names

3. Container start: `sudo docker run --net=host --privileged --restart unless-stopped -d -i -t -v [PATH-TO-DIRECTORY]:/usr/src/app --name MiTempATC mitempatc`

Option --privileged required to access docker host bluetooth manager

Sensor datas goes to PATH/sensordata to sensor-SENSORNAME.txt
 
--- 

Tested on Raspberry Pi 4 @ Raspberry Pi OS 
