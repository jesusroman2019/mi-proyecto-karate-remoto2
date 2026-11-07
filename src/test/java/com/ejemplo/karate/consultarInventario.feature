Feature: Pruebas de Swagger PetStore

  Background:
    * url 'https://petstore.swagger.io/v2'

  Scenario: Consultar inventario de la tienda
    Given path 'store', 'inventory'
    When method get
    Then status 200
    And match response.available == '#number'