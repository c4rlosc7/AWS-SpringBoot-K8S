FROM openjdk:17-jdk-alpine as builder

WORKDIR /app/ms-employee

COPY ./pom.xml /app
COPY ./ms-employee/.mvn ./.mvn
COPY ./ms-employee/mvnw .
COPY ./ms-employee/pom.xml .

RUN ./mvnw dependency:go-offline
#RUN ./mvnw clean package -Dmaven.test.skip -Dmaven.main.skip -Dspring-boot.repackage.skip && rm -r ./target/

COPY ./ms-employee/src ./src

RUN ./mvnw clean package -DskipTests

FROM openjdk:17-jdk-alpine

WORKDIR /app

RUN mkdir ./logs

COPY --from=builder /app/ms-employee/target/aws-spring-k8s-0.0.1-SNAPSHOT.jar .

ENV PORT 8001

#EXPOSE 8001
EXPOSE $PORT

#ENTRYPOINT ["java", "-jar", "aws-spring-k8s-0.0.1-SNAPSHOT.jar"]
CMD ["java", "-jar", "aws-spring-k8s-0.0.1-SNAPSHOT.jar"]
