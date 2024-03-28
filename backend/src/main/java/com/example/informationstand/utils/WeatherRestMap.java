package com.example.informationstand.utils;

import com.example.informationstand.models.weather.WeatherNow;
import com.example.informationstand.models.weather.WeatherResponse;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;
import org.springframework.web.client.RestTemplate;
import java.time.LocalDateTime;

import java.io.IOException;
import java.net.HttpURLConnection;
import java.net.URL;
import java.time.ZoneId;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

@Component
@RequiredArgsConstructor
public class WeatherRestMap {

    private final RestTemplate restTemplate;

    @Value("${api.weather}")
    private String apiUri;

    //получение текущей погоды
    public WeatherResponse getNowWeather(String city) {
        try {
            return restTemplate.getForObject(apiUri
                            .replace("{city}", city),
                    WeatherResponse.class);
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    //проверка существования города
    public boolean isCity(String city) throws IOException {

        URL weatherApiUrl = new URL(apiUri.replace("{city}", city));

        HttpURLConnection weatherApiConnection = (HttpURLConnection) weatherApiUrl.openConnection();
        weatherApiConnection.setRequestMethod("GET");
        weatherApiConnection.connect();
        return weatherApiConnection.getResponseCode() == HttpURLConnection.HTTP_OK;
    }

    public WeatherResponse getTenForecasts(String city) {
        WeatherResponse response = getNowWeather(city);
        if (response != null && response.getList() != null && !response.getList().isEmpty()) {
            List<WeatherNow> forecasts = new ArrayList<>();
            Set<String> uniqueDates = new HashSet<>();
            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
            for (WeatherNow forecast : response.getList()) {
                LocalDateTime dateTime = LocalDateTime.parse(forecast.getDtTxt(), formatter);
                if (dateTime.getHour() >= 13 && dateTime.getHour() <= 17) {
                    String date = dateTime.toLocalDate().toString();
                    if (!uniqueDates.contains(date)) {
                        forecasts.add(forecast);
                        uniqueDates.add(date);
                        if (forecasts.size() == 10) {
                            break;
                        }
                    }
                }
            }
            for (WeatherNow forecast : response.getList()) {
                LocalDateTime dateTime = LocalDateTime.parse(forecast.getDtTxt(), formatter);
                String date = dateTime.toLocalDate().toString();
                if (!uniqueDates.contains(date)) {
                    forecasts.add(forecast);
                    uniqueDates.add(date);
                    if (forecasts.size() == 10) {
                        break;
                    }
                }
            }
            WeatherResponse filteredResponse = new WeatherResponse();
            filteredResponse.setList(forecasts);
            filteredResponse.setCity(response.getCity());
            return filteredResponse;
        } else {
            return null;
        }
    }
}