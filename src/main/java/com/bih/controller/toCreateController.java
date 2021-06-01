package com.bih.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class toCreateController {
    @RequestMapping("/toCreate")
    public String toCreate(){
        return "create";
    }
}
