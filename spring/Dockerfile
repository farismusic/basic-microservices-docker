FROM maven:3 AS build

RUN apt-get update && apt-get install -y git-all

WORKDIR /app

RUN git clone https://github.com/kkenan/basic-microservices.git

RUN mvn clean package -f /app/basic-microservices/spring-boot-app


FROM openjdk:8-jre-slim

WORKDIR /app

COPY --from=build /app/basic-microservices/spring-boot-app/target/spring-boot-app-1.0-SNAPSHOT.jar ./app.jar

EXPOSE 8080

# Avoid running app as root user
RUN useradd -u 8877 faris
USER faris

CMD ["java", "-jar", "app.jar"]