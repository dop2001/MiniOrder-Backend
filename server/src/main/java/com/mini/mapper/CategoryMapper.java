package com.mini.mapper;

import com.mini.entity.Category;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import java.util.List;

@Mapper
public interface CategoryMapper {

    @Select("select * from category order by sort asc")
    List<Category> getAll();

}
