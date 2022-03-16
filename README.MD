环境： 本地数据库、redis
注意数据库及redis的账号密码、库名等是否存在

执行db目录下的sql脚本

基于maven骨架生成新项目步骤：
1，引入依赖：
    <plugin>
    <groupId>org.apache.maven.plugins</groupId>
    <artifactId>maven-archetype-plugin</artifactId>
    <version>3.2.1</version>
    </plugin>

2，在项目下执行命令： mvn archetype: create-from-project
注：如果遇到错误：Invoker process ended with result different than 0!
确保是否是在当前项目目录下执行命令；将maven中的settings.xml拷贝到仓库目录下

3，在target/generated-sources/archetype 目录下查看pom.xml中找到已生成的骨架名：demo2-archetype
    执行mvn install

4，在target/generated-sources/archetype目录下执行命令：
    mvn archetype:generate
    -DgroupId=com.project.li  
    -DartifactId=demo3
    -Dversion=1.0.0-SNAPSHOT
    -Dpackage=com.project.li  
    -DarchetypeGroupId=com.example.magic  
    -DarchetypeArtifactId= demo2-archetype
    -DarchetypeVersion=0.0.1-SNAPSHOT  -B
    -DarchetypeCatalog=local  
    -DinteractiveMode=false
    或 在testGenerate.java中配置执行Java程序生成新项目
    








