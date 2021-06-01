package com.bih.controller;

import com.bih.service.RegisterService;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import java.io.IOException;

@Controller
public class RegisterController {
    @Autowired
    private RegisterService registerService;
    @RequestMapping(value = "/toRegister", method = {RequestMethod.GET, RequestMethod.POST})
    public String    getData(HttpServletRequest  request,@Param("email") String email, @Param("code") String code, @Param("username") String username,@Param("password") String password, Model model) throws IOException {
        Cookie[] cookies = request.getCookies();
        for(Cookie cookie :cookies){
            if (cookie.getName().equals("_Verification_Code")){
                if (cookie.getValue().equals(code)){
                    Boolean message = registerService.register(username, password, email);
                    if (message){
                        model.addAttribute("error","注册成功,请登录");
                        return "login";
                    }else {
                        model.addAttribute("error","该账户已注册");
                        return "register";
                    }

                }else{
                    model.addAttribute("error","验证码错误");
                    return "register";
                }
            }
        }
        return "register";
    }
}
