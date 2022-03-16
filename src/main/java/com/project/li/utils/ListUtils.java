package com.project.li.utils;

import java.util.List;

public class ListUtils {

    public static  <T> boolean anyList(List<T> list){
        return list != null && list.size() > 0;
    }

}
