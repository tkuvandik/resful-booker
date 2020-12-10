@DeleteBooking @ComponentTests
Feature: Component tests for deleting booking details using booking id

  //Background steps will be run before each scenario in this feature
  Background: Read the endpoint URL, generate a token and get the booking id
    Given I have an endpoint "restful-booker-auth"
    When I generate an authentication token with the following request "src/main/resources/Background_Test_Data/auth_token.json"
    And I have an endpoint "restful-booker"
    Then I post the following "src/main/resources/Background_Test_Data/create_booking.json" request with "application/json" header to create a new booking
    And I request the "bookingid"

  @TestSubject4 @4.1 @StatusCode @StatusCode201 @Valid
  Scenario: 4.1. Valid attempts for deleting an existing booking to verify the status code as 201
    When I delete the existing booking
    Then I verify the status code as "201"

  @TestSubject4 @4.2 @StatusCode @StatusCode404 @Valid
  Scenario: 4.2. Valid attempts for getting details of an deleted booking to verify the status code as 404
    When I delete the existing booking
    Then I request for an existing booking
    And I verify the status code as "404"