/*
Navicat MySQL Data Transfer

Source Server         : 172.16.50.242
Source Server Version : 50505
Source Host           : 172.16.50.242:13306
Source Database       : msyt-thirdplatform

Target Server Type    : MYSQL
Target Server Version : 50505
File Encoding         : 65001

Date: 2017-12-25 15:20:07
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for tb_third_log
-- ----------------------------
DROP TABLE IF EXISTS `tb_third_log`;
CREATE TABLE `tb_third_log` (
  `idx` bigint(19) NOT NULL COMMENT '日志记录主键idx，必须是分布式架构，全局唯一递增的',
  `idx_code` bigint(19) DEFAULT NULL COMMENT '主键idx生成的code##@Long2S(targetField = "idxCode")##',
  `platform_id` smallint(1) DEFAULT NULL COMMENT '第三方平台ID，必填##@NotNull(message = "请求不能为空")##',
  `req_html` text COMMENT '请求参数报文，必填，最多65535个字符，不可以为null，必须手动设置为空字符串##@NotNull(message = "请求不能为空")@Length(max = 65535, message = "请求最大65535个字符")##',
  `req_action` varchar(200) DEFAULT NULL COMMENT '请求接口，必填##@NotNull(message = "请求接口不能为空")@Length(max = 200, message = "请求接口最大200个字符")##',
  `action_code` varchar(20) DEFAULT NULL COMMENT '请求接口编码，必填##@NotNull(message = "请求接口编码不能为空")@Length(max = 20, message = "请求接口编码最大20个字符")##',
  `resp_html` text COMMENT '响应报文，必填，最多65535个字符，不可以为null，必须手动设置为空字符串##@NotNull(message = "响应不能为空")@Length(max = 65535, message = "响应最大65535个字符")##',
  `remark` varchar(100) DEFAULT NULL COMMENT '备注，最多100个字符，不可以为null，必须手动设置为空字符串##@Length(max = 100, message = "备注最大100个字符")##',
  `retry_times` int(11) DEFAULT NULL COMMENT '请求重试次数，必填，默认1##@NotNull(message = "请求重试次数不能为空")##',
  `status` smallint(1) DEFAULT NULL COMMENT '状态，1：可用，0：删除，2、异常数据、3、重试成功，4、重试成功，取值范围0-9，不可以为null',
  `version` bigint(19) DEFAULT NULL COMMENT '版本号，高并发，乐观解决方案，不可以为null',
  `create_by_member_idx` bigint(19) DEFAULT NULL COMMENT '被哪个成员创建',
  `update_by_member_idx` bigint(19) DEFAULT NULL COMMENT '被哪个成员修改',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间，第一次创建时间，后续不可以修改时间',
  `update_time` timestamp NULL DEFAULT NULL COMMENT '更新时间，每次修改，都要更新时间',
  `ext` varchar(50) DEFAULT NULL COMMENT '扩展字段',
  PRIMARY KEY (`idx`),
  KEY `index_platform` (`platform_id`) USING BTREE,
  KEY `index_req_code` (`action_code`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for tb_third_log_detail
-- ----------------------------
DROP TABLE IF EXISTS `tb_third_log_detail`;
CREATE TABLE `tb_third_log_detail` (
  `idx` bigint(19) NOT NULL COMMENT '日志记录主键idx，必须是分布式架构，全局唯一递增的',
  `idx_code` bigint(19) DEFAULT NULL COMMENT '主键idx生成的code##@Long2S(targetField = "idxCode")##',
  `third_log_idx_code` bigint(19) DEFAULT NULL COMMENT '第三方日志idxcode，必填##@NotNull(message = "第三方日志idxcode不能为空")##',
  `msg` longtext COMMENT '报文，必填，最多4294967295个字符，不可以为null，必须手动设置为空字符串',
  `msg_type` smallint(1) DEFAULT NULL COMMENT '状态，0：请求，1：响应，取值范围0-9，不可以为null',
  `remark` varchar(100) DEFAULT NULL COMMENT '备注，最多100个字符，不可以为null，必须手动设置为空字符串##@Length(max = 100, message = "备注最大100个字符")##',
  `status` smallint(1) DEFAULT NULL COMMENT '状态，1：可用，0：删除，2、未激活，取值范围0-9，不可以为null',
  `version` bigint(19) DEFAULT NULL COMMENT '版本号，高并发，乐观解决方案，不可以为null',
  `create_by_member_idx` bigint(19) DEFAULT NULL COMMENT '被哪个成员创建',
  `update_by_member_idx` bigint(19) DEFAULT NULL COMMENT '被哪个成员修改',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间，第一次创建时间，后续不可以修改时间',
  `update_time` timestamp NULL DEFAULT NULL COMMENT '更新时间，每次修改，都要更新时间',
  `ext` varchar(50) DEFAULT NULL COMMENT '扩展字段',
  PRIMARY KEY (`idx`),
  UNIQUE KEY `uniq_idx_code` (`idx_code`) USING BTREE,
  KEY `index_third_log_idx_code` (`third_log_idx_code`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='第三方日志明细表';
