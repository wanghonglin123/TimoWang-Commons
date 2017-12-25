/*
Navicat MySQL Data Transfer

Source Server         : 172.16.50.242
Source Server Version : 50505
Source Host           : 172.16.50.242:13306
Source Database       : msyt-content

Target Server Type    : MYSQL
Target Server Version : 50505
File Encoding         : 65001

Date: 2017-12-25 15:13:50
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for tb_content
-- ----------------------------
DROP TABLE IF EXISTS `tb_content`;
CREATE TABLE `tb_content` (
  `idx` bigint(19) NOT NULL COMMENT '内容主键idx，分布式架构，全局唯一递增',
  `idx_code` bigint(19) DEFAULT NULL COMMENT 'idx code 全局唯一性，解决idx可以通过递增1猜测出来，潜在安全问题##@Long2S(targetField = "idxCode")##',
  `code` varchar(20) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '唯一标识码，最多20个字符，不可以为null##@NotNull(message = "唯一标识码不能为空")@Length(max = 20, message = "唯一标识码最多20个字符")##',
  `name` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '名称，最多50个字符，不可以为null##@NotNull(message = "名称不能为空")@Length(max = 50, message = "名称最多50个字符")##',
  `type` smallint(1) DEFAULT NULL COMMENT '类型，不可以为null，1：html，2：多图##@NotNull(message = "类型不能为空")@Range(min = 1, max = 2, message = "类型取值区间1-2")##',
  `content` varchar(12000) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'HTML内容，最多12000个字符，不可以为null##@NotNull(message = "HTML内容不能为空")@Length(max = 12000, message = "HTML内容最多12000个字符")##',
  `start_time` timestamp NULL DEFAULT NULL COMMENT '有效开始时间，不可以为null##@NotNull(message = "有效开始时间不能为空")@EnYyyyMMddHHmmss##',
  `end_time` timestamp NULL DEFAULT NULL COMMENT '有效结束时间，不可以为null##@NotNull(message = "有效结束时间不能为空")@EnYyyyMMddHHmmss##',
  `create_by_member_idx` bigint(19) DEFAULT NULL COMMENT '创建成员idx，不可以为null',
  `update_by_member_idx` bigint(19) DEFAULT NULL COMMENT '修改成员idx，不可以为null',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间，第一次创建时间，后续不可以修改时间',
  `update_time` timestamp NULL DEFAULT NULL COMMENT '更新时间，每一次修改都要更新时间',
  `status` smallint(1) DEFAULT NULL COMMENT '状态，1：可用的、激活的，2：未激活，0：删除，取值范围为0-9，不可以为null',
  `version` bigint(19) DEFAULT NULL COMMENT '版本号，高并发，乐观锁的解决方案',
  `remark` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '备注##@Length(max = 50, message = "唯一标识码最多50个字符")##',
  `ext` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '扩展，0-100字符，不可以为null，必须手动设置为空字符串',
  PRIMARY KEY (`idx`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='内容表';

-- ----------------------------
-- Table structure for tb_content_image
-- ----------------------------
DROP TABLE IF EXISTS `tb_content_image`;
CREATE TABLE `tb_content_image` (
  `idx` bigint(19) NOT NULL COMMENT '内容图片主键idx，分布式架构，全局唯一递增',
  `idx_code` bigint(19) DEFAULT NULL COMMENT 'idx code 全局唯一性，解决idx可以通过递增1猜测出来，潜在安全问题##@Long2S(targetField = "idxCode")##',
  `content_idx` bigint(19) DEFAULT NULL COMMENT '内容主键idx，不可以为null0##@NotNull(message = "内容主键不能为空")##',
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '图片名称，最多50个字符，不可以为null##@NotNull(message = "图片名称不能为空")@Length(max = 50, message = "图片名称最多50个字符")##',
  `title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '图片标题，最多50个字符，不可以为null##@NotNull(message = "图片标题不能为空")@Length(max = 50, message = "图片标题最多50个字符")##',
  `link_url` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '图片链接地址，最多200个字符##@Length(max = 200, message = "图片链接地址最多200个字符")##',
  `order_number` int(11) DEFAULT NULL COMMENT '排序号，升序排列，不可以为null，必须手动设置默认值为0##@NotNull(message = "排序号不能为空")@Range(min = 0, max = 10, message = "排序号")##',
  `image_small` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '小图，最多255个字符##@Length(max = 255, message = "小图最多255个字符")##',
  `image_middle` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '中图，最多255个字符##@Length(max = 255, message = "中图最多255个字符")##',
  `image_big` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '大图，最多255个字符##@Length(max = 255, message = "大图最多255个字符")##',
  `create_by_member_idx` bigint(19) DEFAULT NULL COMMENT '创建成员idx，不可以为null',
  `update_by_member_idx` bigint(19) DEFAULT NULL COMMENT '修改成员idx，不可以为null',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间，第一次创建时间，后续不可以修改时间',
  `update_time` timestamp NULL DEFAULT NULL COMMENT '更新时间，每一次修改都要更新时间',
  `status` smallint(1) DEFAULT NULL COMMENT '上下架状态，1：上架，2：下架，0：删除，取值范围为0-9，不可以为null',
  `version` bigint(19) DEFAULT NULL COMMENT '版本号，高并发，乐观锁的解决方案',
  `remark` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '备注##@NotNull(message = "备注不能为空")@Length(max = 50, message = "唯一标识码最多50个字符")##',
  `ext` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '扩展，0-100字符，不可以为null，必须手动设置为空字符串',
  PRIMARY KEY (`idx`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='内容图片表';

-- ----------------------------
-- Table structure for tb_content_keyword
-- ----------------------------
DROP TABLE IF EXISTS `tb_content_keyword`;
CREATE TABLE `tb_content_keyword` (
  `idx` bigint(19) NOT NULL COMMENT '关键词主键idx，分布式架构，全局唯一递增',
  `idx_code` bigint(19) DEFAULT NULL COMMENT 'idx code 全局唯一性，解决idx可以通过递增1猜测出来，潜在安全问题##@Long2S(targetField = "idxCode")##',
  `keyword` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '关键词，最多50个字符，不可以为null##@NotNull(message = "关键词不能为空")@Length(max = 50, message = "关键词最多50个字符")##',
  `first_word` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '首字母，最多1个字符，不可以为null##@NotNull(message = "首字母不能为空")@Length(max = 1, message = "首字母最多1个字符")##',
  `create_by_member_idx` bigint(19) DEFAULT NULL COMMENT '创建成员idx，不可以为null',
  `update_by_member_idx` bigint(19) DEFAULT NULL COMMENT '修改成员idx，不可以为null',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间，第一次创建时间，后续不可以修改时间',
  `update_time` timestamp NULL DEFAULT NULL COMMENT '更新时间，每一次修改都要更新时间',
  `status` smallint(1) DEFAULT NULL COMMENT '状态，1：可用的、激活的，2：未激活，0：删除，取值范围为0-9，不可以为null',
  `version` bigint(19) DEFAULT NULL COMMENT '版本号，高并发，乐观锁的解决方案',
  `remark` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '备注##@Length(max = 50, message = "唯一标识码最多50个字符")##',
  `ext` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '扩展，0-100字符，不可以为null，必须手动设置为空字符串',
  PRIMARY KEY (`idx`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='关键词表';
