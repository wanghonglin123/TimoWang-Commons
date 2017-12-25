/*
Navicat MySQL Data Transfer

Source Server         : 172.16.50.242
Source Server Version : 50505
Source Host           : 172.16.50.242:13306
Source Database       : msyt-sms

Target Server Type    : MYSQL
Target Server Version : 50505
File Encoding         : 65001

Date: 2017-12-25 15:18:55
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for tb_sms
-- ----------------------------
DROP TABLE IF EXISTS `tb_sms`;
CREATE TABLE `tb_sms` (
  `idx` bigint(19) NOT NULL COMMENT '主键idx，分布式架构，全局唯一递增##@Cache(module = "msyt-sms")@MQ(module = "msyt-sms", moduleAlias = "sms", autoAck = false)##',
  `idx_code` bigint(19) DEFAULT NULL COMMENT 'idx code 全局唯一性，解决idx可以通过递增1猜测出来，潜在安全问题##@Long2S(targetField = "idxCode")##',
  `user_idxcode` bigint(19) DEFAULT NULL COMMENT '会员idxCode',
  `telphone` varchar(5000) DEFAULT NULL COMMENT '手机号码',
  `flag` smallint(2) DEFAULT NULL COMMENT '动作，比如注册，忘记密码，修改密码动作等。 ',
  `content` varchar(300) DEFAULT NULL COMMENT '短信内容',
  `fail_reason` varchar(300) DEFAULT NULL COMMENT '失败原因',
  `remark` varchar(100) DEFAULT NULL COMMENT '备注，不能为Null',
  `status` smallint(1) DEFAULT NULL COMMENT '区域状态，1：可用，0：删除，取值范围为0-9，不可以为null，必须手动设置为0或者1',
  `version` bigint(19) DEFAULT NULL COMMENT '版本号，高并发，乐观锁的解决方案，不可以为null，必须赋值',
  `create_by_member_idx` bigint(19) DEFAULT NULL COMMENT '被哪位成员（member_idx）创建的，不可以为null',
  `update_by_member_idx` bigint(19) DEFAULT NULL COMMENT '被哪位成员（member_idx）修改的，不可以为null',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间，后续不可以再更新时间##@EnYyyyMMddHHmmss##',
  `update_time` timestamp NULL DEFAULT NULL COMMENT '更新时间，每一次都要更新##@EnYyyyMMddHHmmss##',
  `ext` varchar(100) DEFAULT NULL COMMENT '扩展字段，不可以为null，默认为空字符串',
  PRIMARY KEY (`idx`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='短信信息类';

-- ----------------------------
-- Table structure for tb_sms_template
-- ----------------------------
DROP TABLE IF EXISTS `tb_sms_template`;
CREATE TABLE `tb_sms_template` (
  `idx` bigint(19) NOT NULL COMMENT '主键idx，分布式架构，全局唯一递增##@Cache(module = "msyt-sms")@MQ(module = "msyt-sms", moduleAlias = "sms", autoAck = false)##',
  `idx_code` bigint(19) DEFAULT NULL COMMENT 'idx code 全局唯一性，解决idx可以通过递增1猜测出来，潜在安全问题##@Long2S(targetField = "idxCode")##',
  `code` varchar(30) DEFAULT NULL COMMENT '模板编码',
  `name` varchar(30) DEFAULT NULL COMMENT '模板名称',
  `content` varchar(300) DEFAULT NULL COMMENT '模板内容',
  `remark` varchar(100) DEFAULT NULL COMMENT '备注，不能为Null',
  `status` smallint(1) DEFAULT NULL COMMENT '区域状态，1：可用，0：删除，取值范围为0-9，不可以为null，必须手动设置为0或者1',
  `version` bigint(19) DEFAULT NULL COMMENT '版本号，高并发，乐观锁的解决方案，不可以为null，必须赋值',
  `create_by_member_idx` bigint(19) DEFAULT NULL COMMENT '被哪位成员（member_idx）创建的，不可以为null',
  `update_by_member_idx` bigint(19) DEFAULT NULL COMMENT '被哪位成员（member_idx）修改的，不可以为null',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间，后续不可以再更新时间##@EnYyyyMMddHHmmss##',
  `update_time` timestamp NULL DEFAULT NULL COMMENT '更新时间，每一次都要更新##@EnYyyyMMddHHmmss##',
  `ext` varchar(100) DEFAULT NULL COMMENT '扩展字段，不可以为null，默认为空字符串',
  PRIMARY KEY (`idx`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='短信模板';
