package org.example.cicd_test.controller;


import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class MainController {
    @GetMapping("/hello")
    public ResponseEntity<?> hello(){
        return ResponseEntity.ok()
                .header("hello", "cicd")
                .body("cicd");
    }
}
