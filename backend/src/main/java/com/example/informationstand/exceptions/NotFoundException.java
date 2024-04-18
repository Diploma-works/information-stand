package com.example.informationstand.exceptions;

public class NotFoundException extends RuntimeException{
    public NotFoundException(String objectName, Long id){
        super(id == null ? (objectName + " not found.") : (objectName + " with id " + id + "not found"));
    }
}

