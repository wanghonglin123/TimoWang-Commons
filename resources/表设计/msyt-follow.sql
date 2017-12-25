/*
Navicat MySQL Data Transfer

Source Server         : 172.16.50.242
Source Server Version : 50505
Source Host           : 172.16.50.242:13306
Source Database       : msyt-follow

Target Server Type    : MYSQL
Target Server Version : 50505
File Encoding         : 65001

Date: 2017-12-25 15:15:04
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for tb_follow_item
-- ----------------------------
DROP TABLE IF EXISTS `tb_follow_item`;
CREATE TABLE `tb_follow_item` (
  `idx` bigint(19) NOT NULL COMMENT '计量单位主键idx，分布式架构，全局唯一递增##@Cache(module = "msyt-follow")@MQ(module = "msyt-follow", moduleAlias = "follow", autoAck = false)##',
  `idx_code` bigint(19) DEFAULT NULL COMMENT 'idx code 全局唯一性，解决idx可以通过递增1猜测出来，潜在安全问题##@Long2S(targetField = "idxCode")##',
  `item_idx_code` bigint(19) DEFAULT NULL COMMENT '商品idxCode',
  `user_idx_code` bigint(19) DEFAULT NULL COMMENT '会员idxCode',
  `status` smallint(1) DEFAULT NULL COMMENT '区域状态，1：可用，0：删除，取值范围为0-9，不可以为null，必须手动设置为0或者1',
  `version` bigint(19) DEFAULT NULL COMMENT '版本号，高并发，乐观锁的解决方案，不可以为null，必须赋值',
  `create_by_member_idx` bigint(19) DEFAULT NULL COMMENT '区域被哪位成员（member_idx）创建的，不可以为null',
  `update_by_member_idx` bigint(19) DEFAULT NULL COMMENT '区域被哪位成员（member_idx）修改的，不可以为null',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间，后续不可以再更新时间##@EnYyyyMMddHHmmss##',
  `update_time` timestamp NULL DEFAULT NULL COMMENT '更新时间，每一次都要更新##@EnYyyyMMddHHmmss##',
  `ext` varchar(100) DEFAULT NULL COMMENT '扩展字段，不可以为null，默认为空字符串',
  `remark` varchar(100) DEFAULT NULL COMMENT '备注，不能为Null',
  PRIMARY KEY (`idx`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
