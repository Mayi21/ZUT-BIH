package com.bih.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @author HomieJ
 */
@Controller
public class toShareController {
    @RequestMapping("/toShare")
    public String toShare(){
        return "share";
    }
}
