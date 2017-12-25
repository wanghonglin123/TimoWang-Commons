/*
Navicat MySQL Data Transfer

Source Server         : 172.16.50.242
Source Server Version : 50505
Source Host           : 172.16.50.242:13306
Source Database       : msyt-fileresource

Target Server Type    : MYSQL
Target Server Version : 50505
File Encoding         : 65001

Date: 2017-12-25 15:13:57
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for tb_ablum_lib_p
-- ----------------------------
DROP TABLE IF EXISTS `tb_ablum_lib_p`;
CREATE TABLE `tb_ablum_lib_p` (
  `idx` bigint(19) NOT NULL COMMENT '相册库主键idx，必须是分布式架构，全局唯一递增的##@Cache(module = "msyt-fileresources")##',
  `idx_code` bigint(19) DEFAULT NULL COMMENT '主键idx生成的code##@Long2S(targetField = "idxCode")##',
  `pidx` bigint(19) DEFAULT NULL COMMENT '父级idx',
  `pidx_code` bigint(19) DEFAULT NULL COMMENT 'pidx code 全局唯一性，解决pidx可以通过递增1猜测出来，潜在安全问题##@Long2S(targetField = "pidxCode")##',
  `name` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '名称##@NotNull(message = "名称不能为空")##',
  `parent_name` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '父级名称，冗余一下',
  `relative_path` varchar(200) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '相对路径## @Length(max = 100, message = "父级名称最大100个字符")##',
  `ablum_type` smallint(1) DEFAULT NULL COMMENT '相册类型 1:采集相册；2:正式相册',
  `total_num` int(9) DEFAULT NULL COMMENT '文件总数量',
  `category` smallint(1) DEFAULT NULL COMMENT '文件目录级别 1:一级目录,2：二级目录 ...，以此类推',
  `total_size` bigint(19) DEFAULT NULL COMMENT '文件总大小',
  `file_idx` bigint(19) DEFAULT NULL COMMENT '文件idx，如果是文件夹就不需要保存，文件时需要保存',
  `dir_type` smallint(1) DEFAULT NULL COMMENT '目录类型 0:目录 1:文件',
  `remark` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '备注，不能为null##@Length(max = 100, message = "备注最大100个字符")##',
  `status` smallint(1) DEFAULT NULL COMMENT '状态，1：可用，0：删除，取值范围0-9，不可以为null',
  `version` bigint(19) DEFAULT NULL COMMENT '版本号，高并发，乐观解决方案，不可以为null',
  `create_by_member_idx` bigint(19) DEFAULT NULL COMMENT '被哪个成员创建',
  `update_by_member_idx` bigint(19) DEFAULT NULL COMMENT '被哪个成员修改',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间，第一次创建时间，后续不可以修改时间##@EnYyyyMMddHHmmss##',
  `update_time` timestamp NULL DEFAULT NULL COMMENT '更新时间，每次修改，都要更新时间',
  `ext` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '扩展字段，最多100个字符，不能为null',
  PRIMARY KEY (`idx`),
  KEY `index_abp_ablum_type` (`ablum_type`) USING BTREE,
  KEY `index_abp_status` (`status`) USING BTREE,
  KEY `index_abp_category` (`category`) USING BTREE,
  KEY `index_abp_pidx` (`pidx`) USING BTREE,
  KEY `index_al_idx_code` (`idx_code`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='相册库';

-- ----------------------------
-- Table structure for tb_fileresource_download
-- ----------------------------
DROP TABLE IF EXISTS `tb_fileresource_download`;
CREATE TABLE `tb_fileresource_download` (
  `idx` bigint(19) NOT NULL COMMENT '文件下载主键idx，必须是分布式架构，全局唯一递增的',
  `idx_code` bigint(19) DEFAULT NULL COMMENT '主键idx生成的code##@Long2S(targetField = "idxCode")##',
  `file_idx` bigint(19) DEFAULT NULL COMMENT '文件idx## @NotNull(message = "文件idx不能为空")##',
  `message_id` bigint(19) DEFAULT NULL COMMENT '唯一文件消息id',
  `total_size` bigint(19) unsigned DEFAULT NULL COMMENT '文件总大小',
  `download_size` bigint(19) unsigned DEFAULT NULL COMMENT '下载大小',
  `download_status` smallint(1) DEFAULT NULL COMMENT '上传状态，1:成功，2:失败，0：下载中',
  `remark` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '备注，不能为null## @Length(max = 100, message = "备注最大100个字符")##',
  `status` smallint(1) DEFAULT NULL COMMENT '状态，1：可用，0：删除，取值范围0-9，不可以为null',
  `version` bigint(19) DEFAULT NULL COMMENT '版本号，高并发，乐观解决方案，不可以为null',
  `create_by_member_idx` bigint(19) DEFAULT NULL COMMENT '被哪个成员创建',
  `update_by_member_idx` bigint(19) DEFAULT NULL COMMENT '被哪个成员修改',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间，第一次创建时间，后续不可以修改时间##@EnYyyyMMddHHmmss##',
  `update_time` timestamp NULL DEFAULT NULL COMMENT '更新时间，每次修改，都要更新时间',
  `ext` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '扩展字段，最多100个字符，不能为null',
  PRIMARY KEY (`idx`),
  KEY `index_fd_idx_code` (`idx_code`) USING BTREE,
  KEY `indx_fd_message_id` (`message_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='文件下载表';

-- ----------------------------
-- Table structure for tb_fileresource_template
-- ----------------------------
DROP TABLE IF EXISTS `tb_fileresource_template`;
CREATE TABLE `tb_fileresource_template` (
  `idx` bigint(19) NOT NULL COMMENT '文件模板主键idx，必须是分布式架构，全局唯一递增的##@Cache(module = "msyt-fileresources")##',
  `idx_code` bigint(19) DEFAULT NULL COMMENT '主键idx生成的code##@Long2S(targetField = "idxCode")##',
  `title` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '模板标题##@Length(min = 2, max = 50, message = "模板标题最小2个字符，最大50个字符")##',
  `category_id` smallint(1) DEFAULT NULL COMMENT '模板类别## @Range(min = 1, max = 100, message = "模板类别不能为空，最大为100")##',
  `app_platform` smallint(1) DEFAULT NULL COMMENT '应用平台,不能为空##@Range(min = 1, max = 100, message = "应用平台不能为空，最大为100")##',
  `file_message_id` bigint(19) DEFAULT NULL COMMENT '文件messageid，不能为空##@DynamicS @Range(min = 1,  message = "文件不能为空")##',
  `file_name` varchar(150) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '源文件名称##@Length(max = 150, message = "文件名称最大150个字符")##',
  `remark` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '备注，不能为null##@Length(max = 100, message = "备注最大100个字符")##',
  `status` smallint(1) DEFAULT NULL COMMENT '状态，1：可用，0：删除，取值范围0-9，不可以为null',
  `version` bigint(19) DEFAULT NULL COMMENT '版本号，高并发，乐观解决方案，不可以为null',
  `create_by_member_idx` bigint(19) DEFAULT NULL COMMENT '被哪个成员创建',
  `update_by_member_idx` bigint(19) DEFAULT NULL COMMENT '被哪个成员修改##@DynamicS##',
  `create_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间，第一次创建时间，后续不可以修改时间',
  `update_time` timestamp NULL DEFAULT NULL COMMENT '更新时间，每次修改，都要更新时间##@EnYyyyMMddHHmmss##',
  `ext` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '扩展字段，最多100个字符，不能为null',
  PRIMARY KEY (`idx`),
  KEY `index_tft_category_idx` (`category_id`) USING BTREE,
  KEY `index_tft_app_platforn` (`app_platform`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='文件资源中心模板表';

-- ----------------------------
-- Table structure for tb_fileresource_upload
-- ----------------------------
DROP TABLE IF EXISTS `tb_fileresource_upload`;
CREATE TABLE `tb_fileresource_upload` (
  `idx` bigint(19) NOT NULL COMMENT '文件资源库主键idx，必须是分布式架构，全局唯一递增的##@Cache(module = "msyt-fileresource")##',
  `idx_code` bigint(19) DEFAULT NULL COMMENT '主键idx生成的code##@Long2S(targetField = "idxCode")##',
  `message_id` bigint(19) DEFAULT NULL COMMENT '唯一文件消息id',
  `name` varchar(100) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '文件名称，不能为null## @NotNull(message = "文件名称不能为空")##',
  `path` varchar(200) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '文件路径，不能为null## @NotNull(message = "文件路径不能为空")##',
  `total_size` bigint(19) DEFAULT NULL COMMENT '文件总大小，字节（B）为单位，不能为null',
  `upload_size` bigint(19) DEFAULT NULL COMMENT '文件已经上传多少，',
  `upload_status` smallint(1) DEFAULT NULL COMMENT '上传状态，1:成功，2:上传中，0：上传失败',
  `md5_value` varchar(32) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT 'md5加密文件名称',
  `file_type` smallint(1) DEFAULT NULL COMMENT '文件类型,',
  `album_type` smallint(1) DEFAULT NULL COMMENT '相册类型,1:采集相册；2：正式相册',
  `oss_path` varchar(200) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'oss路径，不可以为null',
  `oss_sync` smallint(1) DEFAULT NULL COMMENT 'oss同步状态，0:未同步 1:已同步',
  `search_by_image` smallint(1) DEFAULT NULL COMMENT '生成以图搜图，0:未完成 1:已完成',
  `remark` varchar(100) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '备注，不能为null##@Length(max = 100, message = "备注最大100个字符")##',
  `status` smallint(1) DEFAULT NULL COMMENT '状态，1：可用，0：删除，取值范围0-9，不可以为null',
  `version` bigint(19) DEFAULT NULL COMMENT '版本号，高并发，乐观解决方案，不可以为null',
  `create_by_member_idx` bigint(19) DEFAULT NULL COMMENT '被哪个成员创建',
  `update_by_member_idx` bigint(19) DEFAULT NULL COMMENT '被哪个成员修改',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间，第一次创建时间，后续不可以修改时间##@EnYyyyMMddHHmmss##',
  `update_time` timestamp NULL DEFAULT NULL COMMENT '更新时间，每次修改，都要更新时间',
  `ext` varchar(100) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '扩展字段，最多100个字符，不能为null',
  PRIMARY KEY (`idx`),
  KEY `index_fru_message_id` (`message_id`) USING BTREE,
  KEY `index_fru_status` (`status`) USING BTREE,
  KEY `index_fu_idx_code` (`idx_code`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='文件资源库';
