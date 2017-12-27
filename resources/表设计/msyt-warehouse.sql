/*
Navicat MySQL Data Transfer

Source Server         : 172.16.50.242
Source Server Version : 50505
Source Host           : 172.16.50.242:13306
Source Database       : msyt-warehouse

Target Server Type    : MYSQL
Target Server Version : 50505
File Encoding         : 65001

Date: 2017-12-25 15:21:27
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for tb_warehouse
-- ----------------------------
DROP TABLE IF EXISTS `tb_warehouse`;
CREATE TABLE `tb_warehouse` (
  `idx` bigint(19) NOT NULL COMMENT '商品仓库主键idx，分布式架构，全局唯一递增',
  `idx_code` bigint(19) DEFAULT NULL COMMENT '主键idx生成的code##@Long2S(targetField = "idxCode")##',
  `item_idx` bigint(19) DEFAULT NULL COMMENT '商品主键idx，不可以为null，必须手动设置为0##@NotNull(message = "商品不能为空")##',
  `real_time_inventory` int(10) DEFAULT NULL COMMENT '实时库存，取值范围为0-2147483647，不可以为null##@NotNull(message = "实时库存不能为空")@Range(min = 0, max = 2147483647, message = "实时库存需要设置0-2147483647")@Modified##',
  `safe_inventory` int(10) DEFAULT NULL COMMENT '安全库存，取值范围为0-2147483647，不可以为null，必须手动设置默认值为3##@NotNull(message = "安全库存不能为空")@Range(min = 0, max = 2147483647, message = "安全库存需要设置0-2147483647")@Modified##',
  `lock_stock_num` int(10) DEFAULT NULL COMMENT '锁定库存数量',
  `delivery_coefficient` smallint(2) DEFAULT NULL COMMENT '发货系数，取值范围为0-99，不可以为null##@NotNull(message = "发货系数不能为空")@Range(min = 0, max = 99, message = "发货系数取值区间1-99")@Modified##',
  `is_key_order` smallint(1) DEFAULT NULL COMMENT '是否一键下单，1：是，0：否，取值范围为0-9，不可以为null##@NotNull(message = "是否一键下单不能为空")@Range(min = 0, max = 9, message = "是否一键下单取值区间0-9")@Modified##',
  `is_free_shipping` smallint(1) DEFAULT NULL COMMENT '是否免邮，1：是，0：否，取值范围为0-9，不可以为null##@NotNull(message = "是否免邮不能为空")@Range(min = 0, max = 9, message = "是否免邮取值区间0-9")@Modified##',
  `publish_status` smallint(1) DEFAULT NULL COMMENT '发布状态，0-未发布 1-已发布',
  `sync_time` timestamp NULL DEFAULT NULL COMMENT '库存同步时间',
  `remark` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '备注，0-100字符，不可以为null，必须手动设置为空字符串## @Length(max = 100, message = "备注最大100个字符")##',
  `create_by_member_idx` bigint(19) DEFAULT NULL COMMENT '创建成员idx，不可以为null',
  `update_by_member_idx` bigint(19) DEFAULT NULL COMMENT '修改成员idx，不可以为null',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间，第一次创建时间，后续不可以修改时间',
  `update_time` timestamp NULL DEFAULT NULL COMMENT '更新时间，每一次修改都要更新时间',
  `status` smallint(1) DEFAULT NULL COMMENT '状态，1：可用的、激活的，2：未激活，0：删除，取值范围为0-9，不可以为null',
  `version` bigint(19) DEFAULT NULL COMMENT '版本号，高并发，乐观锁的解决方案',
  `ext` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '扩展，0-100字符，不可以为null，必须手动设置为空字符串',
  PRIMARY KEY (`idx`),
  KEY `index_warehouse_item` (`item_idx`) USING BTREE,
  KEY `index_warehouse_idx_code` (`idx_code`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='商品仓库表';

-- ----------------------------
-- Table structure for tb_warehouse_official
-- ----------------------------
DROP TABLE IF EXISTS `tb_warehouse_official`;
CREATE TABLE `tb_warehouse_official` (
  `idx` bigint(19) NOT NULL COMMENT '正式商品仓库主键idx，分布式架构，全局唯一递增',
  `idx_code` bigint(19) DEFAULT NULL COMMENT '主键idx生成的code##@Long2S(targetField = "idxCode")##',
  `item_official_idx` bigint(19) DEFAULT NULL COMMENT '正式商品主键idx，不可以为null，必须手动设置为0##@NotNull(message = "正式商品不能为空")##',
  `real_time_inventory` int(10) DEFAULT NULL COMMENT '实时库存，取值范围为0-2147483647，不可以为null##@NotNull(message = "实时库存不能为空")@Range(min = 0, max = 2147483647, message = "实时库存需要设置0-2147483647")@Modified##',
  `safe_inventory` int(10) DEFAULT NULL COMMENT '安全库存，取值范围为0-2147483647，不可以为null，必须手动设置默认值为3##@NotNull(message = "安全库存不能为空")@Range(min = 0, max = 2147483647, message = "安全库存需要设置0-2147483647")@Modified##',
  `delivery_coefficient` smallint(2) DEFAULT NULL COMMENT '发货系数，取值范围为0-99，不可以为null##@NotNull(message = "发货系数不能为空")@Range(min = 0, max = 99, message = "发货系数取值区间1-99")@Modified##',
  `is_key_order` smallint(1) DEFAULT NULL COMMENT '是否一键下单，1：是，0：否，取值范围为0-9，不可以为null##@NotNull(message = "是否一键下单不能为空")@Range(min = 0, max = 9, message = "是否一键下单取值区间0-9")@Modified##',
  `is_free_shipping` smallint(1) DEFAULT NULL COMMENT '是否免邮，1：是，0：否，取值范围为0-9，不可以为null##@NotNull(message = "是否免邮不能为空")@Range(min = 0, max = 9, message = "是否免邮取值区间0-9")@Modified##',
  `sync_time` timestamp NULL DEFAULT NULL COMMENT '库存同步时间',
  `remark` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '备注，0-100字符，不可以为null，必须手动设置为空字符串## @Length(max = 100, message = "备注最大100个字符")##',
  `create_by_member_idx` bigint(19) DEFAULT NULL COMMENT '创建成员idx，不可以为null',
  `update_by_member_idx` bigint(19) DEFAULT NULL COMMENT '修改成员idx，不可以为null',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间，第一次创建时间，后续不可以修改时间',
  `update_time` timestamp NULL DEFAULT NULL COMMENT '更新时间，每一次修改都要更新时间',
  `status` smallint(1) DEFAULT NULL COMMENT '状态，1：可用的、激活的，2：未激活，0：删除，取值范围为0-9，不可以为null',
  `version` bigint(19) DEFAULT NULL COMMENT '版本号，高并发，乐观锁的解决方案',
  `ext` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '扩展，0-100字符，不可以为null，必须手动设置为空字符串',
  PRIMARY KEY (`idx`),
  KEY `index_two_item_official_idx` (`item_official_idx`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='正式商品仓库表';

-- ----------------------------
-- Table structure for tb_warehouse_type
-- ----------------------------
DROP TABLE IF EXISTS `tb_warehouse_type`;
CREATE TABLE `tb_warehouse_type` (
  `idx` bigint(19) NOT NULL COMMENT '商品仓库类型主键idx，分布式架构，全局唯一递增',
  `idx_code` bigint(19) DEFAULT NULL COMMENT '主键idx生成的code##@Long2S(targetField = "idxCode")##',
  `warehouse_name` varchar(50) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '仓库名称##@Length(min = 2, max = 50, message = "仓库名称最小2个字符，最大50个字符")##',
  `warehouse_code` smallint(1) DEFAULT NULL COMMENT '仓库编码##@Range(min = 1, max = 999, message = "仓库编码最小为1，最大为999")##',
  `mantissa` smallint(1) DEFAULT NULL COMMENT '货号尾数,限制两位大于等于0的整数## @Range(min = 10, max = 99, message = "货号尾数最小为10，最大为99")##',
  `zindex` smallint(1) DEFAULT NULL COMMENT '排序##@Range(max = 100, message = "顺序最大为100")##',
  `remark` varchar(100) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '备注，最大100个字符##@Length(max = 100, message = "备注最大100个字符")##',
  `create_by_member_idx` bigint(19) DEFAULT NULL COMMENT '创建成员idx，不可以为null',
  `update_by_member_idx` bigint(19) DEFAULT NULL COMMENT '修改成员idx，不可以为null',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` timestamp NULL DEFAULT NULL COMMENT '更新时间',
  `status` smallint(1) DEFAULT NULL COMMENT '状态，1：可用的、激活的，2：未激活，0：删除，取值范围为0-9，不可以为null',
  `version` bigint(19) DEFAULT NULL COMMENT '版本号，高并发，乐观锁的解决方案',
  `ext` varchar(100) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '扩展，0-100字符，不可以为null，必须手动设置为空字符串',
  PRIMARY KEY (`idx`),
  KEY `index_tiwt_warehouse_code` (`warehouse_code`) USING BTREE,
  KEY `index_tiwt_status` (`status`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='商品仓库类型';
