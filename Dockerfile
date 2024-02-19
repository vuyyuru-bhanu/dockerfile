FROM maven:3.8.7-openjdk-18 AS build
RUN git clone https://github.com/spring-projects/spring-petclinic.git && \
    cd spring-petclinic && \
    mvn package

FROM openjdk:22-ea-17-jdk-bullseye
LABEL project="test"
LABEL author="bhanu"
EXPOSE 8080
COPY --from=build /spring-petclinic/target/spring-petclinic-3.2.0-SNAPSHOT.jar /spring-petclinic.jar
CMD ["java", "-jar", "/spring-petclinic.jar"]