FROM openjdk:17-jdk-alpine

WORKDIR /app

COPY ./target/aws-spring-k8s-0.0.1-SNAPSHOT.jar .

EXPOSE 8088

CMD ["java", "-jar", "aws-spring-k8s-0.0.1-SNAPSHOT.jar"]
