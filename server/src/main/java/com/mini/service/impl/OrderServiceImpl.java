package com.mini.service.impl;

import com.mini.dto.OrderDTO;
import com.mini.entity.OrderDetail;
import com.mini.entity.Orders;
import com.mini.entity.User;
import com.mini.mapper.OrderDetailMapper;
import com.mini.mapper.OrderMapper;
import com.mini.mapper.UserMapper;
import com.mini.service.OrderService;
import com.mini.vo.OrderVo;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

@Service
public class OrderServiceImpl implements OrderService {

    @Autowired
    private UserMapper userMapper;
    @Autowired
    private OrderMapper orderMapper;
    @Autowired
    private OrderDetailMapper orderDetailMapper;

    /**
     * 保存订单
     * @param orderDTO
     */
    @Transactional
    public void saveOrder(OrderDTO orderDTO) {
        // 获取用户信息
        User user = userMapper.getByOpenid(orderDTO.getOpenid());

        // 生成订单号，并封装订单数据
        String number = UUID.randomUUID().toString().replace("-", "").substring(0, 16);
        Orders orders = Orders.builder()
                .userId(user.getId())
                .amount(orderDTO.getAmount())
                .checkoutTime(LocalDateTime.now())
                .number(number)
                .build();
        // 保存订单数据
        orderMapper.save(orders);

        List<OrderDetail> orderDetails = orderDTO.getOrderDetails();
        orderDetails.forEach(item -> {
            item.setOrderId(orders.getId());
            orderDetailMapper.add(item);
        });

    }

    public List<OrderVo> getOrders(String openid){
        // 获取用户信息
        User user = userMapper.getByOpenid(openid);
        // 根据userid查询订单表
        List<Orders> ordersList = orderMapper.getByUserId(user.getId());
        // 获取订单详细信息
        List<OrderVo> orderVos = new ArrayList<>();
        ordersList.forEach(item -> {
            OrderVo orderVo = new OrderVo();
            BeanUtils.copyProperties(item, orderVo);
            orderVo.setOrderDetails(orderDetailMapper.getByOrderId(item.getId()));
            orderVos.add(orderVo);
        });

        return orderVos;
    }
}
