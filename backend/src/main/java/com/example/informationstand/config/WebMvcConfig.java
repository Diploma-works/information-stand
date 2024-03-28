package com.example.informationstand.config;

import com.example.informationstand.utils.DeviceCodeInterceptor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class WebMvcConfig implements WebMvcConfigurer {

    private final DeviceCodeInterceptor deviceCodeInterceptor;

    @Autowired
    public WebMvcConfig(DeviceCodeInterceptor deviceCodeInterceptor) {
        this.deviceCodeInterceptor = deviceCodeInterceptor;
    }

    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        registry.addInterceptor(deviceCodeInterceptor);
    }
}
