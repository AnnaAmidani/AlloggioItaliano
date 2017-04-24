#!/bin/bash

blue='\e[0;34m'
end='\e[0m'

echo -e ${blue}'MAVEN_OPTS="-Xdebug -Xnoagent -Djava.compiler=NONE -Xrunjdwp:transport=dt_socket,address=4000,server=y,suspend=n"' ${end}
export MAVEN_OPTS="-Xdebug -Xnoagent -Djava.compiler=NONE -Xrunjdwp:transport=dt_socket,address=4000,server=y,suspend=n"

echo -e ${blue}'mvn -Djetty.port=7310 jetty:run'${end}
mvn -Djetty.port=7310 jetty:run

