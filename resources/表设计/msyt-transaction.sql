/*
Navicat MySQL Data Transfer

Source Server         : 172.16.50.242
Source Server Version : 50505
Source Host           : 172.16.50.242:13306
Source Database       : msyt-transaction

Target Server Type    : MYSQL
Target Server Version : 50505
File Encoding         : 65001

Date: 2017-12-25 15:20:22
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for tb_payment
-- ----------------------------
DROP TABLE IF EXISTS `tb_payment`;
CREATE TABLE `tb_payment` (
  `idx` bigint(19) NOT NULL COMMENT '支付方式表主键idx，分布式架构，全局唯一递增',
  `idx_code` bigint(19) DEFAULT NULL COMMENT 'idx code 全局唯一性，解决idx可以通过递增1猜测出来，潜在安全问题##@Long2S(targetField = "idxCode")##',
  `name` varchar(200) DEFAULT NULL COMMENT '支付方式名称（如：支付宝）',
  `payment_code` varchar(200) DEFAULT NULL COMMENT '支付方式code，如支付宝为ALIPAY，微信支付为WXPAY',
  `logo_small` varchar(150) DEFAULT NULL COMMENT '支付方式logo小图##@DynamicS##',
  `logo_middle` varchar(150) DEFAULT NULL COMMENT '支付方式logo中图##@DynamicS##',
  `logo_big` varchar(150) DEFAULT NULL COMMENT '支付方式logo大图##@DynamicS##',
  `using_platform` smallint(2) DEFAULT NULL COMMENT '被用于哪个平台（0：未知；1：PC；2：APP；3：WAP；4：ERP；5：其他）',
  `tip_image` varchar(250) DEFAULT NULL COMMENT '支付提示图片，例如：提示扫二维码##@DynamicS##',
  `pay_image` varchar(250) DEFAULT NULL COMMENT '支付操作图片路径，如微信扫一扫入口等##@DynamicS##',
  `tips` varchar(300) DEFAULT NULL COMMENT '支付提示信息，如xxx安全条款等',
  `is_need_navigate` smallint(1) DEFAULT NULL COMMENT '是否需要跳转到支付页面，如支付宝跳转到支付网关（0：不需要跳转；1：需要跳转）',
  `entrance_class` varchar(255) DEFAULT NULL COMMENT '入口类',
  `is_active` smallint(6) DEFAULT NULL COMMENT '是否激活（0：禁用；1：激活）',
  `remark` varchar(200) DEFAULT NULL COMMENT '备注',
  `create_by_member_idx` bigint(19) DEFAULT NULL COMMENT '创建成员idx，不可以为null',
  `update_by_member_idx` bigint(19) DEFAULT NULL COMMENT '修改成员idx，不可以为null',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间，第一次创建时间，后续不可以修改时间##@EnYyyyMMddHHmmss##',
  `update_time` timestamp NULL DEFAULT NULL COMMENT '更新时间，每一次修改都要更新时间##@EnYyyyMMddHHmmss##',
  `status` smallint(1) DEFAULT NULL COMMENT '状态，1：可用的、激活的，2：未激活，0：删除，取值范围为0-9，不可以为null',
  `version` bigint(19) DEFAULT NULL COMMENT '版本号，高并发，乐观锁的解决方案',
  `ext` varchar(100) DEFAULT NULL COMMENT '扩展，0-100字符，不可以为null，必须手动设置为空字符串',
  PRIMARY KEY (`idx`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='支付方式表';

-- ----------------------------
-- Table structure for tb_payment_log
-- ----------------------------
DROP TABLE IF EXISTS `tb_payment_log`;
CREATE TABLE `tb_payment_log` (
  `idx` bigint(19) NOT NULL COMMENT '支付记录表主键idx，分布式架构，全局唯一递增',
  `idx_code` bigint(19) DEFAULT NULL COMMENT 'idx code 全局唯一性，解决idx可以通过递增1猜测出来，潜在安全问题##@Long2S(targetField = "idxCode")##',
  `payment_idx_code` bigint(19) DEFAULT NULL COMMENT '支付idx_code##@DynamicS##',
  `order_idx_code` bigint(19) DEFAULT NULL COMMENT '订单idx_code',
  `order_no` varchar(50) DEFAULT NULL COMMENT '订单编号',
  `payment_amount` int(11) DEFAULT NULL COMMENT '实付金额',
  `pay_no` varchar(50) DEFAULT NULL COMMENT '支付流水号',
  `request_params` varchar(2000) DEFAULT NULL COMMENT '发起支付的请求参数',
  `response_params` varchar(2000) DEFAULT NULL COMMENT '支付回调参数，方便排查问题',
  `is_success` smallint(1) DEFAULT NULL COMMENT '是否支付成功（0：未支付；1：成功；2：失败）',
  `pay_time` timestamp NULL DEFAULT NULL COMMENT '支付时间##@EnYyyyMMddHHmmss##',
  `pay_msg` varchar(1000) DEFAULT NULL COMMENT '支付信息提示',
  `create_by_member_idx` bigint(19) DEFAULT NULL COMMENT '创建成员idx，不可以为null',
  `update_by_member_idx` bigint(19) DEFAULT NULL COMMENT '修改成员idx，不可以为null',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间，第一次创建时间，后续不可以修改时间##@EnYyyyMMddHHmmss##',
  `update_time` timestamp NULL DEFAULT NULL COMMENT '更新时间，每一次修改都要更新时间##@EnYyyyMMddHHmmss##',
  `status` smallint(1) DEFAULT NULL COMMENT '状态，1：可用的、激活的，2：未激活，0：删除，取值范围为0-9，不可以为null',
  `version` bigint(19) DEFAULT NULL COMMENT '版本号，高并发，乐观锁的解决方案',
  `ext` varchar(100) DEFAULT NULL COMMENT '扩展，0-100字符，不可以为null，必须手动设置为空字符串',
  PRIMARY KEY (`idx`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='支付记录表';

-- ----------------------------
-- Table structure for tb_refund_log
-- ----------------------------
DROP TABLE IF EXISTS `tb_refund_log`;
CREATE TABLE `tb_refund_log` (
  `idx` bigint(19) NOT NULL COMMENT '退款记录表主键idx，分布式架构，全局唯一递增',
  `idx_code` bigint(19) DEFAULT NULL COMMENT 'idx code 全局唯一性，解决idx可以通过递增1猜测出来，潜在安全问题##@Long2S(targetField = "idxCode")##',
  `payment_idx_code` bigint(19) DEFAULT NULL COMMENT '支付方式idx_code##@DynamicS##',
  `order_idx_code` bigint(19) DEFAULT NULL COMMENT '订单idx_code',
  `order_no` varchar(50) DEFAULT NULL COMMENT '订单编号',
  `refund_amount` int(11) DEFAULT NULL COMMENT '退款金额',
  `refund_no` varchar(50) DEFAULT NULL COMMENT '退款流水号',
  `request_params` varchar(2000) DEFAULT NULL COMMENT '发起退款的请求参数',
  `response_params` varchar(2000) DEFAULT NULL COMMENT '退款回调参数，方便排查问题',
  `refund_time` timestamp NULL DEFAULT NULL COMMENT '退款时间##@EnYyyyMMddHHmmss##',
  `is_success` smallint(1) DEFAULT NULL COMMENT '是否退款成功（0：否；1：是）',
  `create_by_member_idx` bigint(19) DEFAULT NULL COMMENT '创建成员idx，不可以为null',
  `update_by_member_idx` bigint(19) DEFAULT NULL COMMENT '修改成员idx，不可以为null',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间，第一次创建时间，后续不可以修改时间##@EnYyyyMMddHHmmss##',
  `update_time` timestamp NULL DEFAULT NULL COMMENT '更新时间，每一次修改都要更新时间##@EnYyyyMMddHHmmss##',
  `status` smallint(1) DEFAULT NULL COMMENT '状态，1：可用的、激活的，2：未激活，0：删除，取值范围为0-9，不可以为null',
  `version` bigint(19) DEFAULT NULL COMMENT '版本号，高并发，乐观锁的解决方案',
  `ext` varchar(100) DEFAULT NULL COMMENT '扩展，0-100字符，不可以为null，必须手动设置为空字符串',
  PRIMARY KEY (`idx`),
  UNIQUE KEY `refund_idx_code_index` (`idx_code`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='退款记录表';
