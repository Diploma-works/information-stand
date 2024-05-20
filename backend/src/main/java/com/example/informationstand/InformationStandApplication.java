package com.example.informationstand;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;

@SpringBootApplication
@EnableJpaRepositories
public class InformationStandApplication {

    public static void main(String[] args) {
        SpringApplication.run(InformationStandApplication.class, args);
    }

}
