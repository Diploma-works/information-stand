package com.example.informationstand.utils;

import org.springframework.http.MediaType;
import org.springframework.http.converter.json.MappingJackson2HttpMessageConverter;

import java.util.Collections;

public class JavaScriptMappingJackson2HttpMessageConverter extends MappingJackson2HttpMessageConverter {

    public JavaScriptMappingJackson2HttpMessageConverter() {
        setSupportedMediaTypes(Collections.singletonList(new MediaType("application", "javascript")));
    }
}