/*
Navicat MySQL Data Transfer

Source Server         : 172.16.50.242
Source Server Version : 50505
Source Host           : 172.16.50.242:13306
Source Database       : msyt-system

Target Server Type    : MYSQL
Target Server Version : 50505
File Encoding         : 65001

Date: 2017-12-25 15:19:57
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for tb_sys_consume_message
-- ----------------------------
DROP TABLE IF EXISTS `tb_sys_consume_message`;
CREATE TABLE `tb_sys_consume_message` (
  `idx` bigint(19) NOT NULL COMMENT 'MQ消费消息主键idx，分布式架构，全局唯一递增',
  `idx_code` bigint(19) DEFAULT NULL COMMENT '主键idx生成的code##@Long2S(targetField = "idxCode")##',
  `msg_Id` char(32) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'MQ消息Id，固定是32位MD5值，根据msgId可以解决消息重复消费问题',
  `topic` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'MQ的Topic，最大长度50字符',
  `tags` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'MQ的Tags，最大长度50字符',
  `keys` varchar(200) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'MQ的Keys，最大长度200字符',
  `message` varchar(2000) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'MQ消息内容，最大长度2000字符',
  `status` smallint(1) DEFAULT NULL COMMENT '状态，1：可用，0：删除，取值范围0-9，不可以为null',
  `version` bigint(19) DEFAULT NULL COMMENT '版本号，高并发，乐观解决方案，不可以为null',
  `create_by_member_idx` bigint(19) DEFAULT NULL COMMENT '被哪个成员创建',
  `update_by_member_idx` bigint(19) DEFAULT NULL COMMENT '被哪个成员修改',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间，第一次创建时间，后续不可以修改时间',
  `update_time` timestamp NULL DEFAULT NULL COMMENT '更新时间，每次修改，都要更新时间',
  `ext` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '扩展，最大长度100字符',
  PRIMARY KEY (`idx`),
  UNIQUE KEY `index_msgid` (`msg_Id`) USING BTREE,
  KEY `index_scm_idx_code` (`idx_code`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='MQ消费消息表';

-- ----------------------------
-- Table structure for tb_sys_data_dictionary
-- ----------------------------
DROP TABLE IF EXISTS `tb_sys_data_dictionary`;
CREATE TABLE `tb_sys_data_dictionary` (
  `idx` bigint(19) NOT NULL COMMENT '系统数据字典主键idx，必须是分布式架构，全局唯一递增的##@Cache(module = "msyt-system")##',
  `idx_code` bigint(19) DEFAULT NULL COMMENT '主键idx生成的code##@Long2S(targetField = "idxCode")##',
  `dict_code` varchar(30) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '数据字典编码，不可以为null，必须手动赋值为空字符串## @NotNull(message = "字典编码不能为空")##',
  `dict_key` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '数据字典值，不可以为null，必须手动赋值为空字符## @NotNull(message = "字典值不能为空")@Length(min = 1, max = 50, message = "字典值最小1个字符，最大50个字符")##',
  `dict_value` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '数据字典名称，不可以为null，必须手动赋值为空字符串##  @NotNull(message = "字典名称不能为空")@Length(min = 1, max = 50, message = "字典名称最小1个字符，最大50个字符")##',
  `remark` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '备注，最多100个字符，不可以为null，必须手动设置为空字符串##@Length(max = 100, message = "备注最大100个字符")##',
  `zindex` smallint(3) DEFAULT NULL COMMENT '顺序，必须手动设置为0 ## @Range(max = 100, message = "顺序最大为100")##',
  `status` smallint(1) DEFAULT NULL COMMENT '状态，1：可用，0：删除，取值范围0-9，不可以为null',
  `version` bigint(19) DEFAULT NULL COMMENT '版本号，高并发，乐观解决方案，不可以为null',
  `create_by_member_idx` bigint(19) DEFAULT NULL COMMENT '被哪个成员创建',
  `update_by_member_idx` bigint(19) DEFAULT NULL COMMENT '被哪个成员修改',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间，第一次创建时间，后续不可以修改时间',
  `update_time` timestamp NULL DEFAULT NULL COMMENT '更新时间，每次修改，都要更新时间',
  PRIMARY KEY (`idx`),
  KEY `index_sdd_dict_code` (`dict_code`) USING BTREE,
  KEY `index_sdd_idx_code` (`idx_code`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='系统数据字典表';

-- ----------------------------
-- Table structure for tb_sys_member_login_log
-- ----------------------------
DROP TABLE IF EXISTS `tb_sys_member_login_log`;
CREATE TABLE `tb_sys_member_login_log` (
  `idx` bigint(19) NOT NULL COMMENT '系统登录日志主键idx，必须是分布式架构，全局唯一递增的',
  `idx_code` bigint(19) DEFAULT NULL COMMENT '主键idx生成的code##@Long2S(targetField = "idxCode")##',
  `login_name` varchar(20) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '登录名称，不能为null',
  `ip_address` varchar(30) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '登录ip地址，不能为null',
  `login_status` smallint(1) DEFAULT NULL COMMENT '登录状态，1：成功；2:失败',
  `status` smallint(1) DEFAULT NULL COMMENT '状态，1：可用，0：删除，取值范围0-9，不可以为null',
  `version` bigint(19) DEFAULT NULL COMMENT '版本号，高并发，乐观解决方案，不可以为null',
  `create_by_member_idx` bigint(19) DEFAULT NULL COMMENT '被哪个成员创建',
  `update_by_member_idx` bigint(19) DEFAULT NULL COMMENT '被哪个成员修改',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间，第一次创建时间，后续不可以修改时间',
  `update_time` timestamp NULL DEFAULT NULL COMMENT '更新时间，每次修改，都要更新时间',
  `ext` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '扩展字段，最多50个字符，不能为null',
  PRIMARY KEY (`idx`),
  KEY `index_smll_create_by_member_idx` (`create_by_member_idx`) USING BTREE,
  KEY `index_sml_idx_code` (`idx_code`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='系统登录日志表';

-- ----------------------------
-- Table structure for tb_sys_setting
-- ----------------------------
DROP TABLE IF EXISTS `tb_sys_setting`;
CREATE TABLE `tb_sys_setting` (
  `idx` bigint(19) NOT NULL COMMENT '系统设置主键idx，必须是分布式架构，全局唯一递增的##@Cache(module = "msyt-system")##',
  `idx_code` bigint(19) DEFAULT NULL COMMENT '主键idx生成的code##@Long2S(targetField = "idxCode")##',
  `setting_key` varchar(50) DEFAULT NULL COMMENT '设置编码##@Length(min = 2, max = 50, message = "设置编码最小2个字符，最大50个字符")##',
  `setting_value` varchar(200) DEFAULT NULL COMMENT '设置value值##@Length(min = 1, max = 200, message = "设置值最小1个字符，最大200个字符")##',
  `setting_env` varchar(10) DEFAULT NULL COMMENT '所属环境##@Length(max = 10, message = "所属环境最大10个字符")##',
  `remark` varchar(250) DEFAULT NULL COMMENT '备注，最多250个字符，不可以为null，必须手动设置为空字符串##@Length(max = 250, message = "备注最大250个字符")##',
  `status` smallint(1) DEFAULT NULL COMMENT '状态，1：可用，0：删除，取值范围0-9，不可以为null',
  `version` bigint(19) DEFAULT NULL COMMENT '版本号，高并发，乐观解决方案，不可以为null',
  `create_by_member_idx` bigint(19) DEFAULT NULL COMMENT '被哪个成员创建',
  `update_by_member_idx` bigint(19) DEFAULT NULL COMMENT '被哪个成员修改',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间，第一次创建时间，后续不可以修改时间',
  `update_time` timestamp NULL DEFAULT NULL COMMENT '更新时间，每次修改，都要更新时间',
  `ext` varchar(50) DEFAULT NULL COMMENT '扩展字段',
  PRIMARY KEY (`idx`),
  KEY `index_tss_setting_key` (`setting_key`) USING BTREE,
  KEY `index_tss_status` (`status`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='系统设置表';

-- ----------------------------
-- Table structure for tb_sys_verify_code_pic
-- ----------------------------
DROP TABLE IF EXISTS `tb_sys_verify_code_pic`;
CREATE TABLE `tb_sys_verify_code_pic` (
  `idx` bigint(19) NOT NULL COMMENT '验证码图片主键idx，必须是分布式架构，全局唯一递增的##@Cache(module = "msyt-system")##',
  `idx_code` bigint(19) DEFAULT NULL COMMENT '验证码图片主键idx生成的code##@Long2S(targetField = "idxCode")##',
  `type` smallint(1) DEFAULT NULL COMMENT '类型，不能为空，1、洋桃供应链后台 2、洋桃商城##@NotNull(message = "类型不能为空")@Range(min = 1, max = 9, message = "类型取值区间1-9")##',
  `image_path` varchar(200) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '验证码图片路径##@NotNull(message = "验证码图片路径不能为空")@Length(max = 200, message = "验证码图片路径最大200个字符")@DynamicS##',
  `remark` varchar(100) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '备注，最多100个字符，不可以为null，必须手动设置为空字符串##@Length(max = 100, message = "备注最大100个字符")##',
  `status` smallint(1) DEFAULT NULL COMMENT '状态，1：可用，0：删除，取值范围0-9，不可以为null',
  `version` bigint(19) DEFAULT NULL COMMENT '版本号，高并发，乐观解决方案，不可以为null',
  `create_by_member_idx` bigint(19) DEFAULT NULL COMMENT '被哪个成员创建',
  `update_by_member_idx` bigint(19) DEFAULT NULL COMMENT '被哪个成员修改',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间，第一次创建时间，后续不可以修改时间',
  `update_time` timestamp NULL DEFAULT NULL COMMENT '更新时间，每次修改，都要更新时间',
  `ext` varchar(50) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '扩展字段',
  PRIMARY KEY (`idx`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
