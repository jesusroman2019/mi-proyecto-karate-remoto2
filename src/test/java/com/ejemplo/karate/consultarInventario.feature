Feature: Consultar el inventario de Swagger PetStore
  Consulta el inventario de la tienda y valida que el conteo de mascotas
  disponibles devuelto por la API sea numérico.

  Background:
    * url 'https://petstore.swagger.io/v2'

  Scenario: Consultar inventario de la tienda
    Given path 'store', 'inventory'
    When method get
    Then status 200
    And match response.available == '#number'