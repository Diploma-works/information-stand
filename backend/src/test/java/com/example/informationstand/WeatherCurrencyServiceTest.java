package com.example.informationstand;

import com.example.informationstand.models.currency.CurrencyData;
import com.example.informationstand.models.weather.WeatherResponse;
import com.example.informationstand.services.WeatherCurrencyService;
import com.example.informationstand.utils.CurrencyRestMap;
import com.example.informationstand.utils.WeatherRestMap;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.MockitoAnnotations;
import org.mockito.junit.jupiter.MockitoExtension;

import java.io.IOException;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.mockito.Mockito.*;

@ExtendWith(MockitoExtension.class)
public class WeatherCurrencyServiceTest {

    @Mock
    private WeatherRestMap weatherRestMap;

    @Mock
    private CurrencyRestMap currencyRestMap;

    @InjectMocks
    private WeatherCurrencyService weatherCurrencyService;


    @Test
    public void testGetCurrentWeather() throws IOException {
        String city = "London";
        WeatherResponse expectedWeatherResponse = new WeatherResponse();

        when(weatherRestMap.getTenForecasts(city)).thenReturn(expectedWeatherResponse);

        WeatherResponse actualWeatherResponse = weatherCurrencyService.getCurrentWeather(city);

        assertEquals(expectedWeatherResponse, actualWeatherResponse);
        verify(weatherRestMap, times(1)).getTenForecasts(city);
    }

    @Test
    public void testGetCurrentCurrency() throws IOException {
        CurrencyData expectedCurrencyData = new CurrencyData();

        when(currencyRestMap.getCurrentCurrency()).thenReturn(expectedCurrencyData);

        CurrencyData actualCurrencyData = weatherCurrencyService.getCurrentCurrency();

        assertEquals(expectedCurrencyData, actualCurrencyData);
        verify(currencyRestMap, times(1)).getCurrentCurrency();
    }
}
