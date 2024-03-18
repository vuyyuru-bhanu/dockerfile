FROM ubuntu
ARG USER='bhanu'
ARG GROUP='bhanu'
ARG UID=1000
ARG GID=1000
ARG HOMEDIR="/spc"
RUN addgroup -g ${GID} ${GROUP} \
    && adduser -h ${HOMEDIR} -u ${UID} -G ${GROUP} -s /bin/bash -D ${USER}
# switching to user spc
USER ${USER}
WORKDIR ${HOMEDIR}
##############################3

FROM python:3.10-bullseye
LABEL authot="bhanu"
EXPOSE 5000
RUN git clone https://github.com/Sysnove/flask-hello-world.git && \
    cd flask-hello-world && \
    mv hello.py app.py && \
    pip3 install flask &&
WORKDIR /flask-hello-world
CMD [ "flask", "run", "-h", "0.0.0.0" ]