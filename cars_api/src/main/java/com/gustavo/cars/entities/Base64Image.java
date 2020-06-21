package com.gustavo.cars.entities;

public class Base64Image {
    private String filename;
    private String mimeType;
    private String base64;

    public Base64Image(String filename, String mimeType, String base64) {
        this.filename = filename;
        this.mimeType = mimeType;
        this.base64 = base64;
    }

    public String getFilename() {
        return filename;
    }

    public String getMimeType() {
        return mimeType;
    }

    public String getBase64() {
        return base64;
    }
}
