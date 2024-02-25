package com.mini.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.beans.factory.annotation.Value;

import java.math.BigDecimal;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class DishVo {

    private Long id;

    //菜品名称
    private String fname;

    //菜品价格
    private BigDecimal fprice;

    //图片
    private String img;

    //描述信息
    private String description;

    // 菜品已售数量
    private Long num;

}
