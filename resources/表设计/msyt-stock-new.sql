/*
Navicat MySQL Data Transfer

Source Server         : 172.16.50.242
Source Server Version : 50505
Source Host           : 172.16.50.242:13306
Source Database       : msyt-stock-new

Target Server Type    : MYSQL
Target Server Version : 50505
File Encoding         : 65001

Date: 2017-12-25 15:19:43
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for tb_stock_lock
-- ----------------------------
DROP TABLE IF EXISTS `tb_stock_lock`;
CREATE TABLE `tb_stock_lock` (
  `idx` bigint(19) NOT NULL COMMENT '锁库库存主键idx，分布式架构，全局唯一递增',
  `idx_code` bigint(19) DEFAULT NULL COMMENT 'idx code 全局唯一性，解决idx可以通过递增1猜测出来，潜在安全问题##@Long2S(targetField = "idxCode")##',
  `user_idx_code` bigint(19) DEFAULT NULL COMMENT '会员idx code',
  `quantity` int(10) DEFAULT NULL COMMENT '锁库数量',
  `type_num` int(10) DEFAULT NULL COMMENT '种类数量',
  `amount` int(10) DEFAULT NULL COMMENT '锁库金额，以分为单位，而不是以元为单位，取值范围0-2147483647，不可以为null##@NotNull(message = "锁库金额不能为空")@Range(min = 0, max = 2147483647, message = "锁库金额需要设置0-2147483647")@$2##',
  `available_stock_num` int(10) DEFAULT NULL COMMENT '可用库存',
  `remark` varchar(200) DEFAULT NULL COMMENT '备注',
  `create_member_idx_code` bigint(19) DEFAULT NULL COMMENT '创建成员idx code',
  `update_member_idx_code` bigint(19) DEFAULT NULL COMMENT '更新成员idx code',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` timestamp NULL DEFAULT NULL COMMENT '更新时间',
  `status` smallint(1) DEFAULT NULL COMMENT '状态，1：可用的、激活的，2：未激活，0：删除，2：未激活，取值范围为0-9，不可以为null',
  `version` bigint(19) DEFAULT NULL COMMENT '版本号，高并发，乐观锁解决方案',
  `ext` varchar(100) DEFAULT NULL COMMENT '扩展，0-100字符，不可以为null，必须手动设置为空字符串',
  PRIMARY KEY (`idx`),
  UNIQUE KEY `user_idx_code` (`user_idx_code`),
  KEY `index_sl_user` (`user_idx_code`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='锁库库存表';

-- ----------------------------
-- Table structure for tb_stock_lock_apply
-- ----------------------------
DROP TABLE IF EXISTS `tb_stock_lock_apply`;
CREATE TABLE `tb_stock_lock_apply` (
  `idx` bigint(19) NOT NULL COMMENT '锁库申请主键idx，分布式架构，全局唯一递增',
  `idx_code` bigint(19) DEFAULT NULL COMMENT 'idx code 全局唯一性，解决idx可以通过递增1猜测出来，潜在安全问题##@Long2S(targetField = "idxCode")##',
  `user_idx_code` bigint(19) DEFAULT NULL COMMENT '申请会员idx code',
  `quantity` int(10) DEFAULT NULL COMMENT '锁库数量',
  `type_num` int(10) DEFAULT NULL COMMENT '锁库种类',
  `amount` int(10) DEFAULT NULL COMMENT '锁库金额，以分为单位，而不是以元为单位，取值范围0-2147483647，不可以为null##@NotNull(message = "锁库金额不能为空")@Range(min = 0, max = 2147483647, message = "锁库金额需要设置0-2147483647")@$2##',
  `apply_time` timestamp NULL DEFAULT NULL COMMENT '申请时间',
  `upload_success_num` int(10) DEFAULT NULL COMMENT '上传成功数量',
  `upload_fail_num` int(10) DEFAULT NULL COMMENT '上传失败数量',
  `upload_status` smallint(1) DEFAULT NULL COMMENT '上传状态，1：上传成功，2：上传失败，0：上传中',
  `examine_status` smallint(1) DEFAULT NULL COMMENT '审核状态，1：审核通过，2：审核失败，0：待审核',
  `pay_status` smallint(1) DEFAULT NULL COMMENT '支付状态，1：支付成功，2：支付失败，0：待支付',
  `examine_time` timestamp NULL DEFAULT NULL COMMENT '审核时间',
  `pay_time` timestamp NULL DEFAULT NULL COMMENT '支付时间',
  `remark` varchar(200) DEFAULT NULL COMMENT '备注',
  `create_user_idx_code` bigint(19) DEFAULT NULL COMMENT '创建会员idx code',
  `update_member_idx_code` bigint(19) DEFAULT NULL COMMENT '更新成员idx code',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `status` smallint(1) DEFAULT NULL COMMENT '状态，1：可用的、激活的，2：未激活，0：删除，2：未激活，取值范围为0-9，不可以为null',
  `version` bigint(19) DEFAULT NULL COMMENT '版本号，高并发，乐观锁解决方案',
  `ext` varchar(100) DEFAULT NULL COMMENT '扩展，0-100字符，不可以为null，必须手动设置为空字符串',
  PRIMARY KEY (`idx`),
  KEY `index_sla_user` (`user_idx_code`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='锁库申请表';

-- ----------------------------
-- Table structure for tb_stock_lock_apply_detail
-- ----------------------------
DROP TABLE IF EXISTS `tb_stock_lock_apply_detail`;
CREATE TABLE `tb_stock_lock_apply_detail` (
  `idx` bigint(19) NOT NULL COMMENT '锁库申请详情主键idx，分布式架构，全局唯一递增',
  `idx_code` bigint(19) DEFAULT NULL COMMENT 'idx code 全局唯一性，解决idx可以通过递增1猜测出来，潜在安全问题##@Long2S(targetField = "idxCode")##',
  `stock_lock_apply_idx_code` bigint(19) DEFAULT NULL COMMENT '锁库申请idx code',
  `item_idx_code` bigint(19) DEFAULT NULL COMMENT '商品idx code',
  `item_no` varchar(30) DEFAULT NULL COMMENT '商品货号',
  `item_category_idx_code` bigint(19) DEFAULT NULL COMMENT '商品类目idx code',
  `item_brand_idx_code` bigint(19) DEFAULT NULL COMMENT '商品品牌idx code',
  `item_price` int(10) DEFAULT NULL COMMENT '商品售价，以分为单位，而不是以元为单位，取值范围0-2147483647，不可以为null##@NotNull(message = "商品售价不能为空")@Range(min = 0, max = 2147483647, message = "商品售价需要设置0-2147483647")@$2##',
  `lock_num` int(10) DEFAULT NULL COMMENT '锁库数量',
  `upload_status` smallint(1) DEFAULT NULL COMMENT '上传状态，1：上传成功，2：上传失败，0：上传中',
  `remark` varchar(200) DEFAULT NULL COMMENT '备注',
  `create_user_idx_code` bigint(19) DEFAULT NULL COMMENT '创建会员idx code',
  `update_member_idx_code` bigint(19) DEFAULT NULL COMMENT '更新成员idx code',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` timestamp NULL DEFAULT NULL COMMENT '更新时间',
  `status` smallint(1) DEFAULT NULL COMMENT '状态，1：可用的、激活的，2：未激活，0：删除，2：未激活，取值范围为0-9，不可以为null',
  `version` bigint(19) DEFAULT NULL COMMENT '版本号，高并发，乐观锁解决方案',
  `ext` varchar(100) DEFAULT NULL COMMENT '扩展，0-100字符，不可以为null，必须手动设置为空字符串',
  PRIMARY KEY (`idx`),
  KEY `index_slad_apply` (`stock_lock_apply_idx_code`) USING BTREE,
  KEY `index_slad_item_idx_code` (`item_idx_code`) USING BTREE,
  KEY `index_slad_item_no` (`item_no`) USING BTREE,
  KEY `index_slad_item_category` (`item_category_idx_code`) USING BTREE,
  KEY `index_slad_item_brand` (`item_brand_idx_code`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='锁库申请详情表';

-- ----------------------------
-- Table structure for tb_stock_lock_detail
-- ----------------------------
DROP TABLE IF EXISTS `tb_stock_lock_detail`;
CREATE TABLE `tb_stock_lock_detail` (
  `idx` bigint(19) NOT NULL COMMENT '锁库库存主键idx，分布式架构，全局唯一递增',
  `idx_code` bigint(19) DEFAULT NULL COMMENT 'idx code 全局唯一性，解决idx可以通过递增1猜测出来，潜在安全问题##@Long2S(targetField = "idxCode")##',
  `stock_lock_idx_code` bigint(19) DEFAULT NULL COMMENT '锁库库存idx code',
  `item_idx_code` bigint(19) DEFAULT NULL COMMENT '商品idx code',
  `item_no` varchar(30) DEFAULT NULL COMMENT '商品货号',
  `item_name` varchar(200) DEFAULT NULL COMMENT '商品名称',
  `item_price` int(10) DEFAULT NULL COMMENT '商品售价，以分为单位，而不是以元为单位，取值范围0-2147483647，不可以为null##@NotNull(message = "商品售价不能为空")@Range(min = 0, max = 2147483647, message = "商品售价需要设置0-2147483647")@$2##',
  `item_category_idx_code` bigint(19) DEFAULT NULL COMMENT '商品类目idx code',
  `item_brand_idx_code` bigint(19) DEFAULT NULL COMMENT '商品品牌idx code',
  `item_online_status` smallint(1) DEFAULT NULL COMMENT '上下架状态，1：上架，2：下架，3：待上架，0：删除，取值范围为0-9，不可以为null',
  `lock_num` int(10) DEFAULT NULL COMMENT '锁库数量',
  `available_num` int(10) DEFAULT NULL COMMENT '可用库存',
  `remark` varchar(200) DEFAULT NULL COMMENT '备注',
  `create_member_idx_code` bigint(19) DEFAULT NULL COMMENT '创建成员idx code',
  `update_member_idx_code` bigint(19) DEFAULT NULL COMMENT '更新成员idx code',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` timestamp NULL DEFAULT NULL COMMENT '更新时间',
  `status` smallint(1) DEFAULT NULL COMMENT '状态，1：可用的、激活的，2：未激活，0：删除，2：未激活，取值范围为0-9，不可以为null',
  `version` bigint(19) DEFAULT NULL COMMENT '版本号，高并发，乐观锁解决方案',
  `ext` varchar(100) DEFAULT NULL COMMENT '扩展，0-100字符，不可以为null，必须手动设置为空字符串',
  PRIMARY KEY (`idx`),
  KEY `index_sld_stock_lock` (`stock_lock_idx_code`) USING BTREE,
  KEY `index_sld_item_idx_code` (`item_idx_code`) USING BTREE,
  KEY `index_sld_item_no` (`item_no`) USING BTREE,
  KEY `index_sld_item_category` (`item_category_idx_code`) USING BTREE,
  KEY `index_sld_item_brand` (`item_brand_idx_code`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='锁库库存详情表';

-- ----------------------------
-- Table structure for tb_stock_lock_examine_log
-- ----------------------------
DROP TABLE IF EXISTS `tb_stock_lock_examine_log`;
CREATE TABLE `tb_stock_lock_examine_log` (
  `idx` bigint(19) NOT NULL COMMENT '锁库审核流水主键idx，分布式架构，全局唯一递增',
  `idx_code` bigint(19) DEFAULT NULL COMMENT 'idx code 全局唯一性，解决idx可以通过递增1猜测出来，潜在安全问题##@Long2S(targetField = "idxCode")##',
  `stock_lock_apply_idx_code` bigint(19) DEFAULT NULL COMMENT '锁库申请idx code',
  `examine_member_idx_code` bigint(19) DEFAULT NULL COMMENT '审核成员idx code',
  `examine_time` timestamp NULL DEFAULT NULL COMMENT '审核时间',
  `examine_status` smallint(1) DEFAULT NULL COMMENT '审核状态，1：审核通过，2：审核失败',
  `remark` varchar(200) DEFAULT NULL COMMENT '备注',
  `create_member_idx_code` bigint(19) DEFAULT NULL COMMENT '创建成员idx code',
  `update_member_idx_code` bigint(19) DEFAULT NULL COMMENT '更新成员idx code',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` timestamp NULL DEFAULT NULL COMMENT '更新时间',
  `status` smallint(1) DEFAULT NULL COMMENT '状态，1：可用的、激活的，2：未激活，0：删除，2：未激活，取值范围为0-9，不可以为null',
  `version` bigint(19) DEFAULT NULL COMMENT '版本号，高并发，乐观锁解决方案',
  `ext` varchar(100) DEFAULT NULL COMMENT '扩展，0-100字符，不可以为null，必须手动设置为空字符串',
  PRIMARY KEY (`idx`),
  KEY `index_sle_apply` (`stock_lock_apply_idx_code`) USING BTREE,
  KEY `index_sle_member` (`examine_member_idx_code`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='锁库审核流水表';

-- ----------------------------
-- Table structure for tb_stock_lock_pay_log
-- ----------------------------
DROP TABLE IF EXISTS `tb_stock_lock_pay_log`;
CREATE TABLE `tb_stock_lock_pay_log` (
  `idx` bigint(19) NOT NULL COMMENT '锁库支付流水主键idx，分布式架构，全局唯一递增',
  `idx_code` bigint(19) DEFAULT NULL COMMENT 'idx code 全局唯一性，解决idx可以通过递增1猜测出来，潜在安全问题##@Long2S(targetField = "idxCode")##',
  `stock_lock_apply_idx_code` bigint(19) DEFAULT NULL COMMENT '锁库申请idx code',
  `pay_user_idx_code` bigint(19) DEFAULT NULL COMMENT '支付会员idx code',
  `pay_time` timestamp NULL DEFAULT NULL COMMENT '支付时间',
  `pay_status` smallint(1) DEFAULT NULL COMMENT '支付状态，1：支付成功，2：支付失败，0：待支付',
  `remark` varchar(200) DEFAULT NULL COMMENT '备注',
  `create_user_idx_code` bigint(19) DEFAULT NULL COMMENT '创建会员idx code',
  `update_member_idx_code` bigint(19) DEFAULT NULL COMMENT '更新成员idx code',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` timestamp NULL DEFAULT NULL COMMENT '更新时间',
  `status` smallint(1) DEFAULT NULL COMMENT '状态，1：可用的、激活的，2：未激活，0：删除，2：未激活，取值范围为0-9，不可以为null',
  `version` bigint(19) DEFAULT NULL COMMENT '版本号，高并发，乐观锁解决方案',
  `ext` varchar(100) DEFAULT NULL COMMENT '扩展，0-100字符，不可以为null，必须手动设置为空字符串',
  PRIMARY KEY (`idx`),
  KEY `index_slp_apply` (`stock_lock_apply_idx_code`) USING BTREE,
  KEY `index_slp_user` (`pay_user_idx_code`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='锁库支付流水表';
