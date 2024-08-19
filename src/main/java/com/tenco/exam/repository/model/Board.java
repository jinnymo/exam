package com.tenco.exam.repository.model;

import lombok.*;

import java.io.Serializable;


@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
@ToString
public class Board{
    private int id;
    private String title;
    private String content;
    private String userName;


}
