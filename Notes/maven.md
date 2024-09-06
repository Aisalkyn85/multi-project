Maven
======


Lifecycle
-----------
Site
Clean
default

Few Phases
========
Clean
Site

Validate
Compile
Test Compile
Test
Package
Verify
Install
Deploy

mvn clean package
mvn install -Dmaven.test.skip=true
mvn clean install -DskipTests


Plugins
======
maven.apache.org/plugins



Goals
=====


Profiles
======




mvn archetype:generate -DgroupId=com.GGapp -DartifactId=GGapp -DarchetypeArtifactId=maven-archetype-webapp -DinteractiveMode=false
