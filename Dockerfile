FROM eclipse-temurin:11-jre-jammy
WORKDIR /app
COPY build/libs/ app-libs/
RUN find app-libs/ -name "*.jar" ! -name "*-plain.jar" -exec mv {} app.jar \; \
    && rm -rf app-libs/
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "app.jar"]
