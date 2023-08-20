FROM lolhens/baseimage-openjre
@ADD target/springbootApp.jar springbootApp.jar
ESXPOSE 80
ENTRYPOINT ["java", "-jar", "springbootApp.jar"]
