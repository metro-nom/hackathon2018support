#!/bin/bash
# set -x
jenkins_workspace="/home/jk/robo/jenkins_home/workspace"
robocode_folder="/home/jk/robo/robocode"

echo "Copying all robots to the robocode folder"
cd $jenkins_workspace
counter=0
for file in *
do
    cd $file/robots/
    if [ $(ls -1 | wc -l) -gt 1 ]
    then
        echo "PROBLEM!!!! Project $file has more then 1 robot"
    else
        filename=$(ls -1)
        array[$counter]="de.metro.robocode."${filename::-4}
        counter=$((counter+1))
        cd ..
        cp robots/* $robocode_folder/robots/
    fi
    cd ..
done

echo "Create battle file"
cd $robocode_folder
rm -f battles/battles.battle
cp battles/battles_tmp.battle battles/battles.battle
selectedRobots=$(IFS=, ; echo "${array[*]}")
selectedRobots="robocode.battle.selectedRobots=$selectedRobots"
echo $selectedRobots >> battles/battles.battle

echo "Starting robocode battle"
DATE=`date +%Y%m%d_%H%M%S`
echo $DATE
java -Xmx1024M -cp libs/robocode.jar robocode.Robocode -battle battles/battles.battle -results results_$DATE.txt



# remove all robots to get newest after build
# 

# clean workspace
# curl -X POST http://localhost:8080/job/robocode01/doWipeOutWorkspace --user admin:884575adc57019c32a02a3a209c2172a

# run build vom script
# curl -X POST http://localhost:8080/job/robocode01/build --user admin:884575adc57019c32a02a3a209c2172a