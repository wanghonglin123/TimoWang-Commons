/*
Navicat MySQL Data Transfer

Source Server         : 172.16.50.242
Source Server Version : 50505
Source Host           : 172.16.50.242:13306
Source Database       : msyt-item

Target Server Type    : MYSQL
Target Server Version : 50505
File Encoding         : 65001

Date: 2018-03-22 14:10:53
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for tb_item_attribute_image_official
-- ----------------------------
DROP TABLE IF EXISTS `tb_item_attribute_image_official`;
CREATE TABLE `tb_item_attribute_image_official` (
  `idx` bigint(19) NOT NULL COMMENT '正式商品属性图片主键idx，分布式架构，全局唯一递增##@Cache(module = "msyt-item")@MQ(module = "msyt-item", moduleAlias = "item", autoAck = false)##',
  `idx_code` bigint(19) DEFAULT NULL COMMENT 'idx code 全局唯一性，解决idx可以通过递增1猜测出来，潜在安全问题##@Long2S(targetField = "idxCode")##',
  `item_official_idx` bigint(19) DEFAULT NULL COMMENT '正式商品主键idx，不可以为null，必须手动设置为0##@NotNull(message = "商品不能为空")##',
  `attribute_idx` bigint(19) DEFAULT NULL COMMENT '属性主键idx， 不可以为null，必须手动设置默认值为0',
  `image_small` varchar(200) DEFAULT NULL COMMENT '商品属性小图文件##@DynamicS##',
  `image_middle` varchar(200) DEFAULT NULL COMMENT '商品属性中图文件##@DynamicS##',
  `image_big` varchar(200) DEFAULT NULL COMMENT '商品属性大图文件##@DynamicS##',
  `remark` varchar(200) DEFAULT NULL COMMENT '备注，最多200个字符',
  `edit_type` smallint(1) DEFAULT NULL COMMENT '编辑类型，1：一次编辑，2：二次编辑，取值范围1-9，不可以为null',
  `create_by_member_idx` bigint(19) DEFAULT NULL COMMENT '创建成员，第一次新增时创建，后期不可以更改',
  `update_by_member_idx` bigint(19) DEFAULT NULL COMMENT '修改成员，每一次修改都要记录',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间，新增时赋值当前时间，不可以更改',
  `update_time` timestamp NULL DEFAULT NULL COMMENT '修改时间',
  `status` smallint(1) DEFAULT NULL COMMENT '状态，1：可用的、激活的，2：未激活，0：删除，取值范围为0-9，不可以为null',
  `version` bigint(19) DEFAULT NULL COMMENT '版本号，高并发，乐观锁的解决方案',
  `ext` varchar(100) DEFAULT NULL COMMENT '扩展，0-100字符，不可以为null，必须手动设置为空字符串',
  PRIMARY KEY (`idx`),
  KEY `index_iaio_item` (`item_official_idx`) USING BTREE,
  KEY `index_iaio_attribute` (`attribute_idx`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='正式商品属性图片表';

-- ----------------------------
-- Table structure for tb_item_attribute_official
-- ----------------------------
DROP TABLE IF EXISTS `tb_item_attribute_official`;
CREATE TABLE `tb_item_attribute_official` (
  `idx` bigint(19) NOT NULL COMMENT '正式商品属性值主键idx，分布式架构，全局唯一递增##@Cache(module = "msyt-item")@MQ(module = "msyt-item", moduleAlias = "item", autoAck = false)##',
  `idx_code` bigint(19) DEFAULT NULL COMMENT 'idx code 全局唯一性，解决idx可以通过递增1猜测出来，潜在安全问题##@Long2S(targetField = "idxCode")##',
  `item_official_idx` bigint(19) DEFAULT NULL COMMENT '正式商品主键idx，不可以为null，必须手动设置为0##@NotNull(message = "商品不能为空")##',
  `attribute_idx` bigint(19) DEFAULT NULL COMMENT '属性主键idx， 不可以为null，必须手动设置默认值为0',
  `attribute_value` varchar(500) DEFAULT NULL COMMENT '属性值，最多500个字符',
  `remark` varchar(200) DEFAULT NULL COMMENT '备注，最多200个字符',
  `edit_type` smallint(1) DEFAULT NULL COMMENT '编辑类型，1：一次编辑，2：二次编辑，取值范围1-9，不可以为null',
  `create_by_member_idx` bigint(19) DEFAULT NULL COMMENT '创建成员，第一次新增时创建，后期不可以更改',
  `update_by_member_idx` bigint(19) DEFAULT NULL COMMENT '修改成员，每一次修改都要记录',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间，新增时赋值当前时间，不可以更改',
  `update_time` timestamp NULL DEFAULT NULL COMMENT '修改时间',
  `status` smallint(1) DEFAULT NULL COMMENT '状态，1：可用的、激活的，2：未激活，0：删除，取值范围为0-9，不可以为null',
  `version` bigint(19) DEFAULT NULL COMMENT '版本号，高并发，乐观锁的解决方案',
  `ext` varchar(100) DEFAULT NULL COMMENT '扩展，0-100字符，不可以为null，必须手动设置为空字符串',
  `attribute_option_idx_code` bigint(19) DEFAULT NULL COMMENT '属性选项主键idx code',
  PRIMARY KEY (`idx`),
  KEY `index_iao_item` (`item_official_idx`) USING BTREE,
  KEY `index_iao_attribute` (`attribute_idx`) USING BTREE,
  KEY `index_iao_attribute_option` (`attribute_option_idx_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='正式商品属性值表';

-- ----------------------------
-- Table structure for tb_item_barcode_official
-- ----------------------------
DROP TABLE IF EXISTS `tb_item_barcode_official`;
CREATE TABLE `tb_item_barcode_official` (
  `idx` bigint(19) NOT NULL COMMENT '正式商品条形码主键idx，分布式架构，全局唯一递增##@Cache(module = "msyt-item")@MQ(module = "msyt-item", moduleAlias = "item", autoAck = false)##',
  `idx_code` bigint(19) DEFAULT NULL COMMENT 'idx code 全局唯一性，解决idx可以通过递增1猜测出来，潜在安全问题##@Long2S(targetField = "idxCode")##',
  `item_official_idx` bigint(19) DEFAULT NULL COMMENT '正式商品主键idx，不可以为null，必须手动设置默认值为0##@NotNull(message = "正式商品不能为空")##',
  `barcode` varchar(20) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '条形码，最多20个字符，不可以为null##@NotNull(message = "条形码不能为空")@Length(max = 20, message = "条形码最多20个字符")##',
  `remark` varchar(200) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '备注，最多200个字符',
  `create_by_member_idx` bigint(19) DEFAULT NULL COMMENT '创建成员，第一次新增时创建，后期不可以更改',
  `update_by_member_idx` bigint(19) DEFAULT NULL COMMENT '修改成员，每一次修改都要记录',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间，新增时赋值当前时间，不可以更改',
  `update_time` timestamp NULL DEFAULT NULL COMMENT '修改时间',
  `status` smallint(1) DEFAULT NULL COMMENT '状态，1：可用的、激活的，2：未激活，0：删除，取值范围为0-9，不可以为null',
  `version` bigint(19) DEFAULT NULL COMMENT '版本号，高并发，乐观锁的解决方案',
  `ext` varchar(100) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '扩展，0-100字符，不可以为null，必须手动设置为空字符串',
  PRIMARY KEY (`idx`),
  KEY `index_tibo_item_official_idx` (`item_official_idx`) USING BTREE,
  KEY `index_tibo_status` (`status`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='正式商品条形码表';

-- ----------------------------
-- Table structure for tb_item_basic_official
-- ----------------------------
DROP TABLE IF EXISTS `tb_item_basic_official`;
CREATE TABLE `tb_item_basic_official` (
  `idx` bigint(19) NOT NULL COMMENT '正式商品基本信息主键idx，分布式架构，全局唯一递增##@Cache(module = "msyt-item")@MQ(module = "msyt-item", moduleAlias = "item", autoAck = false)##',
  `idx_code` bigint(19) DEFAULT NULL COMMENT 'idx code 全局唯一性，解决idx可以通过递增1猜测出来，潜在安全问题##@Long2S(targetField = "idxCode")##',
  `item_official_idx` bigint(19) DEFAULT NULL COMMENT '正式商品主键idx，不可以为null，必须手动设置为0##@NotNull(message = "商品不能为空")##',
  `item_state_idx` bigint(19) DEFAULT NULL COMMENT '状态主键idx，不可以为null，必须手动设置为0##@NotNull(message = "商品状态不能为空")@SearchExclusion##',
  `item_ext_idx` bigint(19) DEFAULT NULL COMMENT '商品扩展主键idx，不可以为null，全局唯一递增',
  `item_no` varchar(30) DEFAULT NULL COMMENT '货号，根据类目与仓库类型来自动生成货号，不可重复，不可以为null##@NotNull(message = "货号不能为空")@Length(max = 30, message = "货号最多30位字符")##',
  `barcode` varchar(20) DEFAULT NULL COMMENT '条形码，最多20个字符，不可以为null##@NotNull(message = "条形码不能为空")@Length(max = 20, message = "条形码最多20个字符")##',
  `cn_name` varchar(200) DEFAULT NULL COMMENT '中文名称，最多200位字符，不可以为null##@NotNull(message = "中文名称不能为空")@Length(max = 200, message = "中文名称最多200位字符")@Modified##',
  `en_name` varchar(200) DEFAULT NULL COMMENT '英文名称，最多200个字符，不可以为null##@NotNull(message = "英文名称不能为空")@Length(max = 200, message = "英文名称最多200个字符")##',
  `brand_idx` bigint(19) DEFAULT NULL COMMENT '品牌主键idx，不可以为null，必须手动设置为0##@NotNull(message = "品牌不能为空")##',
  `origin_idx` bigint(19) DEFAULT NULL COMMENT '产地主键idx，不可以为null，必须手动设置为0##@NotNull(message = "产地不能为空")##',
  `category_idx` bigint(19) DEFAULT NULL COMMENT '类目主键idx，不可以为null，必须手动设置为0##@NotNull(message = "类目不能为空")@Modified##',
  `specification` varchar(100) DEFAULT NULL COMMENT '商品规格，最多100个字符##@Length(max = 100, message = "商品规格最多100个字符")##',
  `warehouse_type_idx` bigint(19) DEFAULT NULL COMMENT '仓库类型主键idx，不可以为null，必须手动设置为0##@NotNull(message = "仓库类型不能为空")@DynamicS@Modified##',
  `batch` int(5) DEFAULT NULL COMMENT '批次，取值范围0-99999，不可以为null，必须手动设置为0##@NotNull(message = "批次不能为空")@Range(min = 0, max = 99999, message = "批次取值区间0-99999")##',
  `weight` bigint(19) DEFAULT NULL COMMENT '权重，决定前端商品的排列顺序，不可以为null，必须手动设置为0##@NotNull(message = "权重不能为空")##',
  `collection_remark` varchar(500) DEFAULT NULL COMMENT '采集备注，最多500个字符##@Length(max = 500, message = "采集备注最多500个字符")##',
  `image_small` varchar(100) DEFAULT NULL COMMENT '商品小图文件##@DynamicS##',
  `image_middle` varchar(100) DEFAULT NULL COMMENT '商品中图文件##@DynamicS##',
  `image_big` varchar(100) DEFAULT NULL COMMENT '商品大图文件##@DynamicS##',
  `purchase_status` smallint(1) DEFAULT NULL COMMENT '采购状态，1：未确认采购，2：确认采购，取值范围0-9，不可以为null，必须手动设置默认值为1##@NotNull(message = "采购状态不能为空")@Range(min = 0, max = 9, message = "采购状态取值区间0-9")##',
  `collection_status` smallint(1) DEFAULT NULL COMMENT '采集状态，1：未采集，2：采集完成，3：编辑完成，4：文案通过，取值范围0-9，不可以为null，必须手动设置默认值为1##@NotNull(message = "采集状态不能为空")@Range(min = 0, max = 9, message = "采集状态取值区间0-9")##',
  `purchase_limitation_count` int(11) DEFAULT NULL COMMENT '洋桃限购数，默认为3',
  `create_by_member_idx` bigint(19) DEFAULT NULL COMMENT '创建成员idx，不可以为null',
  `update_by_member_idx` bigint(19) DEFAULT NULL COMMENT '修改成员idx，不可以为null',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间，第一次创建时间，后续不可以修改时间',
  `update_time` timestamp NULL DEFAULT NULL COMMENT '更新时间，每一次修改都要更新时间',
  `status` smallint(1) DEFAULT NULL COMMENT '状态，1：可用的、激活的，2：未激活，0：删除，取值范围为0-9，不可以为null',
  `version` bigint(19) DEFAULT NULL COMMENT '版本号，高并发，乐观锁的解决方案',
  `ext` varchar(100) DEFAULT NULL COMMENT '扩展，0-100字符，不可以为null，必须手动设置为空字符串',
  PRIMARY KEY (`idx`),
  KEY `index_item_brand` (`brand_idx`) USING BTREE,
  KEY `index_item_origin` (`origin_idx`) USING BTREE,
  KEY `index_item_category` (`category_idx`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='正式商品基本信息表';

-- ----------------------------
-- Table structure for tb_item_collection_official
-- ----------------------------
DROP TABLE IF EXISTS `tb_item_collection_official`;
CREATE TABLE `tb_item_collection_official` (
  `idx` bigint(19) NOT NULL COMMENT '正式商品采集主键idx，分布式架构，全局唯一递增##@Cache(module = "msyt-item")@MQ(module = "msyt-item", moduleAlias = "item", autoAck = false)##',
  `idx_code` bigint(19) DEFAULT NULL COMMENT 'idx code 全局唯一性，解决idx可以通过递增1猜测出来，潜在安全问题##@Long2S(targetField = "idxCode")##',
  `item_official_idx` bigint(19) DEFAULT NULL COMMENT '正式商品主键idx，不可以为null，必须手动设置为0##@NotNull(message = "商品不能为空")##',
  `selling_point` varchar(20) DEFAULT NULL COMMENT '卖点，最多20个字符##@Length(max = 20, message = "卖点最多20个字符")##',
  `slogan` varchar(50) DEFAULT NULL COMMENT '广告语，最多50个字符##@Length(max = 50, message = "广告语最多50个字符")##',
  `shopping_guide` varchar(300) DEFAULT NULL COMMENT '导购语，最多300个字符##@Length(max = 300, message = "导购语最多300个字符")##',
  `editor_idx` bigint(19) DEFAULT NULL COMMENT '采编主键idx，不可以为null，必须手动设置为0##@NotNull(message = "采编不能为空")##',
  `search_keywords` varchar(100) DEFAULT NULL COMMENT '搜索关键词，最多100个字符##@Length(max = 100, message = "搜索关键词最多100个字符")##',
  `attachment_id` bigint(19) DEFAULT NULL COMMENT '附件文件messageid##@DynamicS##',
  `video_link` varchar(200) DEFAULT NULL COMMENT '视频链接，最多200个字符',
  `edit_type` smallint(1) DEFAULT NULL COMMENT '编辑类型，1：一次编辑，2：二次编辑，取值范围1-9，不可以为null',
  `create_by_member_idx` bigint(19) DEFAULT NULL COMMENT '创建成员idx，不可以为null',
  `update_by_member_idx` bigint(19) DEFAULT NULL COMMENT '修改成员idx，不可以为null',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间，第一次创建时间，后续不可以修改时间',
  `update_time` timestamp NULL DEFAULT NULL COMMENT '更新时间，每一次修改都要更新时间',
  `status` smallint(1) DEFAULT NULL COMMENT '状态，1：可用的、激活的，2：未激活，0：删除，取值范围为0-9，不可以为null',
  `version` bigint(19) DEFAULT NULL COMMENT '版本号，高并发，乐观锁的解决方案',
  `ext` varchar(100) DEFAULT NULL COMMENT '扩展，0-100字符，不可以为null，必须手动设置为空字符串',
  `efficiency` varchar(1000) DEFAULT NULL COMMENT '产品功效',
  PRIMARY KEY (`idx`),
  KEY `index_collection_item` (`item_official_idx`) USING BTREE,
  KEY `index_collection_editor` (`editor_idx`) USING BTREE,
  KEY `index_collection_create_member` (`create_by_member_idx`) USING BTREE,
  KEY `index_collection_update_member` (`update_by_member_idx`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='正式商品采集表';

-- ----------------------------
-- Table structure for tb_item_official
-- ----------------------------
DROP TABLE IF EXISTS `tb_item_official`;
CREATE TABLE `tb_item_official` (
  `idx` bigint(19) NOT NULL COMMENT '正式商品（正式SPU）主键idx，分布式架构，全局唯一递增##@Cache(module = "msyt-item")@MQ(module = "msyt-item", moduleAlias = "item", autoAck = false)##',
  `idx_code` bigint(19) DEFAULT NULL COMMENT 'idx code 全局唯一性，解决idx可以通过递增1猜测出来，潜在安全问题##@Long2S(targetField = "idxCode")##',
  `item_idx` bigint(19) DEFAULT NULL COMMENT '采集商品主键idx，不可以为null，必须手动设置为0##@NotNull(message = "商品不能为空")##',
  `platform_idx` bigint(19) DEFAULT NULL COMMENT '平台主键idx，不可以为null，必须手动设置为0##@NotNull(message = "所属平台不能为空")##',
  `first_online_by_member_idx` bigint(19) DEFAULT NULL COMMENT '初次上架人，商品第一次上架的操作者名称',
  `first_online_time` timestamp NULL DEFAULT NULL COMMENT '初次上架时间，商品第一次上架的时间##@EnYyyyMMddHHmmss@Date(pattern = MsOnionDatePattern.SINCE)##',
  `online_by_member_idx` bigint(19) DEFAULT NULL COMMENT '上架人，最近上架人的名称',
  `online_time` timestamp NULL DEFAULT NULL COMMENT '上架时间，最近的上架时间##@EnYyyyMMddHHmmss@Date(pattern = MsOnionDatePattern.SINCE)##',
  `offline_by_member_idx` bigint(19) DEFAULT NULL COMMENT '下架人，最近的下架人名称',
  `offline_time` timestamp NULL DEFAULT NULL COMMENT '下架时间，最近的下架时间##@EnYyyyMMddHHmmss@Date(pattern = MsOnionDatePattern.SINCE)##',
  `create_by_member_idx` bigint(19) DEFAULT NULL COMMENT '创建成员idx，不可以为null',
  `update_by_member_idx` bigint(19) DEFAULT NULL COMMENT '修改成员idx，不可以为null',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间，第一次创建时间，后续不可以修改时间##@EnYyyyMMddHHmmss##',
  `update_time` timestamp NULL DEFAULT NULL COMMENT '更新时间，每一次修改都要更新时间##@EnYyyyMMddHHmmss##',
  `status` smallint(1) DEFAULT NULL COMMENT '上下架状态，1：上架，2：下架，3：待上架，0：删除，取值范围为0-9，不可以为null',
  `version` bigint(19) DEFAULT NULL COMMENT '版本号，高并发，乐观锁的解决方案',
  `ext` varchar(100) DEFAULT NULL COMMENT '扩展，0-100字符，不可以为null，必须手动设置为空字符串',
  `limit_count` int(11) DEFAULT NULL COMMENT '限购数，针对其他平台，除了洋桃平台',
  `item_type` int(10) DEFAULT NULL COMMENT '商品类型，10：海外商品，20：普通商品',
  PRIMARY KEY (`idx`),
  UNIQUE KEY `unique_item_idx` (`item_idx`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='正式商品（正式SPU）表';

-- ----------------------------
-- Table structure for tb_item_official_publish_platform
-- ----------------------------
DROP TABLE IF EXISTS `tb_item_official_publish_platform`;
CREATE TABLE `tb_item_official_publish_platform` (
  `idx` bigint(19) NOT NULL COMMENT '商品发布平台主键idx，分布式架构，全局唯一递增##@Cache(module = "msyt-item")@MQ(module = "msyt-item", moduleAlias = "item", autoAck = false)##',
  `idx_code` bigint(19) DEFAULT NULL COMMENT 'idx code 全局唯一性，解决idx可以通过递增1猜测出来，潜在安全问题##@Long2S(targetField = "idxCode")##',
  `item_official_idx_code` bigint(19) DEFAULT NULL COMMENT '发布商品idx code',
  `publish_platform` smallint(1) DEFAULT NULL COMMENT '发布平台，1：洋桃，5：洋葱，4：MiniBuyker，取值范围为0-9，不可以为null',
  `remark` varchar(200) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '备注',
  `create_by_member_idx` bigint(19) DEFAULT NULL COMMENT '创建成员idx，不可以为null',
  `update_by_member_idx` bigint(19) DEFAULT NULL COMMENT '修改成员idx，不可以为null',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间，第一次创建时间，后续不可以修改时间##@EnYyyyMMddHHmmss##',
  `update_time` timestamp NULL DEFAULT NULL COMMENT '更新时间，每一次修改都要更新时间##@EnYyyyMMddHHmmss##',
  `status` smallint(1) DEFAULT NULL COMMENT '状态，1：可用的、激活的，2：未激活，0：删除，取值范围为0-9，不可以为null',
  `version` bigint(19) DEFAULT NULL COMMENT '版本号，高并发，乐观锁的解决方案',
  `ext` varchar(100) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '扩展，0-100字符，不可以为null，必须手动设置为空字符串',
  PRIMARY KEY (`idx`),
  KEY `index_iopp_item` (`item_official_idx_code`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='商品发布平台表';

-- ----------------------------
-- Table structure for tb_item_on_shelves_task_import
-- ----------------------------
DROP TABLE IF EXISTS `tb_item_on_shelves_task_import`;
CREATE TABLE `tb_item_on_shelves_task_import` (
  `idx` bigint(19) NOT NULL COMMENT '主键idx，分布式架构，全局唯一递增##@Cache(module = "msyt-item")@MQ(module = "msyt-item", moduleAlias = "item", autoAck = false)##',
  `idx_code` bigint(19) DEFAULT NULL COMMENT 'idx code 全局唯一性，解决idx可以通过递增1猜测出来，潜在安全问题##@Long2S(targetField = "idxCode")##',
  `item_no` varchar(30) DEFAULT NULL COMMENT '货号，不可以为null##@NotNull(message = "货号不能为空")@Length(max = 30, message = "货号最多30位字符")##',
  `task_type` smallint(1) DEFAULT NULL COMMENT '任务类型：1、上架，2、下架',
  `execute_time` timestamp NULL DEFAULT NULL COMMENT '执行时间',
  `platform` smallint(1) DEFAULT NULL COMMENT '发布平台：1：洋桃，5：洋葱，4：Minibuyker',
  `handle_status` smallint(1) DEFAULT NULL COMMENT '0-已导入 1-已生成调度任务 2-已处理完成',
  `create_by_member_idx` bigint(19) DEFAULT NULL COMMENT '创建成员idx，不可以为null',
  `update_by_member_idx` bigint(19) DEFAULT NULL COMMENT '修改成员idx，不可以为null',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间，第一次创建时间，后续不可以修改时间##@EnYyyyMMddHHmmss##',
  `update_time` timestamp NULL DEFAULT NULL COMMENT '更新时间，每一次修改都要更新时间##@EnYyyyMMddHHmmss##',
  `status` smallint(1) DEFAULT NULL COMMENT '状态，1：可用的、激活的，2：未激活，0：删除，取值范围为0-9，不可以为null',
  `version` bigint(20) DEFAULT NULL COMMENT '版本号，高并发，乐观锁的解决方案',
  `ext` varchar(100) DEFAULT NULL COMMENT '扩展，0-100字符，不可以为null，必须手动设置为空字符串',
  PRIMARY KEY (`idx`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='商品上下架任务导入';

-- ----------------------------
-- Table structure for tb_item_price_official
-- ----------------------------
DROP TABLE IF EXISTS `tb_item_price_official`;
CREATE TABLE `tb_item_price_official` (
  `idx` bigint(19) NOT NULL COMMENT '正式商品价格主键idx，分布式架构，全局唯一递增##@Cache(module = "msyt-item")@MQ(module = "msyt-item", moduleAlias = "item", autoAck = false)##',
  `idx_code` bigint(19) DEFAULT NULL COMMENT 'idx code 全局唯一性，解决idx可以通过递增1猜测出来，潜在安全问题##@Long2S(targetField = "idxCode")##',
  `item_official_idx` bigint(19) DEFAULT NULL COMMENT '正式商品主键idx，不可以为null，必须手动设置默认值为0',
  `market_price` int(10) DEFAULT NULL COMMENT '市场价，以分为单位，而不是以元为单位，取值范围0-2147483647，不可以为null##@NotNull(message = "市场价不能为空")@Range(min = 0, max = 2147483647, message = "市场价需要设置0-2147483647")@$2@Modified##',
  `selling_price` int(10) DEFAULT NULL COMMENT '售价，以分为单位，而不是以元为单位，取值范围0-2147483647，不可以为null##@NotNull(message = "售价不能为空")@Range(min = 0, max = 2147483647, message = "售价需要设置0-2147483647")@$2@Modified##',
  `supply_price` int(10) DEFAULT NULL COMMENT '供货价，以分为单位，而不是以元为单位，取值范围0-2147483647，不可以为null##@NotNull(message = "供货价不能为空")@Range(min = 0, max = 2147483647, message = "供货价需要设置0-2147483647")@$2@Modified##',
  `create_by_member_idx` bigint(19) DEFAULT NULL COMMENT '创建成员idx，不可以为null##@DynamicS##',
  `update_by_member_idx` bigint(19) DEFAULT NULL COMMENT '修改成员idx，不可以为null',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间，第一次创建时间，后续不可以修改时间##@EnYyyyMMddHHmmss##',
  `update_time` timestamp NULL DEFAULT NULL COMMENT '更新时间，每一次修改都要更新时间',
  `status` smallint(1) DEFAULT NULL COMMENT '状态，1：可用的、激活的，2：未激活，0：删除，取值范围为0-9，不可以为null',
  `version` bigint(19) DEFAULT NULL COMMENT '版本号，高并发，乐观锁的解决方案',
  `ext` varchar(100) DEFAULT NULL COMMENT '扩展，0-100字符，不可以为null，必须手动设置为空字符串',
  `is_change_price` smallint(1) DEFAULT '0' COMMENT '是否可改价格,0-否 1-是',
  PRIMARY KEY (`idx`),
  KEY `index_price_create_member` (`create_by_member_idx`) USING BTREE,
  KEY `index_price_update_member` (`update_by_member_idx`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='正式商品价格表';

-- ----------------------------
-- Table structure for tb_sku_image_official
-- ----------------------------
DROP TABLE IF EXISTS `tb_sku_image_official`;
CREATE TABLE `tb_sku_image_official` (
  `idx` bigint(19) NOT NULL COMMENT '正式sku图片主键idx##@Cache(module = "msyt-item")@MQ(module = "msyt-item", moduleAlias = "item", autoAck = false)##',
  `idx_code` bigint(19) DEFAULT NULL COMMENT '正式sku图片主键idx code##@Long2S(targetField = "idxCode")##',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  `image_small` varchar(200) DEFAULT NULL COMMENT '图片（小）##@DynamicS##',
  `image_middle` varchar(200) DEFAULT NULL COMMENT '图片（中）##@DynamicS##',
  `image_big` varchar(200) DEFAULT NULL COMMENT '图片（大）##@DynamicS##',
  `sku_official_idx_code` bigint(19) DEFAULT NULL COMMENT '正式sku主键idx code',
  `sequence` int(10) DEFAULT NULL COMMENT '序号',
  `image_type` int(10) DEFAULT NULL COMMENT '图片类型，预留字段',
  `create_by_member_idx_code` bigint(19) DEFAULT NULL COMMENT '创建成员主键idx code',
  `update_by_member_idx_code` bigint(19) DEFAULT NULL COMMENT '修改成员主键idx code',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间##@EnYyyyMMddHHmmss##',
  `update_time` timestamp NULL DEFAULT NULL COMMENT '修改时间##@EnYyyyMMddHHmmss##',
  `status` smallint(1) DEFAULT NULL COMMENT '状态，1：可用的、激活的，2：未激活，0：删除',
  `version` bigint(19) DEFAULT NULL COMMENT '版本号，高并发，乐观锁的解决方案',
  PRIMARY KEY (`idx`),
  KEY `index_sio_sku_official` (`sku_official_idx_code`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='正式sku图片表';

-- ----------------------------
-- Table structure for tb_sku_official
-- ----------------------------
DROP TABLE IF EXISTS `tb_sku_official`;
CREATE TABLE `tb_sku_official` (
  `idx` bigint(19) NOT NULL COMMENT '正式sku主键idx##@Cache(module = "msyt-item")@MQ(module = "msyt-item", moduleAlias = "item", autoAck = false)##',
  `idx_code` bigint(19) DEFAULT NULL COMMENT '正式sku主键idx code##@Long2S(targetField = "idxCode")##',
  `summary` varchar(500) DEFAULT NULL COMMENT '简介',
  `batch` int(10) DEFAULT NULL COMMENT '批次',
  `spu_official_idx_code` bigint(19) DEFAULT NULL COMMENT '正式spu（item_official表）主键idx code',
  `spu_idx_code` bigint(19) DEFAULT NULL COMMENT 'spu（item表）主键idx code',
  `sku_idx_code` bigint(19) DEFAULT NULL COMMENT 'sku（sku表）主键idx code',
  `item_type` int(10) DEFAULT NULL COMMENT '商品类型，10：海外商品，20：普通商品',
  `limit_count` int(10) DEFAULT NULL COMMENT '限购数',
  `cn_name` varchar(200) DEFAULT NULL COMMENT '中文名称##@Size(max = 200, message = "中文名称，最多200位字符")##',
  `en_name` varchar(200) DEFAULT NULL COMMENT '英文名称##@Size(max = 200, message = "英文名称，最多200位字符")##',
  `item_no` varchar(100) DEFAULT NULL COMMENT '货号##@Size(max = 100, message = "货号，最多100位字符")##',
  `barcode` varchar(100) DEFAULT NULL COMMENT '条形码##@Size(max = 100, message = "条形码，最多100位字符")##',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  `create_by_member_idx_code` bigint(19) DEFAULT NULL COMMENT '创建成员主键idx code',
  `update_by_member_idx_code` bigint(19) DEFAULT NULL COMMENT '修改成员主键idx code',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间##@EnYyyyMMddHHmmss##',
  `update_time` timestamp NULL DEFAULT NULL COMMENT '修改时间##@EnYyyyMMddHHmmss##',
  `status` smallint(1) DEFAULT NULL COMMENT '上下架状态，1：上架，2：下架，3：待上架，0：删除，取值范围为0-9，不可以为null',
  `version` bigint(19) DEFAULT NULL COMMENT '版本号，高并发，乐观锁的解决方案',
  PRIMARY KEY (`idx`),
  UNIQUE KEY `uniq_index_so_sku` (`sku_idx_code`) USING BTREE,
  KEY `index_so_spu_official` (`spu_official_idx_code`) USING BTREE,
  KEY `index_so_idx_code` (`idx_code`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='正式sku表';

-- ----------------------------
-- Table structure for tb_sku_specification_option_official
-- ----------------------------
DROP TABLE IF EXISTS `tb_sku_specification_option_official`;
CREATE TABLE `tb_sku_specification_option_official` (
  `idx` bigint(19) NOT NULL COMMENT '正式sku与规格选项关联主键idx##@Cache(module = "msyt-item")@MQ(module = "msyt-item", moduleAlias = "item", autoAck = false)##',
  `idx_code` bigint(19) DEFAULT NULL COMMENT '正式sku与规格选项关联主键idx code##@Long2S(targetField = "idxCode")##',
  `spu_official_idx_code` bigint(19) DEFAULT NULL COMMENT '正式spu主键idx code',
  `sku_official_idx_code` bigint(19) DEFAULT NULL COMMENT '正式sku主键idx code',
  `specification_idx_code` bigint(19) DEFAULT NULL COMMENT '规格主键idx code',
  `specification_option_idx_code` bigint(19) DEFAULT NULL COMMENT '规格选项idx code',
  `create_by_member_idx_code` bigint(19) DEFAULT NULL COMMENT '创建成员主键idx code',
  `update_by_member_idx_code` bigint(19) DEFAULT NULL COMMENT '修改成员主键idx code',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间##@EnYyyyMMddHHmmss##',
  `update_time` timestamp NULL DEFAULT NULL COMMENT '修改时间##@EnYyyyMMddHHmmss##',
  `status` smallint(1) DEFAULT NULL COMMENT '状态，1：可用的、激活的，2：未激活，0：删除',
  `version` bigint(19) DEFAULT NULL COMMENT '版本号，高并发，乐观锁的解决方案',
  PRIMARY KEY (`idx`),
  KEY `index_ssoo_spu_official` (`spu_official_idx_code`) USING BTREE,
  KEY `index_ssoo_sku_official` (`sku_official_idx_code`) USING BTREE,
  KEY `index_ssoo_spec` (`specification_idx_code`) USING BTREE,
  KEY `index_ssoo_spec_option` (`specification_option_idx_code`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='正式sku与规格选项关联表';

-- ----------------------------
-- Table structure for tb_spu_image_official
-- ----------------------------
DROP TABLE IF EXISTS `tb_spu_image_official`;
CREATE TABLE `tb_spu_image_official` (
  `idx` bigint(19) NOT NULL COMMENT '正式spu图片主键idx##@Cache(module = "msyt-item")@MQ(module = "msyt-item", moduleAlias = "item", autoAck = false)##',
  `idx_code` bigint(19) DEFAULT NULL COMMENT '正式spu图片主键idx code##@Long2S(targetField = "idxCode")##',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  `image_small` varchar(200) DEFAULT NULL COMMENT '图片（小）##@DynamicS##',
  `image_middle` varchar(200) DEFAULT NULL COMMENT '图片（中）##@DynamicS##',
  `image_big` varchar(200) DEFAULT NULL COMMENT '图片（大）##@DynamicS##',
  `spu_official_idx_code` bigint(19) DEFAULT NULL COMMENT '正式spu主键idx code',
  `sequence` int(10) DEFAULT NULL COMMENT '序号',
  `image_type` int(10) DEFAULT NULL COMMENT '图片类型，10：轮播图',
  `create_by_member_idx_code` bigint(19) DEFAULT NULL COMMENT '创建成员主键idx code',
  `update_by_member_idx_code` bigint(19) DEFAULT NULL COMMENT '修改成员主键idx code',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间##@EnYyyyMMddHHmmss##',
  `update_time` timestamp NULL DEFAULT NULL COMMENT '修改时间##@EnYyyyMMddHHmmss##',
  `status` smallint(1) DEFAULT NULL COMMENT '状态，1：可用的、激活的，2：未激活，0：删除',
  `version` bigint(19) DEFAULT NULL COMMENT '版本号，高并发，乐观锁的解决方案',
  PRIMARY KEY (`idx`),
  KEY `index_sio_spu_official` (`spu_official_idx_code`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='正式spu图片表';
