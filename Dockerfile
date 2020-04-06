FROM zabbix/zabbix-agent:ubuntu-latest
COPY ./files /etc/zabbix
RUN chmod +x /etc/zabbix/docker.py /etc/zabbix/docker.ps1 /etc/zabbix/sync.sh /etc/zabbix/syncthing.sh \
    && apt-get -qq update \
    && apt-get -qq -y install \
       python3 \
       jq \
       ca-certificates \
       curl \
    && curl -sSL https://get.docker.com/ | sh \
    && usermod -a -G staff,docker zabbix
