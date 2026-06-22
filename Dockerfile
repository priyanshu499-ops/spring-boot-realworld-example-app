FROM gradle:7.5-jdk11 AS builder
WORKDIR /app
COPY . .
RUN gradle build -x test

FROM eclipse-temurin:11-jre-jammy
WORKDIR /app
COPY --from=builder /app/build/libs/spring-boot-realworld-example-app-*.jar app.jar
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "app.jar"]
