FROM lolhens/baseimage-openjre
ADD target/springbootApp.jar springbootApp.jar
EXPOSE 80
ENTRYPOINT ["java", "-jar", "springbootApp.jar"]
