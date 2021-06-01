package com.bih.controller;

import com.bih.service.EcgService;
import com.bih.utils.ByClick;
import com.bih.utils.oldList;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@Controller
public class RetrievalController {
    @Autowired
    private EcgService ecgService;

    @RequestMapping("/retrieval")
    public String retrieval(@Param("id_orderby") String id_orderby , @Param("city1") String city1 , @Param("city2") String city2 , @Param("city3") String city3 , @Param("city4") String city4 , @Param("city5") String city5 , @Param("city6") String city6 , @Param("city7") String city7 , Model model) throws IOException {
        List<String> list = new ArrayList<>();
        System.out.println(city1+city2+city3);
        list.add(city1);
        list.add(city2);
        list.add(city3);
        list.add(city4);
        list.add(city5);
        list.add(city6);
        list.add(city7);
        ByClick byClick = new ByClick();
        String s = byClick.witchByClick(list);
        System.out.println(s);
        ecgService.GetEcg(id_orderby,s);
        return "retrieval";
    }
}
