package com.project.li.utils;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

public class StringUtils {

    public static List<String> converList(String str){
        if(org.apache.commons.lang3.StringUtils.isEmpty(str)){
            return new ArrayList<>(1);
        }
        return Arrays.asList(str.split(","));
    }
    public static boolean isEmpty(String str){
        return org.apache.commons.lang3.StringUtils.isEmpty(str);
    }

    public static void main(String[] args) {
        List<String> strings = converList("SAVE,DELETE,VIEW,LOCK,UNLOCK,DOWNLOAD,UPLOAD,PUSH");
        System.out.println(strings);
    }

}
