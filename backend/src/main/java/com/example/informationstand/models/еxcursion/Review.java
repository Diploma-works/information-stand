package com.example.informationstand.models.еxcursion;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.util.Date;
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class Review {
    private Long id;
    private String userId; // Идентификатор пользователя, оставившего отзыв
    private String text;
    private double rating;
    private Date date;

}