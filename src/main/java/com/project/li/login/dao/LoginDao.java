package com.project.li.login.dao;

import com.project.li.login.entity.PermissionEntity;
import com.project.li.login.entity.UserEntity;
import com.project.li.utils.ListUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@Repository
public class LoginDao {
    @Autowired
    private JdbcTemplate jdbcTemplate;

    public UserEntity getUserEntityByName(String name,String password){
        List<Object> params = new ArrayList<>();
        params.add(name);
        params.add(password);
        List<UserEntity> userEntities = jdbcTemplate.query(
                "select * from user where name = ? and password = ?",
                new RowMapper<UserEntity>() {
                    @Override
                    public UserEntity mapRow(ResultSet rs, int rowNum) throws SQLException {
                        return getUserEntity(rs);
                    }
                }, params.toArray());
        return ListUtils.anyList(userEntities) ? userEntities.get(0) : null;
    }

    public void updateToken(String name,String token){
        jdbcTemplate.update("update user set token = ? where name = ?",token,name);
    }

    public UserEntity getUserByToken(String token){
        return jdbcTemplate.queryForObject("select * from user where token = ?",
                new RowMapper<UserEntity>() {
                    @Override
                    public UserEntity mapRow(ResultSet rs, int rowNum) throws SQLException {
                        return getUserEntity(rs);
                    }
                },token);
    }


    private UserEntity getUserEntity(ResultSet rs) throws SQLException {
        UserEntity userEntity = new UserEntity();
        userEntity.setId(rs.getLong("id"));
        userEntity.setName(rs.getString("name"));
        userEntity.setPassword(rs.getString("password"));
        return userEntity;
    }
    private PermissionEntity getPermissionEntity(ResultSet rs) throws SQLException {
        PermissionEntity permissionEntity = new PermissionEntity();
        permissionEntity.setId(rs.getLong("id"));
        permissionEntity.setName(rs.getString("name"));
        permissionEntity.setType(rs.getInt("type"));
        return permissionEntity;
    }

    public List<String> getPermissionNames(String userName,int type){
        return jdbcTemplate.query(
                "select p.name name from permission p join role_permission_ref rpr on p.id = rpr.permission_id\n" +
                        "join role r on rpr.role_id = r.id join user_role_ref urr on r.id = urr.role_id\n" +
                        "join user u on urr.user_id = u.id where u.name = ? and p.type = ?",
                new RowMapper<String>() {
                    @Override
                    public String mapRow(ResultSet rs, int rowNum) throws SQLException {
                        return rs.getString("name");
                    }
                }, userName, type);
    }


}
