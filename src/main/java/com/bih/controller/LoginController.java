package com.bih.controller;


import com.bih.service.LoginService;
import com.bih.utils.JwtUtil;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;


/**
 * @author HomieJ
 */
@Controller
public class LoginController {
    @Autowired
    private LoginService loginService;
    @RequestMapping(value = "/toLogin", method = {RequestMethod.GET, RequestMethod.POST},produces="text/html;charset=UTF-8")
    public String  getData(@Param("email") String email, @Param("password") String password, Model model, HttpServletResponse response) throws Exception {
        System.out.println(email+password);
        String psw = loginService.Login(email);
        String username = loginService.getUsername(email);
        if (psw==null){
            model.addAttribute("error","∏√” œ‰Œ¥◊¢≤·");
            return "login";
        }
        else if (password.equals(psw)){
            String token = JwtUtil.sign(username, email);
            Cookie cookie = new Cookie("_COOKIE_NAME", token);
            cookie.setMaxAge(3600);//…Ë÷√token”––ß ±º‰
            cookie.setPath("/");
            model.addAttribute("username",username);
            model.addAttribute("email",email);
            response.addCookie(cookie);
            return "toIndex";
        }else {
            model.addAttribute("error","√‹¬Î¥ÌŒÛ");
            return "login";
        }
    }
}
