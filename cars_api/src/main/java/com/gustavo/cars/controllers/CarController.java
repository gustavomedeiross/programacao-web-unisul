package com.gustavo.cars.controllers;

import com.gustavo.cars.entities.Car;
import com.gustavo.cars.errors.RecordNotFoundError;
import com.gustavo.cars.services.CarService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("cars")
public class CarController {
    @Autowired
    private CarService carService;

    @GetMapping
    public ResponseEntity<List<Car>> index() {
        return ResponseEntity.ok(carService.getAll());
    }

    @PostMapping
    public ResponseEntity<Car> store(@RequestBody Car car) {
        return ResponseEntity.status(201).body(carService.create(car));
    }

    @PutMapping("/{id}")
    public ResponseEntity update(@PathVariable("id") Integer id, @RequestBody Car car) {
        try {
            return ResponseEntity.ok(carService.update(car, id));
        } catch (RecordNotFoundError error) {
            return ResponseEntity.status(404).body("Car not found");
        }
    }

    @DeleteMapping("/{id}")
    public ResponseEntity delete(@PathVariable("id") Integer id) {
        try {
            return ResponseEntity.ok(carService.delete(id));
        } catch (RecordNotFoundError error) {
            return ResponseEntity.status(404).body("Car not found");
        }
    }
}
