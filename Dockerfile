FROM lolhens/baseimage-openjre
ADD target/springbootApp.jar springbootApp.jar
RUN mkdir -p /usr/share/maven
RUN chmod 777 /usr/share/maven
EXPOSE 80
ENTRYPOINT ["java", "-jar", "springbootApp.jar"]
