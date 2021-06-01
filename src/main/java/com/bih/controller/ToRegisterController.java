package com.bih.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ToRegisterController {
    @RequestMapping("/register")
    public String toLogin(Model model){
        model.addAttribute("error","");
        return "register";
    }

}
