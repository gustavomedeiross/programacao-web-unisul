package com.gustavo.cars.controllers;

import com.gustavo.cars.entities.Base64Image;
import com.gustavo.cars.entities.Image;
import com.gustavo.cars.services.ImageUploadService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;

@RestController
@RequestMapping("images")
public class ImageController {
    @Autowired
    private ImageUploadService imageUploadService;

    @PostMapping
    public ResponseEntity store(@RequestBody Base64Image image, HttpServletRequest request) {
        try {
            Image uploadedImage = imageUploadService.create(image);
            return ResponseEntity.status(201).body(uploadedImage);
        } catch (Exception exception) {
            return ResponseEntity.status(500).body("Não foi possível cadastrar a imagem");
        }
    }
}
