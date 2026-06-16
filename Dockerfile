FROM gradle:7.5-jdk11 AS builder
WORKDIR /app
COPY . .
RUN gradle build -x test

FROM openjdk:11-jre-slim
WORKDIR /app
COPY --from=builder /app/build/libs/*.jar app.jar
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "app.jar"]
