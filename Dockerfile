FROM zabbix/zabbix-agent:ubuntu-latest
COPY ./files/linux_zabbix_agent.conf /etc/zabbix/zabbix_agentd.d/linux_zabbix_agent.conf
COPY ./files/docker.py /etc/zabbix/docker.py
COPY ./files/docker.ps1 /etc/zabbix/docker.ps1
RUN chmod +x /etc/zabbix/docker.py /etc/zabbix/docker.ps1 \
    && apt-get -qq update \
    && apt-get -qq -y install \
       python3 \
       ca-certificates \
       curl \
    && curl -sSL https://get.docker.com/ | sh \
    && usermod -a -G staff,docker zabbix
