<<<<<<< HEAD
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
    private String base64Image;
}
=======
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
>>>>>>> 36d864de4e886046ed1011ac5dadc54330919b12
