/*
Navicat MySQL Data Transfer

Source Server         : 172.16.50.242
Source Server Version : 50505
Source Host           : 172.16.50.242:13306
Source Database       : msyt-logistics

Target Server Type    : MYSQL
Target Server Version : 50505
File Encoding         : 65001

Date: 2017-12-25 15:15:23
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for tb_logistics_area_p
-- ----------------------------
DROP TABLE IF EXISTS `tb_logistics_area_p`;
CREATE TABLE `tb_logistics_area_p` (
  `idx` bigint(19) NOT NULL COMMENT '计量单位主键idx，分布式架构，全局唯一递增##@Cache(module = "msyt-logistics")@MQ(module = "msyt-logistics", moduleAlias = "logistics", autoAck = false)##',
  `idx_code` bigint(19) DEFAULT NULL COMMENT 'idx code 全局唯一性，解决idx可以通过递增1猜测出来，潜在安全问题##@Long2S(targetField = "idxCode")##',
  `pidx` bigint(19) DEFAULT NULL COMMENT '父级区域主键idx，不可以为null，必须手动设置为0',
  `pidx_code` bigint(19) DEFAULT NULL COMMENT 'pidx code 全局唯一性，解决pidx可以通过递增1猜测出来，潜在安全问题##@Long2S(targetField = "pidxCode")##',
  `top_province_second_code` varchar(10) DEFAULT NULL COMMENT '顶级省父第二套编码，根据城市code查询全部市区和区县',
  `top_city_second_code` varchar(10) DEFAULT NULL COMMENT '第二套父城市编码，用于查询区县',
  `top_province_code` varchar(10) DEFAULT NULL COMMENT '区县顶级父编码，用于根据省code查询全部区县和市区',
  `top_city_code` varchar(10) DEFAULT NULL COMMENT '顶级城市编码，根据城市code查询全部区县',
  `name` varchar(20) DEFAULT NULL COMMENT '区域名称，最多20个字符（包括中英文），不可以为null或者空字符串，长度最少2个字符##@NotNull(message = "区域名称不能为空")@Length(min = 2, max = 20, message = "区域名称最小2个字符，最大20个字符")##',
  `code` varchar(10) DEFAULT NULL COMMENT '区域编码码，最多10位字符串，不可以为null，必须手动设置为0##@NotNull(message = "区域编码不能为空")@Length(max = 10, message = "区域编码最大10个字符")##',
  `second_code` varchar(10) DEFAULT NULL COMMENT '### 为了兼容杨桃、洋葱现有的省市区的code ',
  `level` smallint(1) DEFAULT NULL COMMENT '区域级别，1：省，2：市区，3：区域，不可以为null，必须手动设置默认值为0',
  `remark` varchar(100) DEFAULT NULL COMMENT '备注，不能为Null',
  `zindex` smallint(3) DEFAULT NULL COMMENT '区域顺序，按照从小到大顺序，取值范围0-766，不可以为null，必须手动设置默认值为0## @Range(min = 0, max = 766, message = "区域顺序需要设置0-766")##',
  `status` smallint(1) DEFAULT NULL COMMENT '区域状态，1：可用，0：删除，3：表示已设置价格，取值范围为0-9，不可以为null，必须手动设置为0或者1',
  `version` bigint(19) DEFAULT NULL COMMENT '版本号，高并发，乐观锁的解决方案，不可以为null，必须赋值',
  `create_by_member_idx` bigint(19) DEFAULT NULL COMMENT '区域被哪位成员（member_idx）创建的，不可以为null',
  `update_by_member_idx` bigint(19) DEFAULT NULL COMMENT '区域被哪位成员（member_idx）修改的，不可以为null',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间，后续不可以再更新时间##@EnYyyyMMddHHmmss##',
  `update_time` timestamp NULL DEFAULT NULL COMMENT '更新时间，每一次都要更新##@EnYyyyMMddHHmmss##',
  `ext` varchar(100) DEFAULT NULL COMMENT '扩展字段，不可以为null，默认为空字符串',
  PRIMARY KEY (`idx`),
  UNIQUE KEY `uniq_idx_code` (`idx_code`) USING HASH,
  KEY `index_code` (`code`) USING HASH,
  KEY `index_secondcode` (`second_code`) USING HASH
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='区域省市区表';

-- ----------------------------
-- Table structure for tb_logistics_customs_declare
-- ----------------------------
DROP TABLE IF EXISTS `tb_logistics_customs_declare`;
CREATE TABLE `tb_logistics_customs_declare` (
  `idx` bigint(19) NOT NULL COMMENT '商品报关主键idx，分布式架构，全局唯一递增##@Cache(module = "msyt-logistics")@MQ(module = "msyt-logistics", moduleAlias = "logistics", autoAck = false)##',
  `idx_code` bigint(19) DEFAULT NULL COMMENT '主键idx生成的code##@Long2S(targetField = "idxCode")##',
  `item_idx` bigint(19) DEFAULT NULL COMMENT '商品主键idx，不可以为null，必须手动设置为0##@NotNull(message = "商品不能为空")##',
  `custom_name` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '报关品名，最多50个字符##@Length(max = 50, message = "报关品名最多50个字符")##',
  `first_quantity` int(10) DEFAULT NULL COMMENT '第一数量，取值范围为0-2147483647##@Range(min = 0, max = 2147483647, message = "第一数量需要设置0-2147483647")@$5##',
  `second_quantity` int(10) DEFAULT NULL COMMENT '第二数量，取值范围为0-2147483647##@Range(min = 0, max = 2147483647, message = "第二数量需要设置0-2147483647")@$5##',
  `first_unit_idx` bigint(19) DEFAULT NULL COMMENT '第一单位主键idx，不可以为null##@DynamicS##',
  `second_unit_idx` bigint(19) DEFAULT NULL COMMENT '第二单位主键idx，不可以为null##@DynamicS##',
  `postal_articles_tax_rate` int(6) DEFAULT NULL COMMENT '行邮税率，以十万分位为单位，而不是以元为单位，取值范围为0-100000，不可以为null##@NotNull(message = "行邮税率不能为空")@Range(min = 0, max = 100000, message = "行邮税率需要设置0-1")@$5##',
  `cross_border_tax_rate` int(6) DEFAULT NULL COMMENT '跨境税率，以十万分位为单位，而不是以元为单位，取值范围为0-100000，不可以为null##@NotNull(message = "跨境税率不能为空")@Range(min = 0, max = 100000, message = "跨境税率需要设置0-1")@$5##',
  `bc_price` int(10) DEFAULT NULL COMMENT 'BC价，以分为单位，而不是以元为单位，取值范围0-2147483647，不可以为null##@NotNull(message = "BC价不能为空")@Range(min = 0, max = 2147483647, message = "BC价需要设置0-2147483647")@$2##',
  `hs_code` varchar(10) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'HS编码，不可以为null##@NotNull(message = "HS编码不能为空")##',
  `gross_weight` varchar(20) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '毛重，最多20个字符##@Length(max = 20, message = "毛重最多20个字符")##',
  `postal_articles_tax_number` varchar(10) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '行邮税号，不可以为null##@NotNull(message = "行邮税号不能为空")##',
  `is_contain_excise` smallint(1) DEFAULT NULL COMMENT '是否含有消费税，1：是，0：否，取值范围为0-9，不可以为null##@NotNull(message = "是否含有消费税不能为空")##',
  `publish_status` smallint(1) DEFAULT NULL COMMENT '发布状态，0-未发布 1-已发布',
  `create_by_member_idx` bigint(19) DEFAULT NULL COMMENT '创建成员idx，不可以为null',
  `update_by_member_idx` bigint(19) DEFAULT NULL COMMENT '修改成员idx，不可以为null',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间，第一次创建时间，后续不可以修改时间',
  `update_time` timestamp NULL DEFAULT NULL COMMENT '更新时间，每一次修改都要更新时间',
  `status` smallint(1) DEFAULT NULL COMMENT '状态，1：可用的、激活的，2：未激活，0：删除，取值范围为0-9，不可以为null',
  `version` bigint(19) DEFAULT NULL COMMENT '版本号，高并发，乐观锁的解决方案',
  `ext` varchar(100) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '扩展，0-100字符，不可以为null，必须手动设置为空字符串',
  `customs_goods_id` varchar(30) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '商品备案ID字段',
  PRIMARY KEY (`idx`),
  KEY `index_lcd_item_idx` (`item_idx`) USING BTREE,
  KEY `index_lcd_idx_code` (`idx_code`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='商品报关表';

-- ----------------------------
-- Table structure for tb_logistics_customs_declare_official
-- ----------------------------
DROP TABLE IF EXISTS `tb_logistics_customs_declare_official`;
CREATE TABLE `tb_logistics_customs_declare_official` (
  `idx` bigint(19) NOT NULL COMMENT '正式商品报关主键idx，分布式架构，全局唯一递增##@Cache(module = "msyt-logistics")@MQ(module = "msyt-logistics", moduleAlias = "logistics", autoAck = false)##',
  `idx_code` bigint(19) DEFAULT NULL COMMENT '主键idx生成的code##@Long2S(targetField = "idxCode")##',
  `item_official_idx` bigint(19) DEFAULT NULL COMMENT '正式商品主键idx，不可以为null，必须手动设置为0##@NotNull(message = "正式商品不能为空")##',
  `custom_name` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '报关品名，最多50个字符##@Length(max = 50, message = "报关品名最多50个字符")##',
  `first_quantity` int(10) DEFAULT NULL COMMENT '第一数量，取值范围为0-2147483647##@Range(min = 0, max = 2147483647, message = "第一数量需要设置0-2147483647")@$5##',
  `second_quantity` int(10) DEFAULT NULL COMMENT '第二数量，取值范围为0-2147483647##@Range(min = 0, max = 2147483647, message = "第二数量需要设置0-2147483647")@$5##',
  `first_unit_idx` bigint(19) DEFAULT NULL COMMENT '第一单位主键idx，不可以为null##@DynamicS##',
  `second_unit_idx` bigint(19) DEFAULT NULL COMMENT '第二单位主键idx，不可以为null##@DynamicS##',
  `postal_articles_tax_rate` int(6) DEFAULT NULL COMMENT '行邮税率，以十万分位为单位，而不是以元为单位，取值范围为0-100000，不可以为null##@NotNull(message = "行邮税率不能为空")@Range(min = 0, max = 100000, message = "行邮税率需要设置0-1")@$5##',
  `cross_border_tax_rate` int(6) DEFAULT NULL COMMENT '跨境税率，以十万分位为单位，而不是以元为单位，取值范围为0-100000，不可以为null##@NotNull(message = "跨境税率不能为空")@Range(min = 0, max = 100000, message = "跨境税率需要设置0-1")@$5##',
  `bc_price` int(10) DEFAULT NULL COMMENT 'BC价，以分为单位，而不是以元为单位，取值范围0-2147483647，不可以为null##@NotNull(message = "BC价不能为空")@Range(min = 0, max = 2147483647, message = "BC价需要设置0-2147483647")@$2##',
  `hs_code` varchar(10) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'HS编码，不可以为null##@NotNull(message = "HS编码不能为空")##',
  `gross_weight` varchar(20) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '毛重，最多20个字符##@Length(max = 20, message = "毛重最多20个字符")##',
  `postal_articles_tax_number` varchar(10) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '行邮税号，不可以为null##@NotNull(message = "行邮税号不能为空")##',
  `is_contain_excise` smallint(1) DEFAULT NULL COMMENT '是否含有消费税，1：是，0：否，取值范围为0-9，不可以为null##@NotNull(message = "是否含有消费税不能为空")##',
  `create_by_member_idx` bigint(19) DEFAULT NULL COMMENT '创建成员idx，不可以为null',
  `update_by_member_idx` bigint(19) DEFAULT NULL COMMENT '修改成员idx，不可以为null',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间，第一次创建时间，后续不可以修改时间',
  `update_time` timestamp NULL DEFAULT NULL COMMENT '更新时间，每一次修改都要更新时间',
  `status` smallint(1) DEFAULT NULL COMMENT '状态，1：可用的、激活的，2：未激活，0：删除，取值范围为0-9，不可以为null',
  `version` bigint(19) DEFAULT NULL COMMENT '版本号，高并发，乐观锁的解决方案',
  `ext` varchar(100) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '扩展，0-100字符，不可以为null，必须手动设置为空字符串',
  `customs_goods_id` varchar(30) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '商品备案ID字段',
  PRIMARY KEY (`idx`),
  KEY `index_tcdo_item_official_idx` (`item_official_idx`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='正式商品报关表';

-- ----------------------------
-- Table structure for tb_logistics_distribution
-- ----------------------------
DROP TABLE IF EXISTS `tb_logistics_distribution`;
CREATE TABLE `tb_logistics_distribution` (
  `idx` bigint(19) NOT NULL COMMENT '配送区主键idx，分布式架构，全局唯一递增##@Cache(module = "msyt-logistics")@MQ(module = "msyt-logistics", moduleAlias = "logistics", autoAck = false)##',
  `idx_code` bigint(19) DEFAULT NULL COMMENT 'idx code 全局唯一性，解决idx可以通过递增1猜测出来，潜在安全问题##@Long2S(targetField = "idxCode")##',
  `price` int(10) DEFAULT NULL COMMENT '运费价格##@$2##',
  `code` varchar(20) DEFAULT NULL COMMENT '编码，唯一标识',
  `version` bigint(19) DEFAULT NULL COMMENT '版本号，高并发，乐观锁的解决方案',
  `status` smallint(2) DEFAULT NULL COMMENT '状态，1：可用的、激活的，2：未激活，0：删除，3: 默认运费，取值范围为0-9，不可以为null',
  `create_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间，第一次创建时间，后续不可以修改时间##@EnYyyyMMddHHmmss##',
  `update_time` timestamp NULL DEFAULT NULL COMMENT '更新时间，每一次都要更新##@EnYyyyMMddHHmmss##',
  `create_by_member_idx` bigint(19) DEFAULT NULL COMMENT '创建成员idx，不可以为##@DynamicS##',
  `update_by_member_idx` bigint(19) DEFAULT NULL COMMENT '修改成员idx，不可以为null##@DynamicS##',
  `ext` varchar(100) DEFAULT NULL COMMENT '扩展，0-100字符，不可以为null，必须手动设置为空字符串',
  `remark` varchar(100) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`idx`),
  UNIQUE KEY `uniq_idx_code` (`idx_code`) USING HASH,
  KEY `index_code` (`code`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='配送区表';

-- ----------------------------
-- Table structure for tb_logistics_distribution_area
-- ----------------------------
DROP TABLE IF EXISTS `tb_logistics_distribution_area`;
CREATE TABLE `tb_logistics_distribution_area` (
  `idx` bigint(19) NOT NULL COMMENT '计量单位主键idx，分布式架构，全局唯一递增##@Cache(module = "msyt-logistics")@MQ(module = "msyt-logistics", moduleAlias = "logistics", autoAck = false)##',
  `idx_code` bigint(19) DEFAULT NULL COMMENT 'idx code 全局唯一性，解决idx可以通过递增1猜测出来，潜在安全问题##@Long2S(targetField = "idxCode")##',
  `distribution_price` int(10) DEFAULT NULL COMMENT '配送区域价格##@$2##',
  `distribution_idx_code` bigint(19) DEFAULT NULL COMMENT '配送区idxCode',
  `area_code` varchar(20) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '区域编码',
  `version` bigint(19) DEFAULT NULL COMMENT '版本号，高并发，乐观锁的解决方案',
  `status` smallint(2) DEFAULT NULL COMMENT '状态，1：可用的、激活的，2：未激活，0：删除，取值范围为0-9，不可以为null',
  `update_by_member_idx` bigint(19) DEFAULT NULL COMMENT '创建成员idx，不可以为null',
  `create_by_member_idx` bigint(19) DEFAULT NULL COMMENT '修改成员idx，不可以为null',
  `create_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间，第一次创建时间，后续不可以修改时间',
  `update_time` timestamp NULL DEFAULT NULL COMMENT '更新时间，每一次都要更新##@EnYyyyMMddHHmmss##',
  `ext` varchar(100) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '扩展，0-100字符，不可以为null，必须手动设置为空字符串',
  `remark` varchar(100) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '扩展，0-100字符，不可以为null，必须手动设置为空字符串',
  PRIMARY KEY (`idx`),
  KEY `index_area_code` (`area_code`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='配送区区域关联表';

-- ----------------------------
-- Table structure for tb_logistics_express_code
-- ----------------------------
DROP TABLE IF EXISTS `tb_logistics_express_code`;
CREATE TABLE `tb_logistics_express_code` (
  `idx` bigint(19) NOT NULL COMMENT '主键idx，分布式架构，全局唯一递增',
  `idx_code` bigint(19) DEFAULT NULL COMMENT '主键idx生成的code##@Long2S(targetField = "idxCode")##',
  `company_key` varchar(50) DEFAULT NULL COMMENT '所属公司key,在系统平台字典设置## @NotNull(message = "所属公司key不能为空")@Length(max = 50, message = "所有公司key最大50个字符")##',
  `express_name` varchar(50) DEFAULT NULL COMMENT '物流名称## @NotNull(message = "物流名称不能为空")@Length(max = 50, message = "物流名称最大50个字符")##',
  `express_code` varchar(50) DEFAULT NULL COMMENT '物流编码## @NotNull(message = "物流编码不能为空")@Length(max = 100, message = "物流编码最大100个字符")##',
  `juhe_code` varchar(100) DEFAULT NULL COMMENT 'juhe快递编码',
  `erp_code` varchar(30) DEFAULT NULL COMMENT 'erp快递编码',
  `remark` varchar(100) DEFAULT NULL COMMENT '备注，不能为Null',
  `status` smallint(1) DEFAULT NULL COMMENT '物流编码状态，1：启用，2：停用，取值范围为0-9，不可以为null，必须手动设置为0或者1',
  `version` bigint(19) DEFAULT NULL COMMENT '版本号，高并发，乐观锁的解决方案，不可以为null，必须赋值',
  `create_by_member_idx` bigint(19) DEFAULT NULL COMMENT '被哪位成员（member_idx）创建的，不可以为null创建成员idx，不可以为##@DynamicS##',
  `update_by_member_idx` bigint(19) DEFAULT NULL COMMENT '被哪位成员（member_idx）修改的，不可以为null创建成员idx，不可以为##@DynamicS##',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间，后续不可以再更新时间##@EnYyyyMMddHHmmss##',
  `update_time` timestamp NULL DEFAULT NULL COMMENT '更新时间，每一次都要更新##@EnYyyyMMddHHmmss##',
  `ext` varchar(100) DEFAULT NULL COMMENT '扩展字段，不可以为null，默认为空字符串',
  PRIMARY KEY (`idx`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='物流快递编码';

-- ----------------------------
-- Table structure for tb_logistics_fictitious_order
-- ----------------------------
DROP TABLE IF EXISTS `tb_logistics_fictitious_order`;
CREATE TABLE `tb_logistics_fictitious_order` (
  `idx` bigint(19) NOT NULL COMMENT '订单虚拟物流idx，分布式架构，全局唯一递增##@Cache(module = "msyt-logistics")@MQ(module = "msyt-logistics", moduleAlias = "logistics", autoAck = false)##',
  `idx_code` bigint(19) DEFAULT NULL COMMENT '主键idx生成的code##@Long2S(targetField = "idxCode")##',
  `warehouse_type_idx_code` bigint(19) DEFAULT NULL COMMENT '仓库类型idxcode##@DynamicS##',
  `fictistious_status` int(1) DEFAULT NULL COMMENT '虚拟状态',
  `tips` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '前台显示##@Length(max = 100, message = "显示最大100个字符")##',
  `trigger_remark` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '触发状态描述##@Length(max = 100, message = "触发状态描述最大100个字符")##',
  `auto_next` smallint(1) DEFAULT NULL COMMENT '是否自动触发下一个状态',
  `trigger_time_policy` smallint(1) DEFAULT NULL COMMENT '时间策略（0：当前时间，1：当前变化）',
  `trigger_time_min` int(3) DEFAULT NULL COMMENT '触发的时间最小区间，单位分',
  `trigger_time_max` int(3) DEFAULT NULL COMMENT '触发的时间最大区间，单位分',
  `random_policy` smallint(1) DEFAULT NULL COMMENT '随机策略（0：无，1：数值类型，2：日期类型,3:跟随上个状态）',
  `random_min` int(3) DEFAULT NULL COMMENT '随机最小值',
  `random_max` int(3) DEFAULT NULL COMMENT '随机最大值',
  `fill_num` int(3) DEFAULT NULL COMMENT '随机之后填充的位数，不足补0',
  `remark` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '备注，不可以为null##@Length(max = 100, message = "备注最大100个字符")##',
  `status` smallint(1) DEFAULT NULL COMMENT '状态，1：可用的、激活的，2：未激活，0：删除，2：未激活，取值范围为0-9，不可以为null',
  `version` bigint(19) DEFAULT NULL COMMENT '版本号，高并发，乐观锁解决方案',
  `create_member_idx_code` bigint(19) DEFAULT NULL COMMENT '创建用户idxcode##@DynamicS##',
  `update_member_idx_code` bigint(19) DEFAULT NULL COMMENT '修改用户idxcode##@DynamicS##',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间##@EnYyyyMMddHHmmss##',
  `update_time` timestamp NULL DEFAULT NULL COMMENT '更新时间##@EnYyyyMMddHHmmss##',
  PRIMARY KEY (`idx`),
  KEY `indx_tlfo_warehouse_type_idx_code` (`warehouse_type_idx_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='订单虚拟物流信息';

-- ----------------------------
-- Table structure for tb_logistics_item_table
-- ----------------------------
DROP TABLE IF EXISTS `tb_logistics_item_table`;
CREATE TABLE `tb_logistics_item_table` (
  `idx` bigint(19) NOT NULL COMMENT '商品表格主键idx，分布式架构，全局唯一递增##@Cache(module = "msyt-logistics")##',
  `idx_code` bigint(19) DEFAULT NULL COMMENT '主键idx生成的code##@Long2S(targetField = "idxCode")##',
  `item_table_name` varchar(50) DEFAULT NULL COMMENT '商品表格名称，最多50个字符##@Length(max = 50, message = "商品表格名称最多50个字符")##',
  `create_by_member_idx` bigint(19) DEFAULT NULL COMMENT '创建成员idx，不可以为null',
  `update_by_member_idx` bigint(19) DEFAULT NULL COMMENT '修改成员idx，不可以为null',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间，第一次创建时间，后续不可以修改时间',
  `update_time` timestamp NULL DEFAULT NULL COMMENT '更新时间，每一次修改都要更新时间',
  `status` smallint(1) DEFAULT NULL COMMENT '状态，1：可用的、激活的，2：未激活，0：删除，取值范围为0-9，不可以为null',
  `version` bigint(19) DEFAULT NULL COMMENT '版本号，高并发，乐观锁的解决方案',
  `ext` varchar(100) DEFAULT NULL COMMENT '扩展，0-100字符，不可以为null，必须手动设置为空字符串',
  `remark` varchar(100) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`idx`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='商品表格';

-- ----------------------------
-- Table structure for tb_logistics_item_table_detail
-- ----------------------------
DROP TABLE IF EXISTS `tb_logistics_item_table_detail`;
CREATE TABLE `tb_logistics_item_table_detail` (
  `idx` bigint(19) NOT NULL COMMENT '商品表格中的商品主键idx，分布式架构，全局唯一递增##@Cache(module = "msyt-logistics")@MQ(module = "msyt-logistics", moduleAlias = "logistics", autoAck = false)##',
  `idx_code` bigint(19) DEFAULT NULL COMMENT '主键idx生成的code##@Long2S(targetField = "idxCode")##',
  `item_table_idx` bigint(19) DEFAULT NULL COMMENT '物流商品表格idx，不可以为null，##@NotNull(message = "商品表格不能为空")##',
  `item_idx_code` bigint(19) DEFAULT NULL COMMENT '商品主键idx_code，不可以为null，必须手动设置为0##@NotNull(message = "商品不能为空")##',
  `item_no` varchar(30) DEFAULT NULL COMMENT '货号，不可以为null##@NotNull(message = "货号不能为空")@Length(max = 30, message = "货号最多30位字符")##',
  `create_by_member_idx` bigint(19) DEFAULT NULL COMMENT '创建成员idx，不可以为null',
  `update_by_member_idx` bigint(19) DEFAULT NULL COMMENT '修改成员idx，不可以为null',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间，第一次创建时间，后续不可以修改时间',
  `update_time` timestamp NULL DEFAULT NULL COMMENT '更新时间，每一次修改都要更新时间',
  `status` smallint(1) DEFAULT NULL COMMENT '状态，1：可用的、激活的，2：未激活，0：删除，取值范围为0-9，不可以为null',
  `version` bigint(19) DEFAULT NULL COMMENT '版本号，高并发，乐观锁的解决方案',
  `ext` varchar(100) DEFAULT NULL COMMENT '扩展，0-100字符，不可以为null，必须手动设置为空字符串',
  `remark` varchar(100) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`idx`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='商品表格中的商品';

-- ----------------------------
-- Table structure for tb_logistics_shunt
-- ----------------------------
DROP TABLE IF EXISTS `tb_logistics_shunt`;
CREATE TABLE `tb_logistics_shunt` (
  `idx` bigint(19) NOT NULL COMMENT '分物流流程主键idx，分布式架构，全局唯一递增##@Cache(module = "msyt-logistics")@MQ(module = "msyt-logistics", moduleAlias = "logistics", autoAck = false)##',
  `idx_code` bigint(19) DEFAULT NULL COMMENT 'idx code 全局唯一性，解决idx可以通过递增1猜测出来，潜在安全问题##@Long2S(targetField = "idxCode")##',
  `warehouse_code` varchar(30) DEFAULT NULL COMMENT '选择商品仓库idxCode，商品仓库idxCode是调用仓库列表的仓库idxCode。',
  `warehouse_name` varchar(30) DEFAULT NULL COMMENT '选择仓库名称，仓库名称是调用仓库列表的仓库。',
  `publish_status` smallint(1) DEFAULT NULL COMMENT '是否已发布，1：已发布，2：未发布，取值范围为0-9，不可以为null',
  `publish_time` timestamp NULL DEFAULT NULL COMMENT '分物流发布时间##@EnYyyyMMddHHmmss@Date(pattern = MsOnionDatePattern.SINCE)##',
  `publish_type` smallint(1) DEFAULT NULL COMMENT '是否立即发布,0:立即发布 1:定时发布',
  `forbidden_by_member_idx` bigint(19) DEFAULT NULL COMMENT '禁用成员idx',
  `create_by_member_idx` bigint(19) DEFAULT NULL COMMENT '创建成员idx，不可以为null',
  `update_by_member_idx` bigint(19) DEFAULT NULL COMMENT '修改成员idx，不可以为null',
  `update_by_member_name` varchar(30) DEFAULT NULL COMMENT '操作人名字',
  `forbidden_time` timestamp NULL DEFAULT NULL COMMENT '禁用时间,##@EnYyyyMMddHHmmss@Date(pattern = MsOnionDatePattern.SINCE)##',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间，第一次创建时间，后续不可以修改时间##@EnYyyyMMddHHmmss##',
  `update_time` timestamp NULL DEFAULT NULL COMMENT '更新时间，每一次修改都要更新时间##@EnYyyyMMddHHmmss##',
  `version` bigint(19) DEFAULT NULL COMMENT '版本号，高并发，乐观锁的解决方案',
  `status` smallint(1) DEFAULT NULL COMMENT '状态，1：正常，2：禁用，0：删除，取值范围为0-9，不可以为null',
  `ext` varchar(100) DEFAULT NULL COMMENT '扩展，0-100字符，不可以为null，必须手动设置为空字符串',
  PRIMARY KEY (`idx`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='分物流列表';

-- ----------------------------
-- Table structure for tb_logistics_shunt_flow
-- ----------------------------
DROP TABLE IF EXISTS `tb_logistics_shunt_flow`;
CREATE TABLE `tb_logistics_shunt_flow` (
  `idx` bigint(19) NOT NULL COMMENT '分物流流程明细主键idx，分布式架构，全局唯一递增##@Cache(module = "msyt-logistics")@MQ(module = "msyt-logistics", moduleAlias = "logistics", autoAck = false)##',
  `idx_code` bigint(19) DEFAULT NULL COMMENT 'idx code 全局唯一性，解决idx可以通过递增1猜测出来，潜在安全问题##@Long2S(targetField = "idxCode")##',
  `shunt_idx_code` bigint(19) DEFAULT NULL COMMENT '分物流列表idxCode',
  `declare_price` varchar(200) DEFAULT NULL COMMENT '申报价,点击弹出计算公式，除了通用计算器外，后台字段名称需计算的为“CC价”、“发货系数”、“供货价”',
  `customs_clearance_company` varchar(30) DEFAULT NULL COMMENT '清关公司,可选项为“新银河”、“高捷”',
  `customs_clearance_mode` varchar(30) DEFAULT NULL COMMENT '清关模式,可选项为BC、BBC、CC',
  `customs_express_code` varchar(30) DEFAULT NULL COMMENT '清关快递编码,调取分物流编码中的快递编码，与所选的清关公司对应',
  `customs_idx_code` bigint(19) DEFAULT NULL COMMENT '清关公司idxCode',
  `warehouse_code` varchar(30) DEFAULT NULL COMMENT '接收仓库,接收的仓库调取仓库列表中创建的仓库',
  `warehouse_express_code` varchar(30) DEFAULT NULL COMMENT '仓库快递编码,调取分物流编码中的快递编码，与所选的仓库名称对应',
  `priority` int(10) DEFAULT NULL COMMENT '优先级,分物流首先判断优先级:数字越小,优先级越高,-1为默认分物流',
  `order_source` int(10) DEFAULT NULL COMMENT '发布平台,默认为全部，可选项为洋桃、洋葱order_source',
  `order_price` varchar(200) DEFAULT NULL COMMENT '订单价格',
  `is_default` smallint(1) DEFAULT NULL COMMENT '是否为默认分物流: 0:否  1:是',
  `shunt_flow_area_codes` varchar(200) DEFAULT NULL COMMENT '关联的省市范围code数组',
  `shunt_flow_area_names` varchar(200) DEFAULT NULL COMMENT '关联省市范围名字数组',
  `shunt_flow_item_codes` varchar(200) DEFAULT NULL COMMENT '关联的商品范围code数组',
  `shunt_flow_item_names` varchar(200) DEFAULT NULL COMMENT '关联商品范围名字数组',
  `create_by_member_idx` bigint(19) DEFAULT NULL COMMENT '创建成员idx，不可以为null',
  `update_by_member_idx` bigint(19) DEFAULT NULL COMMENT '修改成员idx，不可以为null',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间，第一次创建时间，后续不可以修改时间##@EnYyyyMMddHHmmss##',
  `update_time` timestamp NULL DEFAULT NULL COMMENT '更新时间，每一次修改都要更新时间##@EnYyyyMMddHHmmss##',
  `version` bigint(19) DEFAULT NULL COMMENT '版本号，高并发，乐观锁的解决方案',
  `status` smallint(1) DEFAULT NULL COMMENT '状态，1：正常，2：禁用，0：删除，取值范围为0-9，不可以为null',
  `ext` varchar(100) DEFAULT NULL COMMENT '扩展，0-100字符，不可以为null，必须手动设置为空字符串',
  PRIMARY KEY (`idx`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='分物流明细';

-- ----------------------------
-- Table structure for tb_logistics_shunt_flow_area
-- ----------------------------
DROP TABLE IF EXISTS `tb_logistics_shunt_flow_area`;
CREATE TABLE `tb_logistics_shunt_flow_area` (
  `idx` bigint(19) NOT NULL COMMENT '分物流_省市区idx,分布式架构，全局唯一递增##@Cache(module = "msyt-logistics")@MQ(module = "msyt-logistics", moduleAlias = "logistics", autoAck = false)##',
  `idx_code` bigint(19) DEFAULT NULL COMMENT 'idx code 全局唯一性，解决idx可以通过递增1猜测出来，潜在安全问题##@Long2S(targetField = "idxCode")##',
  `shunt_idx_code` bigint(19) DEFAULT NULL COMMENT '分物流列表idxCode',
  `shunt_flow_idx_code` bigint(19) DEFAULT NULL COMMENT '分物流明细idxCode',
  `province_code` varchar(30) DEFAULT NULL COMMENT '区县顶级父编码，用于根据省code查询全部区县和市区',
  `city_code` varchar(30) DEFAULT NULL COMMENT '顶级城市编码，根据城市code查询全部区县',
  `district_code` varchar(30) DEFAULT NULL COMMENT '区编码',
  `create_by_member_idx` bigint(19) DEFAULT NULL COMMENT '创建成员idx，不可以为null',
  `update_by_member_idx` bigint(19) DEFAULT NULL COMMENT '修改成员idx，不可以为null',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间，第一次创建时间，后续不可以修改时间##@EnYyyyMMddHHmmss##',
  `update_time` timestamp NULL DEFAULT NULL COMMENT '更新时间，每一次修改都要更新时间##@EnYyyyMMddHHmmss##',
  `version` bigint(20) DEFAULT NULL COMMENT '版本号，高并发，乐观锁的解决方案',
  `status` smallint(1) DEFAULT NULL COMMENT '状态，1：正常，2：禁用，0：删除，取值范围为0-9，不可以为null',
  `ext` varchar(100) DEFAULT NULL COMMENT '扩展，0-100字符，不可以为null，必须手动设置为空字符串',
  PRIMARY KEY (`idx`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='分物流-省市区表';

-- ----------------------------
-- Table structure for tb_logistics_shunt_flow_item
-- ----------------------------
DROP TABLE IF EXISTS `tb_logistics_shunt_flow_item`;
CREATE TABLE `tb_logistics_shunt_flow_item` (
  `idx` bigint(19) NOT NULL COMMENT '分流商品范围主键idx，分布式架构，全局唯一递增##@Cache(module = "msyt-logistics")@MQ(module = "msyt-logistics", moduleAlias = "logistics", autoAck = false)##',
  `idx_code` bigint(19) DEFAULT NULL COMMENT 'idx code 全局唯一性，解决idx可以通过递增1猜测出来，潜在安全问题##@Long2S(targetField = "idxCode")##',
  `shunt_idx_code` bigint(19) DEFAULT NULL COMMENT '分物流列表idxCode',
  `shunt_flow_idx_code` bigint(19) DEFAULT NULL COMMENT '分物流明细idxCode',
  `item_table_idx_code` bigint(19) DEFAULT NULL COMMENT '商品范围idxCode',
  `create_by_member_idx` bigint(19) DEFAULT NULL COMMENT '创建成员idx，不可以为null',
  `update_by_member_idx` bigint(19) DEFAULT NULL COMMENT '修改成员idx，不可以为null',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间，第一次创建时间，后续不可以修改时间##@EnYyyyMMddHHmmss##',
  `update_time` timestamp NULL DEFAULT NULL COMMENT '更新时间，每一次修改都要更新时间##@EnYyyyMMddHHmmss##',
  `version` bigint(19) DEFAULT NULL COMMENT '版本号，高并发，乐观锁的解决方案',
  `status` smallint(1) DEFAULT NULL COMMENT '状态，1：正常，2：禁用，0：删除，取值范围为0-9，不可以为null',
  `ext` varchar(100) DEFAULT NULL COMMENT '扩展，0-100字符，不可以为null，必须手动设置为空字符串',
  PRIMARY KEY (`idx`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='分物流-商品范围表';

-- ----------------------------
-- Table structure for tb_logistics_unit
-- ----------------------------
DROP TABLE IF EXISTS `tb_logistics_unit`;
CREATE TABLE `tb_logistics_unit` (
  `idx` bigint(19) NOT NULL COMMENT '计量单位主键idx，分布式架构，全局唯一递增##@Cache(module = "msyt-logistics")@MQ(module = "msyt-logistics", moduleAlias = "logistics", autoAck = false)##',
  `idx_code` bigint(19) DEFAULT NULL COMMENT 'idx code 全局唯一性，解决idx可以通过递增1猜测出来，潜在安全问题##@Long2S(targetField = "idxCode")##',
  `code` varchar(20) DEFAULT NULL COMMENT '计量单位编码，最多20位字符##@NotNull(message = "编码不能为空")@Length(max = 20, message = "编码最多20位字符")##',
  `name` varchar(20) DEFAULT NULL COMMENT '计量单位名称，最多20位字符##@NotNull(message = "名称不能为空")@Length(max = 20, message = "名称最多20位字符")##',
  `remark` varchar(100) DEFAULT NULL COMMENT '备注，最多100位字符##@Length(max = 100, message = "备注最多100位字符")##',
  `create_by_member_idx` bigint(19) DEFAULT NULL COMMENT '创建成员idx，不可以为null',
  `update_by_member_idx` bigint(19) DEFAULT NULL COMMENT '修改成员idx，不可以为null',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间，第一次创建时间，后续不可以修改时间',
  `update_time` timestamp NULL DEFAULT NULL COMMENT '更新时间，每一次修改都要更新时间',
  `status` smallint(1) DEFAULT NULL COMMENT '状态，1：可用的、激活的，2：未激活，0：删除，取值范围为0-9，不可以为null',
  `version` bigint(19) DEFAULT NULL COMMENT '版本号，高并发，乐观锁的解决方案',
  `ext` varchar(100) DEFAULT NULL COMMENT '扩展，0-100字符，不可以为null，必须手动设置为空字符串',
  PRIMARY KEY (`idx`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='计量单位表';
