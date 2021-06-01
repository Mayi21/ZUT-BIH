package com.bih.controller;

import com.bih.bean.showData;
import com.bih.service.DiseaseService;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.Cookie;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@Controller
public class SearchController {
    @Autowired
    private DiseaseService diseaseService;

    @RequestMapping("/search_ecg")
    public String search_ecg(@Param("id_topic") String id_topic , Model model) throws IOException {
        List<showData> list = diseaseService.GetData(id_topic);
        model.addAttribute("list",list);
        return "download";
    }
}
