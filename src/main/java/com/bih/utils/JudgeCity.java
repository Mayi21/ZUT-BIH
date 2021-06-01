package com.bih.utils;

import java.util.ArrayList;
import java.util.List;

/**
 * @author HomieJ
 */
public class JudgeCity {
    private static String[] list;
    public static String whoChange(List<String> comeList){
        if (list==null){
            list=(String[]) comeList.toArray();

        }
        for (int i = 0;i<comeList.size();i++){
            if (list[i]!=comeList.get(i)){
                return comeList.get(i);
            }
        }
        return null;
    }
}
