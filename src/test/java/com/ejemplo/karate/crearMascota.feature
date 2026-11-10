Feature: Crear mascotas en Swagger PetStore

  Background:
    * url 'https://petstore.swagger.io/v2'

  Scenario: Crear una mascota nueva
    * def petId = java.lang.System.currentTimeMillis()
    * def nuevaMascota =
      """
      {
        id: #(petId),
        category: { id: 1, name: 'Perros' },
        name: 'Firulais',
        photoUrls: ['https://example.com/firulais.jpg'],
        tags: [{ id: 1, name: 'prueba' }],
        status: 'available'
      }
      """
    Given path 'pet'
    And request nuevaMascota
    When method post
    Then status 200
    And match response.id == petId
    And match response.name == 'Firulais'
    And match response.status == 'available'
