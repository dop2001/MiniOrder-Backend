package com.mini.service;

import com.mini.dto.OrderDTO;
import com.mini.vo.OrderVo;

import java.util.List;

public interface OrderService {

    void saveOrder(OrderDTO orderDTO);

    List<OrderVo> getOrders(String openid);
}
