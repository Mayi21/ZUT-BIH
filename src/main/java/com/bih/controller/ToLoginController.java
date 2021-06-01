package com.bih.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ToLoginController {

    @RequestMapping("/login")
    public String toLogin(Model model){
        model.addAttribute("error","");
        return "login";
    }

}
