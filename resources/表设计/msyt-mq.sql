/*
Navicat MySQL Data Transfer

Source Server         : 172.16.50.242
Source Server Version : 50505
Source Host           : 172.16.50.242:13306
Source Database       : msyt-mq

Target Server Type    : MYSQL
Target Server Version : 50505
File Encoding         : 65001

Date: 2017-12-25 15:15:53
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
  `module` varchar(200) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '模块名称',
  PRIMARY KEY (`idx`),
  UNIQUE KEY `index_msgid` (`msg_id`) USING BTREE,
  KEY `index_scm_idx_code` (`idx_code`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='MQ消费消息表';

-- ----------------------------
-- Table structure for tb_rabbitmq_consume_message
-- ----------------------------
DROP TABLE IF EXISTS `tb_rabbitmq_consume_message`;
CREATE TABLE `tb_rabbitmq_consume_message` (
  `idx` bigint(19) NOT NULL COMMENT 'RabbitMQ消费消息主键idx，分布式架构，全局唯一递增',
  `idx_code` bigint(19) DEFAULT NULL COMMENT 'idx code 全局唯一性，解决idx可以通过递增1猜测出来，潜在安全问题##@Long2S(targetField = "idxCode")##',
  `target_idx` bigint(19) DEFAULT NULL COMMENT '目标idx，也就是当前发送MQ的目标POJO对应 idx',
  `target_idx_code` bigint(19) DEFAULT NULL COMMENT '目标idxCode，也就是当前发送MQ的目标POJO对应 idxCode',
  `target_name` varchar(50) DEFAULT NULL COMMENT '目标名称，例如：POJO的名称，item',
  `target_order_no` varchar(50) DEFAULT NULL COMMENT '订单号（订单号，拆单号，退单号等），专门提供给订单使用的，其他模块不要使用',
  `module` varchar(50) DEFAULT NULL COMMENT '模块，例如：msyt-item、 msyt-user',
  `module_alias` varchar(50) DEFAULT NULL COMMENT '模块别名，例如：msyt-item的别名为：item、 msyt-user的别名为：user',
  `tags` varchar(50) DEFAULT NULL COMMENT 'MQ的Tags，最大长度50字符',
  `batch_conditions` varchar(50) DEFAULT NULL COMMENT '批量条件，也就是批量执行，更新，删除等等。',
  `flag` int(5) DEFAULT NULL COMMENT '动作，比如：1：Save，0：Delete，2：Update',
  `exchange` varchar(200) DEFAULT NULL COMMENT 'RabbitMQ的交换机',
  `routing_key` varchar(200) DEFAULT NULL COMMENT 'RabbitMQ的路由Key',
  `auto_ack` smallint(1) DEFAULT NULL COMMENT '是否自动开启确认机制，1手动，0自动',
  `virtual_host` varchar(100) DEFAULT NULL COMMENT '连接到代理时要使用的虚拟主机。',
  `message` varchar(7000) DEFAULT NULL COMMENT 'MQ发送的消息内容',
  `correlation_data` varchar(7000) DEFAULT NULL COMMENT '关联的数据',
  `others` varchar(500) DEFAULT NULL COMMENT '其他，后续扩展使用',
  `create_by_member_idx` bigint(19) DEFAULT NULL COMMENT '创建成员idx，不可以为null',
  `update_by_member_idx` bigint(19) DEFAULT NULL COMMENT '修改成员idx，不可以为null',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间，第一次创建时间，后续不可以修改时间##@EnYyyyMMddHHmmss##',
  `update_time` timestamp NULL DEFAULT NULL COMMENT '更新时间，每一次修改都要更新时间##@EnYyyyMMddHHmmss##',
  `status` smallint(1) DEFAULT NULL COMMENT '状态，1：可用的、激活的，2：未激活，0：删除，取值范围为0-9，不可以为null',
  `version` bigint(19) DEFAULT NULL COMMENT '版本号，高并发，乐观锁的解决方案',
  `ext` varchar(100) DEFAULT NULL COMMENT '扩展，0-100字符，不可以为null，必须手动设置为空字符串',
  PRIMARY KEY (`idx`),
  KEY `index_rcm_target_idx` (`target_idx`) USING BTREE,
  KEY `index_rcm_target_idx_code` (`target_idx_code`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='RabbitMQ消费消息表';
