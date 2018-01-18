#!/bin/bash
mv $1/src/main/java/de/metro/robocode/TestBot.java $1/src/main/java/de/metro/robocode/$2.java
mv $1/src/main/resources/de/metro/robocode/TestBot.properties $1/src/main/resources/de/metro/robocode/$2.properties
sed -i -e "s/TestBot/$2/g" $1/src/main/java/de/metro/robocode/$2.java
sed -i -e "s/TestBot/$2/g" $1/src/main/resources/de/metro/robocode/$2.properties
sed -i -e "s/TestBot/$2/g" $1/pom.xml
sed -i -e "s/TestBot/$2/g" $1/misc/battles.battle

