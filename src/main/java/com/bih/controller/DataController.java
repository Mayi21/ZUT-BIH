package com.bih.controller;

import com.bih.bean.fileSize;
import com.bih.service.DataService;
import com.bih.service.DownService;
import com.bih.utils.ShowUtils;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@Controller
public class DataController {

    @Autowired
    private DataService dataService;
    @Autowired
    private DownService downLoad;

    @RequestMapping("/normal_ecg")
    public String Detail_page(HttpServletRequest request, @Param("name") String name, Model model, @Param("type") String type, @Param("id") String id) throws IOException {
        List list = dataService.GetData(name);
        model.addAttribute("data", list);
        Boolean flag = false;
        int count = 0;
        List<String> path = downLoad.getPath(type, id);
        List<String> path2 = new ArrayList<>();
        Cookie[] cookies = request.getCookies();
        if (cookies != null && cookies.length > 0) {
            for (Cookie cookie : cookies) {
                count++;
                System.out.println(cookie + "1");
                if (cookie.getName().equals("_COOKIE_NAME")) {
                    if (cookie.getValue().equals("null")) {
                        System.out.println(cookie.getValue());
                        for (int i = 0; i < 2 && path.get(i) != null; i++) {
                            path2.add(i, path.get(i));
                            flag = true;
                        }
                    } else {
                        path2 = path;
                        flag = true;
                    }
                } else {
                    if (count == cookies.length) {
                        if (path.size()==1){
                            for (int i = 0; i < 1 && path.get(i) != null; i++) {
                                path2.add(i, path.get(i));
                                flag = true;
                            }
                        }else if (path.size()==0){
                            flag = true;
                        }else {
                            for (int i = 0; i < 2 && path.get(i) != null; i++) {
                                path2.add(i, path.get(i));
                                flag = true;
                            }
                        }
                    }
                    if (flag) {
                        break;
                    }
                }
                if (flag) {
                    break;
                }
            }
        }
        List<fileSize> list1 = new ArrayList<>();
        long a =0;
        for (int i = 0; i < path2.size(); i++) {
            list1.addAll(ShowUtils.showName(new File(path2.get(i))));
            a=a+ShowUtils.allCount(new File(path2.get(i)));
        }
        model.addAttribute("files",list1);
        String s = ShowUtils.changeBig(a);
        model.addAttribute("allzount",s);
        return "detail_page";
    }
}
