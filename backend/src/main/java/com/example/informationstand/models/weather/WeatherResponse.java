package com.example.informationstand.models.weather;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import lombok.Getter;
import lombok.Setter;

import java.util.List;
@Getter
@Setter
@JsonIgnoreProperties(ignoreUnknown = true)
public class WeatherResponse {
    private List<WeatherNow> list;
    private City city;
}