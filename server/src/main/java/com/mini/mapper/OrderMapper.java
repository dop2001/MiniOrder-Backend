package com.mini.mapper;

import com.mini.entity.Orders;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import java.util.List;

@Mapper
public interface OrderMapper {

    void save(Orders orders);

    @Select("select * from orders where user_id = #{userId}")
    List<Orders> getByUserId(Long userId);

}
