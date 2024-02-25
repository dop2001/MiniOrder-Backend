package com.mini.service.impl;

import com.mini.entity.Category;
import com.mini.mapper.CategoryMapper;
import com.mini.mapper.DishMapper;
import com.mini.service.DishService;
import com.mini.vo.CategoryAllDishVo;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service

public class DishServiceImpl implements DishService {

    @Autowired
    private CategoryMapper categoryMapper;
    @Autowired
    private DishMapper dishMapper;

    public List<CategoryAllDishVo> getAllDish() {

        List<CategoryAllDishVo> categoryAllDishVos = new ArrayList<>();

        // 获取全部的category列表
        List<Category> categories = categoryMapper.getAll();

        // 获取每个分类下的全部菜品
        categories.forEach(item -> {
            CategoryAllDishVo categoryAllDishVo = new CategoryAllDishVo();
            BeanUtils.copyProperties(item, categoryAllDishVo);
            categoryAllDishVo.setIds("id" + item.getId());
            categoryAllDishVo.setCategory(dishMapper.getByCategoryId(item.getId()));
            categoryAllDishVos.add(categoryAllDishVo);
        });

        return categoryAllDishVos;
    }
}
