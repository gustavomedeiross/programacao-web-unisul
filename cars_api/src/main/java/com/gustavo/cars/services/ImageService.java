package com.gustavo.cars.services;

import com.gustavo.cars.entities.Base64Image;
import com.gustavo.cars.entities.Image;
import com.gustavo.cars.repositories.ImageRepository;
import org.apache.tomcat.util.codec.binary.Base64;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;
import java.io.FileOutputStream;

@Service
public class ImageService {
    @Autowired
    private ImageRepository imageRepository;

    public Image create(Image image) {
        return imageRepository.save(image);
    }

    public Image create(Base64Image base64Image, HttpServletRequest request) throws Exception {
        byte[] imageByte = Base64.decodeBase64(base64Image.getBase64());
        String imagePath = "src/main/resources/static/images/" + base64Image.getFilename();
        String url = "images/" + base64Image.getFilename();
        new FileOutputStream(imagePath).write(imageByte);
        return create(new Image(url, base64Image.getFilename()));
    }
}
