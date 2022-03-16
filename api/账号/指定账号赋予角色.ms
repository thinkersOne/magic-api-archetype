{
  "properties" : { },
  "id" : "880e47628fd546d9a291aa3a1c12b8a5",
  "script" : null,
  "groupId" : "206b54ca92d249e8996491a84b7dae26",
  "name" : "指定账号赋予角色",
  "createTime" : null,
  "updateTime" : 1647430424487,
  "lock" : null,
  "createBy" : null,
  "updateBy" : "admin",
  "path" : "userRoles",
  "method" : "POST",
  "parameters" : [ ],
  "options" : [ ],
  "requestBody" : "{\n    \"userName\": \"张三\",\n    \"roleName\": \"测试\"\n}",
  "headers" : [ ],
  "paths" : [ ],
  "responseBody" : "{\n    \"code\": 1,\n    \"message\": \"success\",\n    \"data\": \"OK\",\n    \"timestamp\": 1647427151276,\n    \"executeTime\": 13424\n}",
  "description" : null,
  "requestBodyDefinition" : {
    "name" : "",
    "value" : "",
    "description" : "",
    "required" : false,
    "dataType" : "Object",
    "type" : null,
    "defaultValue" : null,
    "validateType" : "",
    "error" : "",
    "expression" : "",
    "children" : [ {
      "name" : "userName",
      "value" : "张三",
      "description" : "",
      "required" : false,
      "dataType" : "String",
      "type" : null,
      "defaultValue" : null,
      "validateType" : "",
      "error" : "",
      "expression" : "",
      "children" : [ ]
    }, {
      "name" : "roleName",
      "value" : "测试",
      "description" : "",
      "required" : false,
      "dataType" : "String",
      "type" : null,
      "defaultValue" : null,
      "validateType" : "",
      "error" : "",
      "expression" : "",
      "children" : [ ]
    } ]
  },
  "responseBodyDefinition" : {
    "name" : "",
    "value" : "",
    "description" : "",
    "required" : false,
    "dataType" : "Object",
    "type" : null,
    "defaultValue" : null,
    "validateType" : "",
    "error" : "",
    "expression" : "",
    "children" : [ {
      "name" : "code",
      "value" : "1",
      "description" : "",
      "required" : false,
      "dataType" : "Integer",
      "type" : null,
      "defaultValue" : null,
      "validateType" : "",
      "error" : "",
      "expression" : "",
      "children" : [ ]
    }, {
      "name" : "message",
      "value" : "success",
      "description" : "",
      "required" : false,
      "dataType" : "String",
      "type" : null,
      "defaultValue" : null,
      "validateType" : "",
      "error" : "",
      "expression" : "",
      "children" : [ ]
    }, {
      "name" : "data",
      "value" : "OK",
      "description" : "",
      "required" : false,
      "dataType" : "Object",
      "type" : null,
      "defaultValue" : null,
      "validateType" : "",
      "error" : "",
      "expression" : "",
      "children" : [ ]
    }, {
      "name" : "timestamp",
      "value" : "1647427151276",
      "description" : "",
      "required" : false,
      "dataType" : "Long",
      "type" : null,
      "defaultValue" : null,
      "validateType" : "",
      "error" : "",
      "expression" : "",
      "children" : [ ]
    }, {
      "name" : "executeTime",
      "value" : "13424",
      "description" : "",
      "required" : false,
      "dataType" : "Integer",
      "type" : null,
      "defaultValue" : null,
      "validateType" : "",
      "error" : "",
      "expression" : "",
      "children" : [ ]
    } ]
  }
}
================================
import com.project.li.utils.StringUtils;

if(StringUtils.isEmpty(body.userName)){
    exit 10001, "用户名不能为空!";
}
var list = StringUtils.converList(body.roleName);
if(list.isEmpty()){
    //不传默认为超级管理员
    body.roleName = "超级管理员";
}

//查询用户
 var user = db.table('user')
        .where()
        .eq('name',body.userName)
        .selectOne();

//查询角色
 var roleList = db.select('select * from role where name in(#{list})'); 

if(user == null || roleList.isEmpty()){
    exit 10002, "账号或者角色不存在!";
}

roleList.forEach(v=>{
    db.table('user_role_ref').insert({ user_id : user.id,role_id: v.id});
});
return "OK";