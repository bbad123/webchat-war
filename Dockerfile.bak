FROM maven:3.5.0-jdk-8 AS builder

# speed up Maven JVM a bit
ENV MAVEN_OPTS=”-XX:+TieredCompilation -XX:TieredStopAtLevel=1″

# make source folder
RUN mkdir -p /app
WORKDIR /app

# copy other source files (keep code snapshot in image)
COPY app-src/pom.xml /app
COPY app-src/src /app/src

# run packaging
RUN mvn package -T 1C

# customize base JDK version here
FROM tomcat:latest
MAINTAINER mycontainertestkk.azurecr.io
COPY –from=builder /spring-boot-websocket-demo/target/spring-boot-websocket-demo-0.0.1-SNAPSHOT.war /usr/local/tomcat/webapps/
EXPOSE 8888