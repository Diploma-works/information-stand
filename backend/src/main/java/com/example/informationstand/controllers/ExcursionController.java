package com.example.informationstand.controllers;

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
    public boolean addExcursion(ExcursionCreateRequest request) {
        return excursionService.addExcursion(request);
    }

    @GetMapping("/all")
    public List<ExcursionDTO> getAll() {
        return excursionService.getAllExcursionFromDateNow();
    }

    @PostMapping("/reserve")
    public boolean reserveExcursion(ReserveRequest request) {
        return excursionService.reserveExcursion(request);
    }
}
