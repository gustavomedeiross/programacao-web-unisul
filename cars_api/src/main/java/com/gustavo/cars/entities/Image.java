package com.gustavo.cars.entities;

import com.gustavo.cars.util.UrlHelper;
import org.springframework.web.servlet.support.ServletUriComponentsBuilder;

public class Image {
    private String filename;
    private String originalFilename;

    public Image(String filename, String originalFilename) {
        this.filename = filename;
        this.originalFilename = originalFilename;
    }

    public String getFilename() {
        return filename;
    }

    public void setFilename(String filename) {
        this.filename = filename;
    }

    public String getOriginalFilename() {
        return originalFilename;
    }

    public void setOriginalFilename(String originalFilename) {
        this.originalFilename = originalFilename;
    }

    public String getUrl() {
        return UrlHelper.getServerBaseUrl() + "/images/" + this.getFilename();
    }
}
