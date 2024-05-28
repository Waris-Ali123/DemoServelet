#!/bin/bash

# Download and extract Apache Tomcat
wget https://downloads.apache.org/tomcat/tomcat-9/v9.0.53/bin/apache-tomcat-9.0.53.tar.gz
tar xvfz apache-tomcat-9.0.53.tar.gz

# Copy the WAR file to the Tomcat webapps directory
cp dist/Demoservlet.war apache-tomcat-9.0.53/webapps/

# Give execution permission to Tomcat startup script
chmod +x apache-tomcat-9.0.53/bin/catalina.sh

# Start the Tomcat server
apache-tomcat-9.0.53/bin/catalina.sh run
