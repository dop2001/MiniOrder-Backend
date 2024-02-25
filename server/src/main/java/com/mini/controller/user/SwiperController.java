package com.mini.controller.user;

import com.mini.entity.Swiper;
import com.mini.result.Result;
import com.mini.service.SwiperService;
import io.swagger.annotations.Api;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@Slf4j
@Api("轮播图相关接口")
@RequestMapping("/user/swiper")
public class SwiperController {

    @Autowired
    private SwiperService swiperService;

    @GetMapping("/all")
    public Result getAllSwiper() {
        List<Swiper> allSwiper = swiperService.getAllSwiper();
        return Result.success(allSwiper);
    }

}
