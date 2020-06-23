package com.gustavo.cars.entities;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity(name = "images")
public class Image {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;
    private String filename;
    private String originalFilename;

    public Image(String filename, String originalFilename) {
        this.filename = filename;
        this.originalFilename = originalFilename;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
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

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Image image = (Image) o;

        if (id != null ? !id.equals(image.id) : image.id != null) return false;
        if (filename != null ? !filename.equals(image.filename) : image.filename != null) return false;
        return originalFilename != null ? originalFilename.equals(image.originalFilename) : image.originalFilename == null;
    }

    @Override
    public int hashCode() {
        int result = id != null ? id.hashCode() : 0;
        result = 31 * result + (filename != null ? filename.hashCode() : 0);
        result = 31 * result + (originalFilename != null ? originalFilename.hashCode() : 0);
        return result;
    }
}
