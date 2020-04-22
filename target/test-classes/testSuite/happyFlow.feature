Feature: As a user of the Github gists, I would like to do a basic HTTP request to add the file,
         retrieve the file update the file, delete the file and validate status code.


  # The background in cucumber to define a series of steps which is common in the feature file.
  # Here I declare URL that can use in all scenarios and I am getting all the gists and reusing in the following scenarios.

  Background:
    * url 'https://api.github.com/'
    * header Authorization = 'Bearer c97b04ffb33a682eafd8b52e2f5f350d30fff1e6'
    Given path 'gists'
    When method get
    Then status 200

    * def vagh = response

    And print vagh[0].id
    And print vagh[0].created_at

  #In the below outline, I get the gists from backround & did the possible get options in gists

  Scenario: Create the gists and retrieve the same gists file

    * def payload =
"""
{
  "description": "Hello World Examples",
  "public": true,
  "files": {
    "hello.txt": {
      "content": "hello, This is my first gist file"
    }
  }
}
"""
    Given path 'gists'
    And request payload
    And header Authorization = 'Bearer c97b04ffb33a682eafd8b52e2f5f350d30fff1e6'
    When method post
    Then status 201

    * def value = response

    Given path 'gists/' , value.id
    When method get
    Then status 200

  Scenario Outline: Retrieve the gists file by using different params available in gists

    Given path '<what>' , <who>
    And param since = <when>
    And header Authorization = 'Bearer xxx'
    And method get
    Then status 200

    Examples:
      |   what     |   who        |    when           |
      |   gists/   |   vagh[0].id |vagh[0].created_at |
      |   gists/   |  'public'    |vagh[0].created_at |
      |   gists/   |   vagh[0].id |'/commits'         |
      |   gists/   |   vagh[0].id |'/forks'           |
      |   users/   |   'SuthanR'  |'/gists'           |

  Scenario: Update the existing file with new content

    * def payload2 =
"""
{
  "description": "Hello World Examples",
  "public": true,
  "files": {
    "hello_world.txt": {
      "content": "hello, This is my updated gist file"
    }
  }
}
"""
    Given path 'gists/' , vagh[0].id
    And request payload2
    And header Authorization = 'Bearer c97b04ffb33a682eafd8b52e2f5f350d30fff1e6'
    And method patch
    Then status 200

  Scenario: Delete the existing gists file

    Given path 'gists/' , vagh[0].id
    And header Authorization = 'Bearer c97b04ffb33a682eafd8b52e2f5f350d30fff1e6'
    When method delete
    Then status 204
