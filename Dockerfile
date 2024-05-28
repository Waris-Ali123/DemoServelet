# Use the official Tomcat image as the base image
FROM tomcat:9.0.53-jdk11-openjdk

# Set the environment variables
ENV JAVA_OPTS="-Djava.security.egd=file:/dev/./urandom"

# Copy the WAR file to the webapps directory of Tomcat
COPY ./dist/Demoservelet.war /usr/local/tomcat/webapps/

# Expose port 8080
EXPOSE 8080

# Define the command to run Tomcat
CMD ["catalina.sh", "run"]
