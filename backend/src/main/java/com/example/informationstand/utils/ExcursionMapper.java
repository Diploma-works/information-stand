package com.example.informationstand.utils;

import com.example.informationstand.models.еxcursion.Excursion;
import com.example.informationstand.models.еxcursion.ExcursionDTO;

import java.util.List;
import java.util.stream.Collectors;

public class ExcursionMapper {
    private static final ExcursionConverter converter = new ExcursionConverter();

    public static ExcursionDTO toDTO(Excursion excursion) {
        return ExcursionDTO.builder()
                .id(excursion.getId())
                .location(excursion.getLocation())
                .description(excursion.getDescription())
                .cost(excursion.getCost())
                .duration(excursion.getDuration())
                .endTime(excursion.getEndTime())
                .startTime(excursion.getStartTime())
                .maxParticipants(excursion.getMaxParticipants())
                .rating(excursion.getRating())
                .reservedMembers(converter.convertToEntityAttribute(excursion.getReservedMembers()))
                .name(excursion.getName())
                .build();
    }

    public static List<ExcursionDTO> toDTOList(List<Excursion> excursions) {
        return excursions.stream()
                .map(ExcursionMapper::toDTO)
                .collect(Collectors.toList());
    }

    public static Excursion toEntity(ExcursionDTO excursionDTO){
        return Excursion
                .builder()
                .id(excursionDTO.getId())
                .name(excursionDTO.getName())
                .cost(excursionDTO.getCost())
                .rating(excursionDTO.getRating())
                .description(excursionDTO.getDescription())
                .reservedMembers(converter.convertToDatabaseColumn(excursionDTO.getReservedMembers()))
                .location(excursionDTO.getLocation())
                .startTime(excursionDTO.getStartTime())
                .endTime(excursionDTO.getEndTime())
                .duration(excursionDTO.getDuration())
                .build();
    }
}
