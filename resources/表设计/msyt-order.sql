/*
Navicat MySQL Data Transfer

Source Server         : 172.16.50.242
Source Server Version : 50505
Source Host           : 172.16.50.242:13306
Source Database       : msyt-order

Target Server Type    : MYSQL
Target Server Version : 50505
File Encoding         : 65001

Date: 2017-12-25 15:16:13
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for tb_order
-- ----------------------------
DROP TABLE IF EXISTS `tb_order`;
CREATE TABLE `tb_order` (
  `idx` bigint(19) NOT NULL COMMENT '订单主键idx，分布式架构，全局唯一递增##@Cache(module = "msyt-order")@MQ(module = "msyt-order", moduleAlias = "order", autoAck = false)##',
  `idx_code` bigint(19) DEFAULT NULL COMMENT '主键idx生成的code##@Long2S(targetField = "idxCode")##',
  `order_no` varchar(25) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '订单编号## @NotNull(message = "订单编号不能为空")@Length(max = 25, message = "订单编号最大25个字符")##',
  `order_source` smallint(1) DEFAULT NULL COMMENT '订单来源(1:洋桃，2:C店,通过数据字典控制)，不能为空',
  `order_type` smallint(1) DEFAULT NULL COMMENT '(预留)订单类型（洋桃商城可以直接下单，也可以导单，通过数据字典控制）',
  `order_status` smallint(1) DEFAULT NULL COMMENT '订单状态(10:待付款,20:待发货,30:待收货,40:已签收,50:退款退货,60:交易关闭)',
  `user_idx_code` bigint(19) DEFAULT NULL COMMENT '会员idxcode##@DynamicS##',
  `user_account` varchar(20) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '会员账号，冗余字段##@Length(max = 20, message = "会员账号最大20个字符")##',
  `user_name` varchar(30) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '会员名称，冗余字段，erp中只有名称字段，方便展示导出##@Length(max = 30, message = "会员名称最大30个字符")##',
  `order_sale_fee` int(10) DEFAULT NULL COMMENT '订单销售金额(分)##@$2##',
  `order_real_fee` int(10) DEFAULT NULL COMMENT '订单实付金额(分)##@$2##',
  `order_discount_fee` int(10) DEFAULT NULL COMMENT '订单优惠金额(分)##@$2##',
  `weight` int(10) DEFAULT NULL COMMENT '预估称重，单位g##@$3##',
  `freight` int(10) DEFAULT NULL COMMENT '运费(分)##@$2##',
  `tax` int(10) DEFAULT NULL COMMENT '税费，以分为单位，而不是以元为单位，取值范围0-2147483647，不可以为null##@NotNull(message = "税费不能为空")@Range(min = 0, max = 2147483647, message = "税费需要设置0-2147483647")@$2##',
  `tax_rate` int(10) DEFAULT NULL COMMENT '【废弃】税率，以十万分位为单位，而不是以元为单位，取值范围为0-100000，不可以为null',
  `shop_no` varchar(20) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '店铺编号 ##@Length(max = 20, message = "店铺编号最大20个字符")##',
  `shop_name` varchar(80) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '店铺名称 ##@Length(max = 80, message = "店铺名称最大80个字符")##',
  `buyer_message` varchar(200) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '客户留言##@Length(max = 200, message = "客户留言最大200个字符")##',
  `total_num` int(1) DEFAULT NULL COMMENT '订单中商品总数量',
  `source_order_no` varchar(25) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '来源订单号,外部单号（导入的订单才有外部单号，如果是商城直接下单，则不会有外部订单号）##@Length(max = 25, message = "来源订单编号最大25个字符")##',
  `remark` varchar(200) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '订单备注，字符个数0-200，不可以为null，必须手动设置空字符串##@Length(max = 200, message = "订单备注最大200个字符")##',
  `status` smallint(1) DEFAULT NULL COMMENT '状态，1：可用的、激活的，2：未激活，0：删除，2：未激活，取值范围为0-9，不可以为null',
  `version` bigint(19) DEFAULT NULL COMMENT '版本号，高并发，乐观锁解决方案',
  `create_user_idx_code` bigint(19) DEFAULT NULL COMMENT '创建用户idxcode',
  `update_user_idx_code` bigint(19) DEFAULT NULL COMMENT '修改用户idxcode',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '订单创建时间##@EnYyyyMMddHHmmss##',
  `update_time` timestamp NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`idx`),
  KEY `index_o_order_no` (`order_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='订单表';

-- ----------------------------
-- Table structure for tb_order_cancel
-- ----------------------------
DROP TABLE IF EXISTS `tb_order_cancel`;
CREATE TABLE `tb_order_cancel` (
  `idx` bigint(19) NOT NULL COMMENT '订单取消表主键idx，分布式架构，全局唯一递增##@Cache(module = "msyt-order")@MQ(module = "msyt-order", moduleAlias = "order", autoAck = false)##',
  `idx_code` bigint(19) DEFAULT NULL COMMENT '主键idx生成的code##@Long2S(targetField = "idxCode")##',
  `order_no` varchar(25) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '订单编号，不能为空## @NotNull(message = "订单编号不能为空")@Length(max = 25, message = "订单编号最大25个字符")##',
  `sub_order_no` varchar(25) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '(预留)拆单编号，可为空##@Length(max = 25, message = "拆单编号最大25个字符")##',
  `order_status` smallint(1) DEFAULT NULL COMMENT '订单当前状态',
  `type` smallint(1) DEFAULT NULL COMMENT '操作类型：(0:系统自动取消，1：人工取消)',
  `reason` smallint(1) DEFAULT NULL COMMENT '(预留)取消原因',
  `opinion` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '(预留)取消意见##@Length(max = 100, message = "取消意见最大100个字符")##',
  `remark` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '备注，不可以为null##@Length(max = 100, message = "备注最大100个字符")##',
  `status` smallint(1) DEFAULT NULL COMMENT '状态，1：可用的、激活的，2：未激活，0：删除，2：未激活，取值范围为0-9，不可以为null',
  `version` bigint(19) DEFAULT NULL COMMENT '版本号，高并发，乐观锁解决方案',
  `create_user_idx_code` bigint(19) DEFAULT NULL COMMENT '创建用户idxcode##@DynamicS##',
  `update_user_idx_code` bigint(19) DEFAULT NULL COMMENT '修改用户idxcode',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间##@EnYyyyMMddHHmmss##',
  `update_time` timestamp NULL DEFAULT NULL COMMENT '更新时间##@EnYyyyMMddHHmmss##',
  PRIMARY KEY (`idx`),
  KEY `index_toc_order_no` (`order_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='订单取消表';

-- ----------------------------
-- Table structure for tb_order_delivery
-- ----------------------------
DROP TABLE IF EXISTS `tb_order_delivery`;
CREATE TABLE `tb_order_delivery` (
  `idx` bigint(19) NOT NULL COMMENT '订单配送主键idx，分布式架构，全局唯一递增##@Cache(module = "msyt-order")@MQ(module = "msyt-order", moduleAlias = "order", autoAck = false)##',
  `idx_code` bigint(19) DEFAULT NULL COMMENT '主键idx生成的code##@Long2S(targetField = "idxCode")##',
  `order_no` varchar(25) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '订单编号##@NotNull(message = "订单编号不能为空")@Length(max = 25, message = "订单编号最大25个字符")##',
  `sub_order_no` varchar(25) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '(预留)拆单编号##@Length(max = 25, message = "拆单单编号最大25个字符")##',
  `name` varchar(30) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '收货人名称## @NotNull(message = "收货人名称不能为空")@Length(max = 30, message = "收货人名称最大30个字符")##',
  `contact_way` varchar(20) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '收货人联系方式##@NotNull(message = "联系方式不能为空")@Length(max = 20, message = "联系方式最大20个字符")##',
  `province_code` varchar(10) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '收货人省份编码## @NotNull(message = "省份编码不能为空")@Length(max = 10, message = "省份编码最大10个字符")##',
  `city_code` varchar(10) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '收货人城市编码##@NotNull(message = "城市编码不能为空") @Length(max = 10, message = "城市编码最大10个字符")##',
  `district_code` varchar(10) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '收货人区县编码##@Length(max = 10, message = "区县编码最大10个字符")##',
  `address` varchar(200) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '详细地址##@Length(max = 200, message = "详细地址最大200个字符")##',
  `post_code` varchar(6) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '邮政编码##@Length(max = 6, message = "邮政编码最大6个字符")##',
  `card_type` smallint(1) DEFAULT NULL COMMENT '件类型(默认:18位身份证)',
  `card_no` varchar(32) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '证件号码##@Length(max = 32, message = "证件号码最大32个字符")##',
  `remark` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '备注，字符个数0-100，不可以为null，##@Length(max = 100, message = "备注最大100个字符")##',
  `status` smallint(1) DEFAULT NULL COMMENT '状态，1：可用的、激活的，2：未激活，0：删除，2：未激活，取值范围为0-9，不可以为null',
  `version` bigint(19) DEFAULT NULL COMMENT '版本号，高并发，乐观锁解决方案',
  `create_user_idx_code` bigint(19) DEFAULT NULL COMMENT '创建用户idxcode',
  `update_user_idx_code` bigint(19) DEFAULT NULL COMMENT '修改用户idxcode',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` timestamp NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`idx`),
  KEY `index_od_order_no` (`order_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='订单配送信息';

-- ----------------------------
-- Table structure for tb_order_ext
-- ----------------------------
DROP TABLE IF EXISTS `tb_order_ext`;
CREATE TABLE `tb_order_ext` (
  `idx` bigint(19) NOT NULL COMMENT '订单扩展表主键idx，分布式架构，全局唯一递增##@Cache(module = "msyt-order")@MQ(module = "msyt-order", moduleAlias = "order", autoAck = false)##',
  `idx_code` bigint(19) DEFAULT NULL COMMENT '主键idx生成的code##@Long2S(targetField = "idxCode")##',
  `order_no` varchar(25) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '订单编号##@NotNull(message = "订单编号不能为空")@Length(max = 25, message = "订单编号最大25个字符")##',
  `declare_price` int(9) DEFAULT NULL COMMENT '订单申报总价，根据商品申报总价统计，单位分##@$2##',
  `remark` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '备注，不可以为null##@Length(max = 100, message = "备注最大100个字符")##',
  `status` smallint(1) DEFAULT NULL COMMENT '状态，1：可用的、激活的，2：未激活，0：删除，2：未激活，取值范围为0-9，不可以为null',
  `version` bigint(19) DEFAULT NULL COMMENT '版本号，高并发，乐观锁解决方案',
  `create_user_idx_code` bigint(19) DEFAULT NULL COMMENT '创建用户idxcode',
  `update_user_idx_code` bigint(19) DEFAULT NULL COMMENT '修改用户idxcode',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` timestamp NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`idx`),
  KEY `index_toe_order_no` (`order_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='订单扩展表';

-- ----------------------------
-- Table structure for tb_order_from_erp_result
-- ----------------------------
DROP TABLE IF EXISTS `tb_order_from_erp_result`;
CREATE TABLE `tb_order_from_erp_result` (
  `idx` bigint(19) NOT NULL COMMENT 'erp同步日志主键idx，分布式架构，全局唯一递增##@Cache(module = "msyt-order")##',
  `idx_code` bigint(19) DEFAULT NULL COMMENT '主键idx生成的code##@Long2S(targetField = "idxCode")##',
  `order_no` varchar(28) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '订单编号##@NotNull(message = "订单编号不能为空")@Length(max = 25, message = "订单编号最大25个字符")##',
  `modified_time` timestamp NULL DEFAULT NULL COMMENT '订单erp中的修改时间##@EnYyyyMMddHHmmss##',
  `platform_id` smallint(1) DEFAULT NULL COMMENT '平台类型ID, (1淘宝, 2淘宝分销, 3京东, 4拍拍, 5亚马逊, 6一号店, 7当当网, 8库巴, 9阿里巴巴, 10ECShop, 11麦考林, 12V+, 13苏宁, 14唯品会, 15易迅, 16聚美, 17口袋通, 18Hishop, 19微铺宝, 20美丽说, 21蘑菇街, 22贝贝网, 23Ecstroe, 127其它)',
  `count` int(3) DEFAULT NULL COMMENT '同步次数',
  `trade_no` varchar(40) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'erp订单编号',
  `remark` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '备注，字符个数0-100，不可以为null，必须手动设置空字符串',
  `status` smallint(1) DEFAULT NULL COMMENT '状态，1：可用的，2：未激活，0：删除，2：未激活，取值范围为0-9，不可以为null',
  `version` bigint(19) DEFAULT NULL COMMENT '版本号，高并发，乐观锁解决方案',
  `create_user_idx_code` bigint(19) DEFAULT NULL COMMENT '创建用户idxcode',
  `update_user_idx_code` bigint(19) DEFAULT NULL COMMENT '修改用户idxcode',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` timestamp NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`idx`),
  KEY `index_ofer_order_no` (`order_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='erp中同步订单信息结果表';

-- ----------------------------
-- Table structure for tb_order_import
-- ----------------------------
DROP TABLE IF EXISTS `tb_order_import`;
CREATE TABLE `tb_order_import` (
  `idx` bigint(19) NOT NULL COMMENT '订单导单记录表主键idx，分布式架构，全局唯一递增##@Cache(module = "msyt-order")##',
  `idx_code` bigint(19) DEFAULT NULL COMMENT '主键idx生成的code##@Long2S(targetField = "idxCode")##',
  `user_idx_code` bigint(19) DEFAULT NULL COMMENT '会员idxcode##@NotNull(message = "会员idxcode不能为空")##',
  `original_order_no` varchar(30) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '原始渠道订单编号## @NotNull(message = "原始渠道订单编号不能为空")@Length(max = 30, message = "订单编号最大30个字符")##',
  `receive_name` varchar(30) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '收货人名称## @NotNull(message = "收货人名称不能为空")@Length(max = 30, message = "收货人名称最大30个字符")##',
  `card_no` varchar(32) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '身份证号码##@Length(max = 20, message = "身份证号码最大20个字符")##',
  `phone_number` varchar(20) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '手机号码##@NotNull(message = "手机号码不能为空")@Length(max = 20, message = "手机号码最大20个字符")@DynamicS##',
  `province` varchar(20) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '省名称，最多20个字符（包括中英文），不可以为null或者空字符串##@NotNull(message = "省名称不能为空")@Length(max = 20, message = "省名称最大20个字符")##',
  `city` varchar(20) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '市名称，最多20个字符（包括中英文），不可以为null或者空字符串##@NotNull(message = "市名称不能为空")@Length(max = 20, message = "市名称最大20个字符")##',
  `district` varchar(20) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '区名称，最多20个字符（包括中英文），不可以为null或者空字符串##@NotNull(message = "区名称不能为空")@Length(max = 20, message = "区名称最大20个字符")##',
  `address` varchar(200) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '详细地址##@Length(max = 200, message = "详细地址最大200个字符")##',
  `order_type` smallint(1) DEFAULT NULL COMMENT '订单类型，不能为空，0-普通订单，1-锁库订单##@NotNull(message = "订单类型不能为空")##',
  `import_status` smallint(1) DEFAULT NULL COMMENT '导入结果状态，0：导入中，1：导入成功，2：导入失败，取值范围为0-9，不可以为null ##@NotNull(message = "导入结果状态不能为空")##',
  `import_describe` varchar(200) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '导入失败原因，存处理失败结果##@Length(max = 200, message = "导入失败原因最大200个字符")##',
  `result_status` smallint(1) DEFAULT NULL COMMENT '处理结果状态，0：系统处理中，1：处理成功，2：处理失败，取值范围为0-9，不可以为null ##@NotNull(message = "处理结果状态不能为空")##',
  `result_describe` varchar(200) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '系统处理结果，处理成功为空，处理失败，存处理失败结果##@Length(max = 200, message = "系统处理结果最大200个字符")##',
  `status` smallint(1) DEFAULT NULL COMMENT '状态，1：可用的、激活的，2：未激活，0：删除，2：未激活，取值范围为0-9，不可以为null',
  `create_user_idx_code` bigint(19) DEFAULT NULL COMMENT '创建用户idxcode',
  `update_user_idx_code` bigint(19) DEFAULT NULL COMMENT '修改用户idxcode',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '订单创建时间##@EnYyyyMMddHHmmss##',
  `update_time` timestamp NULL DEFAULT NULL COMMENT '更新时间##@EnYyyyMMddHHmmss##',
  `version` bigint(19) DEFAULT NULL COMMENT '版本号，高并发，乐观锁解决方案',
  `ext` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '扩展字段',
  `remark` varchar(200) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '备注，字符个数0-200，不可以为null，必须手动设置空字符串##@Length(max = 200, message = "订单备注最大200个字符")##',
  PRIMARY KEY (`idx`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- ----------------------------
-- Table structure for tb_order_item
-- ----------------------------
DROP TABLE IF EXISTS `tb_order_item`;
CREATE TABLE `tb_order_item` (
  `idx` bigint(19) NOT NULL COMMENT '订单商品主键idx，分布式架构，全局唯一递增##@Cache(module = "msyt-order")@MQ(module = "msyt-order", moduleAlias = "order", autoAck = false)##',
  `idx_code` bigint(19) DEFAULT NULL COMMENT '主键idx生成的code##@Long2S(targetField = "idxCode")##',
  `order_no` varchar(25) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '订单编号##@NotNull(message = "订单编号不能为空")@Length(max = 25, message = "订单编号最大25个字符")##',
  `sub_order_no` varchar(25) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '订单拆单编号##@Length(max = 25, message = "订单拆单编号最大25个字符")##',
  `item_idx_code` bigint(19) DEFAULT NULL COMMENT '商品idxcode',
  `customs_goods_id` bigint(19) DEFAULT NULL COMMENT '【废弃】高捷商品备案ID',
  `item_no` varchar(30) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '商品货号##@NotNull(message = "商品货号不能为空")@Length(max = 30, message = "商品货号最大30个字符")##',
  `item_name` varchar(200) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '商品名称##@NotNull(message = "商品名称不能为空")##',
  `barcode` varchar(20) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '条形码##@Length(max = 20, message = "商品条形码最大20个字符")',
  `unit_price` int(10) DEFAULT NULL COMMENT '单价(分)##@$2##',
  `buy_num` int(4) DEFAULT NULL COMMENT '购买数量',
  `unit_idx_code` bigint(19) DEFAULT NULL COMMENT '单位,对应报关单位中的idx_code##@DynamicS##',
  `sale_fee` int(10) DEFAULT NULL COMMENT '商品销售价格(分)##@$2##',
  `discount_fee` int(10) DEFAULT NULL COMMENT '商品优惠价格(分)##@$2##',
  `real_fee` int(10) DEFAULT NULL COMMENT '商品实付价格(分)##@$2##',
  `share_post` int(10) DEFAULT NULL COMMENT '商品分摊邮费(分)##@$2##',
  `goods_gweight` int(10) DEFAULT NULL COMMENT '预估称重，单位g##@$3##',
  `brand_name` varchar(30) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '【废弃】品牌名称##@Length(max = 30, message = "品牌名称最大30个字符")##',
  `specification` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '商品规格##@Length(max = 100, message = "商品规格最大100个字符")##',
  `logistics_no` varchar(20) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '物流单号##@Length(max = 20, message = "物流单号最大20个字符")##',
  `tax` int(10) DEFAULT NULL COMMENT '税费，以分为单位，而不是以元为单位，取值范围0-2147483647，不可以为null##@NotNull(message = "税费不能为空")@Range(min = 0, max = 2147483647, message = "税费需要设置0-2147483647")@$2##',
  `tax_rate` int(10) DEFAULT NULL COMMENT '【废弃】税率，以十万分位为单位，而不是以元为单位，取值范围为0-100000，不可以为null',
  `category_idx_code` bigint(19) DEFAULT NULL COMMENT '【废弃】分类idxcode##@DynamicS##',
  `remark` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '备注，字符个数0-100，不可以为null，必须手动设置空字符串##    @Length(max = 100, message = "备注最大20个字符")##',
  `status` smallint(1) DEFAULT NULL COMMENT '状态，1：可用的、激活的，2：未激活，0：删除，2：未激活，取值范围为0-9，不可以为null',
  `version` bigint(19) DEFAULT NULL COMMENT '版本号，高并发，乐观锁解决方案',
  `create_user_idx_code` bigint(19) DEFAULT NULL COMMENT '创建用户idxcode',
  `update_user_idx_code` bigint(19) DEFAULT NULL COMMENT '修改用户idxcode',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` timestamp NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`idx`),
  KEY `index_oi_orderno_suborderno` (`order_no`,`sub_order_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='订单商品信息';

-- ----------------------------
-- Table structure for tb_order_item_ext
-- ----------------------------
DROP TABLE IF EXISTS `tb_order_item_ext`;
CREATE TABLE `tb_order_item_ext` (
  `idx` bigint(19) NOT NULL COMMENT '订单商品扩展表主键idx，分布式架构，全局唯一递增##@Cache(module = "msyt-order")@MQ(module = "msyt-order", moduleAlias = "order", autoAck = false)##',
  `idx_code` bigint(19) DEFAULT NULL COMMENT '主键idx生成的code##@Long2S(targetField = "idxCode")##',
  `order_no` varchar(25) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '订单编号##@NotNull(message = "订单编号不能为空")@Length(max = 25, message = "订单编号最大25个字符")##',
  `sub_order_no` varchar(25) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '拆单编号##@Length(max = 25, message = "拆单编号最大25个字符")##',
  `item_idx_code` bigint(19) DEFAULT NULL COMMENT '正式商品idxcode',
  `order_item_idx_code` bigint(19) DEFAULT NULL COMMENT '订单商品idxCode',
  `item_no` varchar(30) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '正式商品货号##@NotNull(message = "商品货号不能为空")@Length(max = 30, message = "商品货号最大30个字符")##',
  `warehouse_type_idx_code` bigint(19) DEFAULT NULL COMMENT '正式商品仓库类型idxcode',
  `warehouse_idx_code` bigint(19) DEFAULT NULL COMMENT '正式商品仓库idxcode##@DynamicS##',
  `declare_price` int(9) DEFAULT NULL COMMENT '商品申报总价，单位分##@$2##',
  `is_key_order` smallint(1) DEFAULT NULL COMMENT '一键下单商品，1:是',
  `delivery_coefficient` smallint(2) DEFAULT NULL COMMENT '发货系数',
  `remark` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '备注，不可以为null##@Length(max = 100, message = "备注最大100个字符")##',
  `status` smallint(1) DEFAULT NULL COMMENT '状态，1：可用的、激活的，2：未激活，0：删除，2：未激活，取值范围为0-9，不可以为null',
  `version` bigint(19) DEFAULT NULL COMMENT '版本号，高并发，乐观锁解决方案',
  `create_user_idx_code` bigint(19) DEFAULT NULL COMMENT '创建用户idxcode',
  `update_user_idx_code` bigint(19) DEFAULT NULL COMMENT '修改用户idxcode',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` timestamp NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`idx`),
  KEY `index_toie_order_no` (`order_no`,`sub_order_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='订单商品扩展表';

-- ----------------------------
-- Table structure for tb_order_item_import
-- ----------------------------
DROP TABLE IF EXISTS `tb_order_item_import`;
CREATE TABLE `tb_order_item_import` (
  `idx` bigint(10) NOT NULL COMMENT '订单导单商品记录表主键idx，分布式架构，全局唯一递增##@Cache(module = "msyt-order")##',
  `idx_code` bigint(19) DEFAULT NULL COMMENT '主键idx生成的code##@Long2S(targetField = "idxCode")##',
  `order_import_idx` bigint(10) DEFAULT NULL COMMENT '订单导单记录表主键idx，分布式架构，全局唯一递增',
  `item_no` char(14) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '货号，14个字符，根据类目与仓库类型来自动生成货号，不可重复，不可以为null##@NotNull(message = "货号不能为空")@Length(min = 14, max = 14, message = "货号为14个字符")##',
  `item_number` int(10) DEFAULT NULL COMMENT '商品数量，必填##@NotNull(message = "商品数量不能为空")##',
  `status` smallint(1) DEFAULT NULL COMMENT '状态，1：可用的、激活的，2：未激活，0：删除，2：未激活，取值范围为0-9，不可以为null',
  `create_user_idx_code` bigint(19) DEFAULT NULL COMMENT '创建用户idxcode',
  `update_user_idx_code` bigint(19) DEFAULT NULL COMMENT '修改用户idxcode',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '订单创建时间##@EnYyyyMMddHHmmss##',
  `update_time` timestamp NULL DEFAULT NULL COMMENT '更新时间##@EnYyyyMMddHHmmss##',
  `version` bigint(19) DEFAULT NULL COMMENT '版本号，高并发，乐观锁解决方案',
  `ext` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '扩展字段',
  `remark` varchar(200) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '备注，字符个数0-200，不可以为null，必须手动设置空字符串##@Length(max = 200, message = "订单备注最大200个字符")##',
  PRIMARY KEY (`idx`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- ----------------------------
-- Table structure for tb_order_log
-- ----------------------------
DROP TABLE IF EXISTS `tb_order_log`;
CREATE TABLE `tb_order_log` (
  `idx` bigint(19) NOT NULL COMMENT '主键idx，分布式架构，全局唯一递增##@Cache(module = "msyt-order")##',
  `idx_code` bigint(19) DEFAULT NULL COMMENT '主键idx生成的code##@Long2S(targetField = "idxCode")##',
  `order_no` varchar(25) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '订单编号##@NotNull(message = "订单编号不能为空")@Length(max = 25, message = "订单编号最大25个字符")##',
  `sub_order_no` varchar(25) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '(预留)拆单编号##@Length(max = 25, message = "拆单单编号最大25个字符")##',
  `refund_no` varchar(25) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '退款编号##@Length(max = 25, message = "退款编号最大25个字符")##',
  `content` varchar(5000) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '内容',
  `operation_type` smallint(3) DEFAULT NULL COMMENT '操作类型',
  `operation_system` smallint(1) DEFAULT NULL COMMENT '在那个系统操作的，1：洋桃后台，2：洋桃商城',
  `operator` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '操作人',
  `remark` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '备注，字符个数0-100，不可以为null，必须手动设置空字符串## @Length(max = 100, message = "备注最大100个字符")##',
  `status` smallint(1) DEFAULT NULL COMMENT '状态，1：可用的，2：未激活，0：删除，2：未激活，取值范围为0-9，不可以为null',
  `version` bigint(19) DEFAULT NULL COMMENT '版本号，高并发，乐观锁解决方案',
  `create_member_idx_code` bigint(19) DEFAULT NULL COMMENT '创建成员idxcode',
  `update_member_idx_code` bigint(19) DEFAULT NULL COMMENT '修改成员idxcode',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间##@EnYyyyMMddHHmmss##',
  `update_time` timestamp NULL DEFAULT NULL COMMENT '更新时间##@EnYyyyMMddHHmmss##',
  PRIMARY KEY (`idx`),
  KEY `index_ol_orderno_bizidxcode` (`order_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='订单后台操作日志信息';

-- ----------------------------
-- Table structure for tb_order_logistics_trail
-- ----------------------------
DROP TABLE IF EXISTS `tb_order_logistics_trail`;
CREATE TABLE `tb_order_logistics_trail` (
  `idx` bigint(19) NOT NULL COMMENT '订单轨迹表主键idx，分布式架构，全局唯一递增##@Cache(module = "msyt-order")##',
  `idx_code` bigint(19) DEFAULT NULL COMMENT '主键idx生成的code##@Long2S(targetField = "idxCode")##',
  `order_no` varchar(25) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '订单编号##@NotNull(message = "订单编号不能为空")@Length(max = 25, message = "订单编号最大25个字符")##',
  `sub_order_no` varchar(25) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '拆单编号##@NotNull(message = "拆单编号不能为空") @Length(max = 25, message = "拆单编号最大25个字符")##',
  `warehouse_type_idx_code` bigint(19) DEFAULT NULL COMMENT '仓库类型idxcode##@DynamicS##',
  `fictistious_status` int(1) DEFAULT NULL COMMENT '虚拟状态',
  `tips` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '轨迹信息##@Length(max = 100, message = "轨迹信息最大100个字符")##',
  `remark` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '备注，不可以为null##@Length(max = 100, message = "备注最大100个字符")##',
  `status` smallint(1) DEFAULT NULL COMMENT '状态，1：可用的、激活的，2：未激活，0：删除，2：未激活，取值范围为0-9，不可以为null',
  `version` bigint(19) DEFAULT NULL COMMENT '版本号，高并发，乐观锁解决方案',
  `create_user_idx_code` bigint(19) DEFAULT NULL COMMENT '创建用户idxcode',
  `update_user_idx_code` bigint(19) DEFAULT NULL COMMENT '修改用户idxcode',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间##@EnYyyyMMddHHmmss##',
  `update_time` timestamp NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`idx`),
  KEY `index_tolt_sub_order_no` (`sub_order_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='订单轨迹表';

-- ----------------------------
-- Table structure for tb_order_pay
-- ----------------------------
DROP TABLE IF EXISTS `tb_order_pay`;
CREATE TABLE `tb_order_pay` (
  `idx` bigint(19) NOT NULL COMMENT '订单支付信息主键idx，分布式架构，全局唯一递增##@Cache(module = "msyt-order")@MQ(module = "msyt-order", moduleAlias = "order", autoAck = false)##',
  `idx_code` bigint(19) DEFAULT NULL COMMENT '主键idx生成的code##@Long2S(targetField = "idxCode")##',
  `order_no` varchar(25) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '订单编号##@NotNull(message = "订单编号不能为空")@Length(max = 25, message = "订单编号最大25个字符")##',
  `sub_order_no` varchar(25) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '拆单编号##@NotNull(message = "拆单编号不能为空")@Length(max = 25, message = "拆单编号最大25个字符")##',
  `pay_mode_idx_code` bigint(19) DEFAULT NULL COMMENT '支付方式idxcode',
  `pay_mode_name` varchar(20) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '支付名称## @NotNull(message = "支付名称不能为空")@Length(max = 20, message = "支付名称最大20个字符")##',
  `pay_status` smallint(1) DEFAULT NULL COMMENT '支付状态（10:未支付,20:已支付,30:已退款）',
  `pay_real_fee` int(10) DEFAULT NULL COMMENT '支付金额(分)##@$2##',
  `pay_time` timestamp NULL DEFAULT NULL COMMENT '支付时间##@EnYyyyMMddHHmmss@Date(pattern = MsOnionDatePattern.SINCE)##',
  `chnltrxid` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '渠道平台交易单号,例如微信,支付宝平台的交易单号##@Length(max = 50, message = "渠道平台交易单号最大32个字符")##',
  `pay_trade_no` varchar(32) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '平台的交易流水号##@Length(max = 32, message = "平台的交易流水号最大32个字符")##',
  `pay_decalre_no` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '支付单申报单号##@Length(max = 50, message = "支付单申报单号50个字符")##',
  `refund_fee` int(10) DEFAULT NULL COMMENT '退款金额(分)##@$2##',
  `refund_trade_no` varchar(32) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '退款交易流水号##@Length(max = 32, message = "退款交易流水号最大32个字符")##',
  `refund_time` timestamp NULL DEFAULT NULL COMMENT '退款时间##@EnYyyyMMddHHmmss@Date(pattern = MsOnionDatePattern.SINCE)##',
  `pay_account` varchar(128) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '(预留)支付账号## @Length(max = 128, message = "支付账号最大128个字符")##',
  `remark` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '备注，字符个数0-100，不可以为null，必须手动设置空字符串## @Length(max = 100, message = "备注最大100个字符")##',
  `status` smallint(1) DEFAULT NULL COMMENT '状态，1：可用的、激活的，2：未激活，0：删除，2：未激活，取值范围为0-9，不可以为null',
  `version` bigint(19) DEFAULT NULL COMMENT '版本号，高并发，乐观锁解决方案',
  `create_user_idx_code` bigint(19) DEFAULT NULL COMMENT '创建用户idxcode',
  `update_user_idx_code` bigint(19) DEFAULT NULL COMMENT '修改用户idxcode',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` timestamp NULL DEFAULT NULL COMMENT '更新时间',
  `payment_code` varchar(200) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '支付方式code，如支付宝为ALIPAY，微信支付为WXPAY',
  PRIMARY KEY (`idx`),
  KEY `index_op_order_no` (`order_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='订单支付信息';

-- ----------------------------
-- Table structure for tb_order_push_fail
-- ----------------------------
DROP TABLE IF EXISTS `tb_order_push_fail`;
CREATE TABLE `tb_order_push_fail` (
  `idx` bigint(19) NOT NULL COMMENT '推单失败主键idx，分布式架构，全局唯一递增##@Cache(module = "msyt-order")##',
  `idx_code` bigint(19) DEFAULT NULL COMMENT '主键idx生成的code##@Long2S(targetField = "idxCode")##',
  `order_no` varchar(28) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '订单编号##@NotNull(message = "订单编号不能为空")@Length(max = 25, message = "订单编号最大25个字符")##',
  `sub_order_no` varchar(28) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '拆单编号##@NotNull(message = "拆单编号不能为空")@Length(max = 25, message = "拆单编号最大25个字符")##',
  `fail_type` smallint(1) DEFAULT NULL COMMENT '推单失败类型，必填##@NotNull(message = "推单失败类型不能为空")##',
  `fail_reason` varchar(1000) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '推单失败原因，必填@NotNull(message = "推单失败原因不能为空")@Length(max = 100, message = "推单失败原因最大100个字符")##',
  `sync_type` smallint(1) DEFAULT NULL COMMENT '同步方式，1：自动同步 2：手动同步',
  `remark` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '备注，字符个数0-100，不可以为null，必须手动设置空字符串## @Length(max = 100, message = "备注最大100个字符")##',
  `status` smallint(1) DEFAULT NULL COMMENT '状态，1：可用的、激活的，2：未激活，0：删除，2：未激活，取值范围为0-9，不可以为null',
  `version` bigint(19) DEFAULT NULL COMMENT '版本号，高并发，乐观锁解决方案',
  `create_user_idx_code` bigint(19) DEFAULT NULL COMMENT '创建用户idxcode',
  `update_user_idx_code` bigint(19) DEFAULT NULL COMMENT '修改用户idxcode',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间##@EnYyyyMMddHHmmss##',
  `update_time` timestamp NULL DEFAULT NULL COMMENT '更新时间##@EnYyyyMMddHHmmss##',
  `ext` varchar(50) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '扩展字段',
  PRIMARY KEY (`idx`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- ----------------------------
-- Table structure for tb_order_refund
-- ----------------------------
DROP TABLE IF EXISTS `tb_order_refund`;
CREATE TABLE `tb_order_refund` (
  `idx` bigint(19) NOT NULL COMMENT '订单退货退款表主键idx，分布式架构，全局唯一递增##@Cache(module = "msyt-order")@MQ(module = "msyt-order", moduleAlias = "order", autoAck = false)##',
  `idx_code` bigint(19) DEFAULT NULL COMMENT '主键idx生成的code##@Long2S(targetField = "idxCode")##',
  `order_no` varchar(25) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '订单编号##@NotNull(message = "订单编号不能为空")@Length(max = 25, message = "订单编号最大25个字符")##',
  `lock_order_status` smallint(1) DEFAULT NULL COMMENT '申请退货退款时，订单的状态，如果在这个期间订单状态更新',
  `refund_no` varchar(30) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '退款编号##@NotNull(message = "退款编号不能为空")@Length(max = 30, message = "退款编号最大30个字符")##',
  `refund_status` smallint(1) DEFAULT NULL COMMENT '退款状态（10：待审核 20：财务已审 30：客服已审 40：系统退款失败 50 ：驳回退款 60：退款成功）##@DynamicS##',
  `mall_refund_status` smallint(1) DEFAULT NULL COMMENT '商城前端退款状态（20：退款中 30：退款成功:40：退款失败）##@DynamicS##',
  `time_stamp` smallint(1) DEFAULT NULL COMMENT '时间差（0：小于六小时，1：大于六小时）',
  `finish_time` timestamp NULL DEFAULT NULL COMMENT '整笔退货退款流程，最后完成时间##@EnYyyyMMddHHmmss@Date(pattern = MsOnionDatePattern.SINCE)##',
  `refund_fail_type` smallint(1) DEFAULT NULL COMMENT '订单退款退货失败类型（1：系统失败 2：财务拒绝）##@DynamicS##',
  `remark` varchar(1000) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '备注，不可以为null##@Length(max = 1000, message = "备注最大1000个字符")##',
  `status` smallint(1) DEFAULT NULL COMMENT '状态，1：可用的、激活的，2：未激活，0：删除，2：未激活，取值范围为0-9，不可以为null',
  `version` bigint(19) DEFAULT NULL COMMENT '版本号，高并发，乐观锁解决方案',
  `create_user_idx_code` bigint(19) DEFAULT NULL COMMENT '创建用户idxcode',
  `update_user_idx_code` bigint(19) DEFAULT NULL COMMENT '修改后台member idxcode，',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间##@EnYyyyMMddHHmmss##',
  `update_time` timestamp NULL DEFAULT NULL COMMENT '更新时间##@EnYyyyMMddHHmmss##',
  PRIMARY KEY (`idx`),
  KEY `index_tor_order_no` (`order_no`,`refund_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='订单退货退款表';

-- ----------------------------
-- Table structure for tb_order_refund_apply
-- ----------------------------
DROP TABLE IF EXISTS `tb_order_refund_apply`;
CREATE TABLE `tb_order_refund_apply` (
  `idx` bigint(19) NOT NULL COMMENT '订单退货退款申请表主键idx，分布式架构，全局唯一递增##@Cache(module = "msyt-order")@MQ(module = "msyt-order", moduleAlias = "order", autoAck = false)##',
  `idx_code` bigint(19) DEFAULT NULL COMMENT '主键idx生成的code##@Long2S(targetField = "idxCode")##',
  `order_refund_idx_code` bigint(19) DEFAULT NULL COMMENT '订单退款退货idxcode##    @Range(min = 1, max = Long.MAX_VALUE, message = "订单退款退货idxcode不能为空")##',
  `refund_type_idx_code` bigint(19) DEFAULT NULL COMMENT '退款/退货类型##@DynamicS##',
  `refund_reason_idx_code` bigint(19) DEFAULT NULL COMMENT '退款/退货原因##@DynamicS##',
  `refund_num` int(1) DEFAULT NULL COMMENT '退货数量',
  `refund_item_amount` int(3) DEFAULT NULL COMMENT '退款商品金额(分)##@$2@DynamicS##',
  `refund_amount` int(3) DEFAULT NULL COMMENT '退款总金额(分)##@$2@DynamicS##',
  `freight` int(3) DEFAULT NULL COMMENT '运费(分)##@$2@DynamicS##',
  `problem_describe` varchar(300) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '问题描述##@Length(max = 300, message = "问题描述最大300个字符")##',
  `remark` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '备注，不可以为null##@Length(max = 100, message = "备注最大100个字符")##',
  `status` smallint(1) DEFAULT NULL COMMENT '状态，1：可用的、激活的，2：未激活，0：删除，2：未激活，取值范围为0-9，不可以为null',
  `version` bigint(19) DEFAULT NULL COMMENT '版本号，高并发，乐观锁解决方案',
  `create_user_idx_code` bigint(19) DEFAULT NULL COMMENT '创建用户idxcode',
  `update_user_idx_code` bigint(19) DEFAULT NULL COMMENT '修改用户idxcode',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` timestamp NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`idx`),
  KEY `index_tora_refund_idx_code` (`order_refund_idx_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='订单退货退款申请表';

-- ----------------------------
-- Table structure for tb_order_refund_apply_image
-- ----------------------------
DROP TABLE IF EXISTS `tb_order_refund_apply_image`;
CREATE TABLE `tb_order_refund_apply_image` (
  `idx` bigint(19) NOT NULL COMMENT '订单退货退款申请凭证表主键idx，分布式架构，全局唯一递增##@Cache(module = "msyt-order")##',
  `idx_code` bigint(19) DEFAULT NULL COMMENT '主键idx生成的code##@Long2S(targetField = "idxCode")##',
  `order_refund_apply_idx_code` bigint(19) DEFAULT NULL COMMENT '退款退货申请表idxcode##    @Range(min = 1, max = Long.MAX_VALUE, message = "订单退款退货申请idxcode不能为空")##',
  `image_uri` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '图片uri##@Length(max = 100, message = "图片uri最大100个字符")##',
  `image_uri_small` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '图片小图uri##@Length(max = 100, message = "图片uri最大100个字符")##',
  `image_uri_middle` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '图片中图uri##@Length(max = 100, message = "图片uri最大100个字符")##',
  `remark` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '备注，不可以为null##@Length(max = 100, message = "备注最大100个字符")##',
  `status` smallint(1) DEFAULT NULL COMMENT '状态，1：可用的、激活的，2：未激活，0：删除，2：未激活，取值范围为0-9，不可以为null',
  `version` bigint(19) DEFAULT NULL COMMENT '版本号，高并发，乐观锁解决方案',
  `create_user_idx_code` bigint(19) DEFAULT NULL COMMENT '创建用户idxcode',
  `update_user_idx_code` bigint(19) DEFAULT NULL COMMENT '修改用户idxcode',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` timestamp NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`idx`),
  KEY `index_torai_idx_code` (`order_refund_apply_idx_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='订单退货退款申请凭证表';

-- ----------------------------
-- Table structure for tb_order_refund_examine
-- ----------------------------
DROP TABLE IF EXISTS `tb_order_refund_examine`;
CREATE TABLE `tb_order_refund_examine` (
  `idx` bigint(19) NOT NULL COMMENT '订单退货退款审核表主键idx，分布式架构，全局唯一递增##@Cache(module = "msyt-order")@MQ(module = "msyt-order", moduleAlias = "order", autoAck = false)##',
  `idx_code` bigint(19) DEFAULT NULL COMMENT '主键idx生成的code##@Long2S(targetField = "idxCode")##',
  `order_refund_idx_code` bigint(19) DEFAULT NULL COMMENT '订单退款退货idxcode##@Range(min = 1, max = Long.MAX_VALUE, message = "订单退款退货idxcode不能为空")##',
  `examine_type` smallint(1) DEFAULT NULL COMMENT '审核人类型（1：客服，2：财务，3：系统）',
  `operator_name` varchar(20) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '操作人名称##@Length(max = 20, message = "操作人名称最大20个字符")##',
  `examine_status` smallint(1) DEFAULT NULL COMMENT '审核状态（1：通过，0：拒绝）',
  `reason` varchar(600) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '拒绝原因##@Length(max = 600, message = "拒绝原因最大600个字符")##',
  `tips` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '前端提示语',
  `remark` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '备注，不可以为null##@Length(max = 100, message = "备注最大100个字符")##',
  `status` smallint(1) DEFAULT NULL COMMENT '状态，1：可用的、激活的，2：未激活，0：删除，2：未激活，取值范围为0-9，不可以为null',
  `version` bigint(19) DEFAULT NULL COMMENT '版本号，高并发，乐观锁解决方案',
  `create_member_idx_code` bigint(19) DEFAULT NULL COMMENT '创建成员idxcode',
  `update_member_idx_code` bigint(19) DEFAULT NULL COMMENT '修改成员idxcode',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间##@EnYyyyMMddHHmmss##',
  `update_time` timestamp NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`idx`),
  KEY `index_tore_idx_code` (`order_refund_idx_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='订单退货退款审核表';

-- ----------------------------
-- Table structure for tb_order_refund_item
-- ----------------------------
DROP TABLE IF EXISTS `tb_order_refund_item`;
CREATE TABLE `tb_order_refund_item` (
  `idx` bigint(19) NOT NULL COMMENT '订单退款退货商品关系表主键idx，分布式架构，全局唯一递增##@Cache(module = "msyt-order")@MQ(module = "msyt-order", moduleAlias = "order", autoAck = false)##',
  `idx_code` bigint(19) DEFAULT NULL COMMENT '主键idx生成的code##@Long2S(targetField = "idxCode")##',
  `order_refund_idx_code` bigint(19) DEFAULT NULL COMMENT '订单退货退款idxcode##@Range(min = 1, max = Long.MAX_VALUE, message = "订单退款退货idxcode不能为空")##',
  `order_no` varchar(25) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '订单编号##@NotNull(message = "订单编号不能为空")@Length(max = 25, message = "订单编号最大25个字符")##',
  `sub_order_no` varchar(25) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '拆单编号##@NotNull(message = "拆单编号不能为空")@Length(max = 25, message = "拆单编号最大25个字符")##',
  `order_item_idx_code` bigint(19) DEFAULT NULL COMMENT '关联订单商品idxCode',
  `item_idx_code` bigint(20) DEFAULT NULL COMMENT '(预留)订单商品idxCode##@DynamicS##',
  `time_stamp` smallint(1) DEFAULT NULL COMMENT '时间差（0：小于六小时，1：大于六小时）',
  `remark` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '备注，不可以为null##@Length(max = 100, message = "备注最大100个字符")##',
  `status` smallint(1) DEFAULT NULL COMMENT '状态，1：可用的、激活的，2：未激活，0：删除，2：未激活，取值范围为0-9，不可以为null',
  `version` bigint(19) DEFAULT NULL COMMENT '版本号，高并发，乐观锁解决方案',
  `create_user_idx_code` bigint(19) DEFAULT NULL COMMENT '创建用户idxcode##@DynamicS##',
  `update_user_idx_code` bigint(19) DEFAULT NULL COMMENT '修改用户idxcode',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间##@EnYyyyMMddHHmmss##',
  `update_time` timestamp NULL DEFAULT NULL COMMENT '更新时间##@EnYyyyMMddHHmmss##',
  PRIMARY KEY (`idx`),
  KEY `index_tori_idx_code` (`order_refund_idx_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='订单退款退货商品关系表';

-- ----------------------------
-- Table structure for tb_order_refund_return
-- ----------------------------
DROP TABLE IF EXISTS `tb_order_refund_return`;
CREATE TABLE `tb_order_refund_return` (
  `idx` bigint(19) NOT NULL COMMENT '订单退货退款退货信息表主键idx，分布式架构，全局唯一递增##@Cache(module = "msyt-order")@MQ(module = "msyt-order", moduleAlias = "order", autoAck = false)##',
  `idx_code` bigint(19) DEFAULT NULL COMMENT '主键idx生成的code##@Long2S(targetField = "idxCode")##',
  `order_refund_idx_code` bigint(19) DEFAULT NULL COMMENT '订单退货退款idxcode##@Range(min = 1, max = Long.MAX_VALUE, message = "订单退款退货idxcode不能为空")##',
  `return_type` smallint(1) DEFAULT NULL COMMENT '退货方式（1：未发货2：退款不退货3：退款退货4：退款退货——广州5：退款退货——香港6：退款退货——海关7：退款退货——海豚8：退款退货——漏发9：退款退货——其他）',
  `return_name` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '名称##@NotNull@Length(max = 50, message = "名称最大50个字符")##',
  `province_code` varchar(10) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '省份编码##@NotNull@Length(max = 10, message = "省份编码最大10个字符")@DynamicS##',
  `city_code` varchar(10) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '城市编码##@NotNull@Length(max = 10, message = "城市编码最大10个字符")@DynamicS##',
  `districts_code` varchar(10) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '区县编码##@NotNull@Length(max = 10, message = "区县编码最大10个字符")@DynamicS##',
  `address` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '地址##@Length(max = 100, message = "地址最大100个字符")##',
  `contact_number` varchar(20) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '联系电话##@NotNull@Length(max = 20, message = "联系电话最大10个字符")##',
  `zip_code` varchar(10) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '邮政编码##@Length(max = 10, message = "邮政编码最大10个字符")##',
  `remark` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '备注，不可以为null##@Length(max = 100, message = "备注最大100个字符")##',
  `status` smallint(1) DEFAULT NULL COMMENT '状态，1：可用的、激活的，2：未激活，0：删除，2：未激活，取值范围为0-9，不可以为null',
  `version` bigint(19) DEFAULT NULL COMMENT '版本号，高并发，乐观锁解决方案',
  `create_member_idx_code` bigint(19) DEFAULT NULL COMMENT '创建成员idxcode',
  `update_member_idx_code` bigint(19) DEFAULT NULL COMMENT '修改成员idxcode',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` timestamp NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`idx`),
  KEY `index_torr_idx_code` (`order_refund_idx_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='订单退货退款退货信息表';

-- ----------------------------
-- Table structure for tb_order_refund_trade_detail
-- ----------------------------
DROP TABLE IF EXISTS `tb_order_refund_trade_detail`;
CREATE TABLE `tb_order_refund_trade_detail` (
  `idx` bigint(19) NOT NULL COMMENT '订单退货退款交易明细表主键idx，分布式架构，全局唯一递增##@Cache(module = "msyt-order")@MQ(module = "msyt-order", moduleAlias = "order", autoAck = false)##',
  `idx_code` bigint(19) DEFAULT NULL COMMENT '主键idx生成的code##@Long2S(targetField = "idxCode")##',
  `order_refund_idx_code` bigint(19) DEFAULT NULL COMMENT '订单退款退货idxcode##@Range(min = 1, max = Long.MAX_VALUE, message = "订单退款退货idxcode不能为空")##',
  `order_no` varchar(25) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '订单编号##@NotNull(message = "订单编号不能为空")@Length(max = 25, message = "订单编号最大25个字符")##',
  `sub_order_no` varchar(25) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '拆单编号（大于六小时才有)##@Length(max = 25, message = "拆单编号最大25个字符")##',
  `item_idx_code` bigint(19) DEFAULT NULL COMMENT '商品idxcode（大于六小时,一个一个商品的申请）',
  `trade_amount` int(9) DEFAULT NULL COMMENT '交易金额（单位分）##@$2##',
  `trade_no` varchar(32) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '交易流水号##@Length(max = 32, message = "交易流水号最大32个字符")##',
  `trade_status` varchar(10) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '交易状态编码（0000：交易成功 3045,3088：交易超时 3008：余额不足 3999：交易失败 2008：交易处理中 3050：交易已撤销 -1：请求失败）##@NotNull@Length(max = 10, message = "交易状态编码")@DynamicS##',
  `fail_reason` varchar(300) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '接口返回失败原因##接口返回失败原因##@Length(max = 300, message = "失败原因最大300个字符")##',
  `pay_trade_no` varchar(32) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '支付时交易流水号',
  `order_item_idx_code` bigint(19) DEFAULT NULL COMMENT '订单商品idxcode',
  `remark` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '备注，不可以为null##@Length(max = 100, message = "备注最大100个字符")##',
  `status` smallint(1) DEFAULT NULL COMMENT '状态，1：可用的、激活的，2：未激活，0：删除，2：未激活，取值范围为0-9，不可以为null',
  `version` bigint(19) DEFAULT NULL COMMENT '版本号，高并发，乐观锁解决方案',
  `create_user_idx_code` bigint(19) DEFAULT NULL COMMENT '创建用户idxcode',
  `update_user_idx_code` bigint(19) DEFAULT NULL COMMENT '修改用户idxcode',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间##@EnYyyyMMddHHmmss##',
  `update_time` timestamp NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`idx`),
  KEY `index_tortd_idx_code` (`order_refund_idx_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='订单退货退款交易明细表';

-- ----------------------------
-- Table structure for tb_order_state_machine
-- ----------------------------
DROP TABLE IF EXISTS `tb_order_state_machine`;
CREATE TABLE `tb_order_state_machine` (
  `idx` bigint(19) NOT NULL COMMENT '订单状态机主键idx，分布式架构，全局唯一递增##@Cache(module = "msyt-order")@MQ(module = "msyt-order", moduleAlias = "order", autoAck = false)##',
  `idx_code` bigint(19) DEFAULT NULL COMMENT '主键idx生成的code##@Long2S(targetField = "idxCode")##',
  `order_no` varchar(25) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '订单编号## @NotNull(message = "订单编号不能为空")@Length(max = 25, message = "订单编号最大25个字符")##',
  `sub_order_no` varchar(25) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '拆单编号##@Length(max = 25, message = "拆单编号最大25个字符")##',
  `order_source` smallint(1) DEFAULT NULL COMMENT '订单来源(1:洋桃，2:C店,通过数据字典控制)，不能为空',
  `order_status` smallint(1) DEFAULT NULL COMMENT '订单状态(10:待付款,20:待发货,30:待收货,40:已签收,50:退款退货,60:交易关闭)',
  `remark` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '备注，不可以为null##@Length(max = 100, message = "备注最大100个字符")##',
  `status` smallint(1) DEFAULT NULL COMMENT '状态，1：可用的、激活的，2：未激活，0：删除，2：未激活，取值范围为0-9，不可以为null',
  `version` bigint(19) DEFAULT NULL COMMENT '版本号，高并发，乐观锁解决方案',
  `create_user_idx_code` bigint(19) DEFAULT NULL COMMENT '创建用户idxcode##@DynamicS##',
  `update_user_idx_code` bigint(19) DEFAULT NULL COMMENT '修改用户idxcode',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间##@EnYyyyMMddHHmmss##',
  `update_time` timestamp NULL DEFAULT NULL COMMENT '更新时间##@EnYyyyMMddHHmmss##',
  PRIMARY KEY (`idx`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='订单状态机信息';

-- ----------------------------
-- Table structure for tb_order_sub
-- ----------------------------
DROP TABLE IF EXISTS `tb_order_sub`;
CREATE TABLE `tb_order_sub` (
  `idx` bigint(19) NOT NULL COMMENT '订单拆单主键idx，分布式架构，全局唯一递增##@Cache(module = "msyt-order")@MQ(module = "msyt-order", moduleAlias = "order", autoAck = false)##',
  `idx_code` bigint(19) DEFAULT NULL COMMENT '主键idx生成的code##@Long2S(targetField = "idxCode")##',
  `order_no` varchar(28) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '订单编号##@NotNull(message = "订单编号不能为空")@Length(max = 25, message = "订单编号最大25个字符")##',
  `sub_order_no` varchar(28) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '拆单编号##@NotNull(message = "拆单编号不能为空")@Length(max = 25, message = "拆单编号最大25个字符")##',
  `order_source` smallint(1) DEFAULT NULL COMMENT '订单来源(1:洋桃，2:C店)，不能为空，冗余字段方便查询',
  `out_order_status` smallint(1) DEFAULT NULL COMMENT '外部系统订单状态##@DynamicS##',
  `order_status` smallint(1) DEFAULT NULL COMMENT '订单状态(10:待付款,20:待发货,30:待收货,40:已签收,50:退款退货,60:交易关闭)',
  `total_num` int(1) DEFAULT NULL COMMENT '订单中商品总数量',
  `warehouse_no` varchar(20) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '仓库编号## @NotNull(message = "仓库编号不能为空")@Length(max = 20, message = "仓库编号最大20个字符")##',
  `express_code` varchar(20) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '快递公司编码##@DynamicS##',
  `logistics_no` varchar(20) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '物流单号##@Length(max = 20, message = "物流单号最大20个字符")##',
  `logistics_time` timestamp NULL DEFAULT NULL COMMENT '拿到物流时间##@EnYyyyMMddHHmmss@Date(pattern = MsOnionDatePattern.SINCE)##',
  `order_sale_fee` int(10) DEFAULT NULL COMMENT '订单销售金额(分)##@$2##',
  `order_real_fee` int(10) DEFAULT NULL COMMENT '订单实付金额(分)##@$2##',
  `order_discount_fee` int(10) DEFAULT NULL COMMENT '订单优惠金额(分)##@$2##',
  `freight` int(10) DEFAULT NULL COMMENT '运费(分)##@$2##',
  `weight` int(10) DEFAULT NULL COMMENT '预估称重，单位g##@$3##',
  `tax` int(10) DEFAULT NULL COMMENT '税费，以分为单位，而不是以元为单位，取值范围0-2147483647，不可以为null##@NotNull(message = "税费不能为空")@Range(min = 0, max = 2147483647, message = "税费需要设置0-2147483647")@$2#',
  `tax_rate` int(10) DEFAULT NULL COMMENT '【废弃】税率，以十万分位为单位，而不是以元为单位，取值范围为0-100000，不可以为null',
  `remark` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '备注，字符个数0-100，不可以为null，必须手动设置空字符串## @Length(max = 100, message = "备注最大100个字符")##',
  `status` smallint(1) DEFAULT NULL COMMENT '状态，1：可用的、激活的，2：未激活，0：删除，2：未激活，取值范围为0-9，不可以为null',
  `version` bigint(19) DEFAULT NULL COMMENT '版本号，高并发，乐观锁解决方案',
  `create_user_idx_code` bigint(19) DEFAULT NULL COMMENT '创建用户idxcode',
  `update_user_idx_code` bigint(19) DEFAULT NULL COMMENT '修改用户idxcode',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间##@EnYyyyMMddHHmmss##',
  `update_time` timestamp NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`idx`),
  KEY `index_os_orderno_suborderno` (`order_no`,`sub_order_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='订单拆单信息';

-- ----------------------------
-- Table structure for tb_order_sub_ext
-- ----------------------------
DROP TABLE IF EXISTS `tb_order_sub_ext`;
CREATE TABLE `tb_order_sub_ext` (
  `idx` bigint(19) NOT NULL COMMENT '订单拆单扩展表主键idx，分布式架构，全局唯一递增##@Cache(module = "msyt-order")@MQ(module = "msyt-order", moduleAlias = "order", autoAck = false)##',
  `idx_code` bigint(19) DEFAULT NULL COMMENT '主键idx生成的code##@Long2S(targetField = "idxCode")##',
  `order_no` varchar(25) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '订单编号##@NotNull(message = "订单编号不能为空")@Length(max = 25, message = "订单编号最大25个字符")##',
  `sub_order_no` varchar(25) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '拆单编号##@NotNull(message = "拆单编号不能为空")@Length(max = 25, message = "拆单编号最大25个字符")##',
  `warehouse_type_idx_code` bigint(19) DEFAULT NULL COMMENT '正式商品仓库类型idxcode##@DynamicS##',
  `delivery_time` timestamp NULL DEFAULT NULL COMMENT '发货时间##@EnYyyyMMddHHmmss@Date(pattern = MsOnionDatePattern.SINCE)##',
  `declare_price` int(9) DEFAULT NULL COMMENT '订单拆单申报总价，根据商品申报总价统计，单位分##@$2##',
  `payment_push` smallint(1) DEFAULT NULL COMMENT '支付单推送公司(1:自己,2:高捷代推,3:新银河代推)',
  `push_hg_status` smallint(1) DEFAULT NULL COMMENT '推送海关状态，0：默认未推送 1：推送中 2：推送成功 3：推送失败',
  `push_pay_status` smallint(1) DEFAULT NULL COMMENT '推送支付单状态，0：默认未推送 1：推送中 2：推送成功 3：推送失败',
  `from_erp_sync_time` timestamp NULL DEFAULT NULL COMMENT '(洋桃订单专属)从erp同步过来的时间##@EnYyyyMMddHHmmss@Date(pattern = MsOnionDatePattern.SINCE)##',
  `from_erp_sync_status` smallint(1) DEFAULT NULL COMMENT '(洋桃订单专属)订单从erp中同步状态（0:未同步，1：同步成功，2：同步失败）',
  `push_wms_status` smallint(1) DEFAULT NULL COMMENT '推送WMS状态，0：默认未推送 1：推送成功 2：推送失败',
  `push_back_status` smallint(1) DEFAULT NULL COMMENT '推送回传数据状态，0：默认未推送 1：推送成功 2：推送失败',
  `push_company_status` smallint(1) DEFAULT NULL COMMENT '推送清关公司状态，0：默认未推送 1：推送成功 2：推送失败',
  `push_express_status` smallint(1) DEFAULT NULL COMMENT '推送快递公司状态，0：默认未推送 1：推送成功 2：推送失败',
  `push_trace_status` smallint(1) DEFAULT NULL COMMENT '推送国外物流痕迹状态，0：默认未推送 1：推送成功 2：推送失败',
  `is_key_order` smallint(1) DEFAULT NULL COMMENT '一键下单，1:是',
  `remark` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '备注，不可以为null##@Length(max = 100, message = "备注最大100个字符")##',
  `status` smallint(1) DEFAULT NULL COMMENT '状态，1：可用的、激活的，2：未激活，0：删除，2：未激活，取值范围为0-9，不可以为null',
  `version` bigint(19) DEFAULT NULL COMMENT '版本号，高并发，乐观锁解决方案',
  `create_user_idx_code` bigint(19) DEFAULT NULL COMMENT '创建用户idxcode',
  `update_user_idx_code` bigint(19) DEFAULT NULL COMMENT '修改用户idxcode',
  `update_time` timestamp NULL DEFAULT NULL COMMENT '更新时间',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`idx`),
  KEY `index_tose_order_no` (`order_no`,`sub_order_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='订单拆单扩展表';

-- ----------------------------
-- Table structure for tb_order_sync_record
-- ----------------------------
DROP TABLE IF EXISTS `tb_order_sync_record`;
CREATE TABLE `tb_order_sync_record` (
  `idx` bigint(19) NOT NULL COMMENT '订单同步erp主键idx，分布式架构，全局唯一递增##@Cache(module = "msyt-order")##',
  `idx_code` bigint(19) DEFAULT NULL COMMENT '主键idx生成的code##@Long2S(targetField = "idxCode")##',
  `order_no` varchar(25) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '订单编号##@NotNull(message = "订单编号不能为空")@Length(max = 25, message = "订单编号最大25个字符")##',
  `sub_order_no` varchar(25) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '拆单编号，如果不确定是那个，为空##@Length(max = 25, message = "拆单编号最大25个字符")##',
  `order_refund_idx_code` bigint(19) DEFAULT NULL COMMENT '退货退款idxcode',
  `to_system` smallint(1) DEFAULT NULL COMMENT '接收系统（1:erp,2:高捷,3:云达,4:新银河世纪,5:聚合数据,6:海豚,7:德邦,8:广州海关，9：杭州海关，10：通联支付）##@DynamicS##',
  `sync_status` smallint(1) DEFAULT NULL COMMENT '同步状态（0:未同步，1：同步成功，2：同步失败）##@DynamicS##',
  `task_type` smallint(1) DEFAULT NULL COMMENT '任务类型（1:同步订单,2:退款申请,3:清关,4:WMS,5:物流推送,6:回传物流,7:推支付,8:推海关,9;国外物流推送,10:支付回执回调,11:海关回执回调）##@DynamicS##',
  `sync_type` smallint(1) DEFAULT NULL COMMENT '同步方式，1：自动同步 2：手动同步',
  `finish_time` timestamp NULL DEFAULT NULL COMMENT '完成时间##@EnYyyyMMddHHmmss@Date(pattern = MsOnionDatePattern.SINCE)##',
  `retry_number` smallint(1) DEFAULT NULL COMMENT '(预留)失败可重试次数',
  `retried_number` smallint(1) DEFAULT NULL COMMENT '(预留)已重试次数',
  `retry_interval` int(3) DEFAULT NULL COMMENT '(预留)重试间隔（秒）',
  `remark` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '备注，不可以为null##@Length(max = 100, message = "备注最大100个字符")##',
  `status` smallint(1) DEFAULT NULL COMMENT '状态，1：可用的、激活的，2：未激活，0：删除，2：未激活，取值范围为0-9，不可以为null',
  `version` bigint(19) DEFAULT NULL COMMENT '版本号，高并发，乐观锁解决方案',
  `create_user_idx_code` bigint(19) DEFAULT NULL COMMENT '创建用户idxcode',
  `update_user_idx_code` bigint(19) DEFAULT NULL COMMENT '修改用户idxcode',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` timestamp NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`idx`),
  KEY `index_tosr_group` (`sub_order_no`,`to_system`,`sync_status`,`task_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='订单同步erp记录表';

-- ----------------------------
-- Table structure for tb_order_user_behavior
-- ----------------------------
DROP TABLE IF EXISTS `tb_order_user_behavior`;
CREATE TABLE `tb_order_user_behavior` (
  `idx` bigint(19) NOT NULL COMMENT '订单流程日志表主键idx，分布式架构，全局唯一递增##@Cache(module = "msyt-order")##',
  `idx_code` bigint(19) DEFAULT NULL COMMENT '主键idx生成的code##@Long2S(targetField = "idxCode")##',
  `order_no` varchar(25) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '订单编号##@NotNull(message = "订单编号不能为空")@Length(max = 25, message = "订单编号最大25个字符")##',
  `sub_order_no` varchar(25) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '拆单编号，如果不确定是那个，为空##@Length(max = 25, message = "拆单编号最大25个字符")##',
  `req_user_agent` varchar(1000) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '请求头user-agent信息##@Length(max = 1000, message = "请求头最大1000个字符")##',
  `ip_addr` varchar(20) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'ip地址##@Length(max = 20, message = "ip地址最大20个字符")##',
  `browser` varchar(20) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '浏览器##@Length(max = 20, message = "浏览器最大20个字符")##',
  `system_name` varchar(20) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '操作系统##@Length(max = 20, message = " 操作系统最大20个字符")##',
  `fun_module` smallint(1) DEFAULT NULL COMMENT '功能模块（如用户下单，订单支付等）',
  `remark` varchar(200) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '备注，不可以为null##@Length(max = 200, message = "备注最大200个字符")##',
  `status` smallint(1) DEFAULT NULL COMMENT '状态，1：可用的、激活的，2：未激活，0：删除，2：未激活，取值范围为0-9，不可以为null',
  `version` bigint(19) DEFAULT NULL COMMENT '版本号，高并发，乐观锁解决方案',
  `create_user_idx_code` bigint(19) DEFAULT NULL COMMENT '创建用户idxcode',
  `update_user_idx_code` bigint(19) DEFAULT NULL COMMENT '修改用户idxcode',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间##@EnYyyyMMddHHmmss##',
  `update_time` timestamp NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`idx`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='【预留】订单用户行为表';

-- ----------------------------
-- Table structure for tb_refund_reason
-- ----------------------------
DROP TABLE IF EXISTS `tb_refund_reason`;
CREATE TABLE `tb_refund_reason` (
  `idx` bigint(19) NOT NULL COMMENT '退货退款原因表主键idx，分布式架构，全局唯一递增##@Cache(module = "msyt-order")##',
  `idx_code` bigint(19) DEFAULT NULL COMMENT '主键idx生成的code##@Long2S(targetField = "idxCode")##',
  `refund_type_idx_code` bigint(19) DEFAULT NULL COMMENT '退款退货idxCode',
  `reason` varchar(30) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '退款退货原因##@Length(max = 30, message = "退款退货原因最大100个字符")##',
  `zindex` smallint(1) DEFAULT NULL COMMENT '排序，数字越大，排序越靠前##@Range(min = 0, max = Short.MAX_VALUE, message = "排序最小为0，最大为32767")##',
  `remark` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '备注，不可以为null##@Length(max = 100, message = "备注最大100个字符")##',
  `status` smallint(1) DEFAULT NULL COMMENT '状态，1：可用的、激活的，2：未激活，0：删除，2：未激活，取值范围为0-9，不可以为null',
  `version` bigint(19) DEFAULT NULL COMMENT '版本号，高并发，乐观锁解决方案',
  `create_user_idx_code` bigint(19) DEFAULT NULL COMMENT '创建用户idxcode',
  `update_user_idx_code` bigint(19) DEFAULT NULL COMMENT '修改用户idxcode',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间##@EnYyyyMMddHHmmss##',
  `update_time` timestamp NULL DEFAULT NULL COMMENT '更新时间##@EnYyyyMMddHHmmss##',
  PRIMARY KEY (`idx`),
  KEY `index_trr_refund_type_idx_code` (`refund_type_idx_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='退货退款原因表';

-- ----------------------------
-- Table structure for tb_refund_type
-- ----------------------------
DROP TABLE IF EXISTS `tb_refund_type`;
CREATE TABLE `tb_refund_type` (
  `idx` bigint(19) NOT NULL COMMENT '退货退款类型表主键idx，分布式架构，全局唯一递增##@Cache(module = "msyt-order")##',
  `idx_code` bigint(19) DEFAULT NULL COMMENT '主键idx生成的code##@Long2S(targetField = "idxCode")##',
  `name` varchar(30) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '退货退款类型名称##@NotNull@Length(max = 30, message = "退货退款类型名称最大100个字符")##',
  `zindex` smallint(1) DEFAULT NULL COMMENT '排序，数字越大，排序越靠前##@Range(min = 0, max = Short.MAX_VALUE, message = "排序最小为0，最大为32767")##',
  `remark` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '备注，不可以为null##@Length(max = 100, message = "备注最大100个字符")##',
  `status` smallint(1) DEFAULT NULL COMMENT '状态，1：可用的、激活的，2：未激活，0：删除，2：未激活，取值范围为0-9，不可以为null',
  `version` bigint(19) DEFAULT NULL COMMENT '版本号，高并发，乐观锁解决方案',
  `create_user_idx_code` bigint(19) DEFAULT NULL COMMENT '创建用户idxcode',
  `update_user_idx_code` bigint(19) DEFAULT NULL COMMENT '修改用户idxcode',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间##@EnYyyyMMddHHmmss##',
  `update_time` timestamp NULL DEFAULT NULL COMMENT '更新时间##@EnYyyyMMddHHmmss##',
  PRIMARY KEY (`idx`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='退货退款类型表';
