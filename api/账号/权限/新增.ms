{
  "properties" : { },
  "id" : "cbc21417d9a441ecafa0c18d8a7f9e15",
  "script" : null,
  "groupId" : "988c79e7a9c646c7bd85ef5806d36225",
  "name" : "新增",
  "createTime" : null,
  "updateTime" : 1647427576496,
  "lock" : null,
  "createBy" : null,
  "updateBy" : "admin",
  "path" : "add",
  "method" : "POST",
  "parameters" : [ ],
  "options" : [ ],
  "requestBody" : "{\n    \"name\": \"SAVE,DELETE,VIEW,LOCK,UNLOCK\",\n    \"type\": 2\n}\n",
  "headers" : [ ],
  "paths" : [ ],
  "responseBody" : "{\n    \"code\": 1,\n    \"message\": \"success\",\n    \"data\": \"OK\",\n    \"timestamp\": 1647425029331,\n    \"executeTime\": 70\n}",
  "description" : "----- 0:按钮\t\n// Authorization.SAVE 保存\n// Authorization.DELETE 删除\n// Authorization.VIEW 查询\t\n// Authorization.LOCK 锁定\n// Authorization.UNLOCK 解锁\t\t\n// Authorization.DOWNLOAD 导出\t\t\n// Authorization.UPLOAD 上传\n// Authorization.PUSH 推送\n\n----- 1:接口\n// Authorization.SAVE 保存\n// Authorization.DELETE 删除\n// Authorization.VIEW 查询\n// Authorization.LOCK 锁定\n// Authorization.UNLOCK 解锁\n\n----- 2:分组\n// Authorization.SAVE 保存\n// Authorization.DELETE 删除\n// Authorization.VIEW 查询\n// Authorization.LOCK 锁定\n// Authorization.UNLOCK 解锁\n\n{\n     \"name\": \"SAVE,DELETE,VIEW,LOCK,UNLOCK,DOWNLOAD,UPLOAD,PUSH\",\n     \"type\": 0\n}\n{\n    \"name\": \"SAVE,DELETE,VIEW,LOCK,UNLOCK\",\n    \"type\": 1\n}\n{\n    \"name\": \"SAVE,DELETE,VIEW,LOCK,UNLOCK\",\n    \"type\": 2\n}\n\n\n\n\n\n\n",
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
      "name" : "name",
      "value" : "SAVE,DELETE,VIEW,LOCK,UNLOCK",
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
      "dataType" : "String",
      "type" : null,
      "defaultValue" : null,
      "validateType" : "",
      "error" : "",
      "expression" : "",
      "children" : [ ]
    }, {
      "name" : "timestamp",
      "value" : "1647425029331",
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

var list = StringUtils.converList(body.name);
if(list.isEmpty()){
    exit 10001, "名称不能为空!";
}
list.forEach(v=>{
    db.table('permission').insert({ name : v,type: body.type});
});
return "OK";