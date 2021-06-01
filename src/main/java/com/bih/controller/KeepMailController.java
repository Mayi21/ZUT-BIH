package com.bih.controller;



import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.mail.Session;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;

import static com.bih.utils.SendMail.*;

@Controller
public class KeepMailController {

    @RequestMapping("/mail")
    public String mail(@Param("code")String code , HttpServletResponse response) throws Exception {
        Session session = CreatSession();
        String string = Createcode();
        Cookie cookie = new Cookie("_Verification_Code", string);
        cookie.setMaxAge(3600);//设置token有效时间
        cookie.setPath("/");
        response.addCookie(cookie);
        MimeMessage message = createSimpleMail(session,code,string);
        boolean a = SendMail(session,message);
//        System.out.println(a);
        return null;
    }
}
