package com.example.informationstand.config;

import com.example.informationstand.utils.JavaScriptMappingJackson2HttpMessageConverter;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.client.HttpComponentsClientHttpRequestFactory;
import org.springframework.web.client.RestTemplate;

@Configuration
public class AppConfig {

    @Bean
    public RestTemplate restTemplate() {
        RestTemplate restTemplate = new RestTemplate(new HttpComponentsClientHttpRequestFactory());
        restTemplate.getMessageConverters().add(new JavaScriptMappingJackson2HttpMessageConverter());
        return restTemplate;
    }
}

