package com.mini.mapper;

import com.mini.entity.Dish;
import com.mini.vo.DishVo;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import java.util.List;

@Mapper
public interface DishMapper {

    @Select("select id, description, name as fname, price as fprice, image as img from dish where category_id = #{categoryId}")
    List<DishVo> getByCategoryId(Long categoryId);

}
