package com.example.informationstand.services;

import com.example.informationstand.exceptions.NotFoundException;
import com.example.informationstand.models.catalog.Category;
import com.example.informationstand.models.catalog.CreateUpdatePlaceRequest;
import com.example.informationstand.models.catalog.Place;
import com.example.informationstand.repositories.PlaceRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class CatalogService {

    private final PlaceRepository placeRepository;

    public List<Place> getAllPlaces() {
        return placeRepository.findAll();
    }

    public Place getPlaceById(Long id) {
        return placeRepository.findById(id)
                .orElseThrow(() -> new NotFoundException("Place", id));
    }

    public Place createPlace(CreateUpdatePlaceRequest request) {
        Place place = Place.builder()
                .name(request.getName())
                .description(request.getDescription())
                .base64Image(request.getBase64Image())
                .latitude(request.getLatitude())
                .longitude(request.getLongitude())
                .address(request.getAddress())
                .phoneNumber(request.getPhoneNumber())
                .workingHours(request.getWorkingHours())
                .category(Category.valueOf(request.getCategory()))
                .build();

         return placeRepository.save(place);
    }

    public List<Place> getAllPlacesByCategory(Category category) {
        return placeRepository.findByCategory(category);
    }

    public Place updatePlace(CreateUpdatePlaceRequest request, Long id) {
        Place existingPlace = placeRepository.findById(id)
                .orElseThrow(() -> new NotFoundException("Place", id));
        existingPlace.setName(request.getName());
        existingPlace.setDescription(request.getDescription());
        existingPlace.setBase64Image(request.getBase64Image());
        existingPlace.setLatitude(request.getLatitude());
        existingPlace.setLongitude(request.getLongitude());
        existingPlace.setAddress(request.getAddress());
        existingPlace.setPhoneNumber(request.getPhoneNumber());
        existingPlace.setWorkingHours(request.getWorkingHours());
        existingPlace.setCategory(Category.valueOf(request.getCategory()));

        return placeRepository.save(existingPlace);
    }

    public void deletePlace(Long id) {
        placeRepository.deleteById(id);
    }
}
