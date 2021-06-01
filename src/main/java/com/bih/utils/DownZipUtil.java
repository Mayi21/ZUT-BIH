package com.bih.utils;

import javax.servlet.http.HttpServletResponse;
import java.io.*;

public class DownZipUtil {
    public static void fileDownload(String filename, InputStream input, HttpServletResponse response) {
        try {
            byte[] buffer = new byte[input.available()];
            input.read(buffer);
            input.close();
            // 清空response
            response.reset();
            // 设置response的Header
            response.addHeader("Content-Disposition", "attachment;filename=" + new String(filename.getBytes()));
            OutputStream toClient = new BufferedOutputStream(response.getOutputStream());
            response.setContentType("application/octet-stream");
            toClient.write(buffer);
            toClient.flush();
            //关闭，即下载
            toClient.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
