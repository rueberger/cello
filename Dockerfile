FROM library/maven:3.6.0-jdk-7

# create user
RUN addgroup -g 1000 -S app && \
    adduser -u 1000 -S app -G app && \
    mkdir -p /home/app && \
    chown -R app:app /home/app


USER app

RUN mkdir -p /home/app/work && \
    mkdir -p /home/app/src

ADD --chown=app:app  . /home/app/cello