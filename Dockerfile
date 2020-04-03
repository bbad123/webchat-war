FROM java:openjdk-8-jdk
ADD /spring-boot-websocket-demo/target/spring-boot-websocket-demo-0.0.1-SNAPSHOT.war springBoot.jar
EXPOSE 8888
CMD ["java", "-jar", "/springBoot.jar"]
