#!/usr/bin bash

yum update -y


cat << EOF >> /etc/systemd/system/my-app.service
[Unit]
Description=This is what my service does

[Service]
ExecStart= /usr/bin/java -jar /home/ec2-user/app/app.jar

[Install]
WantedBy=multi-user.target
EOF
