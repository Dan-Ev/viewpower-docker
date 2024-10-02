Docker container for the ViewPower application: https://www.power-software-download.com/viewpower.html.

The example docker-compose.yml file is the recommended way to run this docker container. You need to specify the UPS device, for example if it is a USB device. You can find the device using lsusb. 
Persistant volumes are required to store configuration and logs between restarts. 
The compiled docker image is available at https://hub.docker.com/repository/docker/michu137/viewpower-docker/general.

You can also combine this container with https://github.com/jstehlik/prometheus-viewpower to get metrics into prometheus.

The web application can be accessed via port 15178 or run through a reverse proxy (e.g. traefik or nginx) without any issues.

Example result:
![image](https://github.com/user-attachments/assets/21853659-66c7-49a4-9d6d-bf176b9c2010)

