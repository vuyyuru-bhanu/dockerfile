FROM maven:3.8.6-openjdk-11 as build

RUN git clone https://github.com/spring-projects/spring-petclinic.git && \
    cd spring-petclinic && \
    mvn package

# jar location /spring-petclinic/target/spring-petclinic-2.7.3.jar




FROM openjdk:21-jdk

LABEL project="petclinic"

LABEL author="devops team"

EXPOSE 8080

COPY --from=build /spring-petclinic/target/*.jar /spring-petclinic.jar

CMD ["java", "-jar", "/spring-petclinic.jar"]