FROM lolhens/baseimage-openjre
ADD target/springbootApp.jar springbootApp.jar
ENTRYPOINT ["java", "-jar", "springbootApp.jar"]
