#!/bin/bash

#result=$( docker images -q discovery-service )
#if [[ -n "$result" ]]; then
#echo "image exists"
#docker rmi -f discovery-service:0.0.1-SNAPSHOT
#else
#echo "No such image"
#fi

cd ..
cd schedule-app-parent
mvn clean install -DskipTests=true

echo "------------------------------------------"
echo "start build apigateway"
echo "------------------------------------------"
cd ..
cd apigateway
mvn clean install -DskipTests=true
docker rmi -f apigateway:0.0.1-SNAPSHOT
docker build -t apigateway:0.0.1-SNAPSHOT .
echo "------------------------------------------"
echo "built apigateway finished"
echo "------------------------------------------"

echo "------------------------------------------"
echo "start build discovery-service"
echo "------------------------------------------"
cd ..
cd discovery-service
mvn clean install -DskipTests=true
docker rmi -f discovery-service:0.0.1-SNAPSHOT
docker build -t discovery-service:0.0.1-SNAPSHOT .
echo "------------------------------------------"
echo "built discovery-service finished"
echo "------------------------------------------"

echo "------------------------------------------"
echo "start build google-calendar-service"
echo "------------------------------------------"
cd ..
cd google-calendar-service
mvn clean install -DskipTests=true
docker rmi -f google-calendar-service:0.0.1-SNAPSHOT
docker build -t google-calendar-service:0.0.1-SNAPSHOT .
echo "------------------------------------------"
echo "built google-calendar-service finished"
echo "------------------------------------------"

echo "------------------------------------------"
echo "start build meeting-manager-service"
echo "------------------------------------------"
cd ..
cd meeting-manager-service
mvn clean install -DskipTests=true
docker rmi -f meeting-manager-service:0.0.1-SNAPSHOT
docker build -t meeting-manager-service:0.0.1-SNAPSHOT .
echo "------------------------------------------"
echo "built meeting-manager-service finished"
echo "------------------------------------------"

echo "------------------------------------------"
echo "start build notification-service"
echo "------------------------------------------"
cd ..
cd notification-service
mvn clean install -DskipTests=true
docker rmi -f notification-service:0.0.1-SNAPSHOT
docker build -t notification-service:0.0.1-SNAPSHOT .
echo "------------------------------------------"
echo "built notification-service finished"
echo "------------------------------------------"

echo "------------------------------------------"
echo "start build zoom-service"
echo "------------------------------------------"
cd ..
cd zoom-service
mvn clean install -DskipTests=true
docker rmi -f zoom-service:0.0.1-SNAPSHOT
docker build -t zoom-service:0.0.1-SNAPSHOT .
echo "------------------------------------------"
echo "built zoom-service finished"
echo "------------------------------------------"

#result=$( docker ps -q -f name=helloworld )
#if [[ $? -eq 0 ]]; then
#echo "Container exists"
#docker container rm -f helloworld
#echo "Deleted the existing docker container"
#else
#echo "No such container"
#fi