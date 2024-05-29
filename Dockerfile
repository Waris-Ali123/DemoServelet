# Use the official Tomcat image as the base image
FROM tomcat:9.0.53-jdk11-openjdk

# Set the environment variables
ENV JAVA_OPTS="-Djava.security.egd=file:/dev/./urandom"

# Copy the WAR file to the webapps directory of Tomcat
COPY dist/DemoServelet.war /usr/local/tomcat/webapps/


# Copy custom tomcat-users.xml
COPY config/tomcat-users.xml /usr/local/tomcat/conf/

# Copy custom context.xml for host-manager
COPY config/context-host-manager.xml /usr/local/tomcat/webapps/host-manager/META-INF/context.xml

# Copy custom context.xml for manager
COPY config/context-manager.xml /usr/local/tomcat/webapps/manager/META-INF/context.xml

# Expose port 8080
EXPOSE 8080

# Define the command to run Tomcat
CMD ["catalina.sh", "run"]
