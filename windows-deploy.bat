@echo off
mvn clean compile war:war
mv target/*.war target/ROOT.war
tail -n 200 -f /usr/local/tomcat6/logs/catalina.out