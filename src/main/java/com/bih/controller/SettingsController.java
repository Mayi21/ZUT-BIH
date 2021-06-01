package com.bih.controller;

import com.bih.service.SettingsService;
import com.bih.utils.JwtUtil;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import java.io.IOException;

@Controller
public class SettingsController {
    private static String passwordWarn = "";
    private static String usernameWarn = "";
    @Autowired
    private SettingsService settingsService;
    @RequestMapping("/settings/to_username")
    public String setUserName(@RequestParam("settingflag") String flag,Model model){
        model.addAttribute("usernameWarn",usernameWarn);
        usernameWarn="";
        return "username";

    }
    @RequestMapping("/settings/to_othermessage")
    public String setOtherMessage(@RequestParam("settingflag") String flag,Model model){
        System.out.println(flag);
        if ("true".equals(flag)){
            model.addAttribute("warn","????");
        }else {
            model.addAttribute("warn","");
        }
        return "othermessage";

    }
    @RequestMapping("/settings/to_password")
    public String setPassWord(Model model,@RequestParam("settingflag") String flag){
        model.addAttribute("passwordWarn",passwordWarn);
        passwordWarn = "";
        return "password";

    }
    @RequestMapping("/settings/password")
    public String setpsw(@RequestParam("old_password") String old_password,@RequestParam("password") String new_password1,@RequestParam("new_password2") String new_password2,Model model,HttpServletRequest  request) throws IOException {
        Cookie[] cookies = request.getCookies();
        String email ="";
        for (Cookie cookie:cookies){
            if (cookie.getName().equals("_COOKIE_NAME")){
                email= JwtUtil.getUserId(cookie.getValue());
            }
        }
        String s = settingsService.upDatepassword(old_password, new_password1, new_password2, email);
        passwordWarn=s;
        model.addAttribute("setting","password");
        return "account";
    }
    @RequestMapping("/settings/othermessage")
    public String setohtherm(@RequestParam("old_password") String old_password,@RequestParam("new_password1") String new_password1,Model model,HttpServletRequest  request) throws IOException {
        Cookie[] cookies = request.getCookies();
        String email ="";
        for (Cookie cookie:cookies){
            if (cookie.getName().equals("_COOKIE_NAME")){
                email= JwtUtil.getUsername(cookie.getValue());
            }
        }
        settingsService.updateotherm(old_password, new_password1, email);
        model.addAttribute("setting","password");
        return "account";
    }
    @RequestMapping("/settings/username")
    public String upDateUserName(@Param("username") String username, @Param("gender") String gender ,@Param("province") String province ,@Param("city") String city,@Param("county") String county, @Param("birthday") String birthday,@Param("introduction") String introduction,Model model ,HttpServletRequest request) throws IOException {
        Cookie[] cookies = request.getCookies();
        String email ="";
        for (Cookie cookie:cookies){
            if (cookie.getName().equals("_COOKIE_NAME")){
                email= JwtUtil.getUserId(cookie.getValue());
            }
        }
        String s = settingsService.upDateUserName(username,gender,province,city,county,birthday,introduction,email);
        usernameWarn = s;
        model.addAttribute("setting","username");
        return "toAccount";
    }
}
