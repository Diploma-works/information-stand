package com.example.informationstand.models.catalog;

import lombok.*;

import jakarta.persistence.*;

@Entity
@Table(name = "places")
@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@Builder
public class Place {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(nullable = false)
    private String name;

    @Column(nullable = false)
    private String description;

    @Column(nullable = false)
    private String base64Image;

    @Column(nullable = false)
    private double latitude;

    @Column(nullable = false)
    private double longitude;

    @Column(nullable = false)
    private String address;

    private String phoneNumber;

    @Column(nullable = false)
    private String workingHours;

    @Enumerated(EnumType.STRING)
    @Column(nullable = false)
    private Category category;

    public Place(Category category) {
        this.category = category;
    }
}
