package com.billie.component;

import cucumber.api.CucumberOptions;
import cucumber.api.junit.Cucumber;
import org.junit.runner.RunWith;

@RunWith(Cucumber.class)
@CucumberOptions(plugin = { "pretty" },
        features = { "src/test/resources/Component_Tests" },
        glue = { "com.billie.component" },
        tags = { "@ComponentTests" })
public class CucumberRun {
}