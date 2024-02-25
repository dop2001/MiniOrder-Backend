/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 50744
 Source Host           : localhost:3306
 Source Schema         : mini_order

 Target Server Type    : MySQL
 Target Server Version : 50744
 File Encoding         : 65001

 Date: 25/02/2024 13:21:11
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `type` int(11) NULL DEFAULT NULL COMMENT '类型   1 菜品分类 2 套餐分类',
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '分类名称',
  `sort` int(11) NOT NULL DEFAULT 0 COMMENT '顺序',
  `status` int(11) NULL DEFAULT NULL COMMENT '分类状态 0:禁用，1:启用',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `create_user` bigint(20) NULL DEFAULT NULL COMMENT '创建人',
  `update_user` bigint(20) NULL DEFAULT NULL COMMENT '修改人',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_category_name`(`name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 31 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '菜品及套餐分类' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES (25, 1, '人气招牌', 1, 1, '2024-02-21 12:54:39', '2024-02-21 12:54:39', 1, 1);
INSERT INTO `category` VALUES (26, 1, '特色时蔬', 2, 1, '2024-02-21 12:54:55', '2024-02-21 12:54:55', 1, 1);
INSERT INTO `category` VALUES (27, 1, '特色小吃', 3, 1, '2024-02-21 12:55:06', '2024-02-21 12:55:06', 1, 1);
INSERT INTO `category` VALUES (28, 1, '主食', 4, 1, '2024-02-21 12:55:18', '2024-02-21 12:55:18', 1, 1);
INSERT INTO `category` VALUES (29, 1, '甜饮品', 5, 1, '2024-02-21 12:55:38', '2024-02-21 12:55:38', 1, 1);
INSERT INTO `category` VALUES (30, 1, '当季限定', 0, 1, '2024-02-21 13:22:24', '2024-02-21 13:23:55', 1, 1);

-- ----------------------------
-- Table structure for dish
-- ----------------------------
DROP TABLE IF EXISTS `dish`;
CREATE TABLE `dish`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '菜品名称',
  `category_id` bigint(20) NOT NULL COMMENT '菜品分类id',
  `price` decimal(10, 2) NULL DEFAULT NULL COMMENT '菜品价格',
  `image` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '图片',
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '描述信息',
  `status` int(11) NULL DEFAULT 1 COMMENT '0 停售 1 起售',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `create_user` bigint(20) NULL DEFAULT NULL COMMENT '创建人',
  `update_user` bigint(20) NULL DEFAULT NULL COMMENT '修改人',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_dish_name`(`name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 116 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '菜品' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of dish
-- ----------------------------
INSERT INTO `dish` VALUES (91, '红烧碎碎鸡', 30, 39.00, 'http://localhost:8080/images/dish/1_1.png', '入口及化', 0, '2024-02-21 13:26:19', '2024-02-21 13:26:19', 1, 1);
INSERT INTO `dish` VALUES (92, '家乡白菜梗', 30, 26.00, 'http://localhost:8080/images/dish/1_2.png', '微辣', 0, '2024-02-21 13:27:01', '2024-02-21 13:27:01', 1, 1);
INSERT INTO `dish` VALUES (93, '爆辣鲜虾捞粉', 30, 66.00, 'http://localhost:8080/images/dish/1_3.png', '爆辣', 0, '2024-02-21 13:27:50', '2024-02-21 13:27:50', 1, 1);
INSERT INTO `dish` VALUES (94, '石锅焖芋头', 30, 32.00, 'http://localhost:8080/images/dish/1_4.png', '微辣', 0, '2024-02-21 13:28:18', '2024-02-21 13:28:18', 1, 1);
INSERT INTO `dish` VALUES (96, '椒盐芋条', 26, 22.00, 'http://localhost:8080/images/dish/2_1.png', '脆口', 0, '2024-02-21 13:30:19', '2024-02-21 13:30:19', 1, 1);
INSERT INTO `dish` VALUES (97, '清炒时蔬', 26, 19.00, 'http://localhost:8080/images/dish/2_2.png', '清淡', 0, '2024-02-21 13:30:55', '2024-02-21 13:30:55', 1, 1);
INSERT INTO `dish` VALUES (98, '蛋黄炸时疏', 26, 22.00, 'http://localhost:8080/images/dish/2_3.png', '酥脆', 0, '2024-02-21 13:31:33', '2024-02-21 13:31:33', 1, 1);
INSERT INTO `dish` VALUES (99, '蔬菜沙拉', 26, 29.00, 'http://localhost:8080/images/dish/2_4.png', '新鲜', 0, '2024-02-21 13:32:01', '2024-02-21 13:32:01', 1, 1);
INSERT INTO `dish` VALUES (100, '糯叽叽', 27, 3.00, 'http://localhost:8080/images/dish/3_1.png', '糯甜', 0, '2024-02-21 13:36:33', '2024-02-21 13:36:33', 1, 1);
INSERT INTO `dish` VALUES (101, '麻辣藕片', 27, 12.00, 'http://localhost:8080/images/dish/3_2.png', '爆辣', 0, '2024-02-21 13:36:54', '2024-02-21 13:36:54', 1, 1);
INSERT INTO `dish` VALUES (102, '香辣肺管', 27, 12.00, 'http://localhost:8080/images/dish/3_3.png', '香辣', 0, '2024-02-21 13:37:14', '2024-02-21 13:37:14', 1, 1);
INSERT INTO `dish` VALUES (103, '蚌壳子肉', 27, 16.00, 'http://localhost:8080/images/dish/3_4.png', '爆辣', 0, '2024-02-21 13:37:38', '2024-02-21 13:37:38', 1, 1);
INSERT INTO `dish` VALUES (104, '小朋友蒸蛋', 28, 12.00, 'http://localhost:8080/images/dish/4_1.png', '好吃', 0, '2024-02-21 13:38:31', '2024-02-21 13:38:31', 1, 1);
INSERT INTO `dish` VALUES (105, '红糖夹心年糕', 28, 14.00, 'http://localhost:8080/images/dish/4_2.png', '香甜', 0, '2024-02-21 13:38:47', '2024-02-21 13:38:47', 1, 1);
INSERT INTO `dish` VALUES (106, '光粉', 28, 4.00, 'http://localhost:8080/images/dish/4_3.png', '筋道', 0, '2024-02-21 13:39:08', '2024-02-21 13:39:08', 1, 1);
INSERT INTO `dish` VALUES (107, '光面', 28, 4.00, 'http://localhost:8080/images/dish/4_4.png', '筋道', 0, '2024-02-21 13:39:27', '2024-02-21 13:39:27', 1, 1);
INSERT INTO `dish` VALUES (108, '鲸裕', 29, 18.00, 'http://localhost:8080/images/dish/5_1.png', '浓郁', 0, '2024-02-21 13:40:22', '2024-02-21 13:40:22', 1, 1);
INSERT INTO `dish` VALUES (109, '茉莉豆花奶茶', 29, 12.00, 'http://localhost:8080/images/dish/5_2.png', '桂花香', 0, '2024-02-21 13:40:52', '2024-02-21 13:40:52', 1, 1);
INSERT INTO `dish` VALUES (110, '手打青柠茶', 29, 10.00, 'http://localhost:8080/images/dish/5_3.png', '酸甜', 0, '2024-02-21 13:41:12', '2024-02-21 13:41:12', 1, 1);
INSERT INTO `dish` VALUES (111, '润田翠', 29, 3.00, 'http://localhost:8080/images/dish/5_4.png', '大自然的味道', 0, '2024-02-21 13:41:39', '2024-02-21 13:41:39', 1, 1);
INSERT INTO `dish` VALUES (112, '劲辣小甲鱼', 25, 49.00, 'http://localhost:8080/images/dish/6_1.png', '爆辣', 0, '2024-02-21 13:45:16', '2024-02-21 13:45:16', 1, 1);
INSERT INTO `dish` VALUES (113, '蟹脚捞粉', 25, 56.00, 'http://localhost:8080/images/dish/6_2.png', '爆辣', 0, '2024-02-21 13:45:57', '2024-02-21 13:45:57', 1, 1);
INSERT INTO `dish` VALUES (114, '蟹脚捞面', 25, 56.00, 'http://localhost:8080/images/dish/6_3.png', '爆辣', 0, '2024-02-21 13:46:22', '2024-02-21 13:46:22', 1, 1);
INSERT INTO `dish` VALUES (115, '嫩豆腐烧牛蛙', 25, 59.00, 'http://localhost:8080/images/dish/6_4.png', '爆辣', 0, '2024-02-21 13:46:40', '2024-02-21 13:46:40', 1, 1);

-- ----------------------------
-- Table structure for order_detail
-- ----------------------------
DROP TABLE IF EXISTS `order_detail`;
CREATE TABLE `order_detail`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '名字',
  `image` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '图片',
  `order_id` bigint(20) NOT NULL COMMENT '订单id',
  `dish_id` bigint(20) NULL DEFAULT NULL COMMENT '菜品id',
  `setmeal_id` bigint(20) NULL DEFAULT NULL COMMENT '套餐id',
  `dish_flavor` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '口味',
  `number` int(11) NOT NULL DEFAULT 1 COMMENT '数量',
  `amount` decimal(10, 2) NOT NULL COMMENT '金额',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 28 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '订单明细表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of order_detail
-- ----------------------------
INSERT INTO `order_detail` VALUES (5, '红烧碎碎鸡', 'https://web-dop.oss-cn-beijing.aliyuncs.com/5109ce77-cb95-46b3-9363-fa39e6ddb76d.png', 5, 91, NULL, NULL, 2, 78.00);
INSERT INTO `order_detail` VALUES (6, '小朋友蒸蛋', 'https://web-dop.oss-cn-beijing.aliyuncs.com/8409a908-b7e6-493b-ba75-137261659ab8.png', 5, 104, NULL, NULL, 1, 12.00);
INSERT INTO `order_detail` VALUES (7, '润田翠', 'https://web-dop.oss-cn-beijing.aliyuncs.com/fcaa8f7d-5dc2-479c-ae59-cb50eabdb65f.png', 5, 111, NULL, NULL, 1, 3.00);
INSERT INTO `order_detail` VALUES (8, '茉莉豆花奶茶', 'https://web-dop.oss-cn-beijing.aliyuncs.com/8b6c90ea-d520-4c20-b1c8-3d1600c00401.png', 6, 109, NULL, NULL, 2, 24.00);
INSERT INTO `order_detail` VALUES (9, '手打青柠茶', 'https://web-dop.oss-cn-beijing.aliyuncs.com/31dd6a8c-b506-448d-bed5-e2ab46ada3e5.png', 6, 110, NULL, NULL, 1, 10.00);
INSERT INTO `order_detail` VALUES (10, '蔬菜沙拉', 'https://web-dop.oss-cn-beijing.aliyuncs.com/73d31690-bf8b-4d07-996b-4adda8540eab.png', 6, 99, NULL, NULL, 1, 29.00);
INSERT INTO `order_detail` VALUES (11, '蟹脚捞面', 'https://web-dop.oss-cn-beijing.aliyuncs.com/ff16a7da-3750-4c3d-8e39-d4d2b903921b.png', 6, 114, NULL, NULL, 2, 112.00);
INSERT INTO `order_detail` VALUES (12, '石锅焖芋头', 'https://web-dop.oss-cn-beijing.aliyuncs.com/754091cd-a3d6-43e7-a4d5-1ee05c0a2c56.png', 6, 94, NULL, NULL, 1, 32.00);
INSERT INTO `order_detail` VALUES (13, '红烧碎碎鸡', 'https://web-dop.oss-cn-beijing.aliyuncs.com/5109ce77-cb95-46b3-9363-fa39e6ddb76d.png', 6, 91, NULL, NULL, 1, 39.00);
INSERT INTO `order_detail` VALUES (14, '家乡白菜梗', 'https://web-dop.oss-cn-beijing.aliyuncs.com/af6feb8c-819b-4920-af98-f61d6a33e7e1.png', 6, 92, NULL, NULL, 1, 26.00);
INSERT INTO `order_detail` VALUES (15, '爆辣鲜虾捞粉', 'https://web-dop.oss-cn-beijing.aliyuncs.com/e3786d38-efc3-4132-9382-2de6b2c7ae6c.png', 6, 93, NULL, NULL, 1, 66.00);
INSERT INTO `order_detail` VALUES (16, '红烧碎碎鸡', 'https://web-dop.oss-cn-beijing.aliyuncs.com/5109ce77-cb95-46b3-9363-fa39e6ddb76d.png', 7, 91, NULL, NULL, 2, 78.00);
INSERT INTO `order_detail` VALUES (17, '爆辣鲜虾捞粉', 'https://web-dop.oss-cn-beijing.aliyuncs.com/e3786d38-efc3-4132-9382-2de6b2c7ae6c.png', 7, 93, NULL, NULL, 1, 66.00);
INSERT INTO `order_detail` VALUES (18, '家乡白菜梗', 'https://web-dop.oss-cn-beijing.aliyuncs.com/af6feb8c-819b-4920-af98-f61d6a33e7e1.png', 8, 92, NULL, NULL, 2, 52.00);
INSERT INTO `order_detail` VALUES (19, '劲辣小甲鱼', 'https://web-dop.oss-cn-beijing.aliyuncs.com/8bf79d69-9ecf-468f-a89e-f406184d47f2.png', 8, 112, NULL, NULL, 1, 49.00);
INSERT INTO `order_detail` VALUES (20, '嫩豆腐烧牛蛙', 'https://web-dop.oss-cn-beijing.aliyuncs.com/f4070ae9-bccf-479c-818e-85ba05365346.png', 8, 115, NULL, NULL, 1, 59.00);
INSERT INTO `order_detail` VALUES (21, '红烧碎碎鸡', 'https://web-dop.oss-cn-beijing.aliyuncs.com/5109ce77-cb95-46b3-9363-fa39e6ddb76d.png', 9, 91, NULL, NULL, 2, 78.00);
INSERT INTO `order_detail` VALUES (22, '蟹脚捞面', 'https://web-dop.oss-cn-beijing.aliyuncs.com/ff16a7da-3750-4c3d-8e39-d4d2b903921b.png', 9, 114, NULL, NULL, 1, 56.00);
INSERT INTO `order_detail` VALUES (23, '糯叽叽', 'https://web-dop.oss-cn-beijing.aliyuncs.com/84df5176-b95a-45c9-90ca-12f051d35cf3.png', 9, 100, NULL, NULL, 1, 3.00);
INSERT INTO `order_detail` VALUES (24, '红烧碎碎鸡', 'https://web-dop.oss-cn-beijing.aliyuncs.com/5109ce77-cb95-46b3-9363-fa39e6ddb76d.png', 10, 91, NULL, NULL, 1, 39.00);
INSERT INTO `order_detail` VALUES (25, '红烧碎碎鸡', 'https://web-dop.oss-cn-beijing.aliyuncs.com/5109ce77-cb95-46b3-9363-fa39e6ddb76d.png', 11, 91, NULL, NULL, 1, 39.00);
INSERT INTO `order_detail` VALUES (26, '爆辣鲜虾捞粉', 'https://web-dop.oss-cn-beijing.aliyuncs.com/e3786d38-efc3-4132-9382-2de6b2c7ae6c.png', 11, 93, NULL, NULL, 1, 66.00);
INSERT INTO `order_detail` VALUES (27, '蟹脚捞粉', 'https://web-dop.oss-cn-beijing.aliyuncs.com/e707f26b-daa6-4e9f-a16a-900242b72d95.png', 11, 113, NULL, NULL, 1, 56.00);

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `number` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '订单号',
  `user_id` bigint(20) NOT NULL COMMENT '下单用户',
  `checkout_time` datetime(0) NULL DEFAULT NULL COMMENT '结账时间',
  `amount` decimal(10, 2) NOT NULL COMMENT '实收金额',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '订单表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of orders
-- ----------------------------
INSERT INTO `orders` VALUES (5, '70b8812e6f1e4c278f9b845e67294fd4', 5, '2024-02-21 20:55:12', 93.00);
INSERT INTO `orders` VALUES (6, '019bffd731eb471f9e7dd63c52816670', 5, '2024-02-21 20:56:59', 338.00);
INSERT INTO `orders` VALUES (7, 'ef4413b7398b479082f050d357632adc', 5, '2024-02-21 22:24:58', 144.00);
INSERT INTO `orders` VALUES (8, '80c22240ff9b4e9ebbd7', 5, '2024-02-21 22:25:34', 160.00);
INSERT INTO `orders` VALUES (9, '4ae5228f19f7', 5, '2024-02-21 22:26:34', 137.00);
INSERT INTO `orders` VALUES (10, 'cdffbf24b13d40ac', 5, '2024-02-21 22:27:01', 39.00);
INSERT INTO `orders` VALUES (11, 'af49c998f5af4687', 5, '2024-02-21 22:31:39', 161.00);

-- ----------------------------
-- Table structure for swiper
-- ----------------------------
DROP TABLE IF EXISTS `swiper`;
CREATE TABLE `swiper`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `image` varchar(500) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '头像',
  `create_time` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '轮播图' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of swiper
-- ----------------------------
INSERT INTO `swiper` VALUES (1, 'http://localhost:8080/images/swiper/1.jpg', '2024-02-20 23:01:26');
INSERT INTO `swiper` VALUES (2, 'http://localhost:8080/images/swiper/2.jpg', '2024-02-20 23:01:26');
INSERT INTO `swiper` VALUES (3, 'http://localhost:8080/images/swiper/3.jpg', '2024-02-20 23:01:26');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `openid` varchar(45) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '微信用户唯一标识',
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '姓名',
  `phone` varchar(11) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '手机号',
  `sex` varchar(2) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '性别',
  `id_number` varchar(18) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '身份证号',
  `avatar` varchar(500) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '头像',
  `create_time` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '用户信息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (5, 'ontSy5WszNjcUvivGe1ito6osij4', NULL, NULL, NULL, NULL, NULL, '2024-02-20 23:01:26');

SET FOREIGN_KEY_CHECKS = 1;
