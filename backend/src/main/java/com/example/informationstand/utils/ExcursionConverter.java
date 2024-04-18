package com.example.informationstand.utils;

import com.example.informationstand.models.еxcursion.Member;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;

import javax.persistence.AttributeConverter;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

public class ExcursionConverter implements AttributeConverter<List<Member>, String> {
    private final ObjectMapper objectMapper = new ObjectMapper();

    @Override
    public String convertToDatabaseColumn(List<Member> members) {
        try {
            return objectMapper.writeValueAsString(members);
        } catch (JsonProcessingException e) {
            // Handle conversion error
            return null;
        }
    }

    @Override
    public List<Member> convertToEntityAttribute(String json) {
        if (json == null) {
            return new ArrayList<>();
        }
        try {
            return objectMapper.readValue(json, new TypeReference<List<Member>>() {
            });
        } catch (IOException e) {
            // Handle conversion error
            return new ArrayList<>();
        }
    }
}
