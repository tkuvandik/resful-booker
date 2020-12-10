@UpdateBookingDetails @ComponentTests
Feature: Component tests for updating an existing booking

  //Background steps will be run before each scenario in this feature
  Background: Read the endpoint URL, generate a token and get the booking id
    Given I have an endpoint "restful-booker-auth"
    When I generate an authentication token with the following request "src/main/resources/Background_Test_Data/auth_token.json"
    And I have an endpoint "restful-booker"
    Then I post the following "src/main/resources/Background_Test_Data/create_booking.json" request with "application/json" header to create a new booking
    And I request the "bookingid"

  @TestSubject2 @2.1 @StatusCode @StatusCode200 @Valid
  Scenario Outline: 2.1. Valid attempts for updating an existing booking to verify the status code as 200
    When I request the followings "<valid_requests>" with "<content_type>" to update an existing booking
    Then I verify the status code as "200"
    Examples:
      | valid_requests                                                                      | content_type     |
      | src/main/resources/Update_Booking_Test_Data/Valid/JSON/update_additional_needs.json | application/json |
      | src/main/resources/Update_Booking_Test_Data/Valid/JSON/update_check_in_date.json    | application/json |
      | src/main/resources/Update_Booking_Test_Data/Valid/JSON/update_check_out_date.json   | application/json |
      | src/main/resources/Update_Booking_Test_Data/Valid/JSON/update_deposit_paid.json     | application/json |
      | src/main/resources/Update_Booking_Test_Data/Valid/JSON/update_first_name.json       | application/json |
      | src/main/resources/Update_Booking_Test_Data/Valid/JSON/update_last_name.json        | application/json |
      | src/main/resources/Update_Booking_Test_Data/Valid/JSON/update_total_price.json      | application/json |

  @TestSubject2 @2.2 @CompareRequestResponse @Valid
  Scenario Outline: 2.2. Valid attempts for updating an existing booking to verify the data in the response body
    When I request the followings "<valid_requests>" with "<content_type>" to update an existing booking
    Then I verify the data in the response body equals to the data given in the request body "<valid_requests>"
    Examples:
      | valid_requests                                                                      | content_type     |
      | src/main/resources/Update_Booking_Test_Data/Valid/JSON/update_additional_needs.json | application/json |
      | src/main/resources/Update_Booking_Test_Data/Valid/JSON/update_check_in_date.json    | application/json |
      | src/main/resources/Update_Booking_Test_Data/Valid/JSON/update_check_out_date.json   | application/json |
      | src/main/resources/Update_Booking_Test_Data/Valid/JSON/update_deposit_paid.json     | application/json |
      | src/main/resources/Update_Booking_Test_Data/Valid/JSON/update_first_name.json       | application/json |
      | src/main/resources/Update_Booking_Test_Data/Valid/JSON/update_last_name.json        | application/json |
      | src/main/resources/Update_Booking_Test_Data/Valid/JSON/update_total_price.json      | application/json |