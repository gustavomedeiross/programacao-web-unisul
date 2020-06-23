package com.gustavo.cars.util;

import com.gustavo.cars.entities.Base64Image;

public class FileHelper {
    public static String generateUniqueFilename(Base64Image image) {
        return image.getFilenameWithoutExtension() + "-" + System.currentTimeMillis() + image.getFileExtension();
    }
}
