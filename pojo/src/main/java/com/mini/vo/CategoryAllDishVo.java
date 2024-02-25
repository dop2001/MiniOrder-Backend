package com.mini.vo;

import com.mini.entity.Dish;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDateTime;
import java.util.List;

/**
 * 微信小程序端点餐页面展示
 */
@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class CategoryAllDishVo {

    private Long id;

    // 微信端左右滑动联动所需
    private String ids;

    //类型: 1菜品分类 2套餐分类
    private Integer type;

    //分类名称
    private String name;

    //顺序
    private Integer sort;

    //分类状态 0标识禁用 1表示启用
    private Integer status;

    //创建时间
    private LocalDateTime createTime;

    //更新时间
    private LocalDateTime updateTime;

    //创建人
    private Long createUser;

    //修改人
    private Long updateUser;

    // 分类下的菜品列表
    List<DishVo> category;

}
