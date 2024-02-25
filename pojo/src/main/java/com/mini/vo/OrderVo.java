package com.mini.vo;

import com.mini.entity.OrderDetail;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.util.List;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class OrderVo {

    private Long id;
    // 订单号
    private String number;
    // 实际收取金额
    private BigDecimal amount;
    //结账时间
    private LocalDateTime checkoutTime;
    // 菜品列表
    private List<OrderDetail> orderDetails;
}
