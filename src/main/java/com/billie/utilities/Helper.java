package com.billie.utilities;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import io.restassured.response.Response;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

import java.io.*;
import java.util.*;

public class Helper {
    String endpointURL;

    public void GetURL(String endpoint) throws IOException {
        String _endpoint="";
        Properties prop=new Properties();
        InputStream inputS=getClass().getClassLoader().getResourceAsStream("config.properties");
        if(inputS!=null){
            prop.load(inputS);
        }
        else{
            throw new FileNotFoundException("Config file could not be found");
        }
        try{
            if(endpoint!=null || !endpoint.isEmpty()){
                if(endpoint.equalsIgnoreCase("restful-booker")){
                    _endpoint=prop.getProperty("restful-booker");
                }
                else if(endpoint.equalsIgnoreCase("restful-booker-auth")){
                    _endpoint=prop.getProperty("restful-booker-auth");
                }
                else if(endpoint.equalsIgnoreCase("restful-booker-health")){
                    _endpoint=prop.getProperty("restful-booker-health");
                }
                else{
                    throw new AssertionError("The specified endpoint in config file is UNCOVERED or incorrect," + endpoint);
                }
            }else{
                throw new AssertionError("The endpoint is empty");
            }
        }
        catch(Exception ex) {
            throw new AssertionError("An error occurred during reading the endpoint from the config file, "+ex.getMessage());
        }
        finally {
            inputS.close();
        }
        endpointURL=_endpoint;
    }

    JSONObject ConvertFileToJSONObject(String path){
        JSONParser jsonParser = new JSONParser();
        try (FileReader reader = new FileReader(path))
        {
            JSONObject obj = (JSONObject) jsonParser.parse(reader);
            if(obj!=null) return obj;
            else throw new AssertionError(" Converted JSONObject from path is empty" );
        } catch (IOException e) {
            throw new AssertionError("An error occurred during reading the JSON file from the specified path, " + e.getMessage());
        } catch (ParseException e) {
            throw new AssertionError("An error occurred during parsing the JSON file, " + e.getMessage());
        }
    }

    String FindValueForKey(String path, String key) {
        JSONParser jsonParser = new JSONParser();
        try (FileReader reader = new FileReader(path))
        {
            JSONObject obj = (JSONObject) jsonParser.parse(reader);
            if(obj!=null) return obj.get(key).toString();
            else throw new AssertionError(" Converted JSONObject from path is empty" );
        } catch (IOException e) {
            throw new AssertionError("An error occurred during reading the JSON file from the specified path, " + e.getMessage());
        } catch (ParseException e) {
            throw new AssertionError("An error occurred during parsing the JSON file, " + e.getMessage());
        }
    }
    Map ConvertJSonObjectToHashMap(JSONObject jsonObject) throws JsonProcessingException {
        ObjectMapper mapper = new ObjectMapper();
        try{
            return mapper.readValue(jsonObject.toJSONString(), Map.class);
        } catch (JsonProcessingException e){
            throw new AssertionError("An error occurred during converting JSON Object to hash map, " + e.getMessage());
        }
    }

    public String CompareValues(String requestPath, Response response) {
        String result = "";
        try (FileReader reader = new FileReader(requestPath)) {
            if(!response.getBody().asString().contains("Invalid")) {
                JSONParser jsonParser = new JSONParser();
                Map requestObject = ConvertJSonObjectToHashMap((JSONObject) jsonParser.parse(reader));
                Map responseObject = response.getBody().jsonPath().get();
                Set reqKeys = requestObject.keySet();
                Set resKeys = responseObject.keySet();
                if (resKeys.contains("booking")) {
                    responseObject = response.getBody().jsonPath().get("booking");
                }
                for (int i = 0; i < reqKeys.size(); i++) {
                    String requestValue = requestObject.get(reqKeys.toArray()[i]).toString();
                    String responseValue = responseObject.get(reqKeys.toArray()[i]).toString();
                    if (responseValue != null) {
                        if (requestValue.equals(responseValue)) {
                            result = "equal";
                        } else {
                            result = reqKeys.toArray()[i] + ": Request body value->" + requestValue + " , Response body value-> " + responseValue;
                            break;
                        }
                    } else {
                        result = reqKeys.toArray()[i] + " key could not be found in the response body";
                        break;
                    }
                }
            }else{
                result="\"response body contains invalid message\"";
            }
        } catch (IOException e) {
            throw new AssertionError("An error occurred during reading the JSON file from the specified path, " + e.getMessage());
        } catch (ParseException e) {
            throw new AssertionError("An error occurred during parsing the JSON file, " + e.getMessage());
        }
        return result;
    }

    public void UpdateUrl(Integer id) {
        endpointURL = endpointURL + "/" + id;
    }
}