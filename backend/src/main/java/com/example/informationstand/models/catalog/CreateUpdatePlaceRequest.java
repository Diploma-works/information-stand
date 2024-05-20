package com.example.informationstand.models.catalog;

import lombok.*;

@Builder
@Setter
@Getter
@AllArgsConstructor
@NoArgsConstructor
public class CreateUpdatePlaceRequest {
    private String name;

    private String description;

    private String base64Image;

    private double latitude;

    private double longitude;

    private String address;

    private String phoneNumber;

    private String workingHours;

    private String category;
}
