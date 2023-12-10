# Hello World Plugin Demo
Build a simple "Hello, World" plugin using a template.

-- Create a local folder for the source code:
mkdir -p hello-world
cd hello-world

-- Create a plugin from the Jenkins templates:
mvn -U archetype:generate -Dfilter="io.jenkins.archetypes:"

mvn verify
mvn package

Move .hpi file from targets to Jenkins Plugin Directory
Retstart the Jenkins Service


# LogIn Jenkins and follow below steps:
- New freestyle job
- Add "Hello World" build step
- Run, check console