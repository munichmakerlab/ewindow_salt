# Management service for Mutlifactory eWindow

eWindows connect to a salt server for central management and configuration. These are the config files for this salt server

## SaltStack Master
The master is set up in a docker container, based on https://github.com/bbinet/docker-salt-master

SystemD Service file:
```
[Unit]
Description=eWindow Salt Master
After=docker.service
Requires=docker.service

[Service]
TimeoutStartSec=0
Restart=always
ExecStartPre=-/usr/bin/docker kill ewindow_salt
ExecStartPre=-/usr/bin/docker rm ewindow_salt
ExecStart=/usr/bin/docker run --name ewindow_salt \
				-v /data/ewindow/salt/config/pki:/etc/salt/pki \
				-v /data/ewindow/salt/config/master.d:/etc/salt/master.d \
				-v /data/ewindow/salt/data:/srv/salt \
				-p 4505:4505 \
				-p 4506:4506 \
				bbinet/salt-master
ExecStop=/usr/bin/docker stop -t 10 ewindow_salt
#ExecStopPost=/usr/bin/docker rm ewindow_salt

[Install]
WantedBy=multi-user.target
```

Place the files here in /data/ewindow/salt/data, and off you go
