#!/bin/bash

# Parameters to set:
listOfRobots="/home/jk/robo/listOfRobots"
jenkinsApiToken="84756b7dd39d5fbd8f18ef6f25813145"
jenkinsConfigTemplate="/home/jk/robo/jenkinsConfigTemplate.xml"
# ber = Berlin, dus = Düsseldorf, buk = Bucharest, brv = Brasov, ALL = all Cities
location="ber"

#Adding Jenkins Jobs from listOfRobots
CRUMB=$(curl -s 'http://localhost:8080/crumbIssuer/api/xml?xpath=concat(//crumbRequestField,":",//crumb)' --user admin:$jenkinsApiToken)
while read -r robot
do
    name="robocode18"
    if [[ $robot == "robocode$location"* || $location == ALL ]] ;
    then
        cp $jenkinsConfigTemplate "jenkinsConfig.xml"
        sed -i -e "s/REPLACEROBOTNAME/$robot/g" jenkinsConfig.xml
        curl -s -XPOST "http://localhost:8080/createItem?name=$robot" --user admin:$jenkinsApiToken \
                --data-binary @jenkinsConfig.xml -H "Content-Type:text/xml" -H "$CRUMB"
        rm "jenkinsConfig.xml"
    fi
done < "$listOfRobots"



# remove all robots to get newest after build
# clean workspace
# curl -X POST http://localhost:8080/job/robocode01/doWipeOutWorkspace --user admin:884575adc57019c32a02a3a209c2172a

# run build vom script
# curl -X POST http://localhost:8080/job/robocode01/build --user admin:884575adc57019c32a02a3a209c2172a