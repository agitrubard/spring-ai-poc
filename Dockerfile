FROM maven:3.9.9-amazoncorretto-21-al2023 AS build

COPY pom.xml ./

COPY src src

RUN mvn clean install -DskipTests

FROM amazoncorretto:21.0.7-al2023-headless

WORKDIR /app

COPY --from=build target/*.jar /app/spring-ai-poc.jar

EXPOSE 8080

ENTRYPOINT ["java", "-jar", "/app/spring-ai-poc.jar"]
