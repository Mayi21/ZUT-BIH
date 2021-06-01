package com.bih.utils;

import java.io.BufferedWriter;
import java.io.FileWriter;
import java.io.IOException;

public class oldList {

    public static void write(String ss) throws IOException {
        //将写入转化为流的形式
                BufferedWriter bw = new BufferedWriter(new FileWriter("E:\\DeskTop\\111.txt",true));
              //一次写一行
                  bw.write(ss);
                  bw.newLine();  //换行用

                //关闭流
               bw.close();
               System.out.println("写入成功");
                }

}
