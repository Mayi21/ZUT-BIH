package com.bih.controller;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class toSearchController {

    @RequestMapping("/search_page")
    public String toSearch(@Param("topic") String topic, Model model){
        model.addAttribute("topic",topic);
        return "/search_page";
    }
}
