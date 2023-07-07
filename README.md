# opentracing-microservices-example

This is source code for blog [Jaeger Integration With Spring Boot Application](https://medium.com/xebia-engineering/jaeger-integration-with-spring-boot-application-3c6ec4a96a6f).


## Cloning the Project
You can clone the project using the follwoing command:

```
git clone git@github.com:ozer550/Jaeger-demo-application.git
```

## Switch to branch with prometheus and grafana setup

```
git pull
git branch -a
git checkout otl_instrumentation_prometheus_grafana
```

## Run the docker-compose file to bring up containers

```
podman-compose up
or
docker compose up
```

## Run the shell script to bring up mircoservices with opentelemetry agent

```
./run.sh
```

you can browse the applications at following endpoints:

Jaeger: http://localhost:9090/
prometheus: http://localhost:8888/
grafana: http://localhost:3000/
Demo application: http://localhost:8080/api/v1/names/random
