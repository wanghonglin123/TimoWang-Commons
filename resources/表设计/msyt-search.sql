/*
Navicat MySQL Data Transfer

Source Server         : 172.16.50.242
Source Server Version : 50505
Source Host           : 172.16.50.242:13306
Source Database       : msyt-search

Target Server Type    : MYSQL
Target Server Version : 50505
File Encoding         : 65001

Date: 2017-12-25 15:16:34
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for tb_consume_message
-- ----------------------------
DROP TABLE IF EXISTS `tb_consume_message`;
CREATE TABLE `tb_consume_message` (
  `idx` bigint(19) NOT NULL COMMENT 'MQ消费消息主键idx，分布式架构，全局唯一递增',
  `idx_code` bigint(19) DEFAULT NULL COMMENT '主键idx生成的code##@Long2S(targetField = "idxCode")##',
  `msg_id` char(32) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'MQ消息id，固定是32位MD5值，根据msgId可以解决消息重复消费问题',
  `topic` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'MQ的Topic，最大长度50字符',
  `tags` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'MQ的Tags，最大长度50字符',
  `flag` int(5) DEFAULT NULL COMMENT '动作，比如：1：Save，0：Delete，2：Update',
  `mq_keys` varchar(200) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'MQ的Keys，最大长度200字符',
  `message` varchar(10000) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'MQ消息内容，最大长度10000字符，如果超过9900就需要截取',
  `status` smallint(1) DEFAULT NULL COMMENT '状态，1：可用，0：删除，取值范围0-9，不可以为null',
  `version` bigint(19) DEFAULT NULL COMMENT '版本号，高并发，乐观解决方案，不可以为null',
  `create_by_member_idx` bigint(19) DEFAULT NULL COMMENT '被哪个成员创建',
  `update_by_member_idx` bigint(19) DEFAULT NULL COMMENT '被哪个成员修改',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间，第一次创建时间，后续不可以修改时间##@EnYyyyMMddHHmmss##',
  `update_time` timestamp NULL DEFAULT NULL COMMENT '更新时间，每次修改，都要更新时间',
  `ext` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '扩展，最大长度100字符',
  PRIMARY KEY (`idx`),
  UNIQUE KEY `index_msgid` (`msg_id`) USING BTREE,
  KEY `index_scm_idx_code` (`idx_code`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='MQ消费消息表';

-- ----------------------------
-- Table structure for tb_index_rebuild_log
-- ----------------------------
DROP TABLE IF EXISTS `tb_index_rebuild_log`;
CREATE TABLE `tb_index_rebuild_log` (
  `idx` bigint(19) NOT NULL COMMENT '索引重建日志主键idx，分布式架构，全局唯一递增##@Cache(module = "msyt-search")##''',
  `idx_code` bigint(19) DEFAULT NULL COMMENT 'idx code 全局唯一性，解决idx可以通过递增1猜测出来，潜在安全问题',
  `alias_name` varchar(50) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '索引别名',
  `type_name` varchar(50) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '类型名称',
  `rebuild_type` smallint(1) DEFAULT NULL COMMENT '重建类型，1：模版，2：索引，取值范围为0-9，不可以为null',
  `rebuild_status` smallint(1) DEFAULT NULL COMMENT '重建状态，1：重建中，2：重建完成，取值范围为0-9，不可以为null',
  `start_time` timestamp NULL DEFAULT NULL COMMENT '开始时间##@EnYyyyMMddHHmmss##',
  `end_time` timestamp NULL DEFAULT NULL COMMENT '结束时间##@EnYyyyMMddHHmmss@Date(pattern = MsOnionDatePattern.SINCE)##',
  `remark` varchar(1000) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '备注',
  `create_by_member_idx` bigint(19) DEFAULT NULL COMMENT '创建成员idx，不可以为null',
  `update_by_member_idx` bigint(19) DEFAULT NULL COMMENT '修改成员idx，不可以为null',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间，第一次创建时间，后续不可以修改时间##@EnYyyyMMddHHmmss##',
  `update_time` timestamp NULL DEFAULT NULL COMMENT '更新时间，每一次修改都要更新时间##@EnYyyyMMddHHmmss##',
  `status` smallint(1) DEFAULT NULL COMMENT '状态，1：可用的、激活的，2：未激活，0：删除，取值范围为0-9，不可以为null',
  `version` bigint(19) DEFAULT NULL COMMENT '版本号，高并发，乐观锁的解决方案',
  `ext` varchar(100) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '扩展，0-100字符，不可以为null，必须手动设置为空字符串',
  PRIMARY KEY (`idx`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='索引重建记录表';

-- ----------------------------
-- Table structure for tb_search_hot_word
-- ----------------------------
DROP TABLE IF EXISTS `tb_search_hot_word`;
CREATE TABLE `tb_search_hot_word` (
  `idx` bigint(19) NOT NULL COMMENT '搜索热词主键idx，分布式架构，全局唯一递增',
  `idx_code` bigint(19) DEFAULT NULL COMMENT 'idx code 全局唯一性，解决idx可以通过递增1猜测出来，潜在安全问题',
  `name` varchar(50) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '热词名称',
  `url` varchar(500) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '热词链接',
  `zindex` smallint(2) DEFAULT NULL COMMENT '热词排序',
  `style` smallint(2) DEFAULT NULL COMMENT '热词样式，比如：1：红色，2：黄色',
  `remark` varchar(200) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '备注',
  `create_by_member_idx` bigint(19) DEFAULT NULL COMMENT '创建成员idx，不可以为null',
  `update_by_member_idx` bigint(19) DEFAULT NULL COMMENT '修改成员idx，不可以为null',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间，第一次创建时间，后续不可以修改时间##@EnYyyyMMddHHmmss##',
  `update_time` timestamp NULL DEFAULT NULL COMMENT '更新时间，每一次修改都要更新时间##@EnYyyyMMddHHmmss##',
  `status` smallint(1) DEFAULT NULL COMMENT '状态，1：可用的、激活的，2：未激活，0：删除，取值范围为0-9，不可以为null',
  `version` bigint(19) DEFAULT NULL COMMENT '版本号，高并发，乐观锁的解决方案',
  `ext` varchar(100) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '扩展，0-100字符，不可以为null，必须手动设置为空字符串',
  PRIMARY KEY (`idx`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='搜索热词表';

-- ----------------------------
-- Table structure for tb_search_recommend_word
-- ----------------------------
DROP TABLE IF EXISTS `tb_search_recommend_word`;
CREATE TABLE `tb_search_recommend_word` (
  `idx` bigint(19) NOT NULL COMMENT '搜索推荐词主键idx，分布式架构，全局唯一递增',
  `idx_code` bigint(19) DEFAULT NULL COMMENT 'idx code 全局唯一性，解决idx可以通过递增1猜测出来，潜在安全问题',
  `name` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '推荐词名称',
  `weight` bigint(19) DEFAULT NULL COMMENT '推荐词权重',
  `remark` varchar(200) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '备注',
  `create_by_member_idx` bigint(19) DEFAULT NULL COMMENT '创建成员idx，不可以为null',
  `update_by_member_idx` bigint(19) DEFAULT NULL COMMENT '修改成员idx，不可以为null',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间，第一次创建时间，后续不可以修改时间##@EnYyyyMMddHHmmss##',
  `update_time` timestamp NULL DEFAULT NULL COMMENT '更新时间，每一次修改都要更新时间##@EnYyyyMMddHHmmss##',
  `status` smallint(1) DEFAULT NULL COMMENT '状态，1：可用的、激活的，2：未激活，0：删除，取值范围为0-9，不可以为null',
  `version` bigint(19) DEFAULT NULL COMMENT '版本号，高并发，乐观锁的解决方案',
  `ext` varchar(100) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '扩展，0-100字符，不可以为null，必须手动设置为空字符串',
  PRIMARY KEY (`idx`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='搜索推荐词表';
