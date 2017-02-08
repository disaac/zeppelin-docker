# zeppelin-docker
Dockerfile and related resources repo for zeppelin image on docker.
This image is built on top of the [spark-docker](https://github.com/timmyraynor/spark-on-hadoop-docker) image, with the zeppelin settings point to spark home in the spark-docker image.

Components in this image:
  - R
  - Spark
  - Hadoop/YARN
  - Python
  - Zeppelin

# how to build and run
To build, you could use

```shell
  docker build -t timmyraynor/zeppelin-docker .
```
or just pull from the docker hub

```shell
  docker pull timmyraynor/zeppelin-docker:latest
```

To run the instance, you will need to expose the ports for zeppelin + ports for spark + ports for hadoop/YARN, thus

```shell
  docker run -it -p 8088:8088 -p 8042:8042 -p 4040:4040 -p 8090:8090 -p 50070:50070 -h sandbox timmyraynor/zeppelin-docker bash
```

or

```shell
  docker run -it -p 8088:8088 -p 8042:8042 -p 4040:4040 -p 8090:8090 -p 50070:50070 -d -h sandbox timmyraynor/zeppelin-docker -d
```

the above used *sandbox* as the hostname for the instance that is because of the yarn-site.xml files is using *sandbox* as the localhost.

# ports and services
with the ports published in the above command, here list the corresponding services:
  - 8088 YARN
  - 8090 Zeppelin
  - 50070 HDFS GUI
  - 8042 hadoop ui
  
# misc
You could always reattach to the running in backend instance using

```shell
  docker exec -it <CONTAINER ID> /bin/bash
```


