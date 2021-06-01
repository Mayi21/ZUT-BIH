package com.bih.controller;

import com.bih.bean.user;
import com.bih.service.LoginService;
import com.bih.utils.JwtUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import java.io.IOException;

@Controller
public class toAccountController {

    @Autowired
    private LoginService loginService;
    @RequestMapping("/toAccount")
    public String toAccount(HttpServletRequest request, Model model) throws IOException {
        Cookie[] cookies = request.getCookies();
        for (Cookie cookie:cookies){
            if (cookie.getName().equals("_COOKIE_NAME")){
                user user = loginService.getUser(JwtUtil.getUserId(cookie.getValue()));
                if (user.getSex()==null){
                    user.setSex("±£√‹");
                }
                if (user.getCity()==null){
                    user.setCity("±£√‹");
                }
                if (user.getBirthday()==null){
                    user.setBirthday("±£√‹");
                }
                model.addAttribute("user",user);
//                if (user.getCity()!=null){
//                    String[] split = user.getCity().split("-");
//                    if(split.length!=0){
//                        for (int i =0;i<3;i++){
//                            model.addAttribute("province"+i,split[i]+"");
//                        }
//                    }else {
//                        for (int i =0;i<3;i++){
//                            model.addAttribute("province"+i,"");
//                        }
//                    }
//                }else {
//                    for (int i =0;i<3;i++){
//                        model.addAttribute("province"+i,"");
//                    }
//                }

            }
        }
        return "account";
    }
}
