FROM python:alpine3.19
LABEL author = "bhanu"
EXPOSE 5000
RUN apk update && apk add --no-cache git &&\
    git clone https://github.com/Sysnove/flask-hello-world.git && \
    cd flask-hello-world && \
    mv hello.py app.py && \
    pip3 install flask
WORKDIR /flask-hello-world
CMD ["flask", "run", "-h", "0.0.0.0"]