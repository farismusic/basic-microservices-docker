FROM bitnami/git AS git
WORKDIR /app
RUN git clone https://github.com/kkenan/basic-microservices.git

FROM maven:3-alpine AS build
WORKDIR /app
COPY --from=git /app/basic-microservices/spring-boot-app .
RUN mvn clean package

FROM openjdk:8-jre-alpine
WORKDIR /app
COPY --from=build /app/target/spring-boot-app-1.0-SNAPSHOT.jar ./app.jar
EXPOSE 8080
RUN adduser --disabled-password -u 8877 faris
USER faris
CMD ["java", "-jar", "app.jar"]