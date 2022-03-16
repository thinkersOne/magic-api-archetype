create table permission
(
    id   bigint auto_increment
        primary key,
    type tinyint     null,
    name varchar(10) not null,
    constraint permission_name_type_uindex
        unique (name, type)
);

INSERT INTO `magic-api-test`.permission (type, name) VALUES (0, 'DELETE');
INSERT INTO `magic-api-test`.permission (type, name) VALUES (1, 'DELETE');
INSERT INTO `magic-api-test`.permission (type, name) VALUES (2, 'DELETE');
INSERT INTO `magic-api-test`.permission (type, name) VALUES (0, 'DOWNLOAD');
INSERT INTO `magic-api-test`.permission (type, name) VALUES (0, 'LOCK');
INSERT INTO `magic-api-test`.permission (type, name) VALUES (1, 'LOCK');
INSERT INTO `magic-api-test`.permission (type, name) VALUES (2, 'LOCK');
INSERT INTO `magic-api-test`.permission (type, name) VALUES (0, 'PUSH');
INSERT INTO `magic-api-test`.permission (type, name) VALUES (0, 'SAVE');
INSERT INTO `magic-api-test`.permission (type, name) VALUES (1, 'SAVE');
INSERT INTO `magic-api-test`.permission (type, name) VALUES (2, 'SAVE');
INSERT INTO `magic-api-test`.permission (type, name) VALUES (0, 'UNLOCK');
INSERT INTO `magic-api-test`.permission (type, name) VALUES (1, 'UNLOCK');
INSERT INTO `magic-api-test`.permission (type, name) VALUES (2, 'UNLOCK');
INSERT INTO `magic-api-test`.permission (type, name) VALUES (0, 'UPLOAD');
INSERT INTO `magic-api-test`.permission (type, name) VALUES (0, 'VIEW');
INSERT INTO `magic-api-test`.permission (type, name) VALUES (1, 'VIEW');
INSERT INTO `magic-api-test`.permission (type, name) VALUES (2, 'VIEW');
