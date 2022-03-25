create table user_role_ref
(
    id      bigint auto_increment
        primary key,
    user_id bigint null,
    role_id bigint null,
    constraint user_role_ref_user_id_role_id_uindex
        unique (user_id, role_id)
);

INSERT INTO `magic-api-test`.user_role_ref (user_id, role_id) VALUES (4, 1);
INSERT INTO `magic-api-test`.user_role_ref (user_id, role_id) VALUES (3, 3);
