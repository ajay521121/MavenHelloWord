# Use Tomcat base image
FROM tomcat:9.0-jdk17

# Remove default apps
RUN rm -rf /usr/local/tomcat/webapps/*

# Copy WAR file to deployment directory
COPY webapp/target/webapp.war /usr/local/tomcat/webapps/ROOT.war

# Expose port
EXPOSE 9091
