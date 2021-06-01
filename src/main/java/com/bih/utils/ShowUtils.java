package com.bih.utils;

import com.bih.bean.fileSize;

import java.io.File;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class ShowUtils {
    /**
     * 遍历所有文件
     * @param file
     * @return
     */
    public static List<fileSize> showName(File file) {
        String s = "";
        File[] fs = file.listFiles();
        List<fileSize> list = new ArrayList<>();
        for (File f : fs) {
            if (f.isDirectory())
            {
                showName(f);
            }
            if (f.isFile())
            {
                s = changeBig(f.length());
                list.add(new fileSize(s,f.getName(),f.getPath()));
            }
        }
        return list;
    }
    public static String changeBig(long size){
        if (size <= 0) {
            return "0";
        }
        final String[] units = new String[]{"B", "KB", "MB", "GB", "TB"};
        int digitGroups = (int) (Math.log10(size) / Math.log10(1024));
        return new DecimalFormat("#,##0.#").format(size / Math.pow(1024, digitGroups)) + " " + units[digitGroups];
    }
    public static Long allCount(File file) {
        long s = 0 ;
        File[] fs = file.listFiles();
        List<fileSize> list = new ArrayList<>();
        for (File f : fs) {
            if (f.isDirectory())
            {
                allCount(f);
            }
            if (f.isFile())
            {
               s = s+f.length();
            }
        }
        return s;
    }
}