#!/bin/sh
tomcat_home=/usr/local/tomcat
kill -9 $(lsof -i tcp:8080 | sed -n '2p' | awk '{print $2}')
git pull
mvn clean compile war:war
mv target/*.war target/ROOT.war
rm -rf $tomcat_home/webapps/ROOT*
mv target/ROOT.war $tomcat_home/webapps/
$tomcat_home/bin/startup.sh
tail -n 200 -f $tomcat_home/logs/catalina.out
