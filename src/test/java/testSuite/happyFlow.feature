Feature: As a user of the Github gists I would like to do basic http request to add the file, retrieve the file
         update the file & delete the file

  Background:
    * url 'https://api.github.com/'
    * header Authorization = 'Bearer 10b9eb5c481152b71cfec37cfbf5262539e1c1c8'

  Scenario: get all users and then get the first user by id

    * def payload1 =
"""
{
  "description": "Hello gists",
  "public": true,
  "files": {
    "hello.txt": {
      "content": "hello, This is my first gist file"
    }
  }
}
"""
    Given path 'gists'
    And request payload1
    When method post
    Then status 201

    * def value = response

    Given path 'gists/' , value.id
    When method get
    Then status 200

