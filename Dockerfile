# Use the Alpine Linux base image
FROM alpine:3.12 as base

# Install bash and netcat
RUN apk add --update bash netcat-openbsd maven

# Install OpenJDK 11
RUN apk add --update openjdk11

# Set the working directory to /app
WORKDIR /app
# Copy the code from source to the container
COPY /src ./src
# Copy the pom.xml file to the working directory
COPY pom.xml .

# Build the Spring Boot app using Maven
RUN mvn clean package

# Create a new stage for the final image
FROM alpine:3.12 as final

# Install bash and netcat
RUN apk add --update bash nmap-ncat openjdk11

# Set the working directory to /app
WORKDIR /app

# Copy the built JAR file from the previous stage
COPY --from=base /app/target/text4shell-app.jar .

# Start the Spring Boot app
# CMD ["/bin/bash", "-c", "java -jar text4shell-app.jar"]
CMD ["java", "-jar", "text4shell-app.jar"]

# Mit frontend:
#FROM alpine:3.12 as base
#
## Install necessary packages
#RUN apk add --update bash netcat-openbsd maven nginx
#
## Set the working directory to /app
#WORKDIR /app
#
## Copy the HTML, CSS, and JavaScript files for the website
#COPY . /usr/share/nginx/html
#
## Copy the code from source to the container
#COPY /src ./src
## Copy the pom.xml file to the working directory
#COPY pom.xml .
#
## Build the Spring Boot app using Maven
#RUN mvn clean package
#
## Create a new stage for the final image
#FROM alpine:3.12 as final
#
## Set the working directory to /app
#WORKDIR /app
#
## Copy the built JAR file from the previous stage
#COPY --from=base /app/target/text4shell-app.jar .
#
## Start the Spring Boot app and Nginx server
#CMD ["/bin/sh", "-c", "java -jar text4shell-app.jar & nginx -g 'daemon off;'"]
#
## Expose ports 80 and 8080
#EXPOSE 80 8080