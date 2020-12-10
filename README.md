**Unified Test Framework for resful-booker**
-

This is a simple README file to help you how to run the test framework via terminal screen or CucumberRun.java file

**How to run the test framework?**
-

Following commands will help you to run the framework easily via terminal screen:

- **mvn test :** It will run all the available features

- **mvn test -Dcucumber.options="src/test/resources/Component_Tests/Delete_Booking.feature"** : You can specify the feature file by overriding the DcucumberOptions
 
- **mvn test -Dcucumber.options="--tags @StatusCode"** : You can specify the tag names those are in the feature files by overriding the DcucumberOptions

Following path will help you to specify the feature files or tags that need to be run by overriding the DcucumberOptions:
                                                                                       
- **src/main/test/java/com/billie/component/CucumberRun.java** : Click to run button, specified tests as below will be run

-       @CucumberOptions(plugin = { "pretty" },
        features = { "src/test/resources/Component_Tests" }, // Feature files path
        glue = { "com.billie.component" }, // Steps path
        tags = { "@ComponentTests" }) // Specified tags that need to be run
 

