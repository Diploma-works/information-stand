package com.example.informationstand;

import com.example.informationstand.exceptions.FulFilledException;
import com.example.informationstand.exceptions.NotFoundException;
import com.example.informationstand.models.еxcursion.Excursion;
import com.example.informationstand.models.еxcursion.ExcursionCreateRequest;
import com.example.informationstand.models.еxcursion.ExcursionDTO;
import com.example.informationstand.models.еxcursion.ReserveRequest;
import com.example.informationstand.repositories.ExcursionRepository;
import com.example.informationstand.services.ExcursionService;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.junit.jupiter.MockitoExtension;

import java.time.LocalDateTime;
import java.util.Arrays;
import java.util.List;
import java.util.Optional;

import static org.junit.jupiter.api.Assertions.*;
import static org.mockito.ArgumentMatchers.any;
import static org.mockito.Mockito.*;

@ExtendWith(MockitoExtension.class)
public class ExcursionServiceTest {
    @Mock
    private ExcursionRepository excursionRepository;

    @InjectMocks
    private ExcursionService excursionService;

    @Test
    public void testAddExcursion_Success() {
        ExcursionCreateRequest request = new ExcursionCreateRequest();

        boolean result = excursionService.addExcursion(request);

        assertTrue(result);
        verify(excursionRepository, times(1)).save(any(Excursion.class));
    }

    @Test
    public void testGetAllExcursionFromDateNowByLocation_Success() {
        String city = "testCity";
        List<Excursion> mockExcursions = Arrays.asList(
                new Excursion(),
                new Excursion()
        );

        when(excursionRepository.findUpcomingSortedByStartDate(any(LocalDateTime.class), eq(city))).thenReturn(mockExcursions);

        List<ExcursionDTO> result = excursionService.getAllExcursionFromDateNowByLocation(city);

        assertNotNull(result);
        assertEquals(mockExcursions.size(), result.size());
    }

    @Test
    public void testReserveExcursion_Success() {
        ReserveRequest request = new ReserveRequest();
        request.setExcursionId(1L);
        when(excursionRepository.existsById(request.getExcursionId())).thenReturn(true);
        when(excursionRepository.findById(request.getExcursionId())).thenReturn(Optional.of(new Excursion(10)));

        Excursion result = excursionService.reserveExcursion(request);

        assertNotNull(result);
        verify(excursionRepository, times(1)).findById(request.getExcursionId());
    }

    @Test
    public void testReserveExcursion_NotFound() {
        ReserveRequest request = new ReserveRequest();
        request.setExcursionId(1L);
        when(excursionRepository.existsById(request.getExcursionId())).thenReturn(false);

        assertThrows(NotFoundException.class, () -> excursionService.reserveExcursion(request));
    }

    @Test
    public void testReserveExcursion_FulFilled() {
        ReserveRequest request = new ReserveRequest();
        request.setExcursionId(1L);
        when(excursionRepository.existsById(request.getExcursionId())).thenReturn(true);
        when(excursionRepository.findById(request.getExcursionId())).thenReturn(Optional.of(new Excursion()));

        assertThrows(FulFilledException.class, () -> excursionService.reserveExcursion(request));
    }

}
