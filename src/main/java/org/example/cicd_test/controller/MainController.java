package org.example.cicd_test.controller;


import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class MainController {
    @PostMapping("/hello")
    public ResponseEntity<?> hello(){
        return ResponseEntity.ok("CICD TEST");
    }
}
