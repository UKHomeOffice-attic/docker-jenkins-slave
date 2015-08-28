#!/bin/bash

if [[ $# -gt 0 ]] && [[ $1 == "jenkins-slave" ]] ; then
  if [[ $# -eq 3 ]]; then
    CI_URL="$2"
    NODE_NAME="$3"
    SLAVE_JAR="$CI_URL/jnlpJars/slave.jar"

    echo Getting slave dependency: $SLAVE_JAR
    wget -O /home/jenkins/slave.jar $SLAVE_JAR

    COMMAND="java -jar /home/jenkins/slave.jar -jnlpUrl $CI_URL/computer/$NODE_NAME/slave-agent.jnlp"

    echo Running slave: $COMMAND
    exec $COMMAND
  else
    echo "Usage: jenkins-slave <jenkins-url> <node-name>"
    exit 99
  fi
else
   exec "$@"
fi

