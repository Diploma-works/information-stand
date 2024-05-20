package com.example.informationstand.models.weather;

import lombok.Builder;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Builder
public class Weather {
    private int id;
    private String main;
    private String description;
    private String icon;
}