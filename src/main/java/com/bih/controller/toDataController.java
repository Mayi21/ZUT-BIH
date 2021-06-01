package com.bih.controller;

import com.bih.bean.showData;
import com.bih.service.ToDataShowService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class toDataController {
 @Autowired
    ToDataShowService toDataShowService;
    @RequestMapping("/data")
    public String toData(Model model) throws IOException {
        char str = 'a';
        List<showData> list = new ArrayList<>();
        for (int i = 0 ;i<7;i++){
            list = toDataShowService.getList(str + "");
            model.addAttribute("list"+str,list);
            str++;
        }
        return "/database";
    }
}
