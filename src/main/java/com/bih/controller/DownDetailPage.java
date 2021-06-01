package com.bih.controller;

import com.bih.service.DownService;
import com.bih.utils.DownLoadUtil;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.FileNotFoundException;
import java.util.ArrayList;
import java.util.List;

@Controller
public class DownDetailPage {
    @RequestMapping("/downdetailpage")
    public void downDetail(@Param("downPath") String downPath, HttpServletResponse response, HttpServletRequest request) throws FileNotFoundException {
        List<String> list = new ArrayList<>();
        String replace = downPath.replace('\\', '/');
        System.out.println(replace);
        list.add(replace);
        DownLoadUtil.downLoad(list,"/root/data",response);
    }
}
