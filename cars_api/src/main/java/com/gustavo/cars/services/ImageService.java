package com.gustavo.cars.services;

import com.gustavo.cars.entities.Base64Image;
import com.gustavo.cars.entities.Image;
import com.gustavo.cars.repositories.ImageRepository;
import com.gustavo.cars.util.FileHelper;
import org.apache.tomcat.util.codec.binary.Base64;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.io.FileOutputStream;

@Service
public class ImageService {
    final public static String IMAGE_UPLOAD_PATH = "tmp/images/";

    @Autowired
    private ImageRepository imageRepository;

    public Image create(Image image) {
        return imageRepository.save(image);
    }

    public Image create(Base64Image base64Image) throws Exception {
        byte[] imageByte = Base64.decodeBase64(base64Image.getBase64());
        String filename = base64Image.getFilename();
        String path = IMAGE_UPLOAD_PATH + FileHelper.generateUniqueFilename(base64Image);
        new FileOutputStream(path).write(imageByte);
        return create(new Image(filename, base64Image.getFilename()));
    }
}
