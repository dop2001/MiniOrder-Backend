package com.mini.controller.user;

import com.mini.result.Result;
import com.mini.service.DishService;
import com.mini.vo.CategoryAllDishVo;
import io.swagger.annotations.Api;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@Slf4j
@RequestMapping("/user/dish")
@Api("菜品相关接口")
public class DishController {

    @Autowired
    private DishService dishService;

    @GetMapping("/allDish")
    public Result getAllDish(){
        List<CategoryAllDishVo> allDish = dishService.getAllDish();
        return Result.success(allDish);
    }

}
