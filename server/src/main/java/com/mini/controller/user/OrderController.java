package com.mini.controller.user;

import com.mini.dto.OrderDTO;
import com.mini.result.Result;
import com.mini.service.OrderService;
import com.mini.vo.OrderVo;
import io.swagger.annotations.Api;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@Slf4j
@RequestMapping("/user/order")
@Api("订单相关接口")
public class OrderController {

    @Autowired
    private OrderService orderService;

    @PostMapping("/save")
    public Result saveOrder(@RequestBody OrderDTO orderDTO){
        orderService.saveOrder(orderDTO);
        return Result.success();
    }

    @PostMapping("/getOrders")
    public Result getOrders(@RequestParam String openid){
        List<OrderVo> orderVos = orderService.getOrders(openid);
        return Result.success(orderVos);
    }

}
