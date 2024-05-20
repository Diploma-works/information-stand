<<<<<<< HEAD
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
    private String base64Image;
}
=======
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
>>>>>>> 36d864de4e886046ed1011ac5dadc54330919b12
