@login
Feature: Demoblaze - Autenticacion de usuarios

  Background:
    * url demoblazeBaseUrl
    * def utils = call read('classpath:utils/user-setup.feature')
    * def registeredUser = utils.result

  @smoke @regression @auth
  Scenario: Login con credenciales correctas retorna token
    Given path demoblazePaths.login
    And request registeredUser
    When method post
    Then status 200
    And match response contains 'Auth_token:'

  @negative @regression
  Scenario: Login con password incorrecto retorna error
    * def invalidPayload = { username: '#(registeredUser.username)', password: 'wrongpassword' }
    Given path demoblazePaths.login
    And request invalidPayload
    When method post
    Then status 200 
    And match response == {errorMessage: 'Wrong password.'}