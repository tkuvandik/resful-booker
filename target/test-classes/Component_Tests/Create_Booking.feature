@CreateBooking @ComponentTests
  Feature: Component tests for creating a new booking

    //Background steps will be run before each scenario in this feature
    Background: Read the endpoint URL
      Given I have an endpoint "restful-booker"

    @TestSubject1 @1.1 @StatusCode @StatusCode200 @Valid
    Scenario Outline: 1.1. Valid attempts for creating a new booking to verify the status code as 200
      When I post the following "<valid_requests>" request with "<content_type>" header to create a new booking
      Then I verify the status code as "200"
      Examples:
        | valid_requests                                                                                                    | content_type     |
        | src/main/resources/Create_Booking_Test_Data/Valid/JSON/deposit_paid/deposit_paid_false.json                       | application/json |
        | src/main/resources/Create_Booking_Test_Data/Valid/JSON/deposit_paid/deposit_paid_true.json                        | application/json |
        | src/main/resources/Create_Booking_Test_Data/Valid/JSON/total_price/total_price_double.json                        | application/json |
        | src/main/resources/Create_Booking_Test_Data/Valid/JSON/total_price/total_price_e.json                             | application/json |
        | src/main/resources/Create_Booking_Test_Data/Valid/JSON/total_price/total_price_integer.json                       | application/json |
        | src/main/resources/Create_Booking_Test_Data/Valid/JSON/additional_needs/additional_needs_lowercase.json           | application/json |
        | src/main/resources/Create_Booking_Test_Data/Valid/JSON/additional_needs/additional_needs_number.json              | application/json |
        | src/main/resources/Create_Booking_Test_Data/Valid/JSON/additional_needs/additional_needs_special_char1.json       | application/json |
        | src/main/resources/Create_Booking_Test_Data/Valid/JSON/additional_needs/additional_needs_special_char2.json       | application/json |
        | src/main/resources/Create_Booking_Test_Data/Valid/JSON/additional_needs/additional_needs_special_char3.json       | application/json |
        | src/main/resources/Create_Booking_Test_Data/Valid/JSON/additional_needs/additional_needs_uppercase.json           | application/json |
        | src/main/resources/Create_Booking_Test_Data/Valid/JSON/additional_needs/additional_needs_uppercase_lowercase.json | application/json |
        | src/main/resources/Create_Booking_Test_Data/Valid/JSON/check_in/check_in_YYYYMMDD.json                            | application/json |
        | src/main/resources/Create_Booking_Test_Data/Valid/JSON/check_in/check_in_YYMMDD.json                              | application/json |
        | src/main/resources/Create_Booking_Test_Data/Valid/JSON/check_out/check_out_YYYYMMDD.json                          | application/json |
        | src/main/resources/Create_Booking_Test_Data/Valid/JSON/check_out/check_out_YYMMDD.json                            | application/json |
        | src/main/resources/Create_Booking_Test_Data/Valid/JSON/first_name/first_name_no_special_char.json                 | application/json |
        | src/main/resources/Create_Booking_Test_Data/Valid/JSON/first_name/first_name_space.json                           | application/json |
        | src/main/resources/Create_Booking_Test_Data/Valid/JSON/first_name/first_name_special_char1.json                   | application/json |
        | src/main/resources/Create_Booking_Test_Data/Valid/JSON/first_name/first_name_special_char2.json                   | application/json |
        | src/main/resources/Create_Booking_Test_Data/Valid/JSON/first_name/first_name_special_char3.json                   | application/json |
        | src/main/resources/Create_Booking_Test_Data/Valid/JSON/last_name/last_name_no_special_char.json                   | application/json |
        | src/main/resources/Create_Booking_Test_Data/Valid/JSON/last_name/last_name_space.json                             | application/json |
        | src/main/resources/Create_Booking_Test_Data/Valid/JSON/last_name/last_name_special_char1.json                     | application/json |
        | src/main/resources/Create_Booking_Test_Data/Valid/JSON/last_name/last_name_special_char2.json                     | application/json |
        | src/main/resources/Create_Booking_Test_Data/Valid/JSON/last_name/last_name_special_char3.json                     | application/json |

    @TestSubject1 @1.2 @CompareRequestResponse @Valid
    Scenario Outline: 1.2. Valid attempts for creating a new booking to verify the data in the response body
      When I post the following "<valid_requests>" request with "<content_type>" header to create a new booking
      Then I verify the data in the response body equals to the data given in the request body "<valid_requests>"
      Examples:
        | valid_requests                                                                                                    | content_type     |
        | src/main/resources/Create_Booking_Test_Data/Valid/JSON/deposit_paid/deposit_paid_false.json                       | application/json |
        | src/main/resources/Create_Booking_Test_Data/Valid/JSON/deposit_paid/deposit_paid_true.json                        | application/json |
        | src/main/resources/Create_Booking_Test_Data/Valid/JSON/total_price/total_price_double.json                        | application/json |
        | src/main/resources/Create_Booking_Test_Data/Valid/JSON/total_price/total_price_e.json                             | application/json |
        | src/main/resources/Create_Booking_Test_Data/Valid/JSON/total_price/total_price_integer.json                       | application/json |
        | src/main/resources/Create_Booking_Test_Data/Valid/JSON/additional_needs/additional_needs_lowercase.json           | application/json |
        | src/main/resources/Create_Booking_Test_Data/Valid/JSON/additional_needs/additional_needs_number.json              | application/json |
        | src/main/resources/Create_Booking_Test_Data/Valid/JSON/additional_needs/additional_needs_special_char1.json       | application/json |
        | src/main/resources/Create_Booking_Test_Data/Valid/JSON/additional_needs/additional_needs_special_char2.json       | application/json |
        | src/main/resources/Create_Booking_Test_Data/Valid/JSON/additional_needs/additional_needs_special_char3.json       | application/json |
        | src/main/resources/Create_Booking_Test_Data/Valid/JSON/additional_needs/additional_needs_uppercase.json           | application/json |
        | src/main/resources/Create_Booking_Test_Data/Valid/JSON/additional_needs/additional_needs_uppercase_lowercase.json | application/json |
        | src/main/resources/Create_Booking_Test_Data/Valid/JSON/check_in/check_in_YYYYMMDD.json                            | application/json |
        | src/main/resources/Create_Booking_Test_Data/Valid/JSON/check_in/check_in_YYMMDD.json                              | application/json |
        | src/main/resources/Create_Booking_Test_Data/Valid/JSON/check_out/check_out_YYYYMMDD.json                          | application/json |
        | src/main/resources/Create_Booking_Test_Data/Valid/JSON/check_out/check_out_YYMMDD.json                            | application/json |
        | src/main/resources/Create_Booking_Test_Data/Valid/JSON/first_name/first_name_no_special_char.json                 | application/json |
        | src/main/resources/Create_Booking_Test_Data/Valid/JSON/first_name/first_name_space.json                           | application/json |
        | src/main/resources/Create_Booking_Test_Data/Valid/JSON/first_name/first_name_special_char1.json                   | application/json |
        | src/main/resources/Create_Booking_Test_Data/Valid/JSON/first_name/first_name_special_char2.json                   | application/json |
        | src/main/resources/Create_Booking_Test_Data/Valid/JSON/first_name/first_name_special_char3.json                   | application/json |
        | src/main/resources/Create_Booking_Test_Data/Valid/JSON/last_name/last_name_no_special_char.json                   | application/json |
        | src/main/resources/Create_Booking_Test_Data/Valid/JSON/last_name/last_name_space.json                             | application/json |
        | src/main/resources/Create_Booking_Test_Data/Valid/JSON/last_name/last_name_special_char1.json                     | application/json |
        | src/main/resources/Create_Booking_Test_Data/Valid/JSON/last_name/last_name_special_char2.json                     | application/json |
        | src/main/resources/Create_Booking_Test_Data/Valid/JSON/last_name/last_name_special_char3.json                     | application/json |

    @TestSubject1 @1.3 @Valid
    Scenario Outline: 1.3. Valid attempts for creating a new booking to verify the bookingid is not null in the response body
      When I post the following "<valid_requests>" request with "<content_type>" header to create a new booking
      Then I verify the "bookingid" is not null in the response body
      Examples:
        | valid_requests                                                                                                    | content_type     |
        | src/main/resources/Create_Booking_Test_Data/Valid/JSON/deposit_paid/deposit_paid_false.json                       | application/json |
        | src/main/resources/Create_Booking_Test_Data/Valid/JSON/deposit_paid/deposit_paid_true.json                        | application/json |
        | src/main/resources/Create_Booking_Test_Data/Valid/JSON/total_price/total_price_double.json                        | application/json |
        | src/main/resources/Create_Booking_Test_Data/Valid/JSON/total_price/total_price_e.json                             | application/json |
        | src/main/resources/Create_Booking_Test_Data/Valid/JSON/total_price/total_price_integer.json                       | application/json |
        | src/main/resources/Create_Booking_Test_Data/Valid/JSON/additional_needs/additional_needs_lowercase.json           | application/json |
        | src/main/resources/Create_Booking_Test_Data/Valid/JSON/additional_needs/additional_needs_number.json              | application/json |
        | src/main/resources/Create_Booking_Test_Data/Valid/JSON/additional_needs/additional_needs_special_char1.json       | application/json |
        | src/main/resources/Create_Booking_Test_Data/Valid/JSON/additional_needs/additional_needs_special_char2.json       | application/json |
        | src/main/resources/Create_Booking_Test_Data/Valid/JSON/additional_needs/additional_needs_special_char3.json       | application/json |
        | src/main/resources/Create_Booking_Test_Data/Valid/JSON/additional_needs/additional_needs_uppercase.json           | application/json |
        | src/main/resources/Create_Booking_Test_Data/Valid/JSON/additional_needs/additional_needs_uppercase_lowercase.json | application/json |
        | src/main/resources/Create_Booking_Test_Data/Valid/JSON/check_in/check_in_YYYYMMDD.json                            | application/json |
        | src/main/resources/Create_Booking_Test_Data/Valid/JSON/check_in/check_in_YYMMDD.json                              | application/json |
        | src/main/resources/Create_Booking_Test_Data/Valid/JSON/check_out/check_out_YYYYMMDD.json                          | application/json |
        | src/main/resources/Create_Booking_Test_Data/Valid/JSON/check_out/check_out_YYMMDD.json                            | application/json |
        | src/main/resources/Create_Booking_Test_Data/Valid/JSON/first_name/first_name_no_special_char.json                 | application/json |
        | src/main/resources/Create_Booking_Test_Data/Valid/JSON/first_name/first_name_space.json                           | application/json |
        | src/main/resources/Create_Booking_Test_Data/Valid/JSON/first_name/first_name_special_char1.json                   | application/json |
        | src/main/resources/Create_Booking_Test_Data/Valid/JSON/first_name/first_name_special_char2.json                   | application/json |
        | src/main/resources/Create_Booking_Test_Data/Valid/JSON/first_name/first_name_special_char3.json                   | application/json |
        | src/main/resources/Create_Booking_Test_Data/Valid/JSON/last_name/last_name_no_special_char.json                   | application/json |
        | src/main/resources/Create_Booking_Test_Data/Valid/JSON/last_name/last_name_space.json                             | application/json |
        | src/main/resources/Create_Booking_Test_Data/Valid/JSON/last_name/last_name_special_char1.json                     | application/json |
        | src/main/resources/Create_Booking_Test_Data/Valid/JSON/last_name/last_name_special_char2.json                     | application/json |
        | src/main/resources/Create_Booking_Test_Data/Valid/JSON/last_name/last_name_special_char3.json                     | application/json |