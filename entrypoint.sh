#! /bin/sh

if [ -z "${site}" ]; then
    echo "Plejd site not set."
    exit 1
fi

if [ -z "${username}" ]; then
    echo "Plejd username not set."
    exit 1
fi

if [ -z "${password}" ]; then
    echo "Plejd password not set."
    exit 1
fi

if [ -z "${mqttUsername}" ]; then
    echo "Mqtt username not set"
    exit 1
fi

if [ -z "${mqttPassword}" ]; then
    echo "Mqtt password not set"
    exit 1
fi

mkdir /data

mqttBroker="${mqttBroker:=mqtt://}" \
includeRoomsAsLights="${includeRoomsAsLights:=false}" \
preferCachedApiResponse="${preferCachedApiResponse:=false}" \
updatePlejdClock="${updatePlejdClock:=false}" \
logLevel="${logLevel:=info}" \
connectionTimout="${connectionTimout:=2}" \
writeQueueWaitTime="${writeQueueWaitTime:=400}" \
envsubst <"/plejd/options.data.tmpl" >"/data/options.json"

node /plejd/main.js