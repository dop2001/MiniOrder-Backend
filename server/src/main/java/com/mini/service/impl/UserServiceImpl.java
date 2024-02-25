package com.mini.service.impl;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.mini.constant.MessageConstant;
import com.mini.dto.UserLoginDTO;
import com.mini.entity.User;
import com.mini.exception.LoginFailedException;
import com.mini.mapper.UserMapper;
import com.mini.properties.WeChatProperties;
import com.mini.service.UserService;
import com.mini.utils.HttpClientUtil;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;
import java.util.HashMap;
import java.util.Map;

@Service
@Slf4j
public class UserServiceImpl implements UserService {

    public static final String WX_LOGIN = "https://api.weixin.qq.com/sns/jscode2session";

    @Autowired
    private WeChatProperties weChatProperties;

    @Autowired
    private UserMapper userMapper;

    public User wxLogin(UserLoginDTO userLoginDTO) {
        // 请求微信服务器，获取当前微信用户的唯一标识符openid
        String openid = getOpenid(userLoginDTO.getCode());

        // 判断openid是否为空，为空则表示登录失败，抛出业务异常
        if (openid == null){
            throw new LoginFailedException(MessageConstant.LOGIN_FAILED);
        }

        // 判断是否为新用户，若是则需要在数据库中插入用户数据
        User user = userMapper.getByOpenid(openid);
        if (user == null) {
            user = User.builder()
                    .openid(openid)
                    .createTime(LocalDateTime.now())
                    .build();
            userMapper.insert(user);
        }
        return user;
    }

    private String getOpenid(String code) {
        // https://developers.weixin.qq.com/miniprogram/dev/OpenApiDoc/user-login/code2Session.html

        Map<String, String> map = new HashMap<>();
        map.put("appid", weChatProperties.getAppid());
        map.put("secret", weChatProperties.getSecret());
        map.put("js_code", code);
        map.put("grant_type", "authorization_code");
        String json = HttpClientUtil.doGet(WX_LOGIN, map);

        JSONObject jsonObject = JSON.parseObject(json);
        String openid = jsonObject.getString("openid");
        return openid;
    }
}
