package com.mini.mapper;

import com.mini.entity.Swiper;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import java.util.List;

@Mapper
public interface SwiperMapper {

    @Select("select * from swiper")
    List<Swiper> getAll();

}
