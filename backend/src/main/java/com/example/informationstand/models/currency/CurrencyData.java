package com.example.informationstand.models.currency;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.Getter;

import java.util.HashMap;
import java.util.Map;

@Getter
@JsonIgnoreProperties(ignoreUnknown = true)
public class CurrencyData {
    @JsonProperty("Date")
    private String date;
    @JsonProperty("Valute")
    private Map<String, CurrencyInfo> valute = new HashMap<>();

}