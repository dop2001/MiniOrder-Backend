package com.mini.controller.user;

import com.mini.constant.JwtClaimsConstant;
import com.mini.dto.UserLoginDTO;
import com.mini.entity.User;
import com.mini.properties.JwtProperties;
import com.mini.result.Result;
import com.mini.service.UserService;
import com.mini.utils.JwtUtil;
import com.mini.vo.UserLoginVo;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;

@RestController
@Slf4j
@RequestMapping("/user/user")
@Api("用户登录相关接口")
public class UserController {

    @Autowired
    private UserService userService;
    @Autowired
    private JwtProperties jwtProperties;

    @PostMapping("/login")
    @ApiOperation("微信用户登录")
    public Result<UserLoginVo> login(@RequestBody UserLoginDTO userLoginDTO) {
        // 查询用户信息
        User user = userService.wxLogin(userLoginDTO);

        // 为微信用户生成jwt令牌
        HashMap<String, Object> claims = new HashMap<>();
        claims.put(JwtClaimsConstant.USER_ID, user.getId());
        String token = JwtUtil.createJWT(jwtProperties.getUserSecretKey(), jwtProperties.getUserTtl(), claims);

        UserLoginVo userLoginVo = UserLoginVo.builder()
                .id(user.getId())
                .openid(user.getOpenid())
                .token(token)
                .build();

        return Result.success(userLoginVo);
    }

}
