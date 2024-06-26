package com.example.informationstand.services;

import com.example.informationstand.exceptions.FulFilledException;
import com.example.informationstand.exceptions.NotFoundException;
import com.example.informationstand.models.еxcursion.*;
import com.example.informationstand.repositories.ExcursionRepository;
import com.example.informationstand.utils.ExcursionMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;
import java.util.List;

@Service
@RequiredArgsConstructor
public class ExcursionService {
    private final ExcursionRepository excursionRepository;

    public boolean addExcursion(ExcursionCreateRequest request) {
        Excursion excursion = Excursion.builder()
                .name(request.getName())
                .description(request.getDescription())
                .location(request.getLocation())
                .cost(request.getCost())
                .duration(request.getDuration())
                .endTime(request.getEndTime())
                .startTime(request.getStartTime())
                .maxParticipants(request.getMaxParticipants())
                .reservedMembers("")
                .rating(0)
                .base64Image(request.getBase64Image())
                .build();
        excursionRepository.save(excursion);
        return true;
    }

    public List<ExcursionDTO> getAllExcursionFromDateNowByLocation(String city) {
        List<Excursion> excursions = excursionRepository.findUpcomingSortedByStartDate(LocalDateTime.now(), city);
        return ExcursionMapper.toDTOList(excursions);
    }

    public Excursion reserveExcursion(ReserveRequest request) {
        try {
            if (!excursionRepository.existsById(request.getExcursionId())) {
                throw new NotFoundException("Excursion", request.getExcursionId());
            }
            Excursion excursion = excursionRepository.findById(request.getExcursionId()).get();
            ExcursionDTO dto = ExcursionMapper.toDTO(excursion);
            if (dto.getReservedMembers().size() >= dto.getMaxParticipants()) {
                throw new FulFilledException("Excursion", dto.getId());
            }
            List<Member> reservedMembers = dto.getReservedMembers();
            reservedMembers.add(Member.builder().count(request.getCount()).credentials(request.getCredentials()).build());
            dto.setReservedMembers(reservedMembers);
            Excursion result = ExcursionMapper.toEntity(dto);
            excursionRepository.save(result);
            return result;
        } catch (Exception e) {
            e.printStackTrace();
            throw e;
        }
    }

}
