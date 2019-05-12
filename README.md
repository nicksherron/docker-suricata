# How to use this image

## start a suricata instance 

``` bash
$ docker run -d  --name suricata \
             -v suricata_data:/var/log/suricata/ \
             --net=host -e "INTERFACE=eth0" \
             nsherron/suricata
``` 

## tail logs
``` bash
$ docker exec -it suricata tail -f /var/log/suricata/eve.json
```


