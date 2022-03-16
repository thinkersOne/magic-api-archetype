create table user
(
    id               bigint auto_increment
        primary key,
    name             varchar(10) not null,
    password         varchar(20) null,
    password_encrypt varchar(50) null,
    phone            varchar(20) null,
    token            varchar(50) null,
    constraint user_name_uindex
        unique (name)
);

INSERT INTO `magic-api-test`.user (name, password, password_encrypt, phone, token) VALUES ('张三', '123456', 'e10adc3949ba59abbe56e057f20f883e', '13222222222', '7c4537a5-b886-4fa0-9d2b-867c83151cc0');
INSERT INTO `magic-api-test`.user (name, password, password_encrypt, phone, token) VALUES ('王五', '123456', 'e10adc3949ba59abbe56e057f20f883e', '13222222222', null);
INSERT INTO `magic-api-test`.user (name, password, password_encrypt, phone, token) VALUES ('admin', '123456', 'e10adc3949ba59abbe56e057f20f883e', null, 'a8342a8d-f0dd-4797-b605-5d18d8cf5eca');
INSERT INTO `magic-api-test`.user (name, password, password_encrypt, phone, token) VALUES ('李四', '123456', 'e10adc3949ba59abbe56e057f20f883e', null, null);
