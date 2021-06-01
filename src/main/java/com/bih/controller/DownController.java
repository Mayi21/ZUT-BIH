package com.bih.controller;

//import com.alibaba.fastjson.JSONObject;
import com.alibaba.fastjson.JSONObject;
import com.bih.service.DataService;
import com.bih.service.DownService;
import com.bih.utils.Compressor;
import com.bih.utils.DownLoadUtil;
import com.bih.utils.DownZipUtil;
import com.bih.utils.ZipCompresssor;
import net.lingala.zip4j.io.outputstream.ZipOutputStream;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.util.ArrayList;
import java.util.List;

@Controller
public class DownController {
    @Autowired
    private DownService downLoad;
    @RequestMapping("/down")
    public void DownLoad(HttpServletResponse response, @Param("type") String type ,@Param("id") String id ,HttpServletRequest request) throws IOException {
        Boolean flag = false;
        int count = 0;
        List<String> path = downLoad.getPath(type, id);
        List<String> path2 = new ArrayList<>();
        Cookie[] cookies = request.getCookies();
        if(cookies != null && cookies.length > 0){
            for (Cookie cookie : cookies){
                count++;
                System.out.println(cookie+"1");
                if (cookie.getName().equals("_COOKIE_NAME")){
                    if (cookie.getValue().equals("null")){
                        System.out.println(cookie.getValue());
                        for (int i =0;i<2&&path.get(i)!=null;i++){
                            path2.add(i,path.get(i));
                            flag=true;
                        }
                    }else {
                        path2 = path;
                        flag=true;
                    }
                }else {
                    if (count==cookies.length){
                        for (int i =0;i<2&&path.get(i)!=null;i++){
                            path2.add(i,path.get(i));
                            flag=true;
                        }
                    }
                    if (flag){
                        break;
                    }
                }
                if (flag){
                    break;
                }
            }
        }
        // TODO
        DownLoadUtil.downLoad(path2,"/home/xaohii/Data/tempData/bih",response);
    }
    @RequestMapping("/toJson")
    public String toJsonText(@Param("type") String type ,@Param("id") String id , HttpServletRequest request,HttpServletResponse response) throws IOException, ServletException {
        List<String> path = downLoad.getPath(type, id);
        // TODO file path
        OutputStreamWriter osw = new OutputStreamWriter(new FileOutputStream("/home/xaohii/Data/set/12345.json"),"UTF-8");
        JSONObject obj=new JSONObject();
        String string ="";
        List<String> list = new ArrayList<>();
        for (int i =0;i<path.size();i++){
            string = string +"\""+path.get(i).substring(26,path.get(i).length())+"\",";
        }
        String substring = string.substring(0, string.length() - 1);
        substring = "["+substring+"]";
        osw.write(substring);
        osw.flush();//清空缓冲区，强制输出数据
        osw.close();//关闭输出流
        return "toshow";
    }
    }
