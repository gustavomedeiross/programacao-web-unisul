package com.gustavo.cars.errors;

public class RecordNotFoundError extends Exception {
    public RecordNotFoundError(String message) {
        super(message);
    }
}
