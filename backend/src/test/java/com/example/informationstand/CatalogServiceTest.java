package com.example.informationstand;

import com.example.informationstand.models.catalog.Category;
import com.example.informationstand.models.catalog.CreateUpdatePlaceRequest;
import com.example.informationstand.models.catalog.Place;
import com.example.informationstand.repositories.PlaceRepository;
import com.example.informationstand.services.CatalogService;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.junit.jupiter.MockitoExtension;

import java.util.Arrays;
import java.util.List;
import java.util.Optional;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotNull;
import static org.mockito.Mockito.*;

@ExtendWith(MockitoExtension.class)
public class CatalogServiceTest {

    @Mock
    private PlaceRepository placeRepository;

    @InjectMocks
    private CatalogService catalogService;

    @Test
    public void testCreatePlace_Success() {
        CreateUpdatePlaceRequest request =
                CreateUpdatePlaceRequest.builder()
                        .name("Test")
                        .description("Test")
                        .base64Image("123")
                        .latitude(1)
                        .longitude(1)
                        .address("address")
                        .phoneNumber("+7")
                        .workingHours("10-11")
                        .category(Category.CAFE.toString())
                        .build();
        Place savedPlace = new Place();
        savedPlace.setId(1L);
        savedPlace.setName(request.getName());
        when(placeRepository.save(any(Place.class))).thenReturn(savedPlace);

        Place createdPlace = catalogService.createPlace(request);

        assertEquals(request.getName(), createdPlace.getName());
    }

    @Test
    public void testGetPlaceById_Success() {
        Place mockPlace = new Place();
        mockPlace.setId(1L);

        when(placeRepository.findById(anyLong())).thenReturn(Optional.of(mockPlace));

        Place retrievedPlace = catalogService.getPlaceById(1L);

        assertEquals(1L, retrievedPlace.getId().longValue());
    }

    @Test
    public void testGetAllPlacesByCategory_Success() {
        Category category = Category.CAFE;
        List<Place> places = Arrays.asList(
                new Place(category),
                new Place(category)
        );

        when(placeRepository.findByCategory(category)).thenReturn(places);

        List<Place> result = catalogService.getAllPlacesByCategory(category);

        assertEquals(2, result.size());
        result.forEach(place -> assertEquals(category, place.getCategory()));
    }
    @Test
    public void testGetAllPlaces_Success() {
        List<Place> places = Arrays.asList(
                new Place(),
                new Place()
        );

        when(placeRepository.findAll()).thenReturn(places);

        List<Place> result = catalogService.getAllPlaces();

        assertEquals(2, result.size());
    }

    @Test
    public void testUpdatePlace_Success() {
        CreateUpdatePlaceRequest request =
                CreateUpdatePlaceRequest.builder()
                        .name("Test")
                        .description("Test")
                        .base64Image("123")
                        .latitude(1)
                        .longitude(1)
                        .address("address")
                        .phoneNumber("+7")
                        .workingHours("10-11")
                        .category(Category.CAFE.toString())
                        .build();

        Long id = 1L;

        Place existingPlace = new Place();
        existingPlace.setId(id);
        existingPlace.setName(request.getName());

        when(placeRepository.findById(id)).thenReturn(Optional.of(existingPlace));

        when(placeRepository.save(existingPlace)).thenReturn(existingPlace);

        Place updatedPlace = catalogService.updatePlace(request, id);

        assertNotNull(updatedPlace);

        assertEquals(request.getName(), updatedPlace.getName());
    }

    @Test
    public void testDeletePlace_Success() {
        Long id = 1L;

        catalogService.deletePlace(id);

        verify(placeRepository).deleteById(id);
    }

}

