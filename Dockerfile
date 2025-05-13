
FROM maven:3.9.6-eclipse-temurin-17 AS build

WORKDIR /app

COPY . /app/

RUN mvn -f /app/pom.xml clean package -DskipTests


FROM openjdk-17.0.2

WORKDIR /app

COPY --from=build /app/target/*.jar /app/demo-docker.jar

EXPOSE 8080
CMD ["sh", "-c", "java -jar  /app/demo-docker.jar 2>&1"]