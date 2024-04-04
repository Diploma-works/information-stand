package com.example.informationstand.models.еxcursion;

import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import lombok.Getter;
import lombok.Setter;

import java.util.Date;

@Setter
@Getter
public class ExcursionCreateRequest {
    @NotBlank
    private String name;
    @NotBlank
    private String description;
    @NotBlank
    private String location;
    @NotNull
    private int duration;
    @NotNull
    private double cost;
    @NotBlank
    private Date startTime;
    @NotBlank
    private Date endTime;
    @NotNull
    private int maxParticipants;
}
