package com.bih.utils;

import com.bih.utils.Compressor;
import com.bih.utils.DownZipUtil;
import com.bih.utils.ZipCompresssor;

import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.util.List;

public class DownLoadUtil {
    public static boolean downLoad(List<String> srcFold , String desFold, HttpServletResponse response) throws FileNotFoundException {
        for (int i = 0 ;i<srcFold.size();i++){
            Compressor.toMoveCompressor(srcFold.get(i),desFold);
        }
        String  zipName = desFold+".zip";
        FileOutputStream fos1 = new FileOutputStream(new File(zipName));
        ZipCompresssor.toZip(desFold,fos1,true);
        InputStream inputStream=null;
        try {
            File file = new File(zipName);
            inputStream=new FileInputStream(file);
            DownZipUtil.fileDownload(file.getName(),inputStream,response);
            inputStream.close();
            fos1.close();
        }catch (Exception e){
            e.printStackTrace();
        }

        Compressor.DeleteFolder(desFold);
        Compressor.DeleteFolder(zipName);
        return true;
    }
}
