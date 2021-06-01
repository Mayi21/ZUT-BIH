package com.bih.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class toAboutController {
    @RequestMapping("/toAbout")
    public String toAbout(){
        return "about";
    }
}
