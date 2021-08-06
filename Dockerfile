FROM maven:3.8.1-openjdk-11

WORKDIR /work

COPY . /work/
COPY ./settings.xml /root/.m2/settings.xml

EXPOSE 8888

RUN ./bootstrap.sh package

ENTRYPOINT bash bootstrap.sh run
