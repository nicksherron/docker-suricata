FROM ubuntu:latest

ARG INTERFACE


RUN apt-get update &&  apt-get install -y libpcre3 libpcre3-dbg libpcre3-dev build-essential libpcap-dev   \
                libyaml-0-2 libyaml-dev pkg-config zlib1g zlib1g-dev \
                make libmagic-dev python-pip


RUN apt-get update &&  apt-get install -y suricata
RUN pip install --upgrade suricata-update
#RUN suricata-update


RUN apt-get -y install cron 

RUN touch /var/log/cron.log


# Setup cron job
RUN ( crontab -l ; echo "* 12 * * *  /usr/local/bin/suricata-update  2>> /var/log/cron.log") | crontab
RUN service cron start

RUN suricata-update

CMD suricata -c /etc/suricata/suricata.yaml -i ${INTERFACE:-eth0}

