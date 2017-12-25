/*
Navicat MySQL Data Transfer

Source Server         : 172.16.50.242
Source Server Version : 50505
Source Host           : 172.16.50.242:13306
Source Database       : msyt-item

Target Server Type    : MYSQL
Target Server Version : 50505
File Encoding         : 65001

Date: 2017-12-25 15:15:13
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for tb_item_attribute_image_official
-- ----------------------------
DROP TABLE IF EXISTS `tb_item_attribute_image_official`;
CREATE TABLE `tb_item_attribute_image_official` (
  `idx` bigint(19) NOT NULL COMMENT '正式商品属性图片主键idx，分布式架构，全局唯一递增',
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
  PRIMARY KEY (`idx`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='正式商品属性图片表';

-- ----------------------------
-- Table structure for tb_item_attribute_official
-- ----------------------------
DROP TABLE IF EXISTS `tb_item_attribute_official`;
CREATE TABLE `tb_item_attribute_official` (
  `idx` bigint(19) NOT NULL COMMENT '正式商品属性值主键idx，分布式架构，全局唯一递增',
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
  PRIMARY KEY (`idx`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='正式商品属性值表';

-- ----------------------------
-- Table structure for tb_item_barcode_official
-- ----------------------------
DROP TABLE IF EXISTS `tb_item_barcode_official`;
CREATE TABLE `tb_item_barcode_official` (
  `idx` bigint(19) NOT NULL COMMENT '正式商品条形码主键idx，分布式架构，全局唯一递增',
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
  `idx` bigint(19) NOT NULL COMMENT '正式商品基本信息主键idx，分布式架构，全局唯一递增##@Search(module="msyt-item")##',
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
  `purchase_limitation_count` int(11) DEFAULT NULL COMMENT '限购数，默认为3',
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
  `idx` bigint(19) NOT NULL COMMENT '正式商品采集主键idx，分布式架构，全局唯一递增',
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
  `idx` bigint(19) NOT NULL COMMENT '正式商品主键idx，分布式架构，全局唯一递增',
  `idx_code` bigint(19) DEFAULT NULL COMMENT 'idx code 全局唯一性，解决idx可以通过递增1猜测出来，潜在安全问题##@Long2S(targetField = "idxCode")##',
  `item_idx` bigint(19) DEFAULT NULL COMMENT '采集商品主键idx，不可以为null，必须手动设置为0##@NotNull(message = "商品不能为空")##',
  `platform_idx` bigint(19) DEFAULT NULL COMMENT '平台主键idx，不可以为null，必须手动设置为0##@NotNull(message = "所属平台不能为空")##',
  `first_online_by_member_idx` bigint(19) DEFAULT NULL COMMENT '初次上架人，商品第一次上架的操作者名称',
  `first_online_time` timestamp NULL DEFAULT NULL COMMENT '初次上架时间，商品第一次上架的时间##@EnYyyyMMddHHmmss##',
  `online_by_member_idx` bigint(19) DEFAULT NULL COMMENT '上架人，最近上架人的名称',
  `online_time` timestamp NULL DEFAULT NULL COMMENT '上架时间，最近的上架时间##@EnYyyyMMddHHmmss##',
  `offline_by_member_idx` bigint(19) DEFAULT NULL COMMENT '下架人，最近的下架人名称',
  `offline_time` timestamp NULL DEFAULT NULL COMMENT '下架时间，最近的下架时间##@EnYyyyMMddHHmmss##',
  `create_by_member_idx` bigint(19) DEFAULT NULL COMMENT '创建成员idx，不可以为null',
  `update_by_member_idx` bigint(19) DEFAULT NULL COMMENT '修改成员idx，不可以为null',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间，第一次创建时间，后续不可以修改时间##@EnYyyyMMddHHmmss##',
  `update_time` timestamp NULL DEFAULT NULL COMMENT '更新时间，每一次修改都要更新时间##@EnYyyyMMddHHmmss##',
  `status` smallint(1) DEFAULT NULL COMMENT '上下架状态，1：上架，2：下架，3：待上架，0：删除，取值范围为0-9，不可以为null',
  `version` bigint(19) DEFAULT NULL COMMENT '版本号，高并发，乐观锁的解决方案',
  `ext` varchar(100) DEFAULT NULL COMMENT '扩展，0-100字符，不可以为null，必须手动设置为空字符串',
  PRIMARY KEY (`idx`),
  UNIQUE KEY `unique_item_idx` (`item_idx`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='正式商品表';

-- ----------------------------
-- Table structure for tb_item_price_official
-- ----------------------------
DROP TABLE IF EXISTS `tb_item_price_official`;
CREATE TABLE `tb_item_price_official` (
  `idx` bigint(19) NOT NULL COMMENT '正式商品价格主键idx，分布式架构，全局唯一递增',
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
  PRIMARY KEY (`idx`),
  KEY `index_price_create_member` (`create_by_member_idx`) USING BTREE,
  KEY `index_price_update_member` (`update_by_member_idx`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='正式商品价格表';
