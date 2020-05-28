package com.example.demo.controllers;

import com.example.demo.entities.City;
import com.example.demo.exceptions.RecordNotFoundException;
import com.example.demo.services.CityService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("cities")
public class CityController {
    @Autowired
    private CityService cityService;

    @GetMapping
    public List<City> index() {
        return cityService.index();
    }

    @PostMapping
    public City store(@RequestBody City city) {
        return cityService.store(city);
    }

    @PutMapping("/{id}")
    public City update(@PathVariable("id") Integer id, @RequestBody City city) {
        return  cityService.update(city, id);
    }

    @DeleteMapping("/{id}")
    public ResponseEntity delete(@PathVariable("id") Integer id) {
        try {
            return ResponseEntity.ok(cityService.delete(id));
        } catch (RecordNotFoundException exception) {
            return ResponseEntity.status(400).body("City not found");
        }
    }
}
