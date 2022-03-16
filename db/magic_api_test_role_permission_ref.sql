create table role_permission_ref
(
    id            bigint auto_increment
        primary key,
    role_id       bigint null,
    permission_id bigint null,
    constraint role_permission_ref_role_id_permission_id_uindex
        unique (role_id, permission_id)
);

INSERT INTO `magic-api-test`.role_permission_ref (role_id, permission_id) VALUES (1, 3);
INSERT INTO `magic-api-test`.role_permission_ref (role_id, permission_id) VALUES (1, 6);
INSERT INTO `magic-api-test`.role_permission_ref (role_id, permission_id) VALUES (1, 12);
INSERT INTO `magic-api-test`.role_permission_ref (role_id, permission_id) VALUES (1, 17);
INSERT INTO `magic-api-test`.role_permission_ref (role_id, permission_id) VALUES (3, 1);
INSERT INTO `magic-api-test`.role_permission_ref (role_id, permission_id) VALUES (3, 2);
INSERT INTO `magic-api-test`.role_permission_ref (role_id, permission_id) VALUES (3, 3);
INSERT INTO `magic-api-test`.role_permission_ref (role_id, permission_id) VALUES (3, 4);
INSERT INTO `magic-api-test`.role_permission_ref (role_id, permission_id) VALUES (3, 5);
INSERT INTO `magic-api-test`.role_permission_ref (role_id, permission_id) VALUES (3, 6);
INSERT INTO `magic-api-test`.role_permission_ref (role_id, permission_id) VALUES (3, 7);
INSERT INTO `magic-api-test`.role_permission_ref (role_id, permission_id) VALUES (3, 8);
INSERT INTO `magic-api-test`.role_permission_ref (role_id, permission_id) VALUES (3, 10);
INSERT INTO `magic-api-test`.role_permission_ref (role_id, permission_id) VALUES (3, 11);
INSERT INTO `magic-api-test`.role_permission_ref (role_id, permission_id) VALUES (3, 12);
INSERT INTO `magic-api-test`.role_permission_ref (role_id, permission_id) VALUES (3, 13);
INSERT INTO `magic-api-test`.role_permission_ref (role_id, permission_id) VALUES (3, 14);
INSERT INTO `magic-api-test`.role_permission_ref (role_id, permission_id) VALUES (3, 15);
INSERT INTO `magic-api-test`.role_permission_ref (role_id, permission_id) VALUES (3, 16);
INSERT INTO `magic-api-test`.role_permission_ref (role_id, permission_id) VALUES (3, 17);
INSERT INTO `magic-api-test`.role_permission_ref (role_id, permission_id) VALUES (3, 18);
INSERT INTO `magic-api-test`.role_permission_ref (role_id, permission_id) VALUES (3, 19);
