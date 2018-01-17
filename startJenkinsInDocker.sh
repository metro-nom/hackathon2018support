#!/bin/bash
jenkinsFolder=/home/jk/robo/jenkins_home2

# Works only outside of vpn
#docker run -v /home/jk/robo/jenkins_home:/var/jenkins_home  -p 8888:8080 -p 50000:50000 robojenkins

if [ ! -d "$jenkinsFolder" ]; then
    mkdir $jenkinsFolder
    sudo chown 1000:1000 j$jenkinsFolder
fi

docker run --network host -v $jenkinsFolder:/var/jenkins_home robojenkins