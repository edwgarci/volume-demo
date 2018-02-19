#!/bin/bash

set -xe

pwd
ls -la
VERSION=0.0.0
# VERSION=$(<version/number)

export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64
export PATH=$JAVA_HOME/bin:$PATH

export M2_HOME=/usr/local/apache-maven/apache-maven-3.3.9
export M2=$M2_HOME/bin
export MAVEN_OPTS="-Xms256m -Xmx512m"
export PATH=$M2:$PATH

cd git-assets/
mvn -DskipTests=true package

echo "saving file with version number: $VERSION"
pwd
ls -la
ls target -la
ls ../ -la
chmod -R 755 ../$CF_APP-releases/
cp target/*.jar ../$CF_APP-releases/$CF_APP-$VERSION.jar
