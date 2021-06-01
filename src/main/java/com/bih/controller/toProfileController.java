package com.bih.controller;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class toProfileController {
    @RequestMapping("/toProfile")
    public String toProfile(){
        return "profile";
    }
}
