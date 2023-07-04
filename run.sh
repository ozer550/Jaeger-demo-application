#!/bin/bash

AGENT_FILE=opentelemetry-javaagent-all.jar

if [ ! -f "${AGENT_FILE}" ]; then
  curl -L https://github.com/aws-observability/aws-otel-java-instrumentation/releases/download/v1.19.2/aws-opentelemetry-agent.jar --output ${AGENT_FILE}
fi

directories=("animal-name-service" "scientist-name-service" "name-generator-service")

export OTEL_TRACES_EXPORTER=otlp
export OTEL_METRICS_EXPORTER=otlp
export OTEL_EXPORTER_OTLP_ENDPOINT=http://localhost:5555
export OTEL_RESOURCE_ATTRIBUTES=service.name=name-generator-service,service.version=1.0


pids=()


kill_processes() {
  for pid in "${pids[@]}"; do
    echo "Killing process with PID: $pid"
    kill "$pid"
  done
}


kill_agent() {
  agent_pid=$(pgrep -f "opentelemetry-javaagent-all.jar")
  if [ -n "$agent_pid" ]; then
    echo "Killing agent process with PID: $agent_pid"
    kill "$agent_pid"
  fi
}


trap 'kill_processes; kill_agent' EXIT

for dir in "${directories[@]}"
do
    cd "$dir"
    mvn clean package -Dmaven.test.skip=true
    java -javaagent:../${AGENT_FILE} -jar target/${dir}-0.0.1-SNAPSHOT.jar &
    # Store the PID of the background process
    pids+=($!)
    cd ..
done

read -rp "Press any key to exit..."