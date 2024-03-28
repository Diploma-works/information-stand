package com.example.informationstand.models;

import jakarta.persistence.*;
import lombok.*;

@Entity
@Table(name = "device_codes")
@Getter
@Setter
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class DeviceCode {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(unique = true)
    private String code;

}
