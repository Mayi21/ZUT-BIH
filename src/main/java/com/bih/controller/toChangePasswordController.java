package com.bih.controller;

import com.bih.service.RegisterService;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import java.io.IOException;

@Controller
public class toChangePasswordController {
    @Autowired
    private RegisterService registerService;
    @RequestMapping("/changePassword")
    public String toChangePassword(Model model){
        model.addAttribute("error","");
        return "changePassword";
    }
    @RequestMapping("/updatePassword")
    public String changePassword(@Param("code") String code, HttpServletRequest request ,Model model, @Param("password") String password, @Param("email") String email) throws IOException {
        Cookie[] cookies = request.getCookies();
        for(Cookie cookie :cookies){
            if (cookie.getName().equals("_Verification_Code")){
                if (cookie.getValue().equals(code)){
                    String message = registerService.updatePassword(password, email);
                        model.addAttribute("error",message);
                        return "login";

                }else{
                    model.addAttribute("error","ÑéÖ¤Âë´íÎó");
                    return "changePassword";
                }
            }
        }
        return "changePassword";
    }
}
