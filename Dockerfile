FROM timmyraynor/spark:latest
MAINTAINER Tim.Qin<qinyujue@gmail.com>

RUN wget -O /tmp/zeppelin-0.7.0-bin-all.tgz http://apache.uberglobalmirror.com/zeppelin/zeppelin-0.7.0/zeppelin-0.7.0-bin-all.tgz
# install hadoop
RUN tar -xzf /tmp/zeppelin-0.7.0-bin-all.tgz -C /usr/local
RUN cd /usr/local && ln -s ./zeppelin-0.7.0-bin-all zeppelin