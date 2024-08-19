#!/bin/bash -e
#use cases

#./ops/app.sh build
#./ops/app.sh run
#./ops/app.sh

DIR=$( cd "$( dirname "$0" )" && pwd )
export ACT=$1
#. ~/.asdf/plugins/java/set-java-home.bash
#asdf_update_java_home();

export ET=n
export ENV=uat

pushd $DIR/..
  if [ "${ACT}" == 'build' ] ; then
    ./mvnw clean install -Dmaven.test.skip=true -Djacoco.skip=true
  elif [ "${ACT}" == 'run' ] ; then
    java -jar target/*-SNAPSHOT.jar
  else
    ./mvnw clean spring-boot:run
  fi
popd
