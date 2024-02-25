package com.mini.entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDateTime;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class Swiper {

    private Long id;
    // 轮播图地址
    private String image;
    // 创建时间
    private LocalDateTime createTime;

}
