package com.mini.service.impl;

import com.mini.entity.Swiper;
import com.mini.mapper.SwiperMapper;
import com.mini.service.SwiperService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class SwiperServiceImpl implements SwiperService {

    @Autowired
    private SwiperMapper swiperMapper;

    public List<Swiper> getAllSwiper() {
        List<Swiper> swipers = swiperMapper.getAll();
        return swipers;
    }
}
