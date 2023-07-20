# Stage 1: Build the Spring Boot application
FROM maven:3.8.3-openjdk-11-slim AS builder
WORKDIR /app
COPY pom.xml .
RUN mvn dependency:go-offline
COPY src/ /app/src/
RUN mvn package

# Stage 2: Create the final Docker image
FROM lolhens/baseimage-openjre
COPY --from=builder /app/target/springbootApp.jar springbootApp.jar
EXPOSE 80
ENTRYPOINT ["java", "-jar", "springbootApp.jar"]
