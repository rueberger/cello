FROM library/maven:3.6.0-jdk-7

RUN adduser --disabled-password --gecos "Cello" cello && \

USER cello

ADD --chown=cello:cello  . /home/cello/cello

# install local jars and compile
RUN cd /home/cello/cello/resources/library && \
    bash install_local_jars_linux.sh && \
    cd /home/cello/cello && \
    mvn clean compile

WORKDIR /home/cello/cello

ENTRYPOINT mvn spring-boot:run