#FROM java:openjdk-8-jdk
#ADD /spring-boot-websocket-demo/target/spring-boot-websocket-demo-0.0.1-SNAPSHOT.war springBoot.jar
#EXPOSE 8888
#CMD ["java", "-jar", "/springBoot.jar"]


# # Build stage # 
FROM maven:3.6.3-jdk-8-slim AS build 
COPY /spring-boot-websocket-demo/src /home/app/src 
COPY /spring-boot-websocket-demo/pom.xml /home/app 
RUN mvn -f /home/app/pom.xml clean package 
# # Package stage # 
FROM java:openjdk-8-jdk
COPY --from=build /home/app/target/spring-boot-websocket-demo-0.0.1-SNAPSHOT.war /usr/local/lib/springBoot.jar 
EXPOSE 8888 
CMD ["java", "-jar", "/springBoot.jar"]
