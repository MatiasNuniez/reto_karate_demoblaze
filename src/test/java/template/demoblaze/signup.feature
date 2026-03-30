@signup
Feature: Demoblaze - Registro de usuarios

  Background:
    * url demoblazeBaseUrl

  @smoke @regression
  Scenario: Crear nuevo usuario exitosamente
    * def payload = read('classpath:data/demoblaze/signup/new_user.json')
    * set payload.username = payload.username + '_' + java.util.UUID.randomUUID().toString().substring(0, 8)
    Given path demoblazePaths.signup
    And request payload
    When method post
    Then status 200

  @negative @regression
  Scenario: Intentar registrar un usuario ya existente retorna error
    * def setup = call read('classpath:utils/user-setup.feature')
    * def payload = { username: '#(setup.result.username)', password: '#(setup.result.password)' }
    Given path demoblazePaths.signup
    And request payload
    When method post
    Then status 200
    And match response == {errorMessage: 'This user already exist.'}