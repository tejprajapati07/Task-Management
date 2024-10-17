package com.example.demo.model;

import jakarta.persistence.*;
import lombok.Data;
import java.time.LocalDate;

@Entity
@Data
public class Task {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String title;
    private String description;

    @Enumerated(EnumType.STRING)
    private Status status;

    private int priority;
    private LocalDate dueDate;

    public enum Status {
        OPEN, IN_PROGRESS, COMPLETED, CLOSED
    }
}
