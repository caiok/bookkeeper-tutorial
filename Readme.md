# Bookeeper Tutorial
This project is derived from [https://github.com/ivankelly/bookkeeper-tutorial]. Read its Readme for a full explanation of the basics.
 
## Build docker image

Run `make` without arguments in order to package the Maven project and to build the docker image that will run it:
```
make
```

## Run the docker image

In order to run the image you need a Zookeeper ensemble (in standalone mode, for example) and a Bookkeeper ensemble (like the one run with localbookie).

When these are up and running, run:
```
make run ZOOKEEPER_SERVERS=127.0.0.1:2181
```

The previous command can be run as many times as desired in order to see concurrency in action.
