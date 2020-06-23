package com.gustavo.cars.services;

import com.gustavo.cars.entities.Base64Image;
import com.gustavo.cars.entities.Image;
import com.gustavo.cars.util.FileHelper;
import org.apache.tomcat.util.codec.binary.Base64;
import org.springframework.stereotype.Service;

import java.io.FileOutputStream;

@Service
public class ImageUploadService {
    final public static String IMAGE_UPLOAD_PATH = "tmp/images/";

    public Image create(Base64Image base64Image) throws Exception {
        byte[] imageByte = Base64.decodeBase64(base64Image.getBase64());
        String filename = FileHelper.generateUniqueFilename(base64Image);
        String path = IMAGE_UPLOAD_PATH + filename;
        new FileOutputStream(path).write(imageByte);
        return new Image(filename, base64Image.getFilename());
    }
}
