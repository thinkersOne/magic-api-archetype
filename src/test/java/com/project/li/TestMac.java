package com.project.li;

import java.io.IOException;

public class TestMac {
    public static void main(String[] args) throws IOException {
        Process process = Runtime.getRuntime()
                .exec("/usr/bin/touch /Users/lizhihao/Desktop/a.md");

    }


}
