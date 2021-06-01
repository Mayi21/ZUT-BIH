package com.bih.controller;


import com.bih.utils.JwtUtil;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;

/**
 * @author HomieJ
 */
@Controller
public class KeepLoginController {

    @ResponseBody
    @RequestMapping("/keepLogin")
    public String keepLogin(HttpServletRequest request){
        Cookie[] cookies = request.getCookies();
        for (Cookie cookie:cookies){
           if (cookie.getName().equals("_COOKIE_NAME")){
               request.setAttribute("data",JwtUtil.getUsername(cookie.getValue()));
               return JwtUtil.getUsername(cookie.getValue());
           }
        }
        System.out.println("login");
        return null;
    }
}
