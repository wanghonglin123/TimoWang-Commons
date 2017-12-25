/*
Navicat MySQL Data Transfer

Source Server         : 172.16.50.242
Source Server Version : 50505
Source Host           : 172.16.50.242:13306
Source Database       : msyt-user

Target Server Type    : MYSQL
Target Server Version : 50505
File Encoding         : 65001

Date: 2017-12-25 15:20:32
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for tb_user
-- ----------------------------
DROP TABLE IF EXISTS `tb_user`;
CREATE TABLE `tb_user` (
  `idx` bigint(19) NOT NULL COMMENT '会员主键idx，分布式架构，全局唯一递增##@Cache(module = "msyt-user")##',
  `idx_code` bigint(19) DEFAULT NULL COMMENT 'idx code 全局唯一性，解决idx可以通过递增1猜测出来，潜在安全问题##@Long2S(targetField = "idxCode")##',
  `account` varchar(20) DEFAULT NULL COMMENT '会员账号，默认是手机号码，必填##@NotNull(message = "会员账号不能为空")',
  `password` varchar(100) DEFAULT NULL COMMENT '密码',
  `default_password` varchar(100) DEFAULT NULL COMMENT '首次创建帐号的密码',
  `name` varchar(25) DEFAULT NULL COMMENT '会员名称##@NotNull(message = "会员名称不能为空")@Size(min = 5, max = 25, message = "会员名称，最少5个字符，最多25个字符")##',
  `gender` smallint(1) DEFAULT NULL COMMENT '性别（0：保密；1：男；2：女；3：第三性别）',
  `company_name` varchar(25) DEFAULT NULL COMMENT '企业名称##@NotNull(message = "企业名称不能为空")@Size(min = 5, max = 25, message = "企业名称，最少5个字符，最多25个字符")##',
  `user_level_idx_code` bigint(19) DEFAULT NULL COMMENT '会员等级idx code',
  `email` varchar(255) DEFAULT NULL COMMENT '绑定邮箱',
  `contacts` varchar(20) DEFAULT NULL COMMENT '联系人##@NotNull(message = "联系人不能为空")@Size(min = 2, max = 20, message = "联系人，最少2个字符，最多20个字符")##',
  `contacts_telephone` varchar(50) DEFAULT NULL COMMENT '联系电话，固话，区号+电话号码',
  `contacts_mobile` varchar(50) DEFAULT NULL COMMENT '联系人手机号',
  `remark` varchar(300) DEFAULT NULL COMMENT '备注，最多300个字符##@Length(max = 300, message = "备注最多300个字符")##',
  `payway_online` tinyint(1) DEFAULT NULL COMMENT '在线支付（0：非在线支付，1：在线支付）',
  `payway_period` tinyint(1) DEFAULT NULL COMMENT '账期支付（0：非账期支付，1：账期支付）',
  `payway_period_time` datetime DEFAULT NULL COMMENT '账期##@EnYyyyMMddHHmmss@Date(pattern = MsOnionDatePattern.SINCE)##',
  `line_of_credit` int(11) DEFAULT NULL COMMENT '信用额度',
  `audit_status` smallint(1) DEFAULT NULL COMMENT '审核状态（1：通过；2：驳回；3：待审核）',
  `reject_reason` varchar(100) DEFAULT NULL COMMENT '驳回原因',
  `retry_count` smallint(2) DEFAULT NULL COMMENT '重试次数，连续输错5次密码，帐号将被锁，30分钟后才能登录',
  `create_by_member_idx` bigint(19) DEFAULT NULL COMMENT '创建成员idx，不可以为null',
  `update_by_member_idx` bigint(19) DEFAULT NULL COMMENT '修改成员idx，不可以为null',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间，第一次创建时间，后续不可以修改时间##@EnYyyyMMddHHmmss##',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间，每一次修改都要更新时间##@EnYyyyMMddHHmmss##',
  `status` smallint(6) DEFAULT NULL COMMENT '状态，1：正常，2：禁用，0：删除，取值范围为0-9，不可以为null',
  `version` bigint(19) DEFAULT NULL COMMENT '版本号，高并发，乐观锁的解决方案',
  `ext` varchar(100) DEFAULT NULL COMMENT '扩展，0-100字符，不可以为null，必须手动设置为空字符串',
  PRIMARY KEY (`idx`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='会员表';

-- ----------------------------
-- Table structure for tb_user_ext
-- ----------------------------
DROP TABLE IF EXISTS `tb_user_ext`;
CREATE TABLE `tb_user_ext` (
  `idx` bigint(19) NOT NULL COMMENT '会员扩展表主键idx，必须是分布式架构，全局唯一递增的##@Cache(module = "msyt-user")##',
  `idx_code` bigint(19) DEFAULT NULL COMMENT '主键idx生成的code##@Long2S(targetField = "idxCode")##',
  `user_idx_code` bigint(19) DEFAULT NULL COMMENT '会员主键idx生成的code',
  `can_download_items` smallint(1) DEFAULT NULL COMMENT '能否导出商品（0：不能；1：能）',
  `download_items_allow_count` smallint(2) DEFAULT NULL COMMENT '1天（24小时）下载次数',
  `has_download_count` smallint(2) DEFAULT NULL COMMENT '已下载次数',
  `download_items_last_time` timestamp NULL DEFAULT NULL COMMENT '最后一次下载的时间',
  `create_by_member_idx` bigint(19) DEFAULT NULL COMMENT '创建成员idx，不可以为null',
  `update_by_member_idx` bigint(19) DEFAULT NULL COMMENT '修改成员idx，不可以为null',
  `create_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间，第一次创建时间，后续不可以修改时间##@EnYyyyMMddHHmmss##',
  `update_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间，每一次修改都要更新时间##@EnYyyyMMddHHmmss##',
  `status` smallint(1) DEFAULT NULL COMMENT '状态，1：正常，2：禁用，0：删除，取值范围为0-9，不可以为null',
  `version` bigint(19) DEFAULT NULL COMMENT '版本号，高并发，乐观锁的解决方案',
  `ext` varchar(100) DEFAULT NULL COMMENT '扩展，0-100字符，不可以为null，必须手动设置为空字符串',
  PRIMARY KEY (`idx`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='会员扩展表';

-- ----------------------------
-- Table structure for tb_user_level
-- ----------------------------
DROP TABLE IF EXISTS `tb_user_level`;
CREATE TABLE `tb_user_level` (
  `idx` bigint(19) NOT NULL COMMENT '会员等级主键idx，分布式架构，全局唯一递增##@Cache(module = "msyt-user")##',
  `idx_code` bigint(19) DEFAULT NULL COMMENT 'idx code 全局唯一性，解决idx可以通过递增1猜测出来，潜在安全问题##@Long2S(targetField = "idxCode")##',
  `level_name` varchar(50) DEFAULT NULL COMMENT '会员等级名称##@NotNull(message = "等级名称不能为空")@Size(min = 1, max = 20, message = "等级名称，最少1个字符，最多20个字符")##',
  `level_discount` int(11) DEFAULT NULL COMMENT '等级折扣',
  `sort` int(11) DEFAULT NULL COMMENT '等级排序',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注##@Length(max = 300, message = "最多300个字符")##',
  `is_default` smallint(1) DEFAULT NULL COMMENT '是否默认等级（0：否；1：是）',
  `create_by_member_idx` bigint(19) DEFAULT NULL COMMENT '创建成员idx，不可以为null',
  `update_by_member_idx` bigint(19) DEFAULT NULL COMMENT '修改成员idx，不可以为null',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间，第一次创建时间，后续不可以修改时间##@EnYyyyMMddHHmmss##',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间，每一次修改都要更新时间##@EnYyyyMMddHHmmss##',
  `status` smallint(6) DEFAULT NULL COMMENT '状态，1：可用，0：删除，取值范围0-9，不可以为null',
  `version` bigint(19) DEFAULT NULL COMMENT '版本号，高并发，乐观锁的解决方案',
  `ext` varchar(100) DEFAULT NULL COMMENT '扩展，0-100字符，不可以为null，必须手动设置为空字符串',
  PRIMARY KEY (`idx`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='会员等级表';

-- ----------------------------
-- Table structure for tb_user_login_log
-- ----------------------------
DROP TABLE IF EXISTS `tb_user_login_log`;
CREATE TABLE `tb_user_login_log` (
  `idx` bigint(19) NOT NULL COMMENT '会员登录日志主键idx，必须是分布式架构，全局唯一递增的##@Cache(module = "msyt-user")##',
  `idx_code` bigint(19) DEFAULT NULL COMMENT '主键idx生成的code##@Long2S(targetField = "idxCode")##',
  `user_idx_code` bigint(19) DEFAULT NULL COMMENT '会员主键idx生成的code',
  `login_name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '登录名称，不能为null',
  `ip_address` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '登录ip地址，不能为null',
  `login_status` smallint(1) DEFAULT NULL COMMENT '登录状态，1：成功；2:失败',
  `status` smallint(1) DEFAULT NULL COMMENT '状态，1：可用，0：删除，取值范围0-9，不可以为null',
  `version` bigint(19) DEFAULT NULL COMMENT '版本号，高并发，乐观解决方案，不可以为null',
  `create_by_member_idx` bigint(19) DEFAULT NULL COMMENT '被哪个成员创建',
  `update_by_member_idx` bigint(19) DEFAULT NULL COMMENT '被哪个成员修改',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间，第一次创建时间，后续不可以修改时间##@EnYyyyMMddHHmmss##',
  `update_time` timestamp NULL DEFAULT NULL COMMENT '更新时间，每次修改，都要更新时间##@EnYyyyMMddHHmmss##',
  `ext` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '扩展字段，最多50个字符，不能为null',
  PRIMARY KEY (`idx`),
  KEY `index_sml_idx_code` (`idx_code`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='会员登录日志表';

-- ----------------------------
-- Table structure for tb_user_mail
-- ----------------------------
DROP TABLE IF EXISTS `tb_user_mail`;
CREATE TABLE `tb_user_mail` (
  `idx` bigint(19) NOT NULL COMMENT '主键idx，分布式架构，全局唯一递增##@Cache(module = "msyt-user")##',
  `idx_code` bigint(19) DEFAULT NULL COMMENT 'idx code 全局唯一性，解决idx可以通过递增1猜测出来，潜在安全问题##@Long2S(targetField = "idxCode")##',
  `user_idx_code` bigint(19) DEFAULT NULL COMMENT '会员idx code',
  `email` varchar(200) DEFAULT NULL COMMENT '收件人邮箱',
  `subject` varchar(500) DEFAULT NULL COMMENT '邮件主题',
  `cc` varchar(2000) DEFAULT NULL COMMENT '抄送',
  `content` varchar(10000) DEFAULT NULL,
  `is_verify` smallint(1) DEFAULT NULL COMMENT '是否已验证（0：未验证；1：已验证）',
  `create_by_member_idx` bigint(19) DEFAULT NULL COMMENT '创建成员idx',
  `update_by_member_idx` bigint(19) DEFAULT NULL COMMENT '修改成员idx',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间，第一次创建时间，后续不可以修改时间##@EnYyyyMMddHHmmss##',
  `update_time` timestamp NULL DEFAULT NULL COMMENT '更新时间，每一次修改都要更新时间',
  `status` smallint(6) DEFAULT NULL COMMENT '状态，1：正常，2：禁用，0：删除，取值范围为0-9，不可以为null',
  `version` bigint(19) DEFAULT NULL COMMENT '版本号，高并发，乐观锁的解决方案',
  `ext` varchar(100) DEFAULT NULL COMMENT '扩展，0-100字符，不可以为null，必须手动设置为空字符串',
  PRIMARY KEY (`idx`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='会员邮件发送记录表';

-- ----------------------------
-- Table structure for tb_user_shipping_address
-- ----------------------------
DROP TABLE IF EXISTS `tb_user_shipping_address`;
CREATE TABLE `tb_user_shipping_address` (
  `idx` bigint(19) NOT NULL COMMENT '会员收货地址主键idx，分布式架构，全局唯一递增##@Cache(module = "msyt-user")##',
  `idx_code` bigint(19) DEFAULT NULL COMMENT '主键idx生成的code##@Long2S(targetField = "idxCode")##',
  `user_idx_code` bigint(19) DEFAULT NULL COMMENT '会员idx_code',
  `province_code` varchar(10) DEFAULT NULL COMMENT '省份，编码',
  `city_code` varchar(10) DEFAULT NULL COMMENT '城市，编码',
  `district_code` varchar(10) DEFAULT NULL COMMENT '区/县，编码',
  `area` varchar(500) DEFAULT NULL COMMENT '详细地址',
  `consignee` varchar(100) DEFAULT NULL COMMENT '收货人',
  `identity_card` varchar(20) DEFAULT NULL COMMENT '身份证',
  `mobile` varchar(15) DEFAULT NULL COMMENT '收货人手机号码',
  `is_default` tinyint(1) DEFAULT NULL COMMENT '是否默认地址（0：否；1：是）',
  `create_by_member_idx` bigint(19) DEFAULT NULL COMMENT '创建人',
  `update_by_member_idx` bigint(19) DEFAULT NULL COMMENT '修改人',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间，第一次创建时间，后续不可以修改时间##@EnYyyyMMddHHmmss##',
  `update_time` timestamp NULL DEFAULT NULL COMMENT '更新时间，每一次修改都要更新时间##@EnYyyyMMddHHmmss##',
  `status` smallint(1) DEFAULT NULL COMMENT '状态，1：可用的、激活的，2：未激活，0：删除，取值范围为0-9，不可以为null',
  `version` bigint(19) DEFAULT NULL COMMENT '版本号，高并发，乐观锁的解决方案',
  `ext` varchar(100) DEFAULT NULL COMMENT '扩展，0-100字符，不可以为null，必须手动设置为空字符串',
  PRIMARY KEY (`idx`),
  UNIQUE KEY `user_shipping_addr_idxcode` (`idx_code`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='会员收货地址表';
