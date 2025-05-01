#!/bin/bash

# remove pacotes antigos
for pkg in docker.io docker-doc docker-compose podman-docker containerd runc; do apt-get remove $pkg; done


# run install
apt update
apt install ca-certificates curl
install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/debian/gpg -o /etc/apt/keyrings/docker.asc
chmod a+r /etc/apt/keyrings/docker.asc

echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/debian \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  tee /etc/apt/sources.list.d/docker.list > /dev/null

apt update
apt install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin



# get logs from containers Apply to new containers, not to already existing - https://docs.docker.com/engine/logging/
if [[ $(docker info --format '{{.LoggingDriver}}') == "none" ]]; then
  sed -i 's#"log-driver": "none"#"log-driver": "local"#' /etc/docker/daemon.json
  echo -n "Config dockerd log: "
  dockerd --validate
  systemctl restart docker || \
    /etc/init.d/docker restart
fi
