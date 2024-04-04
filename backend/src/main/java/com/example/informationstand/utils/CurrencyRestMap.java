package com.example.informationstand.utils;

import com.example.informationstand.models.currency.CurrencyData;
import com.example.informationstand.models.weather.WeatherNow;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;
import org.springframework.web.client.RestTemplate;

@Component
@RequiredArgsConstructor
public class CurrencyRestMap {

    private final RestTemplate restTemplate;

    @Value("${api.currency}")
    private String apiUri;

    public CurrencyData getCurrentCurrency() {
        try {
            String response = restTemplate.getForObject(apiUri, String.class);
            ObjectMapper objectMapper = new ObjectMapper();
            CurrencyData currencyData = objectMapper.readValue(response, CurrencyData.class);
            return currencyData;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }
}
