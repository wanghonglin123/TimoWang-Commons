/*
Navicat MySQL Data Transfer

Source Server         : 172.16.50.242
Source Server Version : 50505
Source Host           : 172.16.50.242:13306
Source Database       : msyt-cart

Target Server Type    : MYSQL
Target Server Version : 50505
File Encoding         : 65001

Date: 2017-12-25 15:13:27
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for tb_cart
-- ----------------------------
DROP TABLE IF EXISTS `tb_cart`;
CREATE TABLE `tb_cart` (
  `idx` bigint(19) NOT NULL COMMENT '进货单主键idx，分布式架构，全局唯一递增##@Cache##',
  `idx_code` bigint(19) DEFAULT NULL COMMENT '主键idx生成的code##@Long2S(targetField = "idxCode")##',
  `user_idx_code` bigint(19) DEFAULT NULL COMMENT '会员idxcode##@NotNull(message = "会员idxcode不能为空")##',
  `item_idx_code` bigint(19) DEFAULT NULL COMMENT '商品主键idx_code，不可以为null，必须手动设置为0##@NotNull(message = "商品不能为空")##',
  `item_number` int(10) DEFAULT NULL COMMENT '商品数量，必填##@NotNull(message = "商品数量不能为空")##',
  `status` smallint(1) DEFAULT NULL COMMENT '状态，1：可用的、激活的，2：未激活，0：删除，2：未激活，取值范围为0-9，不可以为null',
  `create_user_idx_code` bigint(19) DEFAULT NULL COMMENT '创建用户idxcode',
  `update_user_idx_code` bigint(19) DEFAULT NULL COMMENT '修改用户idxcode',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '订单创建时间##@EnYyyyMMddHHmmss##',
  `update_time` timestamp NULL DEFAULT NULL COMMENT '更新时间##@EnYyyyMMddHHmmss##',
  `version` bigint(19) DEFAULT NULL COMMENT '版本号，高并发，乐观锁解决方案',
  `ext` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '扩展字段',
  `remark` varchar(200) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '订单备注，字符个数0-200，不可以为null，必须手动设置空字符串##@Length(max = 200, message = "订单备注最大200个字符")##',
  PRIMARY KEY (`idx`),
  KEY `idx_index` (`idx`) USING BTREE,
  KEY `idxcode_index` (`idx_code`) USING BTREE,
  KEY `user_idx_code_index` (`user_idx_code`) USING BTREE,
  KEY `item_idx_code_index` (`item_idx_code`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
