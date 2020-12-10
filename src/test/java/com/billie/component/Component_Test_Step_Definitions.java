package com.billie.component;

import com.billie.utilities.Methods;
import cucumber.api.java.Before;
import cucumber.api.java.en.And;
import cucumber.api.java.en.Given;
import cucumber.api.java.en.Then;
import cucumber.api.java.en.When;
import io.restassured.response.Response;
import org.json.simple.parser.ParseException;
import org.junit.Assert;
import java.io.IOException;

public class Component_Test_Step_Definitions {

    private Methods helper = new Methods();
    private Integer bookingid;
    private Response response;

    @Before
    public void HealthCheck() throws IOException {
        helper.GetURL("restful-booker-health");
        response=helper.HealthCheck();
        Assert.assertEquals("The endpoint is not running!",201, response.getStatusCode());
    }

    @Given("^I have an endpoint \"([^\"]*)\"$")
    public void iHaveAnEndpoint(String endpoint) throws IOException {
        helper.GetURL(endpoint);
    }

    @When("^I post the following \"([^\"]*)\" request with \"([^\"]*)\" header to create a new booking$")
    public void iPostTheFollowingRequestWithHeaderToCreateANewBooking(String request, String contentType) throws IOException {
        response=helper.POSTMethodToCreateNewBooking(request,contentType);
        Assert.assertNotNull("Response body is empty for create booking method",response);
    }

    @Then("^I verify the status code as \"([^\"]*)\"$")
    public void iVerifyTheStatusCodeAs(int code){
        Assert.assertEquals("Incorrect success code is returned",code, response.getStatusCode());
    }

    @Then("^I verify the data in the response body equals to the data given in the request body \"([^\"]*)\"$")
    public void iVerifyTheDataInTheResponseBodyEqualsToTheDataGivenInTheRequestBody(String requestPath) throws ParseException {
        String result=helper.CompareValues(requestPath, response);
        Assert.assertTrue("The value in the response body is not equal to the value of the request body for "+ result,result.equalsIgnoreCase("equal"));
    }

    @Then("^I verify the \"([^\"]*)\" is not null in the response body$")
    public void iVerifyTheIsNotNullInTheResponseBody(String id)  {
        Assert.assertNotNull("The "+id+" is null in the response body",response.path(id));
    }

    @When("^I request the followings \"([^\"]*)\" with \"([^\"]*)\" to update an existing booking$")
    public void iRequestTheFollowingsWithToUpdateAnExistingBooking(String request, String contentType) throws IOException {
        helper.UpdateUrl(bookingid);
        response=helper.PUTMethodToUpdateABooking(request,contentType);
        Assert.assertNotNull("Response body is empty for updating booking method",response);
    }

    @When("^I generate an authentication token with the following request \"([^\"]*)\"$")
    public void iGenerateAnAuthenticationTokenWithTheFollowingRequest(String request){
        helper.GenerateToken(request);
    }

    @And("^I request the \"([^\"]*)\"$")
    public void iRequestThe(String key)  {
        bookingid=response.path(key);
    }

    @When("^I request for an existing booking$")
    public void iRequestForAnExistingBooking() {
        helper.UpdateUrl(bookingid);
        response=helper.GETMethodToGetBookingDetailsById();
        Assert.assertNotNull("Response body is empty for search booking details method",response);
    }

    @When("^I delete the existing booking$")
    public void iDeleteTheExistingBooking() {
        helper.UpdateUrl(bookingid);
        response=helper.DELETEMethodToDeleteExistingBooking();
        Assert.assertNotNull("Response body is empty for delete booking method",response);
    }
}