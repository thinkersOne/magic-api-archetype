{
  "properties" : { },
  "id" : "fc20f0aeee194ecbb3ebc5202c5bac8a",
  "script" : null,
  "groupId" : "206b54ca92d249e8996491a84b7dae26",
  "name" : "指定角色赋予权限",
  "createTime" : null,
  "updateTime" : 1647430406907,
  "lock" : null,
  "createBy" : null,
  "updateBy" : "admin",
  "path" : "rolePermissions",
  "method" : "POST",
  "parameters" : [ ],
  "options" : [ ],
  "requestBody" : "{\n    \"roleName\": \"测试\",\n    \"permissionName\": \"VIEW\",\n    \"type\": 2\n}",
  "headers" : [ ],
  "paths" : [ ],
  "responseBody" : "{\n    \"code\": 1,\n    \"message\": \"success\",\n    \"data\": \"OK\",\n    \"timestamp\": 1647430399250,\n    \"executeTime\": 70\n}",
  "description" : "--------超级管理员\n{\n    \"roleName\": \"超级管理员\",\n    \"permissionName\": \"SAVE,DELETE,VIEW,LOCK,UNLOCK,DOWNLOAD,UPLOAD,PUSH\",\n    \"type\": 0\n}\n{\n    \"roleName\": \"超级管理员\",\n    \"permissionName\": \"SAVE,DELETE,VIEW,LOCK,UNLOCK\",\n    \"type\": 1\n}\n{\n    \"roleName\": \"超级管理员\",\n    \"permissionName\": \"SAVE,DELETE,VIEW,LOCK,UNLOCK\",\n    \"type\": 2\n}\n---------测试\n{\n    \"roleName\": \"测试\",\n    \"permissionName\": \"VIEW,DOWNLOAD\",\n    \"type\": 0\n}\n{\n    \"roleName\": \"测试\",\n    \"permissionName\": \"VIEW\",\n    \"type\": 1\n}\n{\n    \"roleName\": \"测试\",\n    \"permissionName\": \"VIEW\",\n    \"type\": 2\n}\n\n\n\n\n\n",
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
    }, {
      "name" : "permissionName",
      "value" : "VIEW",
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
      "name" : "type",
      "value" : "2",
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
      "value" : "1647430399250",
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
      "value" : "70",
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

if(StringUtils.isEmpty(body.roleName)){
    exit 10001, "角色不能为空!";
}
var list = StringUtils.converList(body.permissionName);
if(list.isEmpty()){
    exit 10002, "资源权限不能为空!";
}

//查询角色
 var role = db.table('role')
        .where()
        .eq('name',body.roleName)
        .selectOne();

//查询权限
 var permissionList = db.select('select * from permission where name in(#{list}) and type = #{body.type}'); 

if(role == null || permissionList.isEmpty()){
    exit 10002, "角色或者资源权限不存在!";
}

permissionList.forEach(v=>{
    db.table('role_permission_ref').insert({ role_id : role.id,permission_id: v.id});
});
return "OK";