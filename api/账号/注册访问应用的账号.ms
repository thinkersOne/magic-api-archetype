{
  "properties" : { },
  "id" : "347a67de99504694a5e889f68aef170b",
  "script" : null,
  "groupId" : "206b54ca92d249e8996491a84b7dae26",
  "name" : "注册访问应用的账号",
  "createTime" : null,
  "updateTime" : 1647430130823,
  "lock" : null,
  "createBy" : null,
  "updateBy" : "admin",
  "path" : "register",
  "method" : "POST",
  "parameters" : [ ],
  "options" : [ ],
  "requestBody" : "{\n    \"name\": \"李四\",\n    \"password\": \"123456\"\n}",
  "headers" : [ ],
  "paths" : [ ],
  "responseBody" : null,
  "description" : "// Authorization.SAVE 保存\n// Authorization.DELETE 删除\n// Authorization.VIEW 查询\n// Authorization.LOCK 锁定\n// Authorization.UNLOCK 解锁\n// Authorization.DOWNLOAD 导出\n// Authorization.UPLOAD 上传\n// Authorization.PUSH 推送",
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
      "value" : "李四",
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
      "name" : "password",
      "value" : "123456",
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
  "responseBodyDefinition" : null
}
================================
import org.springframework.util.DigestUtils;
//使用SpringBoot自带的MD5加密
return db.table('user').insert({ name : body.name, password : body.password,
password_encrypt : DigestUtils.md5DigestAsHex(body.password.getBytes()),phone : body.phone});
return "OK";
