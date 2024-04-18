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
    @Column(name = "base64Image")
    private String base64Image;

    @Override
    public String toString() {
        return "Excursion{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", description='" + description + '\'' +
                ", location='" + location + '\'' +
                ", duration=" + duration +
                ", cost=" + cost +
                ", startTime=" + startTime +
                ", endTime=" + endTime +
                ", rating=" + rating +
                ", reservedMembers='" + reservedMembers + '\'' +
                ", maxParticipants=" + maxParticipants +
                ", base64Image='" + base64Image + '\'' +
                '}';
    }
}
