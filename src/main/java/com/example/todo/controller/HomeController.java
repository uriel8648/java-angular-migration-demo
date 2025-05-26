package com.example.todo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class HomeController {
    
    @GetMapping("/")
    public String home() {
        return "redirect:/todos";
    }
    
    @GetMapping("/angular")
    public String angularApp() {
        return "todo/angular-app";
    }

    @GetMapping("/angular12-app")
    public String angular12App() {
        return "todo/angular12-app";
    }
}
