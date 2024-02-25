package com.mini.dto;

import com.mini.entity.OrderDetail;
import lombok.Data;

import java.math.BigDecimal;
import java.util.List;

@Data
public class OrderDTO {
    // 用户唯一标识符
    private String openid;
    // 实际收取金额
    private BigDecimal amount;
    // 菜品列表
    private List<OrderDetail> orderDetails;
}
