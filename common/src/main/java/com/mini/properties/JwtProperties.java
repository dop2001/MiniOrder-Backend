package com.mini.properties;

import lombok.Data;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.stereotype.Component;

@Component
@ConfigurationProperties(prefix = "mini.jwt")
@Data
public class JwtProperties {

    /**
     * 微信小程序用户生成jwt令牌相关属性
     */
    private String userSecretKey;
    private long userTtl;
    private String userTokenName;

}
