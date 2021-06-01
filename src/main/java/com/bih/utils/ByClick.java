package com.bih.utils;


import java.util.ArrayList;
import java.util.List;

/**
 * @author HomieJ
 */
public class ByClick {
    private static List<String> oldList = new ArrayList<String>();
    public ByClick(){
        for (int i =0;i<7;i++){
            oldList.add("0");
        }
    }
    public String witchByClick(List<String> list){
        System.out.println(oldList);
        for (int a=0;a<oldList.size();a++){
            if (!(oldList.get(a).equals(list.get(a)))){
                oldList.set(a,list.get(a));
                return oldList.get(a);
            }
        }
        return "faith";
    }
}
