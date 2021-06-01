package com.bih.controller;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MainRight {

    @RequestMapping("/main_right")
    public String toMainRight(){
        return "main_right";
    }
}
