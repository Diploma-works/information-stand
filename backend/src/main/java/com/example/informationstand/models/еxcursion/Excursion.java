<<<<<<< HEAD
package com.example.informationstand.models.еxcursion;

import jakarta.persistence.*;
import lombok.*;

import java.util.Date;

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
    public Excursion(int maxParticipants) {
        this.maxParticipants = maxParticipants;
    }
}
=======
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
>>>>>>> 36d864de4e886046ed1011ac5dadc54330919b12
