Feature: As part of this feature,limited & possible negative flows are tested

  Background:
    * url 'https://api.github.com/'
    * header Authorization = 'Bearer xyz'

  Scenario: Request the valida url with incorrect request method

    Given path 'gists'
    And method delete
    Then status 404

  Scenario: Retrieve the gists file by using invalid parameter value

    Given path 'gists'
    And param since = 'XYZ'
    And method get
    Then status 422

  Scenario: Delete the gists which is not available in gists

    Given path 'gists/c55d28136dc29632671cc7a2ae24176'
    And method delete
    Then status 404

  Scenario: Create the gists with incorrect payload

    * def payload =
"""
{
  "description": "Hello World Examples",
  "public": hello,
  "files": {
    "hello.txt": {
      "content": "hello, This is my first gist file"
    }
  }
}
"""
    Given path 'gists'
    And request payload
    And header Authorization = 'Bearer xyz'
    When method post
    Then status 422

  Scenario: Delete the gists invalid authorization token

    Given path 'gists/e41eb83201089eb196ec8599f2b54140'
    * header Authorization = 'Bearer xyz'
    And method delete
    Then status 401
