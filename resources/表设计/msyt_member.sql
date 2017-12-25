/*
Navicat MySQL Data Transfer

Source Server         : 172.16.50.242
Source Server Version : 50505
Source Host           : 172.16.50.242:13306
Source Database       : msyt_member

Target Server Type    : MYSQL
Target Server Version : 50505
File Encoding         : 65001

Date: 2017-12-25 15:13:05
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for tb_button
-- ----------------------------
DROP TABLE IF EXISTS `tb_button`;
CREATE TABLE `tb_button` (
  `idx` bigint(19) NOT NULL COMMENT '按钮主键idx，必须是分布式架构，全局唯一递增的',
  `idx_code` bigint(19) DEFAULT NULL COMMENT '主键idx生成的code##@Long2S(targetField = "idxCode")##',
  `name` varchar(20) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '按钮名称，最多20个字符，最少2个字符##@NotNull(message = "按钮名称不能为空")@Size(min = 2, max = 20, message = "按钮名称，最少2个字符,最多20个字符")##',
  `code` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '按钮码，暂时不使用，后续扩展使用，不可以为null，必须手动赋值为空字符串##@Length(min = 2, max = 100, message = "按钮编码最少2个字符，最大100个字符")##',
  `menu_idx` bigint(19) DEFAULT NULL COMMENT '菜单主键idx，也就是当前按钮属于哪个菜单的，如果为0表示当前按钮属于后台首页，不可以为null，必须设置为0##@Range(min = 1, message = "所属菜单不能为空")##',
  `icon_url` varchar(200) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '按钮的Icon图片的Url，最多200个字符串，不可以为null，必须手动设置为空字符串',
  `create_by_member_idx` bigint(19) DEFAULT NULL COMMENT '被哪个成员创建',
  `update_by_member_idx` bigint(19) DEFAULT NULL COMMENT '被哪个成员修改',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间，第一次创建时间，后续不可以修改时间',
  `update_time` timestamp NULL DEFAULT NULL COMMENT '更新时间，每次修改，都要更新时间',
  `status` smallint(1) DEFAULT NULL COMMENT '状态，1：可用，0：删除，取值范围0-9，不可以为null',
  `version` bigint(19) DEFAULT NULL COMMENT '版本号，高并发，乐观解决方案，不可以为null',
  `zindex` smallint(3) DEFAULT NULL COMMENT '顺序，暂时不使用，后续扩展使用，取值范围0-760，不可以为null，必须手动设置为0',
  `remark` varchar(20) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '备注，最多20个字符，不可以为null，必须手动设置为空字符串',
  PRIMARY KEY (`idx`),
  KEY `index_button_menu_idx` (`menu_idx`) USING BTREE,
  KEY `index_button_status` (`status`) USING BTREE,
  KEY `index_button_idx_code` (`idx_code`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='按钮表';

-- ----------------------------
-- Table structure for tb_department_p
-- ----------------------------
DROP TABLE IF EXISTS `tb_department_p`;
CREATE TABLE `tb_department_p` (
  `idx` bigint(19) NOT NULL COMMENT '部门主键idx，分布式架构，全局唯一递增',
  `idx_code` bigint(19) DEFAULT NULL COMMENT '主键idx生成的code##@Long2S(targetField = "idxCode")##',
  `pidx` bigint(19) DEFAULT NULL COMMENT '父级部门主键idx，不可以为null，必须手动设置为0',
  `pidx_code` bigint(19) DEFAULT NULL COMMENT 'pidx code 全局唯一性，解决pidx可以通过递增1猜测出来，潜在安全问题##@Long2S(targetField = "pidxCode")##',
  `name` varchar(20) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '部门名称，最少2个字符，最多20个字符##@NotNull(message = "部门名称不能为空")@Length(min = 2, max = 20, message = "部门名称最大20个字符，最小2个字符")##',
  `code` varchar(30) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '部门编码，必须全集唯一，建议按照菜单_功能_模块命名，必须是小写字母和_（下划线），最少4字符，最多30个字符##@NotNull(message = "部门编码不能为空")@Length(min = 4, max = 30, message = "部门编码最大30个字符，最小4个字符")##',
  `create_by_member_idx` bigint(19) DEFAULT NULL COMMENT '创建成员idx，不可以为null',
  `update_by_member_idx` bigint(19) DEFAULT NULL COMMENT '修改成员idx，不可以为null',
  `create_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间，第一次创建时间，后续不可以修改时间',
  `update_time` timestamp NULL DEFAULT NULL COMMENT '更新时间，每一次修改都要更新时间',
  `status` smallint(1) DEFAULT NULL COMMENT '状态，1：可用，0：删除，取值范围为0-9，不可以为null',
  `zindex` smallint(3) DEFAULT NULL COMMENT '顺序，取值范围为0-760，不可以为null',
  `level` smallint(3) DEFAULT NULL COMMENT '级别，取值范围为0-760，不可以为null',
  `version` bigint(19) DEFAULT NULL COMMENT '版本号，高并发，乐观锁解决方案',
  `remark` varchar(20) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '备注，字符个数0-20，不可以为null，必须手动设置空字符串',
  `company_idx` bigint(19) DEFAULT NULL COMMENT '公司主键idx，不可以为null，必须手动设置为0',
  PRIMARY KEY (`idx`),
  KEY `index_department_idx_code` (`idx_code`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='部门表';

-- ----------------------------
-- Table structure for tb_member
-- ----------------------------
DROP TABLE IF EXISTS `tb_member`;
CREATE TABLE `tb_member` (
  `idx` bigint(19) NOT NULL COMMENT '成员主键idx，分布式架构，全局唯一递增',
  `idx_code` bigint(19) DEFAULT NULL COMMENT '主键idx生成的code##@Long2S(targetField = "idxCode")##',
  `name` varchar(20) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '成员名称，最少2个字符，最多20个字符',
  `full_name` varchar(20) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '全名，最多20个字符，不可以为null',
  `code` varchar(30) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '成员编码，必须全集唯一，建议按照菜单_功能_模块命名，必须是小写字母和_（下划线），最少4字符，最多30个字符',
  `password` char(32) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '密码，32位字符，必须是MD5（password + 盐）',
  `phone` varchar(20) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '手机号码，最多20位字符，不可以为null',
  `tel` varchar(15) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '电话号码，最多15，不可以为null',
  `sex` smallint(1) DEFAULT NULL COMMENT '性别,1:男,2:女;不可以为null',
  `email` varchar(30) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'Email，最多30位字符，不可以为null',
  `create_by_member_idx` bigint(19) DEFAULT NULL COMMENT '创建成员idx，不可以为null',
  `update_by_member_idx` bigint(19) DEFAULT NULL COMMENT '修改成员idx，不可以为null',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间，第一次创建时间，后续不可以修改时间',
  `update_time` timestamp NULL DEFAULT NULL COMMENT '更新时间，每一次修改都要更新时间',
  `status` smallint(1) DEFAULT NULL COMMENT '状态，1：可用的、激活的，2：未激活，0：删除，2：未激活，取值范围为0-9，不可以为null',
  `version` bigint(19) DEFAULT NULL COMMENT '版本号，高并发，乐观锁解决方案',
  `remark` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '备注，字符个数0-50，不可以为null，必须手动设置空字符串',
  `store_idx` bigint(19) DEFAULT NULL COMMENT '商店（店铺）主键idx，不可以为null，必须手动设置为0',
  `department_idx` bigint(19) DEFAULT NULL COMMENT '部门主键idx，不可以为null，必须手动设置为0',
  `vip_member_idx` bigint(19) DEFAULT NULL COMMENT 'VIP会员（成员）主键idx，不可以为null，必须手动设置为0',
  `member_cate_idx` bigint(19) DEFAULT NULL COMMENT '成员分类主键idx，不可以为null，必须手动设置为0',
  `last_login_ip` char(15) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '最后登录IP，不可以为null，必须手动设置为空字符串',
  `last_login_time` timestamp NULL DEFAULT NULL COMMENT '最后登录时间，不可以为null##@EnYyyyMMddHHmmss@Date(pattern = MsOnionDatePattern.SINCE)##',
  `ext` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '扩展，0-100字符，不可以为null，必须手动设置为空字符串',
  PRIMARY KEY (`idx`),
  KEY `index_member_code` (`code`) USING BTREE,
  KEY `index_member_create_time` (`create_time`) USING BTREE,
  KEY `index_member_status` (`status`) USING BTREE,
  KEY `index_member_idx_code` (`idx_code`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='成员表';

-- ----------------------------
-- Table structure for tb_member_cate_p
-- ----------------------------
DROP TABLE IF EXISTS `tb_member_cate_p`;
CREATE TABLE `tb_member_cate_p` (
  `idx` bigint(19) NOT NULL COMMENT '成员类别（分类、类型）主键idx',
  `idx_code` bigint(19) DEFAULT NULL COMMENT '主键idx生成的code##@Long2S(targetField = "idxCode")##',
  `pidx` bigint(19) DEFAULT NULL COMMENT '成员父级类别pidx，暂时不使用，后续扩展使用，不可以为null，可以默认为0',
  `pidx_code` bigint(19) DEFAULT NULL COMMENT 'pidx code 全局唯一性，解决pidx可以通过递增1猜测出来，潜在安全问题##@Long2S(targetField = "pidxCode")##',
  `name` varchar(10) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '成员类别的名称，字符数0-10，不可以为null##@NotNull(message = "用户类别名称不能为空")@Length(max = 10, message = "用户类别名称最大为10")##',
  `remark` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '备注，字符数为0-100个（包括中英文），不可以为null，默认都要设置为空字符串##@Length(max = 100, message = "备注字符数最大为100")##',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` timestamp NULL DEFAULT NULL COMMENT '修改时间',
  `version` bigint(19) DEFAULT NULL COMMENT '版本号，高并发，乐观锁解决方案，不可以为null',
  `status` smallint(1) DEFAULT NULL COMMENT '状态，1：可用，0：删除，取值范围0-9，不可以为null',
  `create_by_member_id` bigint(19) DEFAULT NULL COMMENT '被哪位成员（member_idx）创建的，不可以为null',
  `update_by_member_id` bigint(19) DEFAULT NULL COMMENT '被哪位成员（member_idx）修改的，不可以为null',
  PRIMARY KEY (`idx`),
  KEY `index_mc_idx_code` (`idx_code`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='成员类别表';

-- ----------------------------
-- Table structure for tb_member_role
-- ----------------------------
DROP TABLE IF EXISTS `tb_member_role`;
CREATE TABLE `tb_member_role` (
  `idx` bigint(19) NOT NULL COMMENT '成员角色主键idx，分布式架构，全局唯一递增',
  `idx_code` bigint(19) DEFAULT NULL COMMENT '主键idx生成的code##@Long2S(targetField = "idxCode")##',
  `member_idx` bigint(19) DEFAULT NULL COMMENT '成员主键idx，不可以为null',
  `role_idx` bigint(19) DEFAULT NULL COMMENT '角色主键idx，不可以为null',
  `create_by_member_idx` bigint(19) DEFAULT NULL COMMENT '修改成员主键idx',
  `update_by_member_idx` bigint(19) DEFAULT NULL COMMENT '更新成员主键idx',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` timestamp NULL DEFAULT NULL COMMENT '更新时间',
  `status` smallint(1) DEFAULT NULL COMMENT '状态，1：可用，0：删除，取值范围0-9，不可以为null',
  `version` bigint(19) DEFAULT NULL COMMENT '版本号，高并发，乐观锁解决方案，不可以为null',
  PRIMARY KEY (`idx`),
  KEY `index_mr_member_idx` (`member_idx`) USING BTREE,
  KEY `index_mer_role_idx` (`role_idx`) USING BTREE,
  KEY `index_role_idx_code` (`idx_code`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='成员角色表';

-- ----------------------------
-- Table structure for tb_menu_p
-- ----------------------------
DROP TABLE IF EXISTS `tb_menu_p`;
CREATE TABLE `tb_menu_p` (
  `idx` bigint(19) NOT NULL COMMENT '菜单主键idx，必须是分布式全局唯一递增',
  `idx_code` bigint(19) DEFAULT NULL COMMENT '主键idx生成的code##@Long2S(targetField = "idxCode")##',
  `pidx` bigint(19) DEFAULT NULL COMMENT '父级菜单主键pidx，必须是分布式全局唯一递增,不可以为null，必须默认为0，需要手动设置',
  `pidx_code` bigint(19) DEFAULT NULL COMMENT 'pidx code 全局唯一性，解决pidx可以通过递增1猜测出来，潜在安全问题##@Long2S(targetField = "pidxCode")##',
  `code` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '菜单码，最多100个字符，只能包括小写字母和_(下划线)，不可以为null，必须手动设置为空字符串##@NotNull(message = "菜单编码不能为空")@Length(max = 100, message = "菜单编码最大100个字符")##',
  `name` varchar(20) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '菜单名称，最多20个字符（包括中英文），不可以为null或者空字符串，长度最少2个字符##@NotNull(message = "菜单名称不能为空")@Length(min = 2, max = 20, message = "菜单名称最小2个字符，最大20个字符")##',
  `url` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '菜单Url，最多100个字符，不可以包括中文，父级菜单不可以为null，必须手动初始化为空字符串##@Length(max = 100, message = "菜单url最大100个字符")##',
  `url_mapping` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '菜单url权限映射，不可以为null。',
  `remark` varchar(20) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '菜单备注，最多20个字符，不可以为null，必须手动设置为空字符串##@Length(max = 20, message = "菜单备注最大20个字符")##',
  `zindex` smallint(3) DEFAULT NULL COMMENT '菜单顺序，按照从小到大顺序，取值范围0-766，不可以为null，必须手动设置默认值为0## @Range(min = 0, max = 766, message = "菜单顺序需要设置0-766")##',
  `top_show` smallint(2) DEFAULT NULL COMMENT '菜单是否在顶部显示，1:显示，0:不显示；手动设置默认值0',
  `level` smallint(2) DEFAULT NULL COMMENT '菜单级别，1:一级菜单，2：二级菜单，3：三级菜单，不可以为null，必须手动设置默认值为0',
  `icon_url` varchar(200) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '菜单Icon的Url，最多200个字符，不可以为null，必须手动设置为空字符串',
  `menu_cate_idx` bigint(19) DEFAULT NULL COMMENT '菜单类别主键idx，暂时不使用，后续扩展使用，不可以设置为null，必须通过手动设置为0',
  `mark_button` smallint(1) DEFAULT NULL COMMENT '是否生成默认按钮，0:不生成,1:生成',
  `status` smallint(1) DEFAULT NULL COMMENT '菜单状态，1：可用，0：删除，取值范围为0-9，不可以为null，必须手动设置为0或者1',
  `version` bigint(19) DEFAULT NULL COMMENT '版本号，高并发，乐观锁的解决方案，不可以为null，必须赋值',
  `create_by_member_idx` bigint(19) DEFAULT NULL COMMENT '菜单被哪位成员（member_idx）创建的，不可以为null',
  `update_by_member_idx` bigint(19) DEFAULT NULL COMMENT '菜单被哪位成员（member_idx）修改的，不可以为null',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间，后续不可以再更新时间',
  `update_time` timestamp NULL DEFAULT NULL COMMENT '更新时间，每一次都要更新',
  `ext` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '扩展字段，不可以为null，默认为空字符串',
  PRIMARY KEY (`idx`),
  KEY `index_menu_status` (`status`) USING BTREE,
  KEY `index_menu_pidx` (`pidx`) USING BTREE,
  KEY `index_menu_idx_code` (`idx_code`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='菜单表';

-- ----------------------------
-- Table structure for tb_resource_group_p
-- ----------------------------
DROP TABLE IF EXISTS `tb_resource_group_p`;
CREATE TABLE `tb_resource_group_p` (
  `idx` bigint(19) NOT NULL COMMENT '资源组主键idx，分布式架构，全局唯一递增',
  `idx_code` bigint(19) DEFAULT NULL COMMENT '主键idx生成的code##@Long2S(targetField = "idxCode")##',
  `pidx` bigint(19) DEFAULT NULL COMMENT '父级资源组主键pidx，分布式架构，暂时不用，全局唯一递增',
  `pidx_code` bigint(19) DEFAULT NULL COMMENT 'pidx code 全局唯一性，解决pidx可以通过递增1猜测出来，潜在安全问题##@Long2S(targetField = "pidxCode")##',
  `name` varchar(20) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '资源组名称，最少2个字符，最多20个字符##@NotNull(message = "资源组名称不能为空")@Length(max = 20, message = "资源组名称最大20个字符")##',
  `code` varchar(30) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '资源组编码，必须全集唯一，建议按照菜单_功能_模块命名，必须是小写字母和_（下划线），最少4字符，最多30个字符##@Length(max = 30, message = "资源编码名称最大30个字符")##',
  `create_by_member_idx` bigint(19) DEFAULT NULL COMMENT '创建成员idx，不可以为null',
  `update_by_member_idx` bigint(19) DEFAULT NULL COMMENT '修改成员idx，不可以为null',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间，第一次创建时间，后续不可以修改时间',
  `update_time` timestamp NULL DEFAULT NULL COMMENT '更新时间，每一次修改都要更新时间',
  `status` smallint(1) DEFAULT NULL COMMENT '状态，1：可用，0：删除，取值范围为0-9，不可以为null',
  `version` bigint(19) DEFAULT NULL COMMENT '版本号，高并发，乐观锁解决方案',
  `remark` varchar(20) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '备注，字符个数0-20，不可以为null，必须手动设置空字符串',
  `ext` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '扩展，字符个数0-100，不可以为null，必须手动设置空字符串',
  PRIMARY KEY (`idx`),
  KEY `index_rgp_status` (`status`) USING BTREE,
  KEY `index_rg_idx_code` (`idx_code`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='资源组表';

-- ----------------------------
-- Table structure for tb_resource_p
-- ----------------------------
DROP TABLE IF EXISTS `tb_resource_p`;
CREATE TABLE `tb_resource_p` (
  `idx` bigint(19) NOT NULL COMMENT '资源主键idx，分布式架构，全局唯一递增',
  `idx_code` bigint(19) DEFAULT NULL COMMENT '主键idx生成的code##@Long2S(targetField = "idxCode")##',
  `pidx` bigint(19) DEFAULT NULL COMMENT '暂时不用，父级idx，不可以为null，必须手动设置为0',
  `pidx_code` bigint(19) DEFAULT NULL COMMENT 'pidx code 全局唯一性，解决pidx可以通过递增1猜测出来，潜在安全问题##@Long2S(targetField = "pidxCode")##',
  `resource_group_idx` bigint(19) DEFAULT NULL COMMENT '资源组主键idx',
  `code` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '资源编码，必须全集唯一，建议按照菜单_功能_模块命名，必须是小写字母和_（下划线），最少4字符，最多100个字符',
  `resource_type` smallint(1) DEFAULT NULL COMMENT '资源类型，1:菜单 2：按钮，不能为null',
  `menu_button_idx` bigint(19) DEFAULT NULL COMMENT '菜单或者按钮idx，不能为null',
  `create_by_member_idx` bigint(19) DEFAULT NULL COMMENT '创建成员idx，不可以为null',
  `update_by_member_idx` bigint(19) DEFAULT NULL COMMENT '修改成员idx，不可以为null',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间，第一次创建时间，后续不可以修改时间',
  `update_time` timestamp NULL DEFAULT NULL COMMENT '更新时间，每一次修改都要更新时间',
  `status` smallint(1) DEFAULT NULL COMMENT '状态，1：可用，0：删除，取值范围为0-9，不可以为null',
  `version` bigint(19) DEFAULT NULL COMMENT '版本高，高并发，乐观锁解决方案',
  `remark` varchar(20) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '备注，字符个数0-20，不可以为null，必须手动设置空字符串',
  `ext` varchar(20) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '扩展字段，先用于当资源类型为按钮时，存入menu idx',
  PRIMARY KEY (`idx`),
  KEY `index_resource_menu_button_idx` (`resource_type`,`menu_button_idx`) USING BTREE,
  KEY `index_resource_resource_group_idx` (`resource_group_idx`) USING BTREE,
  KEY `index_resource_status` (`status`) USING BTREE,
  KEY `index_resource_idx_code` (`idx_code`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='资源表';

-- ----------------------------
-- Table structure for tb_role
-- ----------------------------
DROP TABLE IF EXISTS `tb_role`;
CREATE TABLE `tb_role` (
  `idx` bigint(19) NOT NULL COMMENT '角色主键idx，分布式架构，全局唯一递增',
  `idx_code` bigint(19) DEFAULT NULL COMMENT '主键idx生成的code##@Long2S(targetField = "idxCode")##',
  `name` varchar(20) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '角色名称，字符数范围2-20，不可以为null##@NotNull(message = "角色名称不能为空")@Length(min = 2, max = 20, message = "角色名称最小2个字符，最大为20字符")##',
  `code` varchar(30) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '角色编码，字符数范围4-30，必须按照小写和_（下划线）组成##@NotNull(message = "角色编码不能为空")@Length(min = 2, max = 30, message = "角色编码最小2个字符，最大为30字符")##',
  `create_by_member_idx` bigint(19) DEFAULT NULL COMMENT '创建成员idx，不可以为null',
  `update_by_member_idx` bigint(19) DEFAULT NULL COMMENT '更新成员idx，不可以为null',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间，第一次创建的时间，后续更新不可以再更新时间',
  `update_time` timestamp NULL DEFAULT NULL COMMENT '更新时间，后续修改都要更新时间',
  `status` smallint(1) DEFAULT NULL COMMENT '状态，1：可用，0；删除，取值范围0-9，不可以为null',
  `version` bigint(19) DEFAULT NULL COMMENT '版本号，高并发，乐观锁解决方案，不可以为null',
  `remark` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '备注，字符数范围0-100，不可以为null，必须手动设置为空字符串##@Length(max = 100, message = "备注最大100个字符")##',
  PRIMARY KEY (`idx`),
  KEY `index_role_idx_code` (`idx_code`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='角色表';

-- ----------------------------
-- Table structure for tb_role_resource_group
-- ----------------------------
DROP TABLE IF EXISTS `tb_role_resource_group`;
CREATE TABLE `tb_role_resource_group` (
  `idx` bigint(19) NOT NULL COMMENT '角色资源主键idx，必须分布式架构，全局唯一递增',
  `idx_code` bigint(19) DEFAULT NULL COMMENT '主键idx生成的code##@Long2S(targetField = "idxCode")##',
  `role_idx` bigint(19) DEFAULT NULL COMMENT '角色主键idx',
  `resource_group_idx` bigint(19) DEFAULT NULL COMMENT '资源主键idx',
  `create_by_member_idx` bigint(19) DEFAULT NULL COMMENT '创建的成员idx',
  `update_by_member_idx` bigint(19) DEFAULT NULL COMMENT '修改的成员idx',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间，第一次创建的时间，后续不可以修改时间',
  `update_time` timestamp NULL DEFAULT NULL COMMENT '更新时间，后续修改必须更新时间',
  `status` smallint(1) DEFAULT NULL COMMENT '状态，1：可用，0：删除，取值范围0-9，不可以为null，必须手动设置为0',
  `version` bigint(19) DEFAULT NULL COMMENT '版本号，高并发，乐观锁的解决方案，不可以为null',
  `ext` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '扩展，字符个数0-100，不可以为null，必须手动设置空字符串',
  PRIMARY KEY (`idx`),
  KEY `index_rrg_role_idx` (`role_idx`) USING BTREE,
  KEY `index_rrg_resource_group_idx` (`resource_group_idx`) USING BTREE,
  KEY `index_rr_idx_code` (`idx_code`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='角色资源表';
