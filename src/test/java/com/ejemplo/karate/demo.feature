Feature: Pruebas bases en repositorio clonado

  Scenario: Comprobación básica de estado
    Given url 'https://httpbin.org'
    When method get
    Then status 200
