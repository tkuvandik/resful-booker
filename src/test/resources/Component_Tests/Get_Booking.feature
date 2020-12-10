@GetBookingDetails @ComponentTests
Feature: Component tests for getting booking details using booking id

  //Background steps will be run before each scenario in this feature
  Background: Read the endpoint URL and get the booking id
    Given I have an endpoint "restful-booker"
    Then I post the following "src/main/resources/Background_Test_Data/create_booking.json" request with "application/json" header to create a new booking
    And I request the "bookingid"

  @TestSubject3 @3.1 @StatusCode @StatusCode200 @Valid
  Scenario: 3.1. Valid attempts for getting details of an existing booking to verify the status code as 200
    When I request for an existing booking
    Then I verify the status code as "200"

  @TestSubject3 @3.2 @CompareRequestResponse @Valid
  Scenario: 3.2. Valid attempts for getting details of an existing booking to verify the data in the response body
    When I request for an existing booking
    Then I verify the data in the response body equals to the data given in the request body "src/main/resources/Background_Test_Data/create_booking.json"