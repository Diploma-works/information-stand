package com.example.informationstand.repositories;

import com.example.informationstand.models.еxcursion.Excursion;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.time.LocalDateTime;
import java.util.List;

public interface ExcursionRepository extends JpaRepository<Excursion, Long> {
    @Query("SELECT e FROM Excursion e WHERE e.startTime > :currentTime ORDER BY e.startTime ASC")
    List<Excursion> findUpcomingSortedByStartDate(LocalDateTime currentTime);

    boolean existsById(Long id);
}
