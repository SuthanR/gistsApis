# gistsApis

Karate is a web service testing framework build on top of the BDD framework called Cucumber. It helps the testing process
allowing the dev-test team to test web services without Java knowledge to write the HTTP calls and assert the web services
response easy and fast.

Set up guide:

Software: Java latest version, Editors like Intellij or Eciplse & Maven latest version

1. git clone https://github.com/SuthanR/gistsApis.git
2. From the project root directory right-click to run the feature or mvn clean test
3. In the maven pom file, I have added the dependencies that require to use the framework
4. Test reports can be found in the target folder.

For more information, please refer : https://github.com/intuit/karate


The folder structure in the test directory contains the runner file, feature files and the Config file. This config
file is more helpful to have a global variable as well to run in a different environment and possible to have as
hook files. Apart all these we can also have a request, response or CSV files to feed input and validate the response.
