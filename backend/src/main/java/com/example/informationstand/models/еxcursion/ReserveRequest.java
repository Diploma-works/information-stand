package com.example.informationstand.models.еxcursion;

import lombok.*;

@Getter
@Setter
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class ReserveRequest {
    private Long excursionId;
    private String credentials;
    private int count;
}
