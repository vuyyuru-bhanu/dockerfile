FROM amazoncorretto:17-alpine3.17-jdk
LABEL author="bhanu" 
LABEL project="test"
ARG DOWNLOAD_URL="https://referenceapplicationskhaja.s3.us-west-2.amazonaws.com/spring-petclinic-3.1.0-SNAPSHOT.jar"
ARG USER="spc"
ARG GROUP="spc"
ARG UID=1000
ARG GID=1000
ARG HOMEDIR="/spc"
# creates a new group and user
RUN addgroup -g ${GID} ${GROUP} \
    && adduser -h ${HOMEDIR} -u ${UID} -G ${GROUP} -s /bin/bash -D ${USER}
# switching to user spc
USER ${USER}
# Download the file
ADD --chown=${USER}:${GROUP} ${DOWNLOAD_URL} ${HOMEDIR}/spring-petclinic.jar
WORKDIR ${HOMEDIR}
EXPOSE 8080
CMD ["java", "-jar", "spring-petclinic.jar"]