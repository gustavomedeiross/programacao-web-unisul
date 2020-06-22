package com.gustavo.cars.controllers;

import com.gustavo.cars.entities.Base64Image;
import com.gustavo.cars.services.ImageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("static/images")
public class ImageController {
    @Autowired
    private ImageService imageService;

    @PostMapping
    public ResponseEntity store(@RequestBody Base64Image image) {
        try {
            return ResponseEntity.status(201).body(imageService.create(image));
        } catch (Exception exception) {
            return ResponseEntity.status(500).body("Não foi possível cadastrar a imagem");
        }
    }
}
