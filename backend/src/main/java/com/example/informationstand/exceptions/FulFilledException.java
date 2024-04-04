package com.example.informationstand.exceptions;

public class FulFilledException extends RuntimeException{
    public FulFilledException(String objectName, Long id){
        super(id == null ? (objectName + " is fulfilled.") : (objectName + " with id " + id + " is fulfilled."));
    }
}
