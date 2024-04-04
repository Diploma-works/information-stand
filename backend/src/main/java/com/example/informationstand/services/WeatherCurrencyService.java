package com.example.informationstand.services;

import com.example.informationstand.models.currency.CurrencyData;
import com.example.informationstand.models.weather.WeatherResponse;
import com.example.informationstand.utils.CurrencyRestMap;
import com.example.informationstand.utils.WeatherRestMap;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.io.IOException;

@Service
@RequiredArgsConstructor
public class WeatherCurrencyService {

    private final WeatherRestMap weatherRestMap;
    private final CurrencyRestMap currencyRestMap;

    public boolean isCity(String city) throws IOException {
        return weatherRestMap.isCity(city);
    }

    public WeatherResponse getCurrentWeather(String city) {
        return weatherRestMap.getTenForecasts(city);
    }

    public CurrencyData getCurrentCurrency() {
        return currencyRestMap.getCurrentCurrency();
    }
}
