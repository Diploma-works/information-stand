package com.example.informationstand.repositories;

import com.example.informationstand.models.catalog.Category;
import com.example.informationstand.models.catalog.Place;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface PlaceRepository  extends JpaRepository<Place, Long> {
    List<Place> findByCategory(Category category);
}
