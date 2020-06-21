package com.gustavo.cars.repositories;

import com.gustavo.cars.entities.Image;
import org.springframework.data.jpa.repository.JpaRepository;

public interface ImageRepository extends JpaRepository<Image, Integer> {
}
