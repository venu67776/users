FROM        maven:3-openjdk-8 as BUILD
RUN         mkdir -p /app/src
WORKDIR     /app
COPY        src src
COPY        pom.xml .
RUN         mvn package

FROM        openjdk:8-jre-slim
COPY        --from=BUILD /app/target/users-api-0.0.1.jar users.jar
CMD         ["java", "-Xmx2048m", "-jar", "users.jar"]