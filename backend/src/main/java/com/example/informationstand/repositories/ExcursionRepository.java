package com.example.informationstand.repositories;

import com.example.informationstand.models.еxcursion.Excursion;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.time.LocalDateTime;
import java.util.List;

@Repository
public interface ExcursionRepository extends JpaRepository<Excursion, Long> {
    @Query("SELECT e FROM Excursion e WHERE e.startTime > :currentTime AND e.location = :location ORDER BY  e.startTime ASC")
    List<Excursion> findUpcomingSortedByStartDate(LocalDateTime currentTime, String location);

    boolean existsById(Long id);
}
