package com.example.informationstand.exceptions;

import org.springframework.http.HttpStatus;
import org.springframework.web.ErrorResponse;
import org.springframework.web.bind.MethodArgumentNotValidException;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RestControllerAdvice;

import java.time.Instant;

@RestControllerAdvice
public class GlobalExceptionHandler {

    @ExceptionHandler(MethodArgumentNotValidException.class)
    public ErrorResponse handleValidationError(MethodArgumentNotValidException exception){
        return ErrorResponse.builder(exception, HttpStatus.BAD_REQUEST, exception.getMessage())
                .title("Data is not valid")
                .property("timestamp", Instant.now())
                .build();
    }

    @ExceptionHandler(NotFoundException.class)
    public ErrorResponse handleNotFoundError(NotFoundException exception){
        return ErrorResponse.builder(exception, HttpStatus.NOT_FOUND, exception.getMessage())
                .title("Not found")
                .property("timestamp", Instant.now())
                .build();
    }
}
