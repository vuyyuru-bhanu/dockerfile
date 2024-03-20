FROM python:3.7-alpine
LABEL author="bhanu" project="sudent cource python"
ENV MYSQL_USERNAME=bhanu \
    MYSQL_PASSWORD=root \
    MYSQL_SERVER=localhost \
    MYSQL_SERVER_PORT=3306 \
    MYSQL_DATABASE=test \
    MYSQL_ROOT_PASSWORD=root
EXPOSE 8080
RUN apk update && apk add --no-cache git &&\
    git clone https://github.com/DevProjectsForDevOps/StudentCoursesRestAPI.git &&\
    cd StudentCoursesRestAPI && \
     pip install -r requirements.txt
WORKDIR /StudentCoursesRestAPI     
CMD ["python", "app.py"]