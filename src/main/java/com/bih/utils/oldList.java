package com.bih.utils;

import java.io.BufferedWriter;
import java.io.FileWriter;
import java.io.IOException;

public class oldList {

    public static void write(String ss) throws IOException {
        //��д��ת��Ϊ������ʽ
                BufferedWriter bw = new BufferedWriter(new FileWriter("E:\\DeskTop\\111.txt",true));
              //һ��дһ��
                  bw.write(ss);
                  bw.newLine();  //������

                //�ر���
               bw.close();
               System.out.println("д��ɹ�");
                }

}
