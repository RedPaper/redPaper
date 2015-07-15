package ecs.test;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;

@Entity
public class Tester {
    @Id @GeneratedValue
    private Long id;
}