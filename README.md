# Plejd2mqtt

A slightly modified version of icanos [hassio-plejd](https://github.com/icanos/hassio-plejd) made to run in pure docker

## Quick start

### Docker compose (Recommended)

```yaml
---
services:
  plejd2mqtt:
    image: oven-lab/plejd2mqtt:latest
    container_name: plejd2mqtt
    privileged: true
    environment:
      - site=YOUR_SITE
      - username=YOUR_USERNAME
      - password=YOUR_PASSWORD
      - mqttBroker=YOUR_BROKER
      - mqttUsername=YOUR_MQTT_USER
      - mqttPassword=YOUR_MQTT_PASS
    volumes:
      - /var/run/dbus:/var/run/dbus
    restart: unless-stopped
```

### CLI

```
sudo docker run \
-e site=YOUR_SITE \
-e username=YOUR_USERNAME \
-e password=YOUR_PASSWORD \
-e mqttBroker=YOUR_BROKER \
-e mqttUsername=YOUR_MQTT_USER \
-e mqttPassword=YOUR_MQTT_PASS \
-v /var/run/dbus:/var/run/dbus \
--privileged \
oven-lab/plejd2mqtt:latest
```

## Configuration Parameters

The container needs some configuration, which is defined via these environment variables.

| Parameter            | Value                                                                                                                                                                                    |
| -------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| site (Required)        | Name of your Plejd site, the name is displayed in the Plejd app (top bar).                                                                                                               |
| username (Required)    | Email/username of your Plejd account, this is used to fetch the crypto key and devices from the Plejd API.                                                                               |
| password (Required)    | Password of your Plejd account, this is used to fetch the crypto key and devices from the Plejd API.                                                                                     |
| mqttBroker             | URL of the MQTT Broker, eg. mqtt://                                                                                                                                                      |
| mqttUsername (Required)| Username of the MQTT broker                                                                                                                                                              |
| mqttPassword (Required)| Password of the MQTT broker                                                                                                                                                              |
| includeRoomsAsLights   | Adds all rooms as lights, making it possible to turn on/off lights by room instead. Setting this to false will ignore all rooms.                                                         |
| updatePlejdClock       | Hourly update Plejd devices' clock if out of sync. Clock is used for time-based scenes. Not recommended if you have a Plejd gateway. Clock updates may flicker scene-controlled devices. |
| logLevel               | Minimim log level. Supported values are `error`, `warn`, `info`, `debug`, `verbose`, `silly` with increasing amount of logging. Do not log more than `info` for production purposes.     |
| connectionTimeout      | Number of seconds to wait when scanning and connecting. Might need to be tweaked on platforms other than RPi 4. Defaults to: 2 seconds.                                                  |
| writeQueueWaitTime     | Wait time between message sent to Plejd over BLE, defaults to 400. If that doesn't work, try changing the value higher in steps of 50.        

See [original repo](https://github.com/icanos/hassio-plejd/edit/master/plejd/README.md) for more info.

## Support
Since most of the work was done by icanos, i would be very happy if you support them, instead of me: [Buy me a coffee](https://www.buymeacoffee.com/w1ANTUb).