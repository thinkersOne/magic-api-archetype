package com.project.li.configuration;

import com.project.li.login.dao.LoginDao;
import com.project.li.login.entity.UserEntity;
import com.project.li.utils.ListUtils;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.ssssssss.magicapi.core.context.MagicUser;
import org.ssssssss.magicapi.core.exception.MagicLoginException;
import org.ssssssss.magicapi.core.interceptor.Authorization;
import org.ssssssss.magicapi.core.interceptor.AuthorizationInterceptor;
import org.ssssssss.magicapi.core.model.Group;
import org.ssssssss.magicapi.core.model.MagicEntity;

import javax.servlet.http.HttpServletRequest;
import java.util.List;
import java.util.Objects;
import java.util.UUID;

/**
 * 自定义用户名密码登录
 */
@Component  //注入到Spring容器中
public class CustomAuthorizationInterceptor implements AuthorizationInterceptor {
    @Autowired
    private LoginDao loginDao;

    /**
     * 配置是否需要登录
     */
    @Override
    public boolean requireLogin() {
        return true;
    }

    /**
     * 根据Token获取User
     * @return
     */
    @Override
    public MagicUser getUserByToken(String token) throws MagicLoginException {
        if("unauthorization".equals(token) || StringUtils.isEmpty(token)){
            throw new MagicLoginException("token无效");
        }
        UserEntity userEntity = loginDao.getUserByToken(token);
        if (Objects.isNull(userEntity)) {
            throw new MagicLoginException("token无效");
        }
        return new MagicUser(userEntity.getId()+"",
                userEntity.getName(),userEntity.getPassword());
    }

    @Override
    public MagicUser login(String username, String password) throws MagicLoginException {
        UserEntity userEntity = loginDao.getUserEntityByName(username, password);
        if(!Objects.isNull(userEntity)){
            String token = UUID.randomUUID().toString();
            loginDao.updateToken(username,token);
            // 登录成功后 构造MagicUser对象。
            return new MagicUser(userEntity.getId()+"",
                    userEntity.getName(),token);
        }
        throw new MagicLoginException("用户名或密码不正确");
    }

    /**
     * 是否拥有页面按钮的权限
     */
    @Override
    public boolean allowVisit(MagicUser magicUser, HttpServletRequest request, Authorization authorization) {
        //查询该用户拥有的所有权限
        List<String> permissionNames = loginDao.getPermissionNames(magicUser.getUsername(), 0);
        if(!ListUtils.anyList(permissionNames)){
            return false;
        }
        return permissionNames.contains(authorization.name());
    }

}
