/*
Navicat MySQL Data Transfer

Source Server         : 172.16.50.242
Source Server Version : 50505
Source Host           : 172.16.50.242:13306
Source Database       : msyt-authorization

Target Server Type    : MYSQL
Target Server Version : 50505
File Encoding         : 65001

Date: 2017-12-25 15:13:18
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for tb_api_authorization
-- ----------------------------
DROP TABLE IF EXISTS `tb_api_authorization`;
CREATE TABLE `tb_api_authorization` (
  `idx_code` bigint(19) DEFAULT NULL COMMENT 'idxCode，全局唯一，随机递增',
  `idx` bigint(19) NOT NULL COMMENT 'API授权，分布式框架全局唯一递增主键Idx##@JWT@Cache(module = "msyt-authorization")@MQ(module = "msyt-authorization", moduleAlias = "authorization", autoAck = false)##',
  `user_idx_code` bigint(19) DEFAULT NULL COMMENT '会员主键idxcode##  @Range(min = 1, message = "会员id不能为空")@DynamicS##',
  `app_name` varchar(20) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'App名称，必填，2-20字符## @Length(min = 2, max = 20, message = "app名称最小2个字符，最大20个字符")##',
  `app_id` bigint(19) DEFAULT NULL COMMENT 'App的ID，分布式框架全局唯一,随机递增',
  `app_key` varchar(20) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'App的Key，大小写字母+随机数字，代码中使用全局变量YT,为前缀##@Length(min = 2, max = 20, message = "appKey最小2个字符，最大20个字符")##',
  `app_secret` varchar(32) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'App的密钥，大小写字母+数字，全局唯一的，后续客户可以自己修改，第一次系统分配##@Length(min = 2, max = 32, message = "appSecret最小2个字符，最大32个字符")##',
  `platform_id` int(3) DEFAULT NULL COMMENT '平台ID，例如：Android、iOS、PHP、Python、WeChat、BigData',
  `has_encryption` smallint(1) DEFAULT NULL COMMENT '是否需要加密，0：不需要加密；1：需要加密',
  `ip_white_list` varchar(500) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'IP白名单，多个IP使用逗号分开，为空不限制##@Length(max = 500, message = "ip白名单最大500个字符")##',
  `remark` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '备注##@Length(max = 100, message = "备注最大100个字符")##',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` timestamp NULL DEFAULT NULL COMMENT '更新时间',
  `create_member_idx` bigint(19) DEFAULT NULL COMMENT '创建的成员Idx',
  `update_member_idx` bigint(19) DEFAULT NULL COMMENT '更新的成员Idx',
  `status` smallint(1) DEFAULT NULL COMMENT '状态，1：可用的、激活的，2：未激活，0：删除，2：未激活，取值范围为0-9，不可以为null',
  `version` bigint(19) DEFAULT NULL COMMENT '版本号，乐观锁解决方案，全局唯一递增',
  `ext` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '扩展',
  `api_version` varchar(10) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '用户请求API的版本，例如：V2.0.0',
  PRIMARY KEY (`idx`),
  KEY `index_taa_multiple` (`platform_id`,`user_idx_code`,`app_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
