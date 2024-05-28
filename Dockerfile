FROM tomcat:9.0.53-jdk11-openjdk

# Copy WAR file to the webapps directory of Tomcat
COPY dist/Demoservlet.war /usr/local/tomcat/webapps/

# Expose port 8080 to the outside world
EXPOSE 8080

# Run Tomcat server
CMD ["catalina.sh", "run"]
