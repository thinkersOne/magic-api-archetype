create table role
(
    id   bigint auto_increment
        primary key,
    name varchar(10) not null,
    constraint role_name_uindex
        unique (name)
);

INSERT INTO `magic-api-test`.role (name) VALUES ('开发');
INSERT INTO `magic-api-test`.role (name) VALUES ('测试');
INSERT INTO `magic-api-test`.role (name) VALUES ('超级管理员');
