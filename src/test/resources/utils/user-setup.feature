@ignore
Feature: Setup - Registro dinamico de usuario para tests

  Scenario: Crear usuario con username unico
    * def userData = read('classpath:data/demoblaze/signup/new_user.json')
    * def uniqueSuffix = java.util.UUID.randomUUID().toString().substring(0, 8)
    * def dynamicUsername = userData.username + '_' + uniqueSuffix

    * def payload = { username: '#(dynamicUsername)', password: '#(userData.password)' }

    Given url demoblazeBaseUrl
    And path demoblazePaths.signup
    And request payload
    When method post
    Then status 200

    * def result = { username: '#(dynamicUsername)', password: '#(userData.password)' }