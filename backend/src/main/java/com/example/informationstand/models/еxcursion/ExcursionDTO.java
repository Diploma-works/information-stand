package com.example.informationstand.models.еxcursion;

import lombok.*;

import java.util.Date;
import java.util.List;
@Getter
@Builder
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class ExcursionDTO {
    private Long id;
    private String name;
    private String description;
    private String location;
    private int duration;
    private double cost;
    private Date startTime;
    private Date endTime;
    private double rating;
    private List<Member> reservedMembers;
    private int maxParticipants;

}
