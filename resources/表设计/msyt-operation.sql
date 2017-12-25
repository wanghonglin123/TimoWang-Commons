/*
Navicat MySQL Data Transfer

Source Server         : 172.16.50.242
Source Server Version : 50505
Source Host           : 172.16.50.242:13306
Source Database       : msyt-operation

Target Server Type    : MYSQL
Target Server Version : 50505
File Encoding         : 65001

Date: 2017-12-25 15:16:04
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for tb_operation_ad
-- ----------------------------
DROP TABLE IF EXISTS `tb_operation_ad`;
CREATE TABLE `tb_operation_ad` (
  `idx` bigint(19) NOT NULL COMMENT '广告主键idx，分布式架构，全局唯一递增##@Cache(module = "msyt-operation")@MQ(module = "msyt-operation", moduleAlias = "operation", autoAck = false)##',
  `idx_code` bigint(19) DEFAULT NULL COMMENT 'idx code 全局唯一性，解决idx可以通过递增1猜测出来，潜在安全问题##@Long2S(targetField = "idxCode")##',
  `ad_type` smallint(1) DEFAULT NULL COMMENT '广告类型 1：轮播广告 2：类目广告',
  `category_idxcode` bigint(19) DEFAULT NULL COMMENT '类目idxCode',
  `ad_url` varchar(300) DEFAULT NULL COMMENT '广告url',
  `ad_title` varchar(20) DEFAULT NULL COMMENT '广告标题',
  `ad_subtitle` varchar(30) DEFAULT NULL COMMENT '广告子标题',
  `img_name` varchar(30) DEFAULT NULL COMMENT '图片名称',
  `img_big` varchar(300) DEFAULT NULL COMMENT '头像小图##@DynamicS##',
  `img_middle` varchar(300) DEFAULT NULL COMMENT '头像中图##@DynamicS##',
  `img_small` varchar(300) DEFAULT NULL COMMENT '头像大图##@DynamicS##',
  `style` varchar(1000) DEFAULT NULL,
  `zindex` smallint(2) DEFAULT NULL COMMENT '广告排序号',
  `slide_tips` varchar(300) DEFAULT NULL COMMENT '轮播广告语，可以存放多个，用 | 分割',
  `remark` varchar(100) DEFAULT NULL COMMENT '备注，不能为Null',
  `status` smallint(1) DEFAULT NULL COMMENT '广告状态，1：可用，0：删除，取值范围为0-9，不可以为null，必须手动设置为0或者1',
  `version` bigint(19) DEFAULT NULL COMMENT '版本号，高并发，乐观锁的解决方案，不可以为null，必须赋值',
  `create_by_member_idx` bigint(19) DEFAULT NULL COMMENT '被哪位成员（member_idx）创建的，不可以为null',
  `update_by_member_idx` bigint(19) DEFAULT NULL COMMENT '被哪位成员（member_idx）修改的，不可以为null',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间，后续不可以再更新时间##@EnYyyyMMddHHmmss##',
  `update_time` timestamp NULL DEFAULT NULL COMMENT '更新时间，每一次都要更新##@EnYyyyMMddHHmmss##',
  `ext` varchar(100) DEFAULT NULL COMMENT '扩展字段，不可以为null，默认为空字符串',
  PRIMARY KEY (`idx`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='运营广告表';

-- ----------------------------
-- Table structure for tb_operation_big_banner
-- ----------------------------
DROP TABLE IF EXISTS `tb_operation_big_banner`;
CREATE TABLE `tb_operation_big_banner` (
  `idx` bigint(19) NOT NULL COMMENT '主键idx，分布式架构，全局唯一递增##@Cache(module = "msyt-operation")@MQ(module = "msyt-operation", moduleAlias = "operation", autoAck = false)##',
  `idx_code` bigint(19) DEFAULT NULL COMMENT 'idx code 全局唯一性，解决idx可以通过递增1猜测出来，潜在安全问题##@Long2S(targetField = "idxCode")##',
  `titles` varchar(1000) DEFAULT NULL COMMENT '广告标题，可以多个，以,分割，可以为null',
  `urls` varchar(300) DEFAULT NULL COMMENT '广告链接不能为空，可以有多个，以,分割url',
  `type` smallint(2) DEFAULT NULL COMMENT '横幅广告类型， 1：固定横幅广告，2：动态横幅广告',
  `style` varchar(1000) DEFAULT NULL COMMENT '横幅样式',
  `img_big` varchar(250) DEFAULT NULL COMMENT '头像大图##@DynamicS##',
  `img_middle` varchar(250) DEFAULT NULL COMMENT '头像中图##@DynamicS##',
  `img_small` varchar(250) DEFAULT NULL COMMENT '头像小图##@DynamicS##',
  `img_width` int(10) DEFAULT NULL COMMENT '图片宽度',
  `img_height` int(10) DEFAULT NULL COMMENT '图片高度',
  `begin_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '广告开始时间##@EnYyyyMMddHHmmss##',
  `end_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '广告结束时间##@EnYyyyMMddHHmmss##',
  `status` smallint(1) DEFAULT NULL COMMENT '状态，1：启用，0：删除，2：停用，取值范围为0-9，不可以为null，必须手动设置为0或者1',
  `version` bigint(19) DEFAULT NULL COMMENT '版本号，高并发，乐观锁的解决方案，不可以为null，必须赋值',
  `create_by_member_idx` bigint(19) DEFAULT NULL COMMENT '被哪位成员（member_idx）创建的，不可以为null',
  `update_by_member_idx` bigint(19) DEFAULT NULL COMMENT '被哪位成员（member_idx）修改的，不可以为null',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间，后续不可以再更新时间##@EnYyyyMMddHHmmss##',
  `update_time` timestamp NULL DEFAULT NULL COMMENT '更新时间，每一次都要更新##@EnYyyyMMddHHmmss##',
  `remark` varchar(100) DEFAULT NULL COMMENT '备注，不能为Null',
  `ext` varchar(100) DEFAULT NULL COMMENT '扩展字段，不可以为null，默认为空字符串',
  PRIMARY KEY (`idx`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='运营横幅广告表';

-- ----------------------------
-- Table structure for tb_operation_content
-- ----------------------------
DROP TABLE IF EXISTS `tb_operation_content`;
CREATE TABLE `tb_operation_content` (
  `idx` bigint(19) NOT NULL COMMENT '主键idx，分布式架构，全局唯一递增##@Cache(module = "msyt-operation")@MQ(module = "msyt-operation", moduleAlias = "operation", autoAck = false)##',
  `idx_code` bigint(19) DEFAULT NULL COMMENT 'idx code 全局唯一性，解决idx可以通过递增1猜测出来，潜在安全问题##@Long2S(targetField = "idxCode")##',
  `name` varchar(30) DEFAULT NULL COMMENT '内容名称',
  `code` varchar(30) DEFAULT NULL COMMENT '编码，在可用状态必须唯一。',
  `content` varchar(12000) DEFAULT NULL COMMENT '内容',
  `type` smallint(1) DEFAULT NULL COMMENT '内容类型 1：html',
  `remark` varchar(100) DEFAULT NULL COMMENT '备注，不能为Null',
  `status` smallint(1) DEFAULT NULL COMMENT '区域状态，1：可用，0：删除，取值范围为0-9，不可以为null，必须手动设置为0或者1',
  `version` bigint(19) DEFAULT NULL COMMENT '版本号，高并发，乐观锁的解决方案，不可以为null，必须赋值',
  `start_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '开始时间##@EnYyyyMMddHHmmss##',
  `end_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '结束时间##@EnYyyyMMddHHmmss##',
  `create_by_member_idx` bigint(19) DEFAULT NULL COMMENT '被哪位成员（member_idx）创建的，不可以为null',
  `update_by_member_idx` bigint(19) DEFAULT NULL COMMENT '被哪位成员（member_idx）修改的，不可以为null',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间，后续不可以再更新时间##@EnYyyyMMddHHmmss##',
  `update_time` timestamp NULL DEFAULT NULL COMMENT '更新时间，每一次都要更新##@EnYyyyMMddHHmmss##',
  `ext` varchar(100) DEFAULT NULL COMMENT '扩展字段，不可以为null，默认为空字符串',
  PRIMARY KEY (`idx`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='运营内容表';
