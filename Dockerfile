# # Build stage #
FROM maven:3.6.3-jdk-8-slim AS build
COPY /spring-boot-websocket-demo/src /home/app/src
COPY /spring-boot-websocket-demo/pom.xml /home/app
RUN mvn -f /home/app/pom.xml clean package
# # Package stage #
FROM java:openjdk-8-jdk
COPY --from=build /home/app/target/spring-boot-websocket-demo-0.0.1-SNAPSHOT.war /usr/local/lib/springBoot.jar
EXPOSE 8888
WORKDIR /usr/local/lib/
ENTRYPOINT ["java", "-jar", "springBoot.jar"]
#CMD ["java", "-jar", "/springBoot.jar"]

