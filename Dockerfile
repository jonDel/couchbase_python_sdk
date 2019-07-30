FROM ubuntu:bionic

RUN apt-get update &&\
    apt-get install -y wget gnupg
RUN sh -c 'echo "deb http://packages.couchbase.com/ubuntu bionic bionic/main" | tee /etc/apt/sources.list.d/couchbase.list'
RUN sh -c 'wget -O- http://packages.couchbase.com/ubuntu/couchbase.key | apt-key add -'
RUN apt-get update &&\
    apt-get install -y libcouchbase2-libevent libcouchbase-dev &&\
    apt-get install -y python3-pip
RUN pip3 install couchbase
# This will make the container alive
CMD ["bash", "-c", "while true; do sleep 1; done"]
