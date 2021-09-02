/*
 Navicat Premium Data Transfer

 Source Server         : 本地
 Source Server Type    : MySQL
 Source Server Version : 80011
 Source Host           : localhost:3306
 Source Schema         : mall

 Target Server Type    : MySQL
 Target Server Version : 80011
 File Encoding         : 65001

 Date: 02/03/2021 09:02:21
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for address
-- ----------------------------
DROP TABLE IF EXISTS `address`;
CREATE TABLE `address`  (
  `address_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL COMMENT 'user_id外键',
  `phone_number` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '收货人的电话号，可以与用户的电话号不通',
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '收货人真名',
  `province` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '省份',
  `city` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '城市',
  `county` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '区/县',
  `address_detail` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '详细地址',
  PRIMARY KEY (`address_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 24 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of address
-- ----------------------------
INSERT INTO `address` VALUES (2, 1, '18888888888', '陈勤', '陕西省', '西安市', '未央区', '渭水校区');
INSERT INTO `address` VALUES (5, 5, '16666666666', '刘文广', '陕西省', '宝鸡市', '渭滨区', '长安大学渭水校区');
INSERT INTO `address` VALUES (6, 1, '12312312312', '刘聪', '陕西省', '西安市', '未央区', '长安大学渭水校区16楼');
INSERT INTO `address` VALUES (9, 1, '12343434343', '张帅', '陕西省', '西安市', '未央区', '长安大学渭水校区');
INSERT INTO `address` VALUES (16, 4, '15768620259', '庞晓军', '陕西省', '西安市', '未央区', '长安大学渭水校区');
INSERT INTO `address` VALUES (17, 1, '13720555921', '庞晓军', '陕西省', '西安市', '未央区', '长安大学渭水校区16号楼');
INSERT INTO `address` VALUES (18, 1, '12345678910', '元素打击', '四川省', '成都市', '锦江区', '厕所');
INSERT INTO `address` VALUES (19, 5, '15009299999', '庞晓君', '重庆市', '县', '垫江县', '海底捞');
INSERT INTO `address` VALUES (20, 6, '13572082079', '小陈', '青海省', '西宁市', '城北区', '呃呃呃呃呃呃呃呃呃');
INSERT INTO `address` VALUES (21, 5, '13572082099', '陈', '四川省', '成都市', '武侯区', '烦烦烦方法');
INSERT INTO `address` VALUES (22, 5, '13572082079', '树时', '四川省', '成都市', '锦江区', '的烦烦烦');
INSERT INTO `address` VALUES (23, 13, '12345678912', 'bineee', '广东省', '广州市', '天河区', 'ABC');
INSERT INTO `address` VALUES (24, 3, '15478457845', '机器人1好', '陕西省', '西安市', '未央区', '幸福大街一号');

-- ----------------------------
-- Table structure for collect
-- ----------------------------
DROP TABLE IF EXISTS `collect`;
CREATE TABLE `collect`  (
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  PRIMARY KEY (`user_id`, `product_id`) USING BTREE,
  INDEX `product_id`(`product_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of collect
-- ----------------------------
INSERT INTO `collect` VALUES (1, 1);
INSERT INTO `collect` VALUES (6, 1);
INSERT INTO `collect` VALUES (1, 2);
INSERT INTO `collect` VALUES (6, 2);
INSERT INTO `collect` VALUES (1, 3);
INSERT INTO `collect` VALUES (5, 3);
INSERT INTO `collect` VALUES (5, 15);
INSERT INTO `collect` VALUES (13, 18);
INSERT INTO `collect` VALUES (13, 19);
INSERT INTO `collect` VALUES (5, 45);
INSERT INTO `collect` VALUES (13, 46);
INSERT INTO `collect` VALUES (3, 69);

-- ----------------------------
-- Table structure for logistic_com
-- ----------------------------
DROP TABLE IF EXISTS `logistic_com`;
CREATE TABLE `logistic_com`  (
  `logistic_id` int(10) NOT NULL AUTO_INCREMENT COMMENT '物流公司id',
  `com_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '物流公司名',
  PRIMARY KEY (`logistic_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of logistic_com
-- ----------------------------
INSERT INTO `logistic_com` VALUES (1, '顺丰');
INSERT INTO `logistic_com` VALUES (2, '圆通');
INSERT INTO `logistic_com` VALUES (3, '韵达');
INSERT INTO `logistic_com` VALUES (4, '第三方');
INSERT INTO `logistic_com` VALUES (5, '中通');

-- ----------------------------
-- Table structure for order
-- ----------------------------
DROP TABLE IF EXISTS `order`;
CREATE TABLE `order`  (
  `order_id` int(20) NOT NULL AUTO_INCREMENT COMMENT '订单id',
  `product_id` int(20) NOT NULL COMMENT '货物id',
  `product_num` int(10) NOT NULL COMMENT '货物数量',
  `price` double(20, 2) NOT NULL COMMENT '金额,货物的单价',
  `buyer_id` int(20) NOT NULL COMMENT '买家id',
  `seller_id` int(20) NOT NULL COMMENT '卖家id',
  `order_time` datetime NOT NULL COMMENT '生成时间',
  `buyer_addr` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '买家地址',
  `seller_addr` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '卖家地址',
  `logistic_id` int(10) UNSIGNED NULL DEFAULT 1 COMMENT '物流公司id',
  `status` int(5) NOT NULL DEFAULT 0 COMMENT '订单状态；0--包括未发货，1--已发货，2--已签收',
  PRIMARY KEY (`order_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 29 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of order
-- ----------------------------
INSERT INTO `order` VALUES (1, 1, 1, 299.00, 1, 1, '2020-07-10 15:38:29', '1', '1', 1, 2);
INSERT INTO `order` VALUES (2, 2, 2, 2.00, 2, 2, '2020-07-10 23:03:39', '2', '2', 3, 1);
INSERT INTO `order` VALUES (3, 1, 1, 1.00, 1, 1, '2020-07-10 15:38:29', '1', '1', 1, 2);
INSERT INTO `order` VALUES (4, 1, 1, 1.30, 2, 3, '2020-07-13 20:47:15', '1', '0', 2, 1);
INSERT INTO `order` VALUES (5, 7, 1, 40.00, 1, 7, '2020-07-13 20:49:36', '9', NULL, 1, 0);
INSERT INTO `order` VALUES (6, 7, 1, 40.00, 1, 7, '2020-07-13 20:49:45', '17', NULL, 1, 0);
INSERT INTO `order` VALUES (7, 7, 1, 40.00, 1, 7, '2020-07-13 20:50:50', '18', NULL, 1, 0);
INSERT INTO `order` VALUES (8, 7, 1, 40.00, 1, 7, '2020-07-13 20:54:26', '2', NULL, 1, 0);
INSERT INTO `order` VALUES (9, 1, 10, 350.00, 1, 1, '2020-07-13 22:04:22', '6', NULL, 1, 0);
INSERT INTO `order` VALUES (10, 8, 1, 3.50, 1, 8, '2020-07-13 22:04:45', '17', NULL, 1, 0);
INSERT INTO `order` VALUES (11, 8, 6, 3.50, 1, 8, '2020-07-13 22:07:13', '6', NULL, 1, 0);
INSERT INTO `order` VALUES (12, 2, 1, 776.00, 1, 2, '2020-07-13 22:36:10', '6', NULL, 1, 0);
INSERT INTO `order` VALUES (13, 8, 7, 3.50, 1, 8, '2020-07-13 23:07:52', '9', NULL, 1, 0);
INSERT INTO `order` VALUES (14, 2, 1, 776.00, 5, 3, '2020-07-14 09:02:54', '5', '0', 4, 1);
INSERT INTO `order` VALUES (15, 3, 1, 400.00, 5, 3, '2020-07-14 09:25:34', '5', '0', 2, 1);
INSERT INTO `order` VALUES (16, 3, 1, 400.00, 5, 3, '2020-07-14 14:20:52', '5', '0', 4, 0);
INSERT INTO `order` VALUES (17, 2, 3, 776.00, 5, 3, '2020-07-14 14:46:36', '5', NULL, 1, 0);
INSERT INTO `order` VALUES (18, 2, 1, 776.00, 5, 3, '2020-07-14 14:47:33', '5', NULL, 0, 0);
INSERT INTO `order` VALUES (19, 3, 8, 400.00, 5, 3, '2020-07-14 14:47:33', '5', NULL, 1, 0);
INSERT INTO `order` VALUES (20, 1, 1, 111.00, 3, 7, '2020-07-14 15:15:05', '55', NULL, 0, 0);
INSERT INTO `order` VALUES (21, 17, 7, 17.00, 5, 4, '2020-07-14 15:55:26', '5', NULL, 1, 0);
INSERT INTO `order` VALUES (25, 46, 1, 111.00, 5, 1, '2020-07-14 19:26:50', '19', NULL, 1, 0);
INSERT INTO `order` VALUES (29, 68, 1, 100.00, 3, 2, '2021-03-01 14:48:37', '242', '0哈哈', 1, 2);
INSERT INTO `order` VALUES (30, 68, 2, 100.00, 3, 2, '2021-03-01 15:23:44', '24', NULL, 1, 0);
INSERT INTO `order` VALUES (31, 69, 3, 100.00, 3, 2, '2021-03-01 16:33:27', '24', NULL, 1, 0);
INSERT INTO `order` VALUES (32, 69, 4, 100.00, 3, 2, '2021-03-01 16:54:49', '24', NULL, 1, 0);
INSERT INTO `order` VALUES (33, 68, 3, 100.00, 3, 2, '2021-03-01 16:58:30', '24', NULL, 1, 0);
INSERT INTO `order` VALUES (34, 68, 1, 100.00, 3, 2, '2021-03-01 16:59:42', '24', NULL, 1, 0);
INSERT INTO `order` VALUES (35, 68, 1, 100.00, 3, 2, '2021-03-01 17:00:26', '24', NULL, 1, 0);
INSERT INTO `order` VALUES (36, 69, 2, 100.00, 3, 2, '2021-03-01 17:00:46', '24', NULL, 1, 0);
INSERT INTO `order` VALUES (37, 68, 1, 100.00, 3, 2, '2021-03-01 17:01:24', '24', NULL, 1, 0);
INSERT INTO `order` VALUES (38, 69, 1, 100.00, 3, 2, '2021-03-01 17:01:33', '24', NULL, 1, 0);
INSERT INTO `order` VALUES (39, 69, 1, 100.00, 3, 2, '2021-03-01 17:05:56', '24', NULL, 1, 0);
INSERT INTO `order` VALUES (40, 69, 1, 100.00, 3, 2, '2021-03-01 17:08:06', '24', NULL, 1, 0);
INSERT INTO `order` VALUES (41, 69, 1, 100.00, 3, 2, '2021-03-02 08:20:18', '陕西省西安市未央区幸福大街一号', NULL, 1, 0);

-- ----------------------------
-- Table structure for orderr
-- ----------------------------
DROP TABLE IF EXISTS `orderr`;
CREATE TABLE `orderr`  (
  `order_id` int(11) NOT NULL,
  `product_id` int(255) NULL DEFAULT NULL,
  `product_num` int(255) NULL DEFAULT NULL,
  `price` int(255) NULL DEFAULT NULL,
  `buyer_id` int(255) NULL DEFAULT NULL,
  `seller_id` int(255) NULL DEFAULT NULL,
  `order_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `buyer_addr` int(255) NULL DEFAULT NULL,
  `seller_addr` int(255) NULL DEFAULT NULL,
  `logisitic_id` int(255) NULL DEFAULT NULL,
  `status` int(255) NULL DEFAULT NULL,
  PRIMARY KEY (`order_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of orderr
-- ----------------------------

-- ----------------------------
-- Table structure for product
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product`  (
  `product_id` int(20) NOT NULL AUTO_INCREMENT COMMENT '商品id',
  `seller_id` int(20) NOT NULL COMMENT '卖家id',
  `product_type_id` int(20) NULL DEFAULT NULL COMMENT '类型id',
  `product_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '货品名字',
  `product_image` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图片路径',
  `price` double(20, 2) NOT NULL COMMENT '价格',
  `discount_price` double(20, 2) NULL DEFAULT NULL COMMENT '优惠价',
  `storage` int(20) NOT NULL COMMENT '库存',
  `sale` int(20) NULL DEFAULT NULL COMMENT '销量',
  `state` int(1) NOT NULL COMMENT '1：上架 ;  0 : 下架',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `modify_time` datetime NULL DEFAULT NULL COMMENT '修改时间',
  `product_describe` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品描述',
  PRIMARY KEY (`product_id`) USING BTREE,
  INDEX `product_type`(`product_type_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 69 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of product
-- ----------------------------
INSERT INTO `product` VALUES (68, 2, 1, '物理', '9e35b510-e8aa-43bd-b5ea-1a93d06b2b6f.jpg', 100.00, 95.00, 91, 9, 0, '2021-02-20 22:16:33', NULL, '2');
INSERT INTO `product` VALUES (69, 2, 10, '22', '9e35b510-e8aa-43bd-b5ea-1a93d06b2b6f.jpg', 100.00, 22.00, 9, 12, 1, '2021-03-01 16:03:05', NULL, '22');

-- ----------------------------
-- Table structure for product_type
-- ----------------------------
DROP TABLE IF EXISTS `product_type`;
CREATE TABLE `product_type`  (
  `product_type_id` int(20) NOT NULL AUTO_INCREMENT COMMENT '货物分类id',
  `product_type_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '分类名',
  PRIMARY KEY (`product_type_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of product_type
-- ----------------------------
INSERT INTO `product_type` VALUES (1, '理科');
INSERT INTO `product_type` VALUES (8, '文科');
INSERT INTO `product_type` VALUES (10, '测试啊');

-- ----------------------------
-- Table structure for shopping_cart
-- ----------------------------
DROP TABLE IF EXISTS `shopping_cart`;
CREATE TABLE `shopping_cart`  (
  `product_id` int(20) NOT NULL COMMENT '货物id',
  `buyer_id` int(20) NOT NULL COMMENT '买家id',
  `price` double(20, 2) NOT NULL COMMENT '加入购物车时的商品单价',
  `num` int(20) NOT NULL COMMENT '货物数量',
  PRIMARY KEY (`product_id`, `buyer_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of shopping_cart
-- ----------------------------
INSERT INTO `shopping_cart` VALUES (8, 6, 3.20, 3);
INSERT INTO `shopping_cart` VALUES (14, 5, 5000.00, 2);

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `user_id` int(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户名，登录用',
  `phone_number` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号',
  `nickname` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '昵称',
  `password` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '密码',
  `type` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户类型 0管理员 1商家 2客户',
  `sex` char(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '性别',
  `img` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`user_id`) USING BTREE,
  UNIQUE INDEX `username`(`username`) USING BTREE COMMENT '用户名索引',
  UNIQUE INDEX `phone_number`(`phone_number`) USING BTREE COMMENT '手机号索引'
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, 'admin', '00000000000', '管理员', '123456789', '0', '保密', NULL);
INSERT INTO `user` VALUES (2, 'zhangsan', '11111111112', '张三', '123456789', '1', '女', NULL);
INSERT INTO `user` VALUES (3, 'bineee', '12345678912', 'bineee3', '123456789', '2', '男', 'fb1652df-80bf-4bcb-987a-9924cd45672c.jpg');

SET FOREIGN_KEY_CHECKS = 1;
