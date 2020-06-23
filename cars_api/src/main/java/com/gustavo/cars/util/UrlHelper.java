package com.gustavo.cars.util;

import org.springframework.web.servlet.support.ServletUriComponentsBuilder;

public class UrlHelper {
    public static String getServerBaseUrl() {
        return ServletUriComponentsBuilder.fromCurrentContextPath().build().toUriString();
    }
}
