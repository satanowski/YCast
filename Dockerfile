FROM alpine:latest

ADD . /opt/

RUN apk update && apk add python3 py3-pip && \
    cd /opt && python3 setup.py install && \
    cd / && rm -rf /opt && apk cache purge

CMD python3 -m ycast -l 0.0.0.0 -p 8010 -c $STATIONS_PATH
