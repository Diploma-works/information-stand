package com.example.informationstand.controllers;

import com.example.informationstand.models.currency.CurrencyData;
import com.example.informationstand.models.weather.WeatherNow;
import com.example.informationstand.models.weather.WeatherResponse;
import com.example.informationstand.services.WeatherCurrencyService;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;

@RequiredArgsConstructor
@RestController
@RequestMapping("/weather_currency")
public class WeatherCurrencyController {

    private final WeatherCurrencyService weatherCurrencyService;

    @GetMapping("/weather")
    public WeatherResponse getWeather(@RequestParam String city) {
        return weatherCurrencyService.getCurrentWeather(city);
    }
    @GetMapping("/currency")
    public CurrencyData getCurrency() {
        return weatherCurrencyService.getCurrentCurrency();
    }


}
