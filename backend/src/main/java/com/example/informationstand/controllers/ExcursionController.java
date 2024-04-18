package com.example.informationstand.controllers;

import com.example.informationstand.models.еxcursion.Excursion;
import com.example.informationstand.models.еxcursion.ExcursionCreateRequest;
import com.example.informationstand.models.еxcursion.ExcursionDTO;
import com.example.informationstand.models.еxcursion.ReserveRequest;
import com.example.informationstand.services.ExcursionService;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RequiredArgsConstructor
@RestController
@RequestMapping("/excursion")
public class ExcursionController {

    private final ExcursionService excursionService;

    @PostMapping("/add")
    public boolean addExcursion(@RequestBody ExcursionCreateRequest request) {
        return excursionService.addExcursion(request);
    }

    @GetMapping("/all")
    public List<ExcursionDTO> getAll(@RequestParam String city) {
        return excursionService.getAllExcursionFromDateNowByLocation(city);
    }

    @PostMapping("/reserve")
    public Excursion reserveExcursion(@RequestBody ReserveRequest request) {
        return excursionService.reserveExcursion(request);
    }
}
