package com.example.informationstand.models.еxcursion;

import jakarta.persistence.*;
import lombok.*;

import java.util.Date;
import java.util.List;

@Entity
@Table(name = "excursions")
@Getter
@Setter
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class Excursion {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private String name;
    private String description;
    private String location;
    private int duration;
    private double cost;
    private Date startTime;
    private Date endTime;
    private double rating;
    private String reservedMembers;
    private int maxParticipants;

}
