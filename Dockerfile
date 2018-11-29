FROM library/maven:3.6.0-jdk-7

RUN adduser --disabled-password --gecos "App" app && \
     mkdir -p /home/app/.ssh && \
     mkdir -p /home/app/src && \
     mkdir -p /home/app/work && \
     chown -R app:app /home/app

USER app

ADD --chown=app:app  . /home/app/work/cello

# install local jars and compile
RUN cd /home/app/work/cello/resources/library && \
    bash install_local_jars_linux.sh && \
    cd /home/app/work/cello && \
    mvn clean compile

WORKDIR /home/app/work/cello

ENTRYPOINT mvn spring-boot:run