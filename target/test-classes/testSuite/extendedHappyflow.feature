Feature: As part of this feature , minimum required possible ways to validate the gists file response

  Background:
    * url 'https://api.github.com/'
    * header Authorization = 'Bearer xyz'

    Given path 'gists'
    When method get
    Then status 200
    * def validate = response

  Scenario: Validate the header and the response file values

     #Below assertion to validate teh content type is json
    Then header Content-Type = 'application/json'

    #Below assertion to validate response time of each request
    And assert responseTime < 1000
    And match validate[0].id  == "17f79662f5a8eecd96503cea3b2e1ed3"
    * def size = $response[*].files[*].size

    #Below assertion to validate the complete array
    Then match size == [34, 35 ]
    Then match size contains 34

    #Below assertion to validate indepth in json file and also instead of exact value string can be validated
    * def file = $response[*]
    And print file
    Then match file..filename == ["hello","#string"]

    #Below assertion to validate the url in complete response
    * def urls = $response[*].url
    * match each urls contains "https://api.github.com/"

    #Below assertion is just the check the expected value in file
    * def date = $response[*].created_at
    Then match date contains '2020-04-21T19:51:45Z'