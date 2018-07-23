#!/bin/sh
#tomcat
tomcat_home=/usr/local/tomcat
kill -9 $(echo $(netstat -anp|grep 8080) | cut -d " " -f 7|cut -d / -f 1)
git pull
mvn clean compile war:war
mv target/*.war target/ROOT.war
rm -rf $tomcat_home/webapps/ROOT*
mv target/ROOT.war $tomcat_home/webapps/
$tomcat_home/bin/startup.sh
tail -n 200 -f $tomcat_home/logs/catalina.out
