package com.billie.utilities;

import io.restassured.RestAssured;
import io.restassured.response.Response;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;

import static io.restassured.RestAssured.given;

public class Methods extends Helper {
    String token;

    public Response DELETEMethodToDeleteExistingBooking() {
        RestAssured.baseURI =endpointURL;
        return given().header("Cookie","token="+token)
                .header("Content-Type", "application/json")
                .delete();
    }

    public Response GETMethodToGetBookingDetailsById() {
        RestAssured.baseURI =endpointURL;
        return given()
                .header("Accept", "application/json")
                .get();
    }

    public String GETMethodToGetBookingIdByNameFiltering(String requestPath) {
        RestAssured.baseURI =endpointURL+ "?firstname=" + FindValueForKey(requestPath,"firstname")+ "&lastname="+ FindValueForKey(requestPath,"lastname");
        return given()
                .body(ConvertFileToJSONObject(requestPath).toJSONString())
                .get()
                .getBody()
                .jsonPath()
                .get("[0].bookingid")
                .toString();
    }

    public String GETMethodToGetBookingIdByDateFiltering(String requestPath){
        RestAssured.baseURI =endpointURL + "?checkin=" + FindValueForKey(requestPath,"checkin")+ "&checkout="+ FindValueForKey(requestPath,"checkout");
        return given()
                .body(ConvertFileToJSONObject(requestPath).toJSONString())
                .get()
                .getBody()
                .jsonPath()
                .get("[0].bookingid")
                .toString();
    }

    public Response GETMethodToGetBookingIds(String requestPath){
        RestAssured.baseURI =endpointURL;
        return given()
                .body(ConvertFileToJSONObject(requestPath).toJSONString())
                .get();
    }

    public Response PUTMethodToUpdateABooking(String requestPath, String contentType) throws IOException {
        RestAssured.baseURI =endpointURL;
        if(contentType.equals("application/json"))
           return given().header("Content-Type","application/json").header("Cookie","token="+token).header("Accept", "application/json")
                   .body(ConvertFileToJSONObject(requestPath).toJSONString())
                   .put();
        else if(contentType.equals("text/xml"))
            return given().header("Content-Type","text/xml, charset=utf-8").header("Cookie","token="+token).header("Accept", "application/json")
                    .body(new String(Files.readAllBytes(Paths.get(requestPath))))
                    .put();
        else throw new AssertionError("The specified content type is not supported for update booking method");
    }

    public Response POSTMethodToCreateNewBooking(String requestPath, String contentType) throws IOException{
        RestAssured.baseURI =endpointURL;
        if(contentType.equals("application/json"))
            return given().header("Content-Type","application/json").header("Accept", "application/json")
                    .body(ConvertFileToJSONObject(requestPath).toJSONString())
                    .post().then().extract().response();
        else if(contentType.equals("text/xml"))
            return given().header("Content-Type","text/xml, charset=utf-8").header("Accept", "application/json")
                    .body(new String(Files.readAllBytes(Paths.get(requestPath))))
                    .post();
        else throw new AssertionError("The specified content type is not supported for create a new booking method");
    }

    public Response HealthCheck(){
        RestAssured.baseURI =endpointURL;
        return given()
                .get();
    }

    public void GenerateToken(String requestPath) {
        RestAssured.baseURI =endpointURL;
        token = given().header("Content-Type","application/json")
                .body(ConvertFileToJSONObject(requestPath).toJSONString())
                .post()
                .path("token");
    }
}