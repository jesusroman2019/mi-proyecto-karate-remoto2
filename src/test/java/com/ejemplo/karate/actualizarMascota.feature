Feature: Actualizar mascotas en Swagger PetStore

  Background:
    * url 'https://petstore.swagger.io/v2'

  Scenario: Crear y actualizar una mascota
    * def petId = java.lang.System.currentTimeMillis()
    * def mascotaInicial =
      """
      {
        id: #(petId),
        category: { id: 1, name: 'Perros' },
        name: 'Firulais',
        photoUrls: ['https://example.com/firulais.jpg'],
        tags: [{ id: 1, name: 'prueba-put' }],
        status: 'available'
      }
      """
    * def mascotaActualizada =
      """
      {
        id: #(petId),
        category: { id: 1, name: 'Perros' },
        name: 'Firulais actualizado',
        photoUrls: ['https://example.com/firulais-actualizado.jpg'],
        tags: [{ id: 1, name: 'prueba-put' }],
        status: 'available'
      }
      """
    Given path 'pet'
    And request mascotaInicial
    When method post
    Then status 200
    And match response.id == petId

    Given path 'pet'
    And request mascotaActualizada
    When method put
    Then status 200
    And match response.id == petId
    And match response.name == 'Firulais actualizado'
    And match response.status == 'available'
