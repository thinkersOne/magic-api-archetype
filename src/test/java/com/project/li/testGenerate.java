package com.project.li;

import java.io.File;
import java.io.IOException;

public class testGenerate {

    public static void main(String[] args) throws IOException {
        String groupId = "com.project.li";
        String artifactId = "demo4";
        String version = "1.0.0-SNAPSHOT";
        String packaged = "com.project.li";
        String command = "mvn archetype:generate"
                + " -DgroupId="+ groupId
                + " -DartifactId="+ artifactId
                + " -Dversion="+ version
                + " -Dpackage="+ packaged
                + " -DarchetypeGroupId=com.project.li"
                + " -DarchetypeArtifactId=demo4-archetype"
                + " -DarchetypeVersion=1.0.0-SNAPSHOT"
                + " -B"
                + " -DarchetypeCatalog=local"
                + " -DinteractiveMode=false";
        File file=new File("/Users/lizhihao");
        //#通过模板进行创建项目
        Runtime.getRuntime().exec(command,null,file);
        System.out.println("执行完毕！");
    }

}
