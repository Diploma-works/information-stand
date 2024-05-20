package com.example.informationstand.controllers;
import com.example.informationstand.models.catalog.Category;
import com.example.informationstand.models.catalog.CreateUpdatePlaceRequest;
import com.example.informationstand.models.catalog.Place;
import com.example.informationstand.services.CatalogService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RequiredArgsConstructor
@RestController
@RequestMapping("/catalog")
public class CatalogController {

    private final CatalogService catalogService;

    @PostMapping("/places")
    public ResponseEntity<Place> createPlace(@RequestBody CreateUpdatePlaceRequest request) {
        Place createdPlace = catalogService.createPlace(request);
        return ResponseEntity.status(HttpStatus.CREATED).body(createdPlace);
    }

    @GetMapping("/places")
    public ResponseEntity<List<Place>> getAllPlaces() {
        List<Place> places = catalogService.getAllPlaces();
        return ResponseEntity.ok(places);
    }

    @GetMapping("/places/{id}")
    public ResponseEntity<Place> getPlaceById(@PathVariable Long id) {
        Place place = catalogService.getPlaceById(id);
        if (place != null) {
            return ResponseEntity.ok(place);
        } else {
            return ResponseEntity.notFound().build();
        }
    }

    @DeleteMapping("/places/{id}")
    public ResponseEntity<Void> deletePlace(@PathVariable Long id) {
        catalogService.deletePlace(id);
        return ResponseEntity.noContent().build();
    }

    @PutMapping("/places/{id}")
    public ResponseEntity<Place> updatePlace(@PathVariable Long id, @RequestBody CreateUpdatePlaceRequest request) {
        Place updatedPlace = catalogService.updatePlace(request, id);
        if (updatedPlace != null) {
            return ResponseEntity.ok(updatedPlace);
        } else {
            return ResponseEntity.notFound().build();
        }
    }

    @GetMapping("/places/category/{category}")
    public ResponseEntity<List<Place>> getAllPlacesByCategory(@PathVariable Category category) {
        List<Place> places = catalogService.getAllPlacesByCategory(category);
        return ResponseEntity.ok(places);
    }


}
