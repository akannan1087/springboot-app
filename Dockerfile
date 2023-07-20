# Stage 1: Build the Spring Boot application with Maven
FROM maven:3.8.3-openjdk-11-slim as builder

WORKDIR /app

# Copy the pom.xml and download dependencies to cache them
COPY pom.xml .
RUN mvn dependency:go-offline

# Copy the source code and build the application
COPY src/ ./src/
RUN mvn package -DskipTests

# Stage 2: Create the final Docker image for the runtime environment
FROM openjdk:11-jre-slim

WORKDIR /app

# Copy the JAR file from the builder stage
COPY --from=builder /app/target/springbootApp.jar .

# Expose the port on which the Spring Boot application listens
EXPOSE 80

# Start the Spring Boot application
CMD ["java", "-jar", "springbootApp.jar"]
