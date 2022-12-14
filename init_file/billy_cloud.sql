/*
 Navicat Premium Data Transfer

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 80030
 Source Host           : localhost:3306
 Source Schema         : billy_cloud

 Target Server Type    : MySQL
 Target Server Version : 80030
 File Encoding         : 65001

 Date: 20/10/2022 14:25:44
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for biz_audit
-- ----------------------------
DROP TABLE IF EXISTS `biz_audit`;
CREATE TABLE `biz_audit`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `task_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '任务编号',
  `result` tinyint UNSIGNED NOT NULL COMMENT '审核结果 2通过 3驳回',
  `comment` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '审核意见',
  `proc_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '流程名称',
  `proc_def_key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '路由 流程定义key',
  `applyer` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '申请人',
  `auditor` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '审批人',
  `auditor_id` bigint UNSIGNED NOT NULL COMMENT '审批人编号',
  `create_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `del_flag` bit(1) NOT NULL DEFAULT b'0' COMMENT '删除标记',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '业务审核记录' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of biz_audit
-- ----------------------------

-- ----------------------------
-- Table structure for biz_business
-- ----------------------------
DROP TABLE IF EXISTS `biz_business`;
CREATE TABLE `biz_business`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `proc_def_id` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '流程定义编号',
  `proc_def_key` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '流程定义key 路由标记',
  `proc_inst_id` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '流程实例编号',
  `proc_name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '流程名称',
  `current_task` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '当前任务节点名称',
  `result` tinyint UNSIGNED NOT NULL DEFAULT 0 COMMENT '结果状态  1处理中 2通过 3驳回',
  `status` tinyint UNSIGNED NOT NULL DEFAULT 0 COMMENT '状态 1处理中 2结束',
  `table_id` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '关联表id',
  `title` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '申请标题',
  `user_id` bigint UNSIGNED NULL DEFAULT NULL COMMENT '创建用户id',
  `applyer` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '申请人',
  `apply_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '申请时间',
  `del_flag` bit(1) NULL DEFAULT b'0' COMMENT '删除标记',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of biz_business
-- ----------------------------

-- ----------------------------
-- Table structure for biz_leave
-- ----------------------------
DROP TABLE IF EXISTS `biz_leave`;
CREATE TABLE `biz_leave`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `title` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '标题',
  `description` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '描述',
  `start_date` datetime(0) NULL DEFAULT NULL COMMENT '开始时间',
  `end_date` datetime(0) NULL DEFAULT NULL COMMENT '结束时间',
  `duration` double(11, 2) NULL DEFAULT NULL COMMENT '时长(小时)',
  `type` tinyint NULL DEFAULT NULL COMMENT '请假类型',
  `del_flag` bit(1) NULL DEFAULT b'0' COMMENT '删除标记',
  `create_time` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '请假' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of biz_leave
-- ----------------------------

-- ----------------------------
-- Table structure for biz_node
-- ----------------------------
DROP TABLE IF EXISTS `biz_node`;
CREATE TABLE `biz_node`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `node_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '节点ID',
  `type` tinyint UNSIGNED NOT NULL COMMENT '类型 1：角色 2：部门负责人 3：用户 4：所属部门负责人',
  `auditor` bigint UNSIGNED NULL DEFAULT 0 COMMENT '类型对应负责人的值',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_node_id`(`node_id`) USING BTREE COMMENT '节点id索引'
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of biz_node
-- ----------------------------

-- ----------------------------
-- Table structure for biz_purchase
-- ----------------------------
DROP TABLE IF EXISTS `biz_purchase`;
CREATE TABLE `biz_purchase`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `title` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '标题',
  `money` decimal(11, 2) UNSIGNED NOT NULL COMMENT '金额',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '描述',
  `create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `del_flag` tinyint UNSIGNED NOT NULL DEFAULT 0 COMMENT '删除标记',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '报销' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of biz_purchase
-- ----------------------------

-- ----------------------------
-- Table structure for course
-- ----------------------------
DROP TABLE IF EXISTS `course`;
CREATE TABLE `course`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `teacher_id` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `course_id_fk`(`teacher_id`) USING BTREE,
  CONSTRAINT `course_id_fk` FOREIGN KEY (`teacher_id`) REFERENCES `teacher` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of course
-- ----------------------------

-- ----------------------------
-- Table structure for districts
-- ----------------------------
DROP TABLE IF EXISTS `districts`;
CREATE TABLE `districts`  (
  `id` int UNSIGNED NOT NULL COMMENT '编号',
  `pid` int NOT NULL DEFAULT 0 COMMENT '上级编号',
  `deep` tinyint(1) NOT NULL DEFAULT 0 COMMENT '层级',
  `name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '名称',
  `pinyin` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '拼音',
  `pinyin_shor` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '拼音缩写',
  `ext_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '扩展名',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `operator` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '操作人',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '地区' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of districts
-- ----------------------------
INSERT INTO `districts` VALUES (11, 0, 0, '北京', 'bei jing', 'bej', '北京市', '2018-12-19 14:26:58', '2018-12-19 15:02:37', 'admin');
INSERT INTO `districts` VALUES (12, 0, 0, '天津', 'tian jin', 'tij', '天津市', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (13, 0, 0, '河北', 'he bei', 'heb', '河北省', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (14, 0, 0, '山西', 'shan xi', 'shx', '山西省', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (15, 0, 0, '内蒙古', 'nei meng gu', 'nemg', '内蒙古自治区', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (21, 0, 0, '辽宁', 'liao ning', 'lin', '辽宁省', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (22, 0, 0, '吉林', 'ji lin', 'jil', '吉林省', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (23, 0, 0, '黑龙江', 'hei long jiang', 'helj', '黑龙江省', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (31, 0, 0, '上海', 'shang hai', 'shh', '上海市', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (32, 0, 0, '江苏', 'jiang su', 'jis', '江苏省', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (33, 0, 0, '浙江', 'zhe jiang', 'zhj', '浙江省', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (34, 0, 0, '安徽', 'an hui', 'anh', '安徽省', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (35, 0, 0, '福建', 'fu jian', 'fuj', '福建省', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (36, 0, 0, '江西', 'jiang xi', 'jix', '江西省', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (37, 0, 0, '山东', 'shan dong', 'shd', '山东省', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (41, 0, 0, '河南', 'he nan', 'hen', '河南省', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (42, 0, 0, '湖北', 'hu bei', 'hub', '湖北省', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (43, 0, 0, '湖南', 'hu nan', 'hun', '湖南省', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (44, 0, 0, '广东', 'guang dong', 'gud', '广东省', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (45, 0, 0, '广西', 'guang xi', 'gux', '广西壮族自治区', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (46, 0, 0, '海南', 'hai nan', 'han', '海南省', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (50, 0, 0, '重庆', 'chong qing', 'chq', '重庆市', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (51, 0, 0, '四川', 'si chuan', 'sic', '四川省', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (52, 0, 0, '贵州', 'gui zhou', 'guz', '贵州省', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (53, 0, 0, '云南', 'yun nan', 'yun', '云南省', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (54, 0, 0, '西藏', 'xi zang', 'xiz', '西藏自治区', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (61, 0, 0, '陕西', 'shan xi', 'shx', '陕西省', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (62, 0, 0, '甘肃', 'gan su', 'gas', '甘肃省', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (63, 0, 0, '青海', 'qing hai', 'qih', '青海省', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (64, 0, 0, '宁夏', 'ning xia', 'nix', '宁夏回族自治区', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (65, 0, 0, '新疆', 'xin jiang', 'xij', '新疆维吾尔自治区', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (90, 0, 0, '港澳台', '~0', '~0', '', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (91, 0, 0, '海外', '~1', '~1', '', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (1101, 11, 1, '北京', 'bei jing', 'bej', '市辖区', '2018-12-19 14:26:58', '2018-12-19 15:06:10', 'admin');
INSERT INTO `districts` VALUES (1201, 12, 1, '天津', 'tian jin', 'tij', '市辖区', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (1301, 13, 1, '石家庄', 'shi jia zhuang', 'shjz', '石家庄市', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (1302, 13, 1, '唐山', 'tang shan', 'tas', '唐山市', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (1303, 13, 1, '秦皇岛', 'qin huang dao', 'qihd', '秦皇岛市', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (1304, 13, 1, '邯郸', 'han dan', 'had', '邯郸市', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (1305, 13, 1, '邢台', 'xing tai', 'xit', '邢台市', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (1306, 13, 1, '保定', 'bao ding', 'bad', '保定市', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (1307, 13, 1, '张家口', 'zhang jia kou', 'zhjk', '张家口市', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (1308, 13, 1, '承德', 'cheng de', 'chd', '承德市', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (1309, 13, 1, '沧州', 'cang zhou', 'caz', '沧州市', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (1310, 13, 1, '廊坊', 'lang fang', 'laf', '廊坊市', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (1311, 13, 1, '衡水', 'heng shui', 'hes', '衡水市', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (1401, 14, 1, '太原', 'tai yuan', 'tay', '太原市', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (1402, 14, 1, '大同', 'da tong', 'dat', '大同市', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (1403, 14, 1, '阳泉', 'yang quan', 'yaq', '阳泉市', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (1404, 14, 1, '长治', 'chang zhi', 'chz', '长治市', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (1405, 14, 1, '晋城', 'jin cheng', 'jic', '晋城市', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (1406, 14, 1, '朔州', 'shuo zhou', 'shz', '朔州市', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (1407, 14, 1, '晋中', 'jin zhong', 'jiz', '晋中市', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (1408, 14, 1, '运城', 'yun cheng', 'yuc', '运城市', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (1409, 14, 1, '忻州', 'xin zhou', 'xiz', '忻州市', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (1410, 14, 1, '临汾', 'lin fen', 'lif', '临汾市', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (1411, 14, 1, '吕梁', 'lv liang', 'lvl', '吕梁市', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (1501, 15, 1, '呼和浩特', 'hu he hao te', 'huhh', '呼和浩特市', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (1502, 15, 1, '包头', 'bao tou', 'bat', '包头市', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (1503, 15, 1, '乌海', 'wu hai', 'wuh', '乌海市', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (1504, 15, 1, '赤峰', 'chi feng', 'chf', '赤峰市', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (1505, 15, 1, '通辽', 'tong liao', 'tol', '通辽市', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (1506, 15, 1, '鄂尔多斯', 'e er duo si', 'eed', '鄂尔多斯市', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (1507, 15, 1, '呼伦贝尔', 'hu lun bei er', 'hulb', '呼伦贝尔市', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (1508, 15, 1, '巴彦淖尔', 'ba yan nao er', 'bayn', '巴彦淖尔市', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (1509, 15, 1, '乌兰察布', 'wu lan cha bu', 'wulc', '乌兰察布市', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (1522, 15, 1, '兴安盟', 'xing an meng', 'xiam', '兴安盟', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (1525, 15, 1, '锡林郭勒盟', 'xi lin guo le meng', 'xilg', '锡林郭勒盟', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (1529, 15, 1, '阿拉善盟', 'a la shan meng', 'als', '阿拉善盟', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (2101, 21, 1, '沈阳', 'shen yang', 'shy', '沈阳市', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (2102, 21, 1, '大连', 'da lian', 'dal', '大连市', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (2103, 21, 1, '鞍山', 'an shan', 'ans', '鞍山市', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (2104, 21, 1, '抚顺', 'fu shun', 'fus', '抚顺市', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (2105, 21, 1, '本溪', 'ben xi', 'bex', '本溪市', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (2106, 21, 1, '丹东', 'dan dong', 'dad', '丹东市', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (2107, 21, 1, '锦州', 'jin zhou', 'jiz', '锦州市', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (2108, 21, 1, '营口', 'ying kou', 'yik', '营口市', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (2109, 21, 1, '阜新', 'fu xin', 'fux', '阜新市', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (2110, 21, 1, '辽阳', 'liao yang', 'liy', '辽阳市', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (2111, 21, 1, '盘锦', 'pan jin', 'paj', '盘锦市', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (2112, 21, 1, '铁岭', 'tie ling', 'til', '铁岭市', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (2113, 21, 1, '朝阳', 'chao yang', 'chy', '朝阳市', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (2114, 21, 1, '葫芦岛', 'hu lu dao', 'huld', '葫芦岛市', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (2201, 22, 1, '长春', 'chang chun', 'chc', '长春市', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (2202, 22, 1, '吉林', 'ji lin', 'jil', '吉林市', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (2203, 22, 1, '四平', 'si ping', 'sip', '四平市', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (2204, 22, 1, '辽源', 'liao yuan', 'liy', '辽源市', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (2205, 22, 1, '通化', 'tong hua', 'toh', '通化市', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (2206, 22, 1, '白山', 'bai shan', 'bas', '白山市', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (2207, 22, 1, '松原', 'song yuan', 'soy', '松原市', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (2208, 22, 1, '白城', 'bai cheng', 'bac', '白城市', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (2224, 22, 1, '延边朝鲜族自治州', 'yan bian chao xian zu zi zhi zhou', 'yabc', '延边朝鲜族自治州', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (2301, 23, 1, '哈尔滨', 'ha er bin', 'haeb', '哈尔滨市', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (2302, 23, 1, '齐齐哈尔', 'qi qi ha er', 'qiqh', '齐齐哈尔市', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (2303, 23, 1, '鸡西', 'ji xi', 'jix', '鸡西市', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (2304, 23, 1, '鹤岗', 'he gang', 'heg', '鹤岗市', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (2305, 23, 1, '双鸭山', 'shuang ya shan', 'shys', '双鸭山市', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (2306, 23, 1, '大庆', 'da qing', 'daq', '大庆市', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (2307, 23, 1, '伊春', 'yi chun', 'yic', '伊春市', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (2308, 23, 1, '佳木斯', 'jia mu si', 'jims', '佳木斯市', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (2309, 23, 1, '七台河', 'qi tai he', 'qith', '七台河市', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (2310, 23, 1, '牡丹江', 'mu dan jiang', 'mudj', '牡丹江市', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (2311, 23, 1, '黑河', 'hei he', 'heh', '黑河市', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (2312, 23, 1, '绥化', 'sui hua', 'suh', '绥化市', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (2327, 23, 1, '大兴安岭地区', 'da xing an ling di qu', 'daxa', '大兴安岭地区', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (3101, 31, 1, '上海', 'shang hai', 'shh', '市辖区', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (3201, 32, 1, '南京', 'nan jing', 'naj', '南京市', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (3202, 32, 1, '无锡', 'wu xi', 'wux', '无锡市', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (3203, 32, 1, '徐州', 'xu zhou', 'xuz', '徐州市', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (3204, 32, 1, '常州', 'chang zhou', 'chz', '常州市', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (3205, 32, 1, '苏州', 'su zhou', 'suz', '苏州市', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (3206, 32, 1, '南通', 'nan tong', 'nat', '南通市', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (3207, 32, 1, '连云港', 'lian yun gang', 'liyg', '连云港市', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (3208, 32, 1, '淮安', 'huai an', 'hua', '淮安市', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (3209, 32, 1, '盐城', 'yan cheng', 'yac', '盐城市', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (3210, 32, 1, '扬州', 'yang zhou', 'yaz', '扬州市', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (3211, 32, 1, '镇江', 'zhen jiang', 'zhj', '镇江市', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (3212, 32, 1, '泰州', 'tai zhou', 'taz', '泰州市', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (3213, 32, 1, '宿迁', 'su qian', 'suq', '宿迁市', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (3301, 33, 1, '杭州', 'hang zhou', 'haz', '杭州市', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (3302, 33, 1, '宁波', 'ning bo', 'nib', '宁波市', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (3303, 33, 1, '温州', 'wen zhou', 'wez', '温州市', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (3304, 33, 1, '嘉兴', 'jia xing', 'jix', '嘉兴市', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (3305, 33, 1, '湖州', 'hu zhou', 'huz', '湖州市', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (3306, 33, 1, '绍兴', 'shao xing', 'shx', '绍兴市', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (3307, 33, 1, '金华', 'jin hua', 'jih', '金华市', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (3308, 33, 1, '衢州', 'qu zhou', 'quz', '衢州市', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (3309, 33, 1, '舟山', 'zhou shan', 'zhs', '舟山市', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (3310, 33, 1, '台州', 'tai zhou', 'taz', '台州市', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (3311, 33, 1, '丽水', 'li shui', 'lis', '丽水市', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (3401, 34, 1, '合肥', 'he fei', 'hef', '合肥市', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (3402, 34, 1, '芜湖', 'wu hu', 'wuh', '芜湖市', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (3403, 34, 1, '蚌埠', 'beng bu', 'beb', '蚌埠市', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (3404, 34, 1, '淮南', 'huai nan', 'hun', '淮南市', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (3405, 34, 1, '马鞍山', 'ma an shan', 'maas', '马鞍山市', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (3406, 34, 1, '淮北', 'huai bei', 'hub', '淮北市', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (3407, 34, 1, '铜陵', 'tong ling', 'tol', '铜陵市', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (3408, 34, 1, '安庆', 'an qing', 'anq', '安庆市', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (3410, 34, 1, '黄山', 'huang shan', 'hus', '黄山市', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (3411, 34, 1, '滁州', 'chu zhou', 'chz', '滁州市', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (3412, 34, 1, '阜阳', 'fu yang', 'fuy', '阜阳市', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (3413, 34, 1, '宿州', 'su zhou', 'suz', '宿州市', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (3415, 34, 1, '六安', 'lu an', 'lua', '六安市', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (3416, 34, 1, '亳州', 'bo zhou', 'boz', '亳州市', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (3417, 34, 1, '池州', 'chi zhou', 'chz', '池州市', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (3418, 34, 1, '宣城', 'xuan cheng', 'xuc', '宣城市', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (3501, 35, 1, '福州', 'fu zhou', 'fuz', '福州市', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (3502, 35, 1, '厦门', 'xia men', 'xim', '厦门市', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (3503, 35, 1, '莆田', 'pu tian', 'put', '莆田市', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (3504, 35, 1, '三明', 'san ming', 'sam', '三明市', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (3505, 35, 1, '泉州', 'quan zhou', 'quz', '泉州市', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (3506, 35, 1, '漳州', 'zhang zhou', 'zhz', '漳州市', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (3507, 35, 1, '南平', 'nan ping', 'nap', '南平市', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (3508, 35, 1, '龙岩', 'long yan', 'loy', '龙岩市', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (3509, 35, 1, '宁德', 'ning de', 'nid', '宁德市', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (3601, 36, 1, '南昌', 'nan chang', 'nac', '南昌市', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (3602, 36, 1, '景德镇', 'jing de zhen', 'jidz', '景德镇市', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (3603, 36, 1, '萍乡', 'ping xiang', 'pix', '萍乡市', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (3604, 36, 1, '九江', 'jiu jiang', 'jij', '九江市', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (3605, 36, 1, '新余', 'xin yu', 'xiy', '新余市', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (3606, 36, 1, '鹰潭', 'ying tan', 'yit', '鹰潭市', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (3607, 36, 1, '赣州', 'gan zhou', 'gaz', '赣州市', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (3608, 36, 1, '吉安', 'ji an', 'jia', '吉安市', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (3609, 36, 1, '宜春', 'yi chun', 'yic', '宜春市', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (3610, 36, 1, '抚州', 'fu zhou', 'fuz', '抚州市', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (3611, 36, 1, '上饶', 'shang rao', 'shr', '上饶市', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (3701, 37, 1, '济南', 'ji nan', 'jin', '济南市', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (3702, 37, 1, '青岛', 'qing dao', 'qid', '青岛市', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (3703, 37, 1, '淄博', 'zi bo', 'zib', '淄博市', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (3704, 37, 1, '枣庄', 'zao zhuang', 'zaz', '枣庄市', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (3705, 37, 1, '东营', 'dong ying', 'doy', '东营市', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (3706, 37, 1, '烟台', 'yan tai', 'yat', '烟台市', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (3707, 37, 1, '潍坊', 'wei fang', 'wef', '潍坊市', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (3708, 37, 1, '济宁', 'ji ning', 'jin', '济宁市', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (3709, 37, 1, '泰安', 'tai an', 'taa', '泰安市', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (3710, 37, 1, '威海', 'wei hai', 'weh', '威海市', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (3711, 37, 1, '日照', 'ri zhao', 'riz', '日照市', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (3712, 37, 1, '莱芜', 'lai wu', 'law', '莱芜市', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (3713, 37, 1, '临沂', 'lin yi', 'liy', '临沂市', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (3714, 37, 1, '德州', 'de zhou', 'dez', '德州市', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (3715, 37, 1, '聊城', 'liao cheng', 'lic', '聊城市', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (3716, 37, 1, '滨州', 'bin zhou', 'biz', '滨州市', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (3717, 37, 1, '菏泽', 'he ze', 'hez', '菏泽市', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (4101, 41, 1, '郑州', 'zheng zhou', 'zhz', '郑州市', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (4102, 41, 1, '开封', 'kai feng', 'kaf', '开封市', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (4103, 41, 1, '洛阳', 'luo yang', 'luy', '洛阳市', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (4104, 41, 1, '平顶山', 'ping ding shan', 'pids', '平顶山市', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (4105, 41, 1, '安阳', 'an yang', 'any', '安阳市', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (4106, 41, 1, '鹤壁', 'he bi', 'heb', '鹤壁市', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (4107, 41, 1, '新乡', 'xin xiang', 'xix', '新乡市', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (4108, 41, 1, '焦作', 'jiao zuo', 'jiz', '焦作市', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (4109, 41, 1, '濮阳', 'pu yang', 'puy', '濮阳市', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (4110, 41, 1, '许昌', 'xu chang', 'xuc', '许昌市', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (4111, 41, 1, '漯河', 'luo he', 'luh', '漯河市', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (4112, 41, 1, '三门峡', 'san men xia', 'samx', '三门峡市', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (4113, 41, 1, '南阳', 'nan yang', 'nay', '南阳市', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (4114, 41, 1, '商丘', 'shang qiu', 'shq', '商丘市', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (4115, 41, 1, '信阳', 'xin yang', 'xiy', '信阳市', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (4116, 41, 1, '周口', 'zhou kou', 'zhk', '周口市', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (4117, 41, 1, '驻马店', 'zhu ma dian', 'zhmd', '驻马店市', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (4190, 41, 1, '直辖市', 'zhi xia shi', 'zhxs', '省直辖县级行政区划', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (4201, 42, 1, '武汉', 'wu han', 'wuh', '武汉市', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (4202, 42, 1, '黄石', 'huang shi', 'hus', '黄石市', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (4203, 42, 1, '十堰', 'shi yan', 'shy', '十堰市', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (4205, 42, 1, '宜昌', 'yi chang', 'yic', '宜昌市', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (4206, 42, 1, '襄阳', 'xiang yang', 'xiy', '襄阳市', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (4207, 42, 1, '鄂州', 'e zhou', 'ez', '鄂州市', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (4208, 42, 1, '荆门', 'jing men', 'jim', '荆门市', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (4209, 42, 1, '孝感', 'xiao gan', 'xig', '孝感市', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (4210, 42, 1, '荆州', 'jing zhou', 'jiz', '荆州市', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (4211, 42, 1, '黄冈', 'huang gang', 'hug', '黄冈市', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (4212, 42, 1, '咸宁', 'xian ning', 'xin', '咸宁市', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (4213, 42, 1, '随州', 'sui zhou', 'suz', '随州市', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (4228, 42, 1, '恩施土家族苗族自治州', 'en shi tu jia zu miao zu zi zhi zhou', 'enst', '恩施土家族苗族自治州', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (4290, 42, 1, '直辖市', 'zhi xia shi', 'zhxs', '省直辖县级行政区划', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (4301, 43, 1, '长沙', 'chang sha', 'chs', '长沙市', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (4302, 43, 1, '株洲', 'zhu zhou', 'zhz', '株洲市', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (4303, 43, 1, '湘潭', 'xiang tan', 'xit', '湘潭市', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (4304, 43, 1, '衡阳', 'heng yang', 'hey', '衡阳市', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (4305, 43, 1, '邵阳', 'shao yang', 'shy', '邵阳市', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (4306, 43, 1, '岳阳', 'yue yang', 'yuy', '岳阳市', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (4307, 43, 1, '常德', 'chang de', 'chd', '常德市', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (4308, 43, 1, '张家界', 'zhang jia jie', 'zhjj', '张家界市', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (4309, 43, 1, '益阳', 'yi yang', 'yiy', '益阳市', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (4310, 43, 1, '郴州', 'chen zhou', 'chz', '郴州市', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (4311, 43, 1, '永州', 'yong zhou', 'yoz', '永州市', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (4312, 43, 1, '怀化', 'huai hua', 'huh', '怀化市', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (4313, 43, 1, '娄底', 'lou di', 'lod', '娄底市', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (4331, 43, 1, '湘西土家族苗族自治州', 'xiang xi tu jia zu miao zu zi zhi zhou', 'xixt', '湘西土家族苗族自治州', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (4401, 44, 1, '广州', 'guang zhou', 'guz', '广州市', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (4402, 44, 1, '韶关', 'shao guan', 'shg', '韶关市', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (4403, 44, 1, '深圳', 'shen zhen', 'shz', '深圳市', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (4404, 44, 1, '珠海', 'zhu hai', 'zhh', '珠海市', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (4405, 44, 1, '汕头', 'shan tou', 'sht', '汕头市', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (4406, 44, 1, '佛山', 'fo shan', 'fos', '佛山市', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (4407, 44, 1, '江门', 'jiang men', 'jim', '江门市', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (4408, 44, 1, '湛江', 'zhan jiang', 'zhj', '湛江市', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (4409, 44, 1, '茂名', 'mao ming', 'mam', '茂名市', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (4412, 44, 1, '肇庆', 'zhao qing', 'zhq', '肇庆市', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (4413, 44, 1, '惠州', 'hui zhou', 'huz', '惠州市', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (4414, 44, 1, '梅州', 'mei zhou', 'mez', '梅州市', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (4415, 44, 1, '汕尾', 'shan wei', 'shw', '汕尾市', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (4416, 44, 1, '河源', 'he yuan', 'hey', '河源市', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (4417, 44, 1, '阳江', 'yang jiang', 'yaj', '阳江市', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (4418, 44, 1, '清远', 'qing yuan', 'qiy', '清远市', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (4419, 44, 1, '东莞', 'dong guan', 'dog', '东莞市', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (4420, 44, 1, '中山', 'zhong shan', 'zhs', '中山市', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (4451, 44, 1, '潮州', 'chao zhou', 'chz', '潮州市', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (4452, 44, 1, '揭阳', 'jie yang', 'jiy', '揭阳市', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (4453, 44, 1, '云浮', 'yun fu', 'yuf', '云浮市', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (4501, 45, 1, '南宁', 'nan ning', 'nan', '南宁市', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (4502, 45, 1, '柳州', 'liu zhou', 'liz', '柳州市', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (4503, 45, 1, '桂林', 'gui lin', 'gul', '桂林市', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (4504, 45, 1, '梧州', 'wu zhou', 'wuz', '梧州市', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (4505, 45, 1, '北海', 'bei hai', 'beh', '北海市', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (4506, 45, 1, '防城港', 'fang cheng gang', 'facg', '防城港市', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (4507, 45, 1, '钦州', 'qin zhou', 'qiz', '钦州市', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (4508, 45, 1, '贵港', 'gui gang', 'gug', '贵港市', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (4509, 45, 1, '玉林', 'yu lin', 'yul', '玉林市', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (4510, 45, 1, '百色', 'bai se', 'bas', '百色市', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (4511, 45, 1, '贺州', 'he zhou', 'hez', '贺州市', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (4512, 45, 1, '河池', 'he chi', 'hec', '河池市', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (4513, 45, 1, '来宾', 'lai bin', 'lab', '来宾市', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (4514, 45, 1, '崇左', 'chong zuo', 'chz', '崇左市', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (4601, 46, 1, '海口', 'hai kou', 'hak', '海口市', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (4602, 46, 1, '三亚', 'san ya', 'say', '三亚市', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (4603, 46, 1, '三沙', 'san sha', 'sas', '三沙市', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (4604, 46, 1, '儋州', 'dan zhou', 'daz', '儋州市', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (4690, 46, 1, '直辖市', 'zhi xia shi', 'zhxs', '省直辖县级行政区划', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (5001, 50, 1, '重庆', 'chong qing', 'chq', '市辖区', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (5002, 50, 1, '县', 'xian', 'xi', '县', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (5101, 51, 1, '成都', 'cheng du', 'chd', '成都市', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (5103, 51, 1, '自贡', 'zi gong', 'zig', '自贡市', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (5104, 51, 1, '攀枝花', 'pan zhi hua', 'pazh', '攀枝花市', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (5105, 51, 1, '泸州', 'lu zhou', 'luz', '泸州市', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (5106, 51, 1, '德阳', 'de yang', 'dey', '德阳市', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (5107, 51, 1, '绵阳', 'mian yang', 'miy', '绵阳市', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (5108, 51, 1, '广元', 'guang yuan', 'guy', '广元市', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (5109, 51, 1, '遂宁', 'sui ning', 'sun', '遂宁市', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (5110, 51, 1, '内江', 'nei jiang', 'nej', '内江市', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (5111, 51, 1, '乐山', 'le shan', 'les', '乐山市', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (5113, 51, 1, '南充', 'nan chong', 'nac', '南充市', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (5114, 51, 1, '眉山', 'mei shan', 'mes', '眉山市', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (5115, 51, 1, '宜宾', 'yi bin', 'yib', '宜宾市', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (5116, 51, 1, '广安', 'guang an', 'gua', '广安市', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (5117, 51, 1, '达州', 'da zhou', 'daz', '达州市', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (5118, 51, 1, '雅安', 'ya an', 'yaa', '雅安市', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (5119, 51, 1, '巴中', 'ba zhong', 'baz', '巴中市', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (5120, 51, 1, '资阳', 'zi yang', 'ziy', '资阳市', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (5132, 51, 1, '阿坝藏族羌族自治州', 'a ba zang zu qiang zu zi zhi zhou', 'abz', '阿坝藏族羌族自治州', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (5133, 51, 1, '甘孜藏族自治州', 'gan zi zang zu zi zhi zhou', 'gazz', '甘孜藏族自治州', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (5134, 51, 1, '凉山彝族自治州', 'liang shan yi zu zi zhi zhou', 'lisy', '凉山彝族自治州', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (5201, 52, 1, '贵阳', 'gui yang', 'guy', '贵阳市', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (5202, 52, 1, '六盘水', 'liu pan shui', 'lips', '六盘水市', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (5203, 52, 1, '遵义', 'zun yi', 'zuy', '遵义市', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (5204, 52, 1, '安顺', 'an shun', 'ans', '安顺市', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (5205, 52, 1, '毕节', 'bi jie', 'bij', '毕节市', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (5206, 52, 1, '铜仁', 'tong ren', 'tor', '铜仁市', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (5223, 52, 1, '黔西南布依族苗族自治州', 'qian xi nan bu yi zu miao zu zi zhi zhou', 'qixn', '黔西南布依族苗族自治州', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (5226, 52, 1, '黔东南苗族侗族自治州', 'qian dong nan miao zu dong zu zi zhi zhou', 'qidn', '黔东南苗族侗族自治州', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (5227, 52, 1, '黔南布依族苗族自治州', 'qian nan bu yi zu miao zu zi zhi zhou', 'qinb', '黔南布依族苗族自治州', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (5301, 53, 1, '昆明', 'kun ming', 'kum', '昆明市', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (5303, 53, 1, '曲靖', 'qu jing', 'quj', '曲靖市', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (5304, 53, 1, '玉溪', 'yu xi', 'yux', '玉溪市', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (5305, 53, 1, '保山', 'bao shan', 'bas', '保山市', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (5306, 53, 1, '昭通', 'zhao tong', 'zht', '昭通市', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (5307, 53, 1, '丽江', 'li jiang', 'lij', '丽江市', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (5308, 53, 1, '普洱', 'pu er', 'pue', '普洱市', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (5309, 53, 1, '临沧', 'lin cang', 'lic', '临沧市', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (5323, 53, 1, '楚雄彝族自治州', 'chu xiong yi zu zi zhi zhou', 'chxy', '楚雄彝族自治州', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (5325, 53, 1, '红河哈尼族彝族自治州', 'hong he ha ni zu yi zu zi zhi zhou', 'hohh', '红河哈尼族彝族自治州', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (5326, 53, 1, '文山壮族苗族自治州', 'wen shan zhuang zu miao zu zi zhi zhou', 'wesz', '文山壮族苗族自治州', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (5328, 53, 1, '西双版纳傣族自治州', 'xi shuang ban na dai zu zi zhi zhou', 'xisb', '西双版纳傣族自治州', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (5329, 53, 1, '大理白族自治州', 'da li bai zu zi zhi zhou', 'dalb', '大理白族自治州', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (5331, 53, 1, '德宏傣族景颇族自治州', 'de hong dai zu jing po zu zi zhi zhou', 'dehd', '德宏傣族景颇族自治州', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (5333, 53, 1, '怒江傈僳族自治州', 'nu jiang li su zu zi zhi zhou', 'nujl', '怒江傈僳族自治州', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (5334, 53, 1, '迪庆藏族自治州', 'di qing zang zu zi zhi zhou', 'diqz', '迪庆藏族自治州', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (5401, 54, 1, '拉萨', 'la sa', 'las', '拉萨市', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (5402, 54, 1, '日喀则', 'ri ka ze', 'rikz', '日喀则市', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (5403, 54, 1, '昌都', 'chang du', 'chd', '昌都市', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (5404, 54, 1, '林芝', 'lin zhi', 'liz', '林芝市', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (5405, 54, 1, '山南', 'shan nan', 'shn', '山南市', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (5424, 54, 1, '那曲地区', 'na qu di qu', 'naqd', '那曲地区', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (5425, 54, 1, '阿里地区', 'a li di qu', 'ald', '阿里地区', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (6101, 61, 1, '西安', 'xi an', 'xia', '西安市', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (6102, 61, 1, '铜川', 'tong chuan', 'toc', '铜川市', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (6103, 61, 1, '宝鸡', 'bao ji', 'baj', '宝鸡市', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (6104, 61, 1, '咸阳', 'xian yang', 'xiy', '咸阳市', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (6105, 61, 1, '渭南', 'wei nan', 'wen', '渭南市', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (6106, 61, 1, '延安', 'yan an', 'yaa', '延安市', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (6107, 61, 1, '汉中', 'han zhong', 'haz', '汉中市', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (6108, 61, 1, '榆林', 'yu lin', 'yul', '榆林市', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (6109, 61, 1, '安康', 'an kang', 'ank', '安康市', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (6110, 61, 1, '商洛', 'shang luo', 'shl', '商洛市', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (6201, 62, 1, '兰州', 'lan zhou', 'laz', '兰州市', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (6202, 62, 1, '嘉峪关', 'jia yu guan', 'jiyg', '嘉峪关市', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (6203, 62, 1, '金昌', 'jin chang', 'jic', '金昌市', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (6204, 62, 1, '白银', 'bai yin', 'bay', '白银市', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (6205, 62, 1, '天水', 'tian shui', 'tis', '天水市', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (6206, 62, 1, '武威', 'wu wei', 'wuw', '武威市', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (6207, 62, 1, '张掖', 'zhang ye', 'zhy', '张掖市', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (6208, 62, 1, '平凉', 'ping liang', 'pil', '平凉市', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (6209, 62, 1, '酒泉', 'jiu quan', 'jiq', '酒泉市', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (6210, 62, 1, '庆阳', 'qing yang', 'qiy', '庆阳市', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (6211, 62, 1, '定西', 'ding xi', 'dix', '定西市', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (6212, 62, 1, '陇南', 'long nan', 'lon', '陇南市', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (6229, 62, 1, '临夏回族自治州', 'lin xia hui zu zi zhi zhou', 'lixh', '临夏回族自治州', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (6230, 62, 1, '甘南藏族自治州', 'gan nan zang zu zi zhi zhou', 'ganz', '甘南藏族自治州', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (6301, 63, 1, '西宁', 'xi ning', 'xin', '西宁市', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (6302, 63, 1, '海东', 'hai dong', 'had', '海东市', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (6322, 63, 1, '海北藏族自治州', 'hai bei zang zu zi zhi zhou', 'habz', '海北藏族自治州', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (6323, 63, 1, '黄南藏族自治州', 'huang nan zang zu zi zhi zhou', 'hunz', '黄南藏族自治州', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (6325, 63, 1, '海南藏族自治州', 'hai nan zang zu zi zhi zhou', 'hanz', '海南藏族自治州', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (6326, 63, 1, '果洛藏族自治州', 'guo luo zang zu zi zhi zhou', 'gulz', '果洛藏族自治州', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (6327, 63, 1, '玉树藏族自治州', 'yu shu zang zu zi zhi zhou', 'yusz', '玉树藏族自治州', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (6328, 63, 1, '海西蒙古族藏族自治州', 'hai xi meng gu zu zang zu zi zhi zhou', 'haxm', '海西蒙古族藏族自治州', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (6401, 64, 1, '银川', 'yin chuan', 'yic', '银川市', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (6402, 64, 1, '石嘴山', 'shi zui shan', 'shzs', '石嘴山市', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (6403, 64, 1, '吴忠', 'wu zhong', 'wuz', '吴忠市', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (6404, 64, 1, '固原', 'gu yuan', 'guy', '固原市', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (6405, 64, 1, '中卫', 'zhong wei', 'zhw', '中卫市', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (6501, 65, 1, '乌鲁木齐', 'wu lu mu qi', 'wulm', '乌鲁木齐市', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (6502, 65, 1, '克拉玛依', 'ke la ma yi', 'kelm', '克拉玛依市', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (6504, 65, 1, '吐鲁番', 'tu lu fan', 'tulf', '吐鲁番市', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (6505, 65, 1, '哈密', 'ha mi', 'ham', '哈密市', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (6523, 65, 1, '昌吉回族自治州', 'chang ji hui zu zi zhi zhou', 'chjh', '昌吉回族自治州', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (6527, 65, 1, '博尔塔拉蒙古自治州', 'bo er ta la meng gu zi zhi zhou', 'boet', '博尔塔拉蒙古自治州', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (6528, 65, 1, '巴音郭楞蒙古自治州', 'ba yin guo leng meng gu zi zhi zhou', 'bayg', '巴音郭楞蒙古自治州', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (6529, 65, 1, '阿克苏地区', 'a ke su di qu', 'aks', '阿克苏地区', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (6530, 65, 1, '克孜勒苏柯尔克孜自治州', 'ke zi le su ke er ke zi zi zhi zhou', 'kezl', '克孜勒苏柯尔克孜自治州', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (6531, 65, 1, '喀什地区', 'ka shi di qu', 'kasd', '喀什地区', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (6532, 65, 1, '和田地区', 'he tian di qu', 'hetd', '和田地区', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (6540, 65, 1, '伊犁哈萨克自治州', 'yi li ha sa ke zi zhi zhou', 'yilh', '伊犁哈萨克自治州', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (6542, 65, 1, '塔城地区', 'ta cheng di qu', 'tacd', '塔城地区', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (6543, 65, 1, '阿勒泰地区', 'a le tai di qu', 'alt', '阿勒泰地区', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (6590, 65, 1, '直辖市', 'zhi xia shi', 'zhxs', '自治区直辖县级行政区划', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (9001, 90, 1, '香港', 'xiang gang', 'xig', '', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (9002, 90, 1, '澳门', 'ao men', 'aom', '', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (9003, 90, 1, '台湾', 'tai wan', 'taw', '', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (9101, 91, 1, '海外', 'hai wai', 'haw', '', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (110101, 1101, 2, '东城', 'dong cheng', 'doc', '东城区', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (110102, 1101, 2, '西城', 'xi cheng', 'xic', '西城区', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (110105, 1101, 2, '朝阳', 'chao yang', 'chy', '朝阳区', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (110106, 1101, 2, '丰台', 'feng tai', 'fet', '丰台区', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (110107, 1101, 2, '石景山', 'shi jing shan', 'shjs', '石景山区', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (110108, 1101, 2, '海淀', 'hai dian', 'had', '海淀区', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (110109, 1101, 2, '门头沟', 'men tou gou', 'metg', '门头沟区', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (110111, 1101, 2, '房山', 'fang shan', 'fas', '房山区', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (110112, 1101, 2, '通州', 'tong zhou', 'toz', '通州区', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (110113, 1101, 2, '顺义', 'shun yi', 'shy', '顺义区', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (110114, 1101, 2, '昌平', 'chang ping', 'chp', '昌平区', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (110115, 1101, 2, '大兴', 'da xing', 'dax', '大兴区', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (110116, 1101, 2, '怀柔', 'huai rou', 'hur', '怀柔区', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (110117, 1101, 2, '平谷', 'ping gu', 'pig', '平谷区', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (110118, 1101, 2, '密云', 'mi yun', 'miy', '密云区', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (110119, 1101, 2, '延庆', 'yan qing', 'yaq', '延庆区', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (120101, 1201, 2, '和平', 'he ping', 'hep', '和平区', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (120102, 1201, 2, '河东', 'he dong', 'hed', '河东区', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (120103, 1201, 2, '河西', 'he xi', 'hex', '河西区', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (120104, 1201, 2, '南开', 'nan kai', 'nak', '南开区', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (120105, 1201, 2, '河北', 'he bei', 'heb', '河北区', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (120106, 1201, 2, '红桥', 'hong qiao', 'hoq', '红桥区', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (120110, 1201, 2, '东丽', 'dong li', 'dol', '东丽区', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (120111, 1201, 2, '西青', 'xi qing', 'xiq', '西青区', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (120112, 1201, 2, '津南', 'jin nan', 'jin', '津南区', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (120113, 1201, 2, '北辰', 'bei chen', 'bec', '北辰区', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (120114, 1201, 2, '武清', 'wu qing', 'wuq', '武清区', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (120115, 1201, 2, '宝坻', 'bao di', 'bad', '宝坻区', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (120116, 1201, 2, '滨海新区', 'bin hai xin qu', 'bihx', '滨海新区', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (120117, 1201, 2, '宁河', 'ning he', 'nih', '宁河区', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (120118, 1201, 2, '静海', 'jing hai', 'jih', '静海区', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (120119, 1201, 2, '蓟州', 'ji zhou', 'jiz', '蓟州区', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (130102, 1301, 2, '长安', 'chang an', 'cha', '长安区', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (130104, 1301, 2, '桥西', 'qiao xi', 'qix', '桥西区', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (130105, 1301, 2, '新华', 'xin hua', 'xih', '新华区', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (130107, 1301, 2, '井陉矿区', 'jing xing kuang qu', 'jixk', '井陉矿区', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (130108, 1301, 2, '裕华', 'yu hua', 'yuh', '裕华区', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (130109, 1301, 2, '藁城', 'gao cheng', 'gac', '藁城区', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (130110, 1301, 2, '鹿泉', 'lu quan', 'luq', '鹿泉区', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (130111, 1301, 2, '栾城', 'luan cheng', 'luc', '栾城区', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (130121, 1301, 2, '井陉', 'jing xing', 'jix', '井陉县', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (130123, 1301, 2, '正定', 'zheng ding', 'zhd', '正定县', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (130125, 1301, 2, '行唐', 'xing tang', 'xit', '行唐县', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (130126, 1301, 2, '灵寿', 'ling shou', 'lis', '灵寿县', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (130127, 1301, 2, '高邑', 'gao yi', 'gay', '高邑县', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (130128, 1301, 2, '深泽', 'shen ze', 'shz', '深泽县', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (130129, 1301, 2, '赞皇', 'zan huang', 'zah', '赞皇县', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (130130, 1301, 2, '无极', 'wu ji', 'wuj', '无极县', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (130131, 1301, 2, '平山', 'ping shan', 'pis', '平山县', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (130132, 1301, 2, '元氏', 'yuan shi', 'yus', '元氏县', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (130133, 1301, 2, '赵县', 'zhao xian', 'zhx', '赵县', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (130171, 1301, 2, '石家庄高新技术产业开发区', 'shi jia zhuang gao xin ji shu chan ye kai fa qu', 'shjz', '石家庄高新技术产业开发区', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (130172, 1301, 2, '石家庄循环化工园', 'shi jia zhuang xun huan hua gong yuan', 'shjz', '石家庄循环化工园区', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (130181, 1301, 2, '辛集', 'xin ji', 'xij', '辛集市', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (130183, 1301, 2, '晋州', 'jin zhou', 'jiz', '晋州市', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (130184, 1301, 2, '新乐', 'xin le', 'xil', '新乐市', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (130202, 1302, 2, '路南', 'lu nan', 'lun', '路南区', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (130203, 1302, 2, '路北', 'lu bei', 'lub', '路北区', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (130204, 1302, 2, '古冶', 'gu ye', 'guy', '古冶区', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (130205, 1302, 2, '开平', 'kai ping', 'kap', '开平区', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (130207, 1302, 2, '丰南', 'feng nan', 'fen', '丰南区', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (130208, 1302, 2, '丰润', 'feng run', 'fer', '丰润区', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (130209, 1302, 2, '曹妃甸', 'cao fei dian', 'cafd', '曹妃甸区', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (130223, 1302, 2, '滦县', 'luan xian', 'lux', '滦县', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (130224, 1302, 2, '滦南', 'luan nan', 'lun', '滦南县', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (130225, 1302, 2, '乐亭', 'le ting', 'let', '乐亭县', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (130227, 1302, 2, '迁西', 'qian xi', 'qix', '迁西县', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (130229, 1302, 2, '玉田', 'yu tian', 'yut', '玉田县', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (130271, 1302, 2, '唐山市芦台经济技术开发区', 'tang shan shi lu tai jing ji ji shu kai fa qu', 'tass', '唐山市芦台经济技术开发区', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (130272, 1302, 2, '唐山市汉沽管理区', 'tang shan shi han gu guan li qu', 'tass', '唐山市汉沽管理区', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (130273, 1302, 2, '唐山高新技术产业开发区', 'tang shan gao xin ji shu chan ye kai fa qu', 'tasg', '唐山高新技术产业开发区', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (130274, 1302, 2, '河北唐山海港经济开发区', 'he bei tang shan hai gang jing ji kai fa qu', 'hebt', '河北唐山海港经济开发区', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (130281, 1302, 2, '遵化', 'zun hua', 'zuh', '遵化市', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (130283, 1302, 2, '迁安', 'qian an', 'qia', '迁安市', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (130302, 1303, 2, '海港', 'hai gang', 'hag', '海港区', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (130303, 1303, 2, '山海关', 'shan hai guan', 'shhg', '山海关区', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (130304, 1303, 2, '北戴河', 'bei dai he', 'bedh', '北戴河区', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (130306, 1303, 2, '抚宁', 'fu ning', 'fun', '抚宁区', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (130321, 1303, 2, '青龙满族自治县', 'qing long man zu zi zhi xian', 'qilm', '青龙满族自治县', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (130322, 1303, 2, '昌黎', 'chang li', 'chl', '昌黎县', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (130324, 1303, 2, '卢龙', 'lu long', 'lul', '卢龙县', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (130371, 1303, 2, '秦皇岛市经济技术开发区', 'qin huang dao shi jing ji ji shu kai fa qu', 'qihd', '秦皇岛市经济技术开发区', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (130372, 1303, 2, '北戴河新区', 'bei dai he xin qu', 'bedh', '北戴河新区', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (130402, 1304, 2, '邯山', 'han shan', 'has', '邯山区', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (130403, 1304, 2, '丛台', 'cong tai', 'cot', '丛台区', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (130404, 1304, 2, '复兴', 'fu xing', 'fux', '复兴区', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (130406, 1304, 2, '峰峰矿区', 'feng feng kuang qu', 'fefk', '峰峰矿区', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (130407, 1304, 2, '肥乡', 'fei xiang', 'fex', '肥乡区', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (130408, 1304, 2, '永年', 'yong nian', 'yon', '永年区', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (130423, 1304, 2, '临漳', 'lin zhang', 'liz', '临漳县', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (130424, 1304, 2, '成安', 'cheng an', 'cha', '成安县', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (130425, 1304, 2, '大名', 'da ming', 'dam', '大名县', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (130426, 1304, 2, '涉县', 'she xian', 'shx', '涉县', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (130427, 1304, 2, '磁县', 'ci xian', 'cix', '磁县', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (130430, 1304, 2, '邱县', 'qiu xian', 'qix', '邱县', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (130431, 1304, 2, '鸡泽', 'ji ze', 'jiz', '鸡泽县', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (130432, 1304, 2, '广平', 'guang ping', 'gup', '广平县', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (130433, 1304, 2, '馆陶', 'guan tao', 'gut', '馆陶县', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (130434, 1304, 2, '魏县', 'wei xian', 'wex', '魏县', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (130435, 1304, 2, '曲周', 'qu zhou', 'quz', '曲周县', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (130471, 1304, 2, '邯郸经济技术开发区', 'han dan jing ji ji shu kai fa qu', 'hadj', '邯郸经济技术开发区', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (130473, 1304, 2, '邯郸冀南新区', 'han dan ji nan xin qu', 'hadj', '邯郸冀南新区', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (130481, 1304, 2, '武安', 'wu an', 'wua', '武安市', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (130502, 1305, 2, '桥东', 'qiao dong', 'qid', '桥东区', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (130503, 1305, 2, '桥西', 'qiao xi', 'qix', '桥西区', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (130521, 1305, 2, '邢台', 'xing tai', 'xit', '邢台县', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (130522, 1305, 2, '临城', 'lin cheng', 'lic', '临城县', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (130523, 1305, 2, '内丘', 'nei qiu', 'neq', '内丘县', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (130524, 1305, 2, '柏乡', 'bai xiang', 'bax', '柏乡县', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (130525, 1305, 2, '隆尧', 'long yao', 'loy', '隆尧县', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (130526, 1305, 2, '任县', 'ren xian', 'rex', '任县', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (130527, 1305, 2, '南和', 'nan he', 'nah', '南和县', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (130528, 1305, 2, '宁晋', 'ning jin', 'nij', '宁晋县', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (130529, 1305, 2, '巨鹿', 'ju lu', 'jul', '巨鹿县', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (130530, 1305, 2, '新河', 'xin he', 'xih', '新河县', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (130531, 1305, 2, '广宗', 'guang zong', 'guz', '广宗县', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (130532, 1305, 2, '平乡', 'ping xiang', 'pix', '平乡县', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (130533, 1305, 2, '威县', 'wei xian', 'wex', '威县', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (130534, 1305, 2, '清河', 'qing he', 'qih', '清河县', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (130535, 1305, 2, '临西', 'lin xi', 'lix', '临西县', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (130571, 1305, 2, '河北邢台经济开发区', 'he bei xing tai jing ji kai fa qu', 'hebx', '河北邢台经济开发区', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (130581, 1305, 2, '南宫', 'nan gong', 'nag', '南宫市', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (130582, 1305, 2, '沙河', 'sha he', 'shh', '沙河市', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (130602, 1306, 2, '竞秀', 'jing xiu', 'jix', '竞秀区', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (130606, 1306, 2, '莲池', 'lian chi', 'lic', '莲池区', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (130607, 1306, 2, '满城', 'man cheng', 'mac', '满城区', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (130608, 1306, 2, '清苑', 'qing yuan', 'qiy', '清苑区', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (130609, 1306, 2, '徐水', 'xu shui', 'xus', '徐水区', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (130623, 1306, 2, '涞水', 'lai shui', 'las', '涞水县', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (130624, 1306, 2, '阜平', 'fu ping', 'fup', '阜平县', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (130626, 1306, 2, '定兴', 'ding xing', 'dix', '定兴县', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (130627, 1306, 2, '唐县', 'tang xian', 'tax', '唐县', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (130628, 1306, 2, '高阳', 'gao yang', 'gay', '高阳县', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (130629, 1306, 2, '容城', 'rong cheng', 'roc', '容城县', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (130630, 1306, 2, '涞源', 'lai yuan', 'lay', '涞源县', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (130631, 1306, 2, '望都', 'wang du', 'wad', '望都县', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (130632, 1306, 2, '安新', 'an xin', 'anx', '安新县', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (130633, 1306, 2, '易县', 'yi xian', 'yix', '易县', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (130634, 1306, 2, '曲阳', 'qu yang', 'quy', '曲阳县', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (130635, 1306, 2, '蠡县', 'li xian', 'lix', '蠡县', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (130636, 1306, 2, '顺平', 'shun ping', 'shp', '顺平县', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (130637, 1306, 2, '博野', 'bo ye', 'boy', '博野县', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (130638, 1306, 2, '雄县', 'xiong xian', 'xix', '雄县', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (130671, 1306, 2, '保定高新技术产业开发区', 'bao ding gao xin ji shu chan ye kai fa qu', 'badg', '保定高新技术产业开发区', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (130672, 1306, 2, '保定白沟新城', 'bao ding bai gou xin cheng', 'badb', '保定白沟新城', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (130681, 1306, 2, '涿州', 'zhuo zhou', 'zhz', '涿州市', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (130682, 1306, 2, '定州', 'ding zhou', 'diz', '定州市', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (130683, 1306, 2, '安国', 'an guo', 'ang', '安国市', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (130684, 1306, 2, '高碑店', 'gao bei dian', 'gabd', '高碑店市', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (130702, 1307, 2, '桥东', 'qiao dong', 'qid', '桥东区', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (130703, 1307, 2, '桥西', 'qiao xi', 'qix', '桥西区', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (130705, 1307, 2, '宣化', 'xuan hua', 'xuh', '宣化区', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (130706, 1307, 2, '下花园', 'xia hua yuan', 'xihy', '下花园区', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (130708, 1307, 2, '万全', 'wan quan', 'waq', '万全区', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (130709, 1307, 2, '崇礼', 'chong li', 'chl', '崇礼区', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (130722, 1307, 2, '张北', 'zhang bei', 'zhb', '张北县', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (130723, 1307, 2, '康保', 'kang bao', 'kab', '康保县', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (130724, 1307, 2, '沽源', 'gu yuan', 'guy', '沽源县', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (130725, 1307, 2, '尚义', 'shang yi', 'shy', '尚义县', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (130726, 1307, 2, '蔚县', 'yu xian', 'yux', '蔚县', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (130727, 1307, 2, '阳原', 'yang yuan', 'yay', '阳原县', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (130728, 1307, 2, '怀安', 'huai an', 'hua', '怀安县', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (130730, 1307, 2, '怀来', 'huai lai', 'hul', '怀来县', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (130731, 1307, 2, '涿鹿', 'zhuo lu', 'zhl', '涿鹿县', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (130732, 1307, 2, '赤城', 'chi cheng', 'chc', '赤城县', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (130771, 1307, 2, '张家口市高新技术产业开发区', 'zhang jia kou shi gao xin ji shu chan ye kai fa qu', 'zhjk', '张家口市高新技术产业开发区', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (130772, 1307, 2, '张家口市察北管理区', 'zhang jia kou shi cha bei guan li qu', 'zhjk', '张家口市察北管理区', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (130773, 1307, 2, '张家口市塞北管理区', 'zhang jia kou shi sai bei guan li qu', 'zhjk', '张家口市塞北管理区', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (130802, 1308, 2, '双桥', 'shuang qiao', 'shq', '双桥区', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (130803, 1308, 2, '双滦', 'shuang luan', 'shl', '双滦区', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (130804, 1308, 2, '鹰手营子矿区', 'ying shou ying zi kuang qu', 'yisy', '鹰手营子矿区', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (130821, 1308, 2, '承德', 'cheng de', 'chd', '承德县', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (130822, 1308, 2, '兴隆', 'xing long', 'xil', '兴隆县', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (130824, 1308, 2, '滦平', 'luan ping', 'lup', '滦平县', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (130825, 1308, 2, '隆化', 'long hua', 'loh', '隆化县', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (130826, 1308, 2, '丰宁满族自治县', 'feng ning man zu zi zhi xian', 'fenm', '丰宁满族自治县', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (130827, 1308, 2, '宽城满族自治县', 'kuan cheng man zu zi zhi xian', 'kucm', '宽城满族自治县', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (130828, 1308, 2, '围场满族蒙古族自治县', 'wei chang man zu meng gu zu zi zhi xian', 'wecm', '围场满族蒙古族自治县', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (130871, 1308, 2, '承德高新技术产业开发区', 'cheng de gao xin ji shu chan ye kai fa qu', 'chdg', '承德高新技术产业开发区', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (130881, 1308, 2, '平泉', 'ping quan', 'piq', '平泉市', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (130902, 1309, 2, '新华', 'xin hua', 'xih', '新华区', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (130903, 1309, 2, '运河', 'yun he', 'yuh', '运河区', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (130921, 1309, 2, '沧县', 'cang xian', 'cax', '沧县', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (130922, 1309, 2, '青县', 'qing xian', 'qix', '青县', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (130923, 1309, 2, '东光', 'dong guang', 'dog', '东光县', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (130924, 1309, 2, '海兴', 'hai xing', 'hax', '海兴县', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (130925, 1309, 2, '盐山', 'yan shan', 'yas', '盐山县', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (130926, 1309, 2, '肃宁', 'su ning', 'sun', '肃宁县', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (130927, 1309, 2, '南皮', 'nan pi', 'nap', '南皮县', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (130928, 1309, 2, '吴桥', 'wu qiao', 'wuq', '吴桥县', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (130929, 1309, 2, '献县', 'xian xian', 'xix', '献县', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (130930, 1309, 2, '孟村回族自治县', 'meng cun hui zu zi zhi xian', 'mech', '孟村回族自治县', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (130971, 1309, 2, '河北沧州经济开发区', 'he bei cang zhou jing ji kai fa qu', 'hebc', '河北沧州经济开发区', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (130972, 1309, 2, '沧州高新技术产业开发区', 'cang zhou gao xin ji shu chan ye kai fa qu', 'cazg', '沧州高新技术产业开发区', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (130973, 1309, 2, '沧州渤海新区', 'cang zhou bo hai xin qu', 'cazb', '沧州渤海新区', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (130981, 1309, 2, '泊头', 'bo tou', 'bot', '泊头市', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (130982, 1309, 2, '任丘', 'ren qiu', 'req', '任丘市', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (130983, 1309, 2, '黄骅', 'huang hua', 'huh', '黄骅市', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (130984, 1309, 2, '河间', 'he jian', 'hej', '河间市', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (131002, 1310, 2, '安次', 'an ci', 'anc', '安次区', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (131003, 1310, 2, '广阳', 'guang yang', 'guy', '广阳区', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (131022, 1310, 2, '固安', 'gu an', 'gua', '固安县', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (131023, 1310, 2, '永清', 'yong qing', 'yoq', '永清县', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (131024, 1310, 2, '香河', 'xiang he', 'xih', '香河县', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (131025, 1310, 2, '大城', 'da cheng', 'dac', '大城县', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (131026, 1310, 2, '文安', 'wen an', 'wea', '文安县', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (131028, 1310, 2, '大厂回族自治县', 'da chang hui zu zi zhi xian', 'dach', '大厂回族自治县', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (131071, 1310, 2, '廊坊经济技术开发区', 'lang fang jing ji ji shu kai fa qu', 'lafj', '廊坊经济技术开发区', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (131081, 1310, 2, '霸州', 'ba zhou', 'baz', '霸州市', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (131082, 1310, 2, '三河', 'san he', 'sah', '三河市', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (131102, 1311, 2, '桃城', 'tao cheng', 'tac', '桃城区', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (131103, 1311, 2, '冀州', 'ji zhou', 'jiz', '冀州区', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (131121, 1311, 2, '枣强', 'zao qiang', 'zaq', '枣强县', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (131122, 1311, 2, '武邑', 'wu yi', 'wuy', '武邑县', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (131123, 1311, 2, '武强', 'wu qiang', 'wuq', '武强县', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (131124, 1311, 2, '饶阳', 'rao yang', 'ray', '饶阳县', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (131125, 1311, 2, '安平', 'an ping', 'anp', '安平县', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (131126, 1311, 2, '故城', 'gu cheng', 'guc', '故城县', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (131127, 1311, 2, '景县', 'jing xian', 'jix', '景县', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (131128, 1311, 2, '阜城', 'fu cheng', 'fuc', '阜城县', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (131171, 1311, 2, '河北衡水经济开发区', 'he bei heng shui jing ji kai fa qu', 'hebh', '河北衡水经济开发区', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (131172, 1311, 2, '衡水滨湖新区', 'heng shui bin hu xin qu', 'hesb', '衡水滨湖新区', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (131182, 1311, 2, '深州', 'shen zhou', 'shz', '深州市', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (140105, 1401, 2, '小店', 'xiao dian', 'xid', '小店区', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (140106, 1401, 2, '迎泽', 'ying ze', 'yiz', '迎泽区', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (140107, 1401, 2, '杏花岭', 'xing hua ling', 'xihl', '杏花岭区', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (140108, 1401, 2, '尖草坪', 'jian cao ping', 'jicp', '尖草坪区', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (140109, 1401, 2, '万柏林', 'wan bai lin', 'wabl', '万柏林区', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (140110, 1401, 2, '晋源', 'jin yuan', 'jiy', '晋源区', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (140121, 1401, 2, '清徐', 'qing xu', 'qix', '清徐县', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (140122, 1401, 2, '阳曲', 'yang qu', 'yaq', '阳曲县', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (140123, 1401, 2, '娄烦', 'lou fan', 'lof', '娄烦县', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (140171, 1401, 2, '山西转型综合改革示范区', 'shan xi zhuan xing zong he gai ge shi fan qu', 'shxz', '山西转型综合改革示范区', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (140181, 1401, 2, '古交', 'gu jiao', 'guj', '古交市', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (140202, 1402, 2, '城区', 'cheng qu', 'chq', '城区', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (140203, 1402, 2, '矿区', 'kuang qu', 'kuq', '矿区', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (140211, 1402, 2, '南郊', 'nan jiao', 'naj', '南郊区', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (140212, 1402, 2, '新荣', 'xin rong', 'xir', '新荣区', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (140221, 1402, 2, '阳高', 'yang gao', 'yag', '阳高县', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (140222, 1402, 2, '天镇', 'tian zhen', 'tiz', '天镇县', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (140223, 1402, 2, '广灵', 'guang ling', 'gul', '广灵县', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (140224, 1402, 2, '灵丘', 'ling qiu', 'liq', '灵丘县', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (140225, 1402, 2, '浑源', 'hun yuan', 'huy', '浑源县', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (140226, 1402, 2, '左云', 'zuo yun', 'zuy', '左云县', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (140227, 1402, 2, '大同', 'da tong', 'dat', '大同县', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (140271, 1402, 2, '山西大同经济开发区', 'shan xi da tong jing ji kai fa qu', 'shxd', '山西大同经济开发区', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (140302, 1403, 2, '城区', 'cheng qu', 'chq', '城区', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (140303, 1403, 2, '矿区', 'kuang qu', 'kuq', '矿区', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (140311, 1403, 2, '郊区', 'jiao qu', 'jiq', '郊区', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (140321, 1403, 2, '平定', 'ping ding', 'pid', '平定县', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (140322, 1403, 2, '盂县', 'yu xian', 'yux', '盂县', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (140371, 1403, 2, '山西阳泉经济开发区', 'shan xi yang quan jing ji kai fa qu', 'shxy', '山西阳泉经济开发区', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (140402, 1404, 2, '城区', 'cheng qu', 'chq', '城区', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (140411, 1404, 2, '郊区', 'jiao qu', 'jiq', '郊区', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (140421, 1404, 2, '长治', 'chang zhi', 'chz', '长治县', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (140423, 1404, 2, '襄垣', 'xiang yuan', 'xiy', '襄垣县', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (140424, 1404, 2, '屯留', 'tun liu', 'tul', '屯留县', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (140425, 1404, 2, '平顺', 'ping shun', 'pis', '平顺县', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (140426, 1404, 2, '黎城', 'li cheng', 'lic', '黎城县', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (140427, 1404, 2, '壶关', 'hu guan', 'hug', '壶关县', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (140428, 1404, 2, '长子', 'zhang zi', 'zhz', '长子县', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (140429, 1404, 2, '武乡', 'wu xiang', 'wux', '武乡县', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (140430, 1404, 2, '沁县', 'qin xian', 'qix', '沁县', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (140431, 1404, 2, '沁源', 'qin yuan', 'qiy', '沁源县', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (140471, 1404, 2, '山西长治高新技术产业园', 'shan xi chang zhi gao xin ji shu chan ye yuan', 'shxc', '山西长治高新技术产业园区', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (140481, 1404, 2, '潞城', 'lu cheng', 'luc', '潞城市', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (140502, 1405, 2, '城区', 'cheng qu', 'chq', '城区', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (140521, 1405, 2, '沁水', 'qin shui', 'qis', '沁水县', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (140522, 1405, 2, '阳城', 'yang cheng', 'yac', '阳城县', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (140524, 1405, 2, '陵川', 'ling chuan', 'lic', '陵川县', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (140525, 1405, 2, '泽州', 'ze zhou', 'zez', '泽州县', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (140581, 1405, 2, '高平', 'gao ping', 'gap', '高平市', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (140602, 1406, 2, '朔城', 'shuo cheng', 'shc', '朔城区', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (140603, 1406, 2, '平鲁', 'ping lu', 'pil', '平鲁区', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (140621, 1406, 2, '山阴', 'shan yin', 'shy', '山阴县', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (140622, 1406, 2, '应县', 'ying xian', 'yix', '应县', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (140623, 1406, 2, '右玉', 'you yu', 'yoy', '右玉县', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (140624, 1406, 2, '怀仁', 'huai ren', 'hur', '怀仁县', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (140671, 1406, 2, '山西朔州经济开发区', 'shan xi shuo zhou jing ji kai fa qu', 'shxs', '山西朔州经济开发区', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (140702, 1407, 2, '榆次', 'yu ci', 'yuc', '榆次区', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (140721, 1407, 2, '榆社', 'yu she', 'yus', '榆社县', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (140722, 1407, 2, '左权', 'zuo quan', 'zuq', '左权县', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (140723, 1407, 2, '和顺', 'he shun', 'hes', '和顺县', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (140724, 1407, 2, '昔阳', 'xi yang', 'xiy', '昔阳县', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (140725, 1407, 2, '寿阳', 'shou yang', 'shy', '寿阳县', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (140726, 1407, 2, '太谷', 'tai gu', 'tag', '太谷县', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (140727, 1407, 2, '祁县', 'qi xian', 'qix', '祁县', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (140728, 1407, 2, '平遥', 'ping yao', 'piy', '平遥县', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (140729, 1407, 2, '灵石', 'ling shi', 'lis', '灵石县', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (140781, 1407, 2, '介休', 'jie xiu', 'jix', '介休市', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (140802, 1408, 2, '盐湖', 'yan hu', 'yah', '盐湖区', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (140821, 1408, 2, '临猗', 'lin yi', 'liy', '临猗县', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (140822, 1408, 2, '万荣', 'wan rong', 'war', '万荣县', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (140823, 1408, 2, '闻喜', 'wen xi', 'wex', '闻喜县', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (140824, 1408, 2, '稷山', 'ji shan', 'jis', '稷山县', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (140825, 1408, 2, '新绛', 'xin jiang', 'xij', '新绛县', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (140826, 1408, 2, '绛县', 'jiang xian', 'jix', '绛县', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (140827, 1408, 2, '垣曲', 'yuan qu', 'yuq', '垣曲县', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (140828, 1408, 2, '夏县', 'xia xian', 'xix', '夏县', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (140829, 1408, 2, '平陆', 'ping lu', 'pil', '平陆县', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (140830, 1408, 2, '芮城', 'rui cheng', 'ruc', '芮城县', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (140881, 1408, 2, '永济', 'yong ji', 'yoj', '永济市', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (140882, 1408, 2, '河津', 'he jin', 'hej', '河津市', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (140902, 1409, 2, '忻府', 'xin fu', 'xif', '忻府区', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (140921, 1409, 2, '定襄', 'ding xiang', 'dix', '定襄县', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (140922, 1409, 2, '五台', 'wu tai', 'wut', '五台县', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (140923, 1409, 2, '代县', 'dai xian', 'dax', '代县', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (140924, 1409, 2, '繁峙', 'fan shi', 'fas', '繁峙县', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (140925, 1409, 2, '宁武', 'ning wu', 'niw', '宁武县', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (140926, 1409, 2, '静乐', 'jing le', 'jil', '静乐县', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (140927, 1409, 2, '神池', 'shen chi', 'shc', '神池县', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (140928, 1409, 2, '五寨', 'wu zhai', 'wuz', '五寨县', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (140929, 1409, 2, '岢岚', 'ke lan', 'kel', '岢岚县', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (140930, 1409, 2, '河曲', 'he qu', 'heq', '河曲县', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (140931, 1409, 2, '保德', 'bao de', 'bad', '保德县', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (140932, 1409, 2, '偏关', 'pian guan', 'pig', '偏关县', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (140971, 1409, 2, '五台山风景名胜区', 'wu tai shan feng jing ming sheng qu', 'wuts', '五台山风景名胜区', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (140981, 1409, 2, '原平', 'yuan ping', 'yup', '原平市', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (141002, 1410, 2, '尧都', 'yao du', 'yad', '尧都区', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (141021, 1410, 2, '曲沃', 'qu wo', 'quw', '曲沃县', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (141022, 1410, 2, '翼城', 'yi cheng', 'yic', '翼城县', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (141023, 1410, 2, '襄汾', 'xiang fen', 'xif', '襄汾县', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (141024, 1410, 2, '洪洞', 'hong dong', 'hod', '洪洞县', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (141025, 1410, 2, '古县', 'gu xian', 'gux', '古县', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (141026, 1410, 2, '安泽', 'an ze', 'anz', '安泽县', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (141027, 1410, 2, '浮山', 'fu shan', 'fus', '浮山县', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (141028, 1410, 2, '吉县', 'ji xian', 'jix', '吉县', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (141029, 1410, 2, '乡宁', 'xiang ning', 'xin', '乡宁县', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (141030, 1410, 2, '大宁', 'da ning', 'dan', '大宁县', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (141031, 1410, 2, '隰县', 'xi xian', 'xix', '隰县', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (141032, 1410, 2, '永和', 'yong he', 'yoh', '永和县', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (141033, 1410, 2, '蒲县', 'pu xian', 'pux', '蒲县', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (141034, 1410, 2, '汾西', 'fen xi', 'fex', '汾西县', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (141081, 1410, 2, '侯马', 'hou ma', 'hom', '侯马市', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (141082, 1410, 2, '霍州', 'huo zhou', 'huz', '霍州市', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (141102, 1411, 2, '离石', 'li shi', 'lis', '离石区', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (141121, 1411, 2, '文水', 'wen shui', 'wes', '文水县', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (141122, 1411, 2, '交城', 'jiao cheng', 'jic', '交城县', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (141123, 1411, 2, '兴县', 'xing xian', 'xix', '兴县', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (141124, 1411, 2, '临县', 'lin xian', 'lix', '临县', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (141125, 1411, 2, '柳林', 'liu lin', 'lil', '柳林县', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (141126, 1411, 2, '石楼', 'shi lou', 'shl', '石楼县', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (141127, 1411, 2, '岚县', 'lan xian', 'lax', '岚县', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (141128, 1411, 2, '方山', 'fang shan', 'fas', '方山县', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (141129, 1411, 2, '中阳', 'zhong yang', 'zhy', '中阳县', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (141130, 1411, 2, '交口', 'jiao kou', 'jik', '交口县', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (141181, 1411, 2, '孝义', 'xiao yi', 'xiy', '孝义市', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (141182, 1411, 2, '汾阳', 'fen yang', 'fey', '汾阳市', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (150102, 1501, 2, '新城', 'xin cheng', 'xic', '新城区', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (150103, 1501, 2, '回民', 'hui min', 'hum', '回民区', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (150104, 1501, 2, '玉泉', 'yu quan', 'yuq', '玉泉区', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (150105, 1501, 2, '赛罕', 'sai han', 'sah', '赛罕区', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (150121, 1501, 2, '土默特左旗', 'tu mo te zuo qi', 'tumt', '土默特左旗', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (150122, 1501, 2, '托克托', 'tuo ke tuo', 'tukt', '托克托县', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (150123, 1501, 2, '和林格尔', 'he lin ge er', 'helg', '和林格尔县', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (150124, 1501, 2, '清水河', 'qing shui he', 'qish', '清水河县', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (150125, 1501, 2, '武川', 'wu chuan', 'wuc', '武川县', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (150171, 1501, 2, '呼和浩特金海工业园', 'hu he hao te jin hai gong ye yuan', 'huhh', '呼和浩特金海工业园区', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (150172, 1501, 2, '呼和浩特经济技术开发区', 'hu he hao te jing ji ji shu kai fa qu', 'huhh', '呼和浩特经济技术开发区', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (150202, 1502, 2, '东河', 'dong he', 'doh', '东河区', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (150203, 1502, 2, '昆都仑', 'kun du lun', 'kudl', '昆都仑区', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (150204, 1502, 2, '青山', 'qing shan', 'qis', '青山区', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (150205, 1502, 2, '石拐', 'shi guai', 'shg', '石拐区', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (150206, 1502, 2, '白云鄂博矿区', 'bai yun e bo kuang qu', 'baye', '白云鄂博矿区', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (150207, 1502, 2, '九原', 'jiu yuan', 'jiy', '九原区', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (150221, 1502, 2, '土默特右旗', 'tu mo te you qi', 'tumt', '土默特右旗', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (150222, 1502, 2, '固阳', 'gu yang', 'guy', '固阳县', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (150223, 1502, 2, '达尔罕茂明安联合旗', 'da er han mao ming an lian he qi', 'daeh', '达尔罕茂明安联合旗', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (150271, 1502, 2, '包头稀土高新技术产业开发区', 'bao tou xi tu gao xin ji shu chan ye kai fa qu', 'batx', '包头稀土高新技术产业开发区', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (150302, 1503, 2, '海勃湾', 'hai bo wan', 'habw', '海勃湾区', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (150303, 1503, 2, '海南', 'hai nan', 'han', '海南区', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (150304, 1503, 2, '乌达', 'wu da', 'wud', '乌达区', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (150402, 1504, 2, '红山', 'hong shan', 'hos', '红山区', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (150403, 1504, 2, '元宝山', 'yuan bao shan', 'yubs', '元宝山区', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (150404, 1504, 2, '松山', 'song shan', 'sos', '松山区', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (150421, 1504, 2, '阿鲁科尔沁旗', 'a lu ke er qin qi', 'alk', '阿鲁科尔沁旗', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (150422, 1504, 2, '巴林左旗', 'ba lin zuo qi', 'balz', '巴林左旗', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (150423, 1504, 2, '巴林右旗', 'ba lin you qi', 'baly', '巴林右旗', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (150424, 1504, 2, '林西', 'lin xi', 'lix', '林西县', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (150425, 1504, 2, '克什克腾旗', 'ke shi ke teng qi', 'kesk', '克什克腾旗', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (150426, 1504, 2, '翁牛特旗', 'weng niu te qi', 'went', '翁牛特旗', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (150428, 1504, 2, '喀喇沁旗', 'ka la qin qi', 'kalq', '喀喇沁旗', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (150429, 1504, 2, '宁城', 'ning cheng', 'nic', '宁城县', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (150430, 1504, 2, '敖汉旗', 'ao han qi', 'aohq', '敖汉旗', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (150502, 1505, 2, '科尔沁', 'ke er qin', 'keeq', '科尔沁区', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (150521, 1505, 2, '科尔沁左翼中旗', 'ke er qin zuo yi zhong qi', 'keeq', '科尔沁左翼中旗', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (150522, 1505, 2, '科尔沁左翼后旗', 'ke er qin zuo yi hou qi', 'keeq', '科尔沁左翼后旗', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (150523, 1505, 2, '开鲁', 'kai lu', 'kal', '开鲁县', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (150524, 1505, 2, '库伦旗', 'ku lun qi', 'kulq', '库伦旗', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (150525, 1505, 2, '奈曼旗', 'nai man qi', 'namq', '奈曼旗', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (150526, 1505, 2, '扎鲁特旗', 'zha lu te qi', 'zhlt', '扎鲁特旗', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (150571, 1505, 2, '通辽经济技术开发区', 'tong liao jing ji ji shu kai fa qu', 'tolj', '通辽经济技术开发区', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (150581, 1505, 2, '霍林郭勒', 'huo lin guo le', 'hulg', '霍林郭勒市', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (150602, 1506, 2, '东胜', 'dong sheng', 'dos', '东胜区', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (150603, 1506, 2, '康巴什', 'kang ba shi', 'kabs', '康巴什区', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (150621, 1506, 2, '达拉特旗', 'da la te qi', 'dalt', '达拉特旗', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (150622, 1506, 2, '准格尔旗', 'zhun ge er qi', 'zhge', '准格尔旗', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (150623, 1506, 2, '鄂托克前旗', 'e tuo ke qian qi', 'etk', '鄂托克前旗', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (150624, 1506, 2, '鄂托克旗', 'e tuo ke qi', 'etk', '鄂托克旗', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (150625, 1506, 2, '杭锦旗', 'hang jin qi', 'hajq', '杭锦旗', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (150626, 1506, 2, '乌审旗', 'wu shen qi', 'wusq', '乌审旗', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (150627, 1506, 2, '伊金霍洛旗', 'yi jin huo luo qi', 'yijh', '伊金霍洛旗', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (150702, 1507, 2, '海拉尔', 'hai la er', 'hale', '海拉尔区', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (150703, 1507, 2, '扎赉诺尔', 'zha lai nuo er', 'zhln', '扎赉诺尔区', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (150721, 1507, 2, '阿荣旗', 'a rong qi', 'arq', '阿荣旗', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (150722, 1507, 2, '莫力达瓦达斡尔族自治旗', 'mo li da wa da wo er zu zi zhi qi', 'mold', '莫力达瓦达斡尔族自治旗', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (150723, 1507, 2, '鄂伦春自治旗', 'e lun chun zi zhi qi', 'elc', '鄂伦春自治旗', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (150724, 1507, 2, '鄂温克族自治旗', 'e wen ke zu zi zhi qi', 'ewk', '鄂温克族自治旗', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (150725, 1507, 2, '陈巴尔虎旗', 'chen ba er hu qi', 'chbe', '陈巴尔虎旗', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (150726, 1507, 2, '新巴尔虎左旗', 'xin ba er hu zuo qi', 'xibe', '新巴尔虎左旗', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (150727, 1507, 2, '新巴尔虎右旗', 'xin ba er hu you qi', 'xibe', '新巴尔虎右旗', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (150781, 1507, 2, '满洲里', 'man zhou li', 'mazl', '满洲里市', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (150782, 1507, 2, '牙克石', 'ya ke shi', 'yaks', '牙克石市', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (150783, 1507, 2, '扎兰屯', 'zha lan tun', 'zhlt', '扎兰屯市', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (150784, 1507, 2, '额尔古纳', 'e er gu na', 'eeg', '额尔古纳市', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (150785, 1507, 2, '根河', 'gen he', 'geh', '根河市', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (150802, 1508, 2, '临河', 'lin he', 'lih', '临河区', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (150821, 1508, 2, '五原', 'wu yuan', 'wuy', '五原县', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (150822, 1508, 2, '磴口', 'deng kou', 'dek', '磴口县', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (150823, 1508, 2, '乌拉特前旗', 'wu la te qian qi', 'wult', '乌拉特前旗', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (150824, 1508, 2, '乌拉特中旗', 'wu la te zhong qi', 'wult', '乌拉特中旗', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (150825, 1508, 2, '乌拉特后旗', 'wu la te hou qi', 'wult', '乌拉特后旗', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (150826, 1508, 2, '杭锦后旗', 'hang jin hou qi', 'hajh', '杭锦后旗', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (150902, 1509, 2, '集宁', 'ji ning', 'jin', '集宁区', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (150921, 1509, 2, '卓资', 'zhuo zi', 'zhz', '卓资县', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (150922, 1509, 2, '化德', 'hua de', 'hud', '化德县', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (150923, 1509, 2, '商都', 'shang du', 'shd', '商都县', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (150924, 1509, 2, '兴和', 'xing he', 'xih', '兴和县', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (150925, 1509, 2, '凉城', 'liang cheng', 'lic', '凉城县', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (150926, 1509, 2, '察哈尔右翼前旗', 'cha ha er you yi qian qi', 'chhe', '察哈尔右翼前旗', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (150927, 1509, 2, '察哈尔右翼中旗', 'cha ha er you yi zhong qi', 'chhe', '察哈尔右翼中旗', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (150928, 1509, 2, '察哈尔右翼后旗', 'cha ha er you yi hou qi', 'chhe', '察哈尔右翼后旗', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (150929, 1509, 2, '四子王旗', 'si zi wang qi', 'sizw', '四子王旗', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (150981, 1509, 2, '丰镇', 'feng zhen', 'fez', '丰镇市', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (152201, 1522, 2, '乌兰浩特', 'wu lan hao te', 'wulh', '乌兰浩特市', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (152202, 1522, 2, '阿尔山', 'a er shan', 'aes', '阿尔山市', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (152221, 1522, 2, '科尔沁右翼前旗', 'ke er qin you yi qian qi', 'keeq', '科尔沁右翼前旗', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (152222, 1522, 2, '科尔沁右翼中旗', 'ke er qin you yi zhong qi', 'keeq', '科尔沁右翼中旗', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (152223, 1522, 2, '扎赉特旗', 'zha lai te qi', 'zhlt', '扎赉特旗', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (152224, 1522, 2, '突泉', 'tu quan', 'tuq', '突泉县', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (152501, 1525, 2, '二连浩特', 'er lian hao te', 'erlh', '二连浩特市', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (152502, 1525, 2, '锡林浩特', 'xi lin hao te', 'xilh', '锡林浩特市', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (152522, 1525, 2, '阿巴嘎旗', 'a ba ga qi', 'abg', '阿巴嘎旗', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (152523, 1525, 2, '苏尼特左旗', 'su ni te zuo qi', 'sunt', '苏尼特左旗', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (152524, 1525, 2, '苏尼特右旗', 'su ni te you qi', 'sunt', '苏尼特右旗', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (152525, 1525, 2, '东乌珠穆沁旗', 'dong wu zhu mu qin qi', 'dowz', '东乌珠穆沁旗', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (152526, 1525, 2, '西乌珠穆沁旗', 'xi wu zhu mu qin qi', 'xiwz', '西乌珠穆沁旗', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (152527, 1525, 2, '太仆寺旗', 'tai pu si qi', 'taps', '太仆寺旗', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (152528, 1525, 2, '镶黄旗', 'xiang huang qi', 'xihq', '镶黄旗', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (152529, 1525, 2, '正镶白旗', 'zheng xiang bai qi', 'zhxb', '正镶白旗', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (152530, 1525, 2, '正蓝旗', 'zheng lan qi', 'zhlq', '正蓝旗', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (152531, 1525, 2, '多伦', 'duo lun', 'dul', '多伦县', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (152571, 1525, 2, '乌拉盖', 'wu la gai', 'wulg', '乌拉盖管委会', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (152921, 1529, 2, '阿拉善左旗', 'a la shan zuo qi', 'als', '阿拉善左旗', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (152922, 1529, 2, '阿拉善右旗', 'a la shan you qi', 'als', '阿拉善右旗', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (152923, 1529, 2, '额济纳旗', 'e ji na qi', 'ejn', '额济纳旗', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (152971, 1529, 2, '内蒙古阿拉善经济开发区', 'nei meng gu a la shan jing ji kai fa qu', 'nemg', '内蒙古阿拉善经济开发区', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (210102, 2101, 2, '和平', 'he ping', 'hep', '和平区', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (210103, 2101, 2, '沈河', 'shen he', 'shh', '沈河区', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (210104, 2101, 2, '大东', 'da dong', 'dad', '大东区', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (210105, 2101, 2, '皇姑', 'huang gu', 'hug', '皇姑区', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (210106, 2101, 2, '铁西', 'tie xi', 'tix', '铁西区', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (210111, 2101, 2, '苏家屯', 'su jia tun', 'sujt', '苏家屯区', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (210112, 2101, 2, '浑南', 'hun nan', 'hun', '浑南区', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (210113, 2101, 2, '沈北新区', 'shen bei xin qu', 'shbx', '沈北新区', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (210114, 2101, 2, '于洪', 'yu hong', 'yuh', '于洪区', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (210115, 2101, 2, '辽中', 'liao zhong', 'liz', '辽中区', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (210123, 2101, 2, '康平', 'kang ping', 'kap', '康平县', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (210124, 2101, 2, '法库', 'fa ku', 'fak', '法库县', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (210181, 2101, 2, '新民', 'xin min', 'xim', '新民市', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (210202, 2102, 2, '中山', 'zhong shan', 'zhs', '中山区', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (210203, 2102, 2, '西岗', 'xi gang', 'xig', '西岗区', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (210204, 2102, 2, '沙河口', 'sha he kou', 'shhk', '沙河口区', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (210211, 2102, 2, '甘井子', 'gan jing zi', 'gajz', '甘井子区', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (210212, 2102, 2, '旅顺口', 'lv shun kou', 'lvsk', '旅顺口区', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (210213, 2102, 2, '金州', 'jin zhou', 'jiz', '金州区', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (210214, 2102, 2, '普兰店', 'pu lan dian', 'puld', '普兰店区', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (210224, 2102, 2, '长海', 'chang hai', 'chh', '长海县', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (210281, 2102, 2, '瓦房店', 'wa fang dian', 'wafd', '瓦房店市', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (210283, 2102, 2, '庄河', 'zhuang he', 'zhh', '庄河市', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (210302, 2103, 2, '铁东', 'tie dong', 'tid', '铁东区', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (210303, 2103, 2, '铁西', 'tie xi', 'tix', '铁西区', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (210304, 2103, 2, '立山', 'li shan', 'lis', '立山区', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (210311, 2103, 2, '千山', 'qian shan', 'qis', '千山区', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (210321, 2103, 2, '台安', 'tai an', 'taa', '台安县', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (210323, 2103, 2, '岫岩满族自治县', 'xiu yan man zu zi zhi xian', 'xiym', '岫岩满族自治县', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (210381, 2103, 2, '海城', 'hai cheng', 'hac', '海城市', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (210402, 2104, 2, '新抚', 'xin fu', 'xif', '新抚区', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (210403, 2104, 2, '东洲', 'dong zhou', 'doz', '东洲区', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (210404, 2104, 2, '望花', 'wang hua', 'wah', '望花区', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (210411, 2104, 2, '顺城', 'shun cheng', 'shc', '顺城区', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (210421, 2104, 2, '抚顺', 'fu shun', 'fus', '抚顺县', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (210422, 2104, 2, '新宾满族自治县', 'xin bin man zu zi zhi xian', 'xibm', '新宾满族自治县', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (210423, 2104, 2, '清原满族自治县', 'qing yuan man zu zi zhi xian', 'qiym', '清原满族自治县', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (210502, 2105, 2, '平山', 'ping shan', 'pis', '平山区', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (210503, 2105, 2, '溪湖', 'xi hu', 'xih', '溪湖区', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (210504, 2105, 2, '明山', 'ming shan', 'mis', '明山区', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (210505, 2105, 2, '南芬', 'nan fen', 'naf', '南芬区', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (210521, 2105, 2, '本溪满族自治县', 'ben xi man zu zi zhi xian', 'bexm', '本溪满族自治县', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (210522, 2105, 2, '桓仁满族自治县', 'huan ren man zu zi zhi xian', 'hurm', '桓仁满族自治县', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (210602, 2106, 2, '元宝', 'yuan bao', 'yub', '元宝区', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (210603, 2106, 2, '振兴', 'zhen xing', 'zhx', '振兴区', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (210604, 2106, 2, '振安', 'zhen an', 'zha', '振安区', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (210624, 2106, 2, '宽甸满族自治县', 'kuan dian man zu zi zhi xian', 'kudm', '宽甸满族自治县', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (210681, 2106, 2, '东港', 'dong gang', 'dog', '东港市', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (210682, 2106, 2, '凤城', 'feng cheng', 'fec', '凤城市', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (210702, 2107, 2, '古塔', 'gu ta', 'gut', '古塔区', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (210703, 2107, 2, '凌河', 'ling he', 'lih', '凌河区', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (210711, 2107, 2, '太和', 'tai he', 'tah', '太和区', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (210726, 2107, 2, '黑山', 'hei shan', 'hes', '黑山县', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (210727, 2107, 2, '义县', 'yi xian', 'yix', '义县', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (210781, 2107, 2, '凌海', 'ling hai', 'lih', '凌海市', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (210782, 2107, 2, '北镇', 'bei zhen', 'bez', '北镇市', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (210802, 2108, 2, '站前', 'zhan qian', 'zhq', '站前区', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (210803, 2108, 2, '西市', 'xi shi', 'xis', '西市区', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (210804, 2108, 2, '鲅鱼圈', 'ba yu quan', 'bayq', '鲅鱼圈区', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (210811, 2108, 2, '老边', 'lao bian', 'lab', '老边区', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (210881, 2108, 2, '盖州', 'gai zhou', 'gaz', '盖州市', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (210882, 2108, 2, '大石桥', 'da shi qiao', 'dasq', '大石桥市', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (210902, 2109, 2, '海州', 'hai zhou', 'haz', '海州区', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (210903, 2109, 2, '新邱', 'xin qiu', 'xiq', '新邱区', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (210904, 2109, 2, '太平', 'tai ping', 'tap', '太平区', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (210905, 2109, 2, '清河门', 'qing he men', 'qihm', '清河门区', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (210911, 2109, 2, '细河', 'xi he', 'xih', '细河区', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (210921, 2109, 2, '阜新蒙古族自治县', 'fu xin meng gu zu zi zhi xian', 'fuxm', '阜新蒙古族自治县', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (210922, 2109, 2, '彰武', 'zhang wu', 'zhw', '彰武县', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (211002, 2110, 2, '白塔', 'bai ta', 'bat', '白塔区', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (211003, 2110, 2, '文圣', 'wen sheng', 'wes', '文圣区', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (211004, 2110, 2, '宏伟', 'hong wei', 'how', '宏伟区', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (211005, 2110, 2, '弓长岭', 'gong chang ling', 'gocl', '弓长岭区', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (211011, 2110, 2, '太子河', 'tai zi he', 'tazh', '太子河区', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (211021, 2110, 2, '辽阳', 'liao yang', 'liy', '辽阳县', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (211081, 2110, 2, '灯塔', 'deng ta', 'det', '灯塔市', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (211102, 2111, 2, '双台子', 'shuang tai zi', 'shtz', '双台子区', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (211103, 2111, 2, '兴隆台', 'xing long tai', 'xilt', '兴隆台区', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (211104, 2111, 2, '大洼', 'da wa', 'daw', '大洼区', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (211122, 2111, 2, '盘山', 'pan shan', 'pas', '盘山县', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (211202, 2112, 2, '银州', 'yin zhou', 'yiz', '银州区', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (211204, 2112, 2, '清河', 'qing he', 'qih', '清河区', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (211221, 2112, 2, '铁岭', 'tie ling', 'til', '铁岭县', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (211223, 2112, 2, '西丰', 'xi feng', 'xif', '西丰县', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (211224, 2112, 2, '昌图', 'chang tu', 'cht', '昌图县', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (211281, 2112, 2, '调兵山', 'diao bing shan', 'dibs', '调兵山市', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (211282, 2112, 2, '开原', 'kai yuan', 'kay', '开原市', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (211302, 2113, 2, '双塔', 'shuang ta', 'sht', '双塔区', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (211303, 2113, 2, '龙城', 'long cheng', 'loc', '龙城区', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (211321, 2113, 2, '朝阳', 'chao yang', 'chy', '朝阳县', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (211322, 2113, 2, '建平', 'jian ping', 'jip', '建平县', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (211324, 2113, 2, '喀喇沁左翼蒙古族自治县', 'ka la qin zuo yi meng gu zu zi zhi xian', 'kalq', '喀喇沁左翼蒙古族自治县', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (211381, 2113, 2, '北票', 'bei piao', 'bep', '北票市', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (211382, 2113, 2, '凌源', 'ling yuan', 'liy', '凌源市', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (211402, 2114, 2, '连山', 'lian shan', 'lis', '连山区', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (211403, 2114, 2, '龙港', 'long gang', 'log', '龙港区', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (211404, 2114, 2, '南票', 'nan piao', 'nap', '南票区', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (211421, 2114, 2, '绥中', 'sui zhong', 'suz', '绥中县', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (211422, 2114, 2, '建昌', 'jian chang', 'jic', '建昌县', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (211481, 2114, 2, '兴城', 'xing cheng', 'xic', '兴城市', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (220102, 2201, 2, '南关', 'nan guan', 'nag', '南关区', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (220103, 2201, 2, '宽城', 'kuan cheng', 'kuc', '宽城区', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (220104, 2201, 2, '朝阳', 'chao yang', 'chy', '朝阳区', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (220105, 2201, 2, '二道', 'er dao', 'erd', '二道区', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (220106, 2201, 2, '绿园', 'lv yuan', 'lvy', '绿园区', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (220112, 2201, 2, '双阳', 'shuang yang', 'shy', '双阳区', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (220113, 2201, 2, '九台', 'jiu tai', 'jit', '九台区', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (220122, 2201, 2, '农安', 'nong an', 'noa', '农安县', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (220171, 2201, 2, '长春经济技术开发区', 'chang chun jing ji ji shu kai fa qu', 'chcj', '长春经济技术开发区', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (220172, 2201, 2, '长春净月高新技术产业开发区', 'chang chun jing yue gao xin ji shu chan ye kai fa qu', 'chcj', '长春净月高新技术产业开发区', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (220173, 2201, 2, '长春高新技术产业开发区', 'chang chun gao xin ji shu chan ye kai fa qu', 'chcg', '长春高新技术产业开发区', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (220174, 2201, 2, '长春汽车经济技术开发区', 'chang chun qi che jing ji ji shu kai fa qu', 'chcq', '长春汽车经济技术开发区', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (220182, 2201, 2, '榆树', 'yu shu', 'yus', '榆树市', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (220183, 2201, 2, '德惠', 'de hui', 'deh', '德惠市', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (220202, 2202, 2, '昌邑', 'chang yi', 'chy', '昌邑区', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (220203, 2202, 2, '龙潭', 'long tan', 'lot', '龙潭区', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (220204, 2202, 2, '船营', 'chuan ying', 'chy', '船营区', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (220211, 2202, 2, '丰满', 'feng man', 'fem', '丰满区', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (220221, 2202, 2, '永吉', 'yong ji', 'yoj', '永吉县', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (220271, 2202, 2, '吉林经济开发区', 'ji lin jing ji kai fa qu', 'jilj', '吉林经济开发区', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (220272, 2202, 2, '吉林高新技术产业开发区', 'ji lin gao xin ji shu chan ye kai fa qu', 'jilg', '吉林高新技术产业开发区', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (220273, 2202, 2, '吉林中国新加坡食品', 'ji lin zhong guo xin jia po shi pin', 'jilz', '吉林中国新加坡食品区', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (220281, 2202, 2, '蛟河', 'jiao he', 'jih', '蛟河市', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (220282, 2202, 2, '桦甸', 'hua dian', 'hud', '桦甸市', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (220283, 2202, 2, '舒兰', 'shu lan', 'shl', '舒兰市', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (220284, 2202, 2, '磐石', 'pan shi', 'pas', '磐石市', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (220302, 2203, 2, '铁西', 'tie xi', 'tix', '铁西区', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (220303, 2203, 2, '铁东', 'tie dong', 'tid', '铁东区', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (220322, 2203, 2, '梨树', 'li shu', 'lis', '梨树县', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (220323, 2203, 2, '伊通满族自治县', 'yi tong man zu zi zhi xian', 'yitm', '伊通满族自治县', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (220381, 2203, 2, '公主岭', 'gong zhu ling', 'gozl', '公主岭市', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (220382, 2203, 2, '双辽', 'shuang liao', 'shl', '双辽市', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (220402, 2204, 2, '龙山', 'long shan', 'los', '龙山区', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (220403, 2204, 2, '西安', 'xi an', 'xia', '西安区', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (220421, 2204, 2, '东丰', 'dong feng', 'dof', '东丰县', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (220422, 2204, 2, '东辽', 'dong liao', 'dol', '东辽县', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (220502, 2205, 2, '东昌', 'dong chang', 'doc', '东昌区', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (220503, 2205, 2, '二道江', 'er dao jiang', 'erdj', '二道江区', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (220521, 2205, 2, '通化', 'tong hua', 'toh', '通化县', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (220523, 2205, 2, '辉南', 'hui nan', 'hun', '辉南县', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (220524, 2205, 2, '柳河', 'liu he', 'lih', '柳河县', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (220581, 2205, 2, '梅河口', 'mei he kou', 'mehk', '梅河口市', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (220582, 2205, 2, '集安', 'ji an', 'jia', '集安市', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (220602, 2206, 2, '浑江', 'hun jiang', 'huj', '浑江区', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (220605, 2206, 2, '江源', 'jiang yuan', 'jiy', '江源区', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (220621, 2206, 2, '抚松', 'fu song', 'fus', '抚松县', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (220622, 2206, 2, '靖宇', 'jing yu', 'jiy', '靖宇县', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (220623, 2206, 2, '长白朝鲜族自治县', 'chang bai chao xian zu zi zhi xian', 'chbc', '长白朝鲜族自治县', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (220681, 2206, 2, '临江', 'lin jiang', 'lij', '临江市', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (220702, 2207, 2, '宁江', 'ning jiang', 'nij', '宁江区', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (220721, 2207, 2, '前郭尔罗斯蒙古族自治县', 'qian guo er luo si meng gu zu zi zhi xian', 'qige', '前郭尔罗斯蒙古族自治县', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (220722, 2207, 2, '长岭', 'chang ling', 'chl', '长岭县', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (220723, 2207, 2, '乾安', 'gan an', 'gaa', '乾安县', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (220771, 2207, 2, '吉林松原经济开发区', 'ji lin song yuan jing ji kai fa qu', 'jils', '吉林松原经济开发区', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (220781, 2207, 2, '扶余', 'fu yu', 'fuy', '扶余市', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (220802, 2208, 2, '洮北', 'tao bei', 'tab', '洮北区', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (220821, 2208, 2, '镇赉', 'zhen lai', 'zhl', '镇赉县', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (220822, 2208, 2, '通榆', 'tong yu', 'toy', '通榆县', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (220871, 2208, 2, '吉林白城经济开发区', 'ji lin bai cheng jing ji kai fa qu', 'jilb', '吉林白城经济开发区', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (220881, 2208, 2, '洮南', 'tao nan', 'tan', '洮南市', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (220882, 2208, 2, '大安', 'da an', 'daa', '大安市', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (222401, 2224, 2, '延吉', 'yan ji', 'yaj', '延吉市', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (222402, 2224, 2, '图们', 'tu men', 'tum', '图们市', '2018-12-19 14:26:58', '2018-12-19 14:26:58', 'admin');
INSERT INTO `districts` VALUES (222403, 2224, 2, '敦化', 'dun hua', 'duh', '敦化市', NULL, NULL, '');
INSERT INTO `districts` VALUES (222404, 2224, 2, '珲春', 'hun chun', 'huc', '珲春市', NULL, NULL, '');
INSERT INTO `districts` VALUES (222405, 2224, 2, '龙井', 'long jing', 'loj', '龙井市', NULL, NULL, '');
INSERT INTO `districts` VALUES (222406, 2224, 2, '和龙', 'he long', 'hel', '和龙市', NULL, NULL, '');
INSERT INTO `districts` VALUES (222424, 2224, 2, '汪清', 'wang qing', 'waq', '汪清县', NULL, NULL, '');
INSERT INTO `districts` VALUES (222426, 2224, 2, '安图', 'an tu', 'ant', '安图县', NULL, NULL, '');
INSERT INTO `districts` VALUES (230102, 2301, 2, '道里', 'dao li', 'dal', '道里区', NULL, NULL, '');
INSERT INTO `districts` VALUES (230103, 2301, 2, '南岗', 'nan gang', 'nag', '南岗区', NULL, NULL, '');
INSERT INTO `districts` VALUES (230104, 2301, 2, '道外', 'dao wai', 'daw', '道外区', NULL, NULL, '');
INSERT INTO `districts` VALUES (230108, 2301, 2, '平房', 'ping fang', 'pif', '平房区', NULL, NULL, '');
INSERT INTO `districts` VALUES (230109, 2301, 2, '松北', 'song bei', 'sob', '松北区', NULL, NULL, '');
INSERT INTO `districts` VALUES (230110, 2301, 2, '香坊', 'xiang fang', 'xif', '香坊区', NULL, NULL, '');
INSERT INTO `districts` VALUES (230111, 2301, 2, '呼兰', 'hu lan', 'hul', '呼兰区', NULL, NULL, '');
INSERT INTO `districts` VALUES (230112, 2301, 2, '阿城', 'a cheng', 'ac', '阿城区', NULL, NULL, '');
INSERT INTO `districts` VALUES (230113, 2301, 2, '双城', 'shuang cheng', 'shc', '双城区', NULL, NULL, '');
INSERT INTO `districts` VALUES (230123, 2301, 2, '依兰', 'yi lan', 'yil', '依兰县', NULL, NULL, '');
INSERT INTO `districts` VALUES (230124, 2301, 2, '方正', 'fang zheng', 'faz', '方正县', NULL, NULL, '');
INSERT INTO `districts` VALUES (230125, 2301, 2, '宾县', 'bin xian', 'bix', '宾县', NULL, NULL, '');
INSERT INTO `districts` VALUES (230126, 2301, 2, '巴彦', 'ba yan', 'bay', '巴彦县', NULL, NULL, '');
INSERT INTO `districts` VALUES (230127, 2301, 2, '木兰', 'mu lan', 'mul', '木兰县', NULL, NULL, '');
INSERT INTO `districts` VALUES (230128, 2301, 2, '通河', 'tong he', 'toh', '通河县', NULL, NULL, '');
INSERT INTO `districts` VALUES (230129, 2301, 2, '延寿', 'yan shou', 'yas', '延寿县', NULL, NULL, '');
INSERT INTO `districts` VALUES (230183, 2301, 2, '尚志', 'shang zhi', 'shz', '尚志市', NULL, NULL, '');
INSERT INTO `districts` VALUES (230184, 2301, 2, '五常', 'wu chang', 'wuc', '五常市', NULL, NULL, '');
INSERT INTO `districts` VALUES (230202, 2302, 2, '龙沙', 'long sha', 'los', '龙沙区', NULL, NULL, '');
INSERT INTO `districts` VALUES (230203, 2302, 2, '建华', 'jian hua', 'jih', '建华区', NULL, NULL, '');
INSERT INTO `districts` VALUES (230204, 2302, 2, '铁锋', 'tie feng', 'tif', '铁锋区', NULL, NULL, '');
INSERT INTO `districts` VALUES (230205, 2302, 2, '昂昂溪', 'ang ang xi', 'anax', '昂昂溪区', NULL, NULL, '');
INSERT INTO `districts` VALUES (230206, 2302, 2, '富拉尔基', 'fu la er ji', 'fule', '富拉尔基区', NULL, NULL, '');
INSERT INTO `districts` VALUES (230207, 2302, 2, '碾子山', 'nian zi shan', 'nizs', '碾子山区', NULL, NULL, '');
INSERT INTO `districts` VALUES (230208, 2302, 2, '梅里斯达斡尔族', 'mei li si da wo er zu', 'mels', '梅里斯达斡尔族区', NULL, NULL, '');
INSERT INTO `districts` VALUES (230221, 2302, 2, '龙江', 'long jiang', 'loj', '龙江县', NULL, NULL, '');
INSERT INTO `districts` VALUES (230223, 2302, 2, '依安', 'yi an', 'yia', '依安县', NULL, NULL, '');
INSERT INTO `districts` VALUES (230224, 2302, 2, '泰来', 'tai lai', 'tal', '泰来县', NULL, NULL, '');
INSERT INTO `districts` VALUES (230225, 2302, 2, '甘南', 'gan nan', 'gan', '甘南县', NULL, NULL, '');
INSERT INTO `districts` VALUES (230227, 2302, 2, '富裕', 'fu yu', 'fuy', '富裕县', NULL, NULL, '');
INSERT INTO `districts` VALUES (230229, 2302, 2, '克山', 'ke shan', 'kes', '克山县', NULL, NULL, '');
INSERT INTO `districts` VALUES (230230, 2302, 2, '克东', 'ke dong', 'ked', '克东县', NULL, NULL, '');
INSERT INTO `districts` VALUES (230231, 2302, 2, '拜泉', 'bai quan', 'baq', '拜泉县', NULL, NULL, '');
INSERT INTO `districts` VALUES (230281, 2302, 2, '讷河', 'ne he', 'neh', '讷河市', NULL, NULL, '');
INSERT INTO `districts` VALUES (230302, 2303, 2, '鸡冠', 'ji guan', 'jig', '鸡冠区', NULL, NULL, '');
INSERT INTO `districts` VALUES (230303, 2303, 2, '恒山', 'heng shan', 'hes', '恒山区', NULL, NULL, '');
INSERT INTO `districts` VALUES (230304, 2303, 2, '滴道', 'di dao', 'did', '滴道区', NULL, NULL, '');
INSERT INTO `districts` VALUES (230305, 2303, 2, '梨树', 'li shu', 'lis', '梨树区', NULL, NULL, '');
INSERT INTO `districts` VALUES (230306, 2303, 2, '城子河', 'cheng zi he', 'chzh', '城子河区', NULL, NULL, '');
INSERT INTO `districts` VALUES (230307, 2303, 2, '麻山', 'ma shan', 'mas', '麻山区', NULL, NULL, '');
INSERT INTO `districts` VALUES (230321, 2303, 2, '鸡东', 'ji dong', 'jid', '鸡东县', NULL, NULL, '');
INSERT INTO `districts` VALUES (230381, 2303, 2, '虎林', 'hu lin', 'hul', '虎林市', NULL, NULL, '');
INSERT INTO `districts` VALUES (230382, 2303, 2, '密山', 'mi shan', 'mis', '密山市', NULL, NULL, '');
INSERT INTO `districts` VALUES (230402, 2304, 2, '向阳', 'xiang yang', 'xiy', '向阳区', NULL, NULL, '');
INSERT INTO `districts` VALUES (230403, 2304, 2, '工农', 'gong nong', 'gon', '工农区', NULL, NULL, '');
INSERT INTO `districts` VALUES (230404, 2304, 2, '南山', 'nan shan', 'nas', '南山区', NULL, NULL, '');
INSERT INTO `districts` VALUES (230405, 2304, 2, '兴安', 'xing an', 'xia', '兴安区', NULL, NULL, '');
INSERT INTO `districts` VALUES (230406, 2304, 2, '东山', 'dong shan', 'dos', '东山区', NULL, NULL, '');
INSERT INTO `districts` VALUES (230407, 2304, 2, '兴山', 'xing shan', 'xis', '兴山区', NULL, NULL, '');
INSERT INTO `districts` VALUES (230421, 2304, 2, '萝北', 'luo bei', 'lub', '萝北县', NULL, NULL, '');
INSERT INTO `districts` VALUES (230422, 2304, 2, '绥滨', 'sui bin', 'sub', '绥滨县', NULL, NULL, '');
INSERT INTO `districts` VALUES (230502, 2305, 2, '尖山', 'jian shan', 'jis', '尖山区', NULL, NULL, '');
INSERT INTO `districts` VALUES (230503, 2305, 2, '岭东', 'ling dong', 'lid', '岭东区', NULL, NULL, '');
INSERT INTO `districts` VALUES (230505, 2305, 2, '四方台', 'si fang tai', 'sift', '四方台区', NULL, NULL, '');
INSERT INTO `districts` VALUES (230506, 2305, 2, '宝山', 'bao shan', 'bas', '宝山区', NULL, NULL, '');
INSERT INTO `districts` VALUES (230521, 2305, 2, '集贤', 'ji xian', 'jix', '集贤县', NULL, NULL, '');
INSERT INTO `districts` VALUES (230522, 2305, 2, '友谊', 'you yi', 'yoy', '友谊县', NULL, NULL, '');
INSERT INTO `districts` VALUES (230523, 2305, 2, '宝清', 'bao qing', 'baq', '宝清县', NULL, NULL, '');
INSERT INTO `districts` VALUES (230524, 2305, 2, '饶河', 'rao he', 'rah', '饶河县', NULL, NULL, '');
INSERT INTO `districts` VALUES (230602, 2306, 2, '萨尔图', 'sa er tu', 'saet', '萨尔图区', NULL, NULL, '');
INSERT INTO `districts` VALUES (230603, 2306, 2, '龙凤', 'long feng', 'lof', '龙凤区', NULL, NULL, '');
INSERT INTO `districts` VALUES (230604, 2306, 2, '让胡路', 'rang hu lu', 'rahl', '让胡路区', NULL, NULL, '');
INSERT INTO `districts` VALUES (230605, 2306, 2, '红岗', 'hong gang', 'hog', '红岗区', NULL, NULL, '');
INSERT INTO `districts` VALUES (230606, 2306, 2, '大同', 'da tong', 'dat', '大同区', NULL, NULL, '');
INSERT INTO `districts` VALUES (230621, 2306, 2, '肇州', 'zhao zhou', 'zhz', '肇州县', NULL, NULL, '');
INSERT INTO `districts` VALUES (230622, 2306, 2, '肇源', 'zhao yuan', 'zhy', '肇源县', NULL, NULL, '');
INSERT INTO `districts` VALUES (230623, 2306, 2, '林甸', 'lin dian', 'lid', '林甸县', NULL, NULL, '');
INSERT INTO `districts` VALUES (230624, 2306, 2, '杜尔伯特蒙古族自治县', 'du er bo te meng gu zu zi zhi xian', 'dueb', '杜尔伯特蒙古族自治县', NULL, NULL, '');
INSERT INTO `districts` VALUES (230671, 2306, 2, '大庆高新技术产业开发区', 'da qing gao xin ji shu chan ye kai fa qu', 'daqg', '大庆高新技术产业开发区', NULL, NULL, '');
INSERT INTO `districts` VALUES (230702, 2307, 2, '伊春', 'yi chun', 'yic', '伊春区', NULL, NULL, '');
INSERT INTO `districts` VALUES (230703, 2307, 2, '南岔', 'nan cha', 'nac', '南岔区', NULL, NULL, '');
INSERT INTO `districts` VALUES (230704, 2307, 2, '友好', 'you hao', 'yoh', '友好区', NULL, NULL, '');
INSERT INTO `districts` VALUES (230705, 2307, 2, '西林', 'xi lin', 'xil', '西林区', NULL, NULL, '');
INSERT INTO `districts` VALUES (230706, 2307, 2, '翠峦', 'cui luan', 'cul', '翠峦区', NULL, NULL, '');
INSERT INTO `districts` VALUES (230707, 2307, 2, '新青', 'xin qing', 'xiq', '新青区', NULL, NULL, '');
INSERT INTO `districts` VALUES (230708, 2307, 2, '美溪', 'mei xi', 'mex', '美溪区', NULL, NULL, '');
INSERT INTO `districts` VALUES (230709, 2307, 2, '金山屯', 'jin shan tun', 'jist', '金山屯区', NULL, NULL, '');
INSERT INTO `districts` VALUES (230710, 2307, 2, '五营', 'wu ying', 'wuy', '五营区', NULL, NULL, '');
INSERT INTO `districts` VALUES (230711, 2307, 2, '乌马河', 'wu ma he', 'wumh', '乌马河区', NULL, NULL, '');
INSERT INTO `districts` VALUES (230712, 2307, 2, '汤旺河', 'tang wang he', 'tawh', '汤旺河区', NULL, NULL, '');
INSERT INTO `districts` VALUES (230713, 2307, 2, '带岭', 'dai ling', 'dal', '带岭区', NULL, NULL, '');
INSERT INTO `districts` VALUES (230714, 2307, 2, '乌伊岭', 'wu yi ling', 'wuyl', '乌伊岭区', NULL, NULL, '');
INSERT INTO `districts` VALUES (230715, 2307, 2, '红星', 'hong xing', 'hox', '红星区', NULL, NULL, '');
INSERT INTO `districts` VALUES (230716, 2307, 2, '上甘岭', 'shang gan ling', 'shgl', '上甘岭区', NULL, NULL, '');
INSERT INTO `districts` VALUES (230722, 2307, 2, '嘉荫', 'jia yin', 'jiy', '嘉荫县', NULL, NULL, '');
INSERT INTO `districts` VALUES (230781, 2307, 2, '铁力', 'tie li', 'til', '铁力市', NULL, NULL, '');
INSERT INTO `districts` VALUES (230803, 2308, 2, '向阳', 'xiang yang', 'xiy', '向阳区', NULL, NULL, '');
INSERT INTO `districts` VALUES (230804, 2308, 2, '前进', 'qian jin', 'qij', '前进区', NULL, NULL, '');
INSERT INTO `districts` VALUES (230805, 2308, 2, '东风', 'dong feng', 'dof', '东风区', NULL, NULL, '');
INSERT INTO `districts` VALUES (230811, 2308, 2, '郊区', 'jiao qu', 'jiq', '郊区', NULL, NULL, '');
INSERT INTO `districts` VALUES (230822, 2308, 2, '桦南', 'hua nan', 'hun', '桦南县', NULL, NULL, '');
INSERT INTO `districts` VALUES (230826, 2308, 2, '桦川', 'hua chuan', 'huc', '桦川县', NULL, NULL, '');
INSERT INTO `districts` VALUES (230828, 2308, 2, '汤原', 'tang yuan', 'tay', '汤原县', NULL, NULL, '');
INSERT INTO `districts` VALUES (230881, 2308, 2, '同江', 'tong jiang', 'toj', '同江市', NULL, NULL, '');
INSERT INTO `districts` VALUES (230882, 2308, 2, '富锦', 'fu jin', 'fuj', '富锦市', NULL, NULL, '');
INSERT INTO `districts` VALUES (230883, 2308, 2, '抚远', 'fu yuan', 'fuy', '抚远市', NULL, NULL, '');
INSERT INTO `districts` VALUES (230902, 2309, 2, '新兴', 'xin xing', 'xix', '新兴区', NULL, NULL, '');
INSERT INTO `districts` VALUES (230903, 2309, 2, '桃山', 'tao shan', 'tas', '桃山区', NULL, NULL, '');
INSERT INTO `districts` VALUES (230904, 2309, 2, '茄子河', 'qie zi he', 'qizh', '茄子河区', NULL, NULL, '');
INSERT INTO `districts` VALUES (230921, 2309, 2, '勃利', 'bo li', 'bol', '勃利县', NULL, NULL, '');
INSERT INTO `districts` VALUES (231002, 2310, 2, '东安', 'dong an', 'doa', '东安区', NULL, NULL, '');
INSERT INTO `districts` VALUES (231003, 2310, 2, '阳明', 'yang ming', 'yam', '阳明区', NULL, NULL, '');
INSERT INTO `districts` VALUES (231004, 2310, 2, '爱民', 'ai min', 'aim', '爱民区', NULL, NULL, '');
INSERT INTO `districts` VALUES (231005, 2310, 2, '西安', 'xi an', 'xia', '西安区', NULL, NULL, '');
INSERT INTO `districts` VALUES (231025, 2310, 2, '林口', 'lin kou', 'lik', '林口县', NULL, NULL, '');
INSERT INTO `districts` VALUES (231071, 2310, 2, '牡丹江经济技术开发区', 'mu dan jiang jing ji ji shu kai fa qu', 'mudj', '牡丹江经济技术开发区', NULL, NULL, '');
INSERT INTO `districts` VALUES (231081, 2310, 2, '绥芬河', 'sui fen he', 'sufh', '绥芬河市', NULL, NULL, '');
INSERT INTO `districts` VALUES (231083, 2310, 2, '海林', 'hai lin', 'hal', '海林市', NULL, NULL, '');
INSERT INTO `districts` VALUES (231084, 2310, 2, '宁安', 'ning an', 'nia', '宁安市', NULL, NULL, '');
INSERT INTO `districts` VALUES (231085, 2310, 2, '穆棱', 'mu ling', 'mul', '穆棱市', NULL, NULL, '');
INSERT INTO `districts` VALUES (231086, 2310, 2, '东宁', 'dong ning', 'don', '东宁市', NULL, NULL, '');
INSERT INTO `districts` VALUES (231102, 2311, 2, '爱辉', 'ai hui', 'aih', '爱辉区', NULL, NULL, '');
INSERT INTO `districts` VALUES (231121, 2311, 2, '嫩江', 'nen jiang', 'nej', '嫩江县', NULL, NULL, '');
INSERT INTO `districts` VALUES (231123, 2311, 2, '逊克', 'xun ke', 'xuk', '逊克县', NULL, NULL, '');
INSERT INTO `districts` VALUES (231124, 2311, 2, '孙吴', 'sun wu', 'suw', '孙吴县', NULL, NULL, '');
INSERT INTO `districts` VALUES (231181, 2311, 2, '北安', 'bei an', 'bea', '北安市', NULL, NULL, '');
INSERT INTO `districts` VALUES (231182, 2311, 2, '五大连池', 'wu da lian chi', 'wudl', '五大连池市', NULL, NULL, '');
INSERT INTO `districts` VALUES (231202, 2312, 2, '北林', 'bei lin', 'bel', '北林区', NULL, NULL, '');
INSERT INTO `districts` VALUES (231221, 2312, 2, '望奎', 'wang kui', 'wak', '望奎县', NULL, NULL, '');
INSERT INTO `districts` VALUES (231222, 2312, 2, '兰西', 'lan xi', 'lax', '兰西县', NULL, NULL, '');
INSERT INTO `districts` VALUES (231223, 2312, 2, '青冈', 'qing gang', 'qig', '青冈县', NULL, NULL, '');
INSERT INTO `districts` VALUES (231224, 2312, 2, '庆安', 'qing an', 'qia', '庆安县', NULL, NULL, '');
INSERT INTO `districts` VALUES (231225, 2312, 2, '明水', 'ming shui', 'mis', '明水县', NULL, NULL, '');
INSERT INTO `districts` VALUES (231226, 2312, 2, '绥棱', 'sui ling', 'sul', '绥棱县', NULL, NULL, '');
INSERT INTO `districts` VALUES (231281, 2312, 2, '安达', 'an da', 'and', '安达市', NULL, NULL, '');
INSERT INTO `districts` VALUES (231282, 2312, 2, '肇东', 'zhao dong', 'zhd', '肇东市', NULL, NULL, '');
INSERT INTO `districts` VALUES (231283, 2312, 2, '海伦', 'hai lun', 'hal', '海伦市', NULL, NULL, '');
INSERT INTO `districts` VALUES (232701, 2327, 2, '加格达奇', 'jia ge da qi', 'jigd', '加格达奇区', NULL, NULL, '');
INSERT INTO `districts` VALUES (232702, 2327, 2, '松岭', 'song ling', 'sol', '松岭区', NULL, NULL, '');
INSERT INTO `districts` VALUES (232703, 2327, 2, '新林', 'xin lin', 'xil', '新林区', NULL, NULL, '');
INSERT INTO `districts` VALUES (232704, 2327, 2, '呼中', 'hu zhong', 'huz', '呼中区', NULL, NULL, '');
INSERT INTO `districts` VALUES (232721, 2327, 2, '呼玛', 'hu ma', 'hum', '呼玛县', NULL, NULL, '');
INSERT INTO `districts` VALUES (232722, 2327, 2, '塔河', 'ta he', 'tah', '塔河县', NULL, NULL, '');
INSERT INTO `districts` VALUES (232723, 2327, 2, '漠河', 'mo he', 'moh', '漠河县', NULL, NULL, '');
INSERT INTO `districts` VALUES (310101, 3101, 2, '黄浦', 'huang pu', 'hup', '黄浦区', NULL, NULL, '');
INSERT INTO `districts` VALUES (310104, 3101, 2, '徐汇', 'xu hui', 'xuh', '徐汇区', NULL, NULL, '');
INSERT INTO `districts` VALUES (310105, 3101, 2, '长宁', 'chang ning', 'chn', '长宁区', NULL, NULL, '');
INSERT INTO `districts` VALUES (310106, 3101, 2, '静安', 'jing an', 'jia', '静安区', NULL, NULL, '');
INSERT INTO `districts` VALUES (310107, 3101, 2, '普陀', 'pu tuo', 'put', '普陀区', NULL, NULL, '');
INSERT INTO `districts` VALUES (310109, 3101, 2, '虹口', 'hong kou', 'hok', '虹口区', NULL, NULL, '');
INSERT INTO `districts` VALUES (310110, 3101, 2, '杨浦', 'yang pu', 'yap', '杨浦区', NULL, NULL, '');
INSERT INTO `districts` VALUES (310112, 3101, 2, '闵行', 'min hang', 'mih', '闵行区', NULL, NULL, '');
INSERT INTO `districts` VALUES (310113, 3101, 2, '宝山', 'bao shan', 'bas', '宝山区', NULL, NULL, '');
INSERT INTO `districts` VALUES (310114, 3101, 2, '嘉定', 'jia ding', 'jid', '嘉定区', NULL, NULL, '');
INSERT INTO `districts` VALUES (310115, 3101, 2, '浦东新区', 'pu dong xin qu', 'pudx', '浦东新区', NULL, NULL, '');
INSERT INTO `districts` VALUES (310116, 3101, 2, '金山', 'jin shan', 'jis', '金山区', NULL, NULL, '');
INSERT INTO `districts` VALUES (310117, 3101, 2, '松江', 'song jiang', 'soj', '松江区', NULL, NULL, '');
INSERT INTO `districts` VALUES (310118, 3101, 2, '青浦', 'qing pu', 'qip', '青浦区', NULL, NULL, '');
INSERT INTO `districts` VALUES (310120, 3101, 2, '奉贤', 'feng xian', 'fex', '奉贤区', NULL, NULL, '');
INSERT INTO `districts` VALUES (310151, 3101, 2, '崇明', 'chong ming', 'chm', '崇明区', NULL, NULL, '');
INSERT INTO `districts` VALUES (320102, 3201, 2, '玄武', 'xuan wu', 'xuw', '玄武区', NULL, NULL, '');
INSERT INTO `districts` VALUES (320104, 3201, 2, '秦淮', 'qin huai', 'qih', '秦淮区', NULL, NULL, '');
INSERT INTO `districts` VALUES (320105, 3201, 2, '建邺', 'jian ye', 'jiy', '建邺区', NULL, NULL, '');
INSERT INTO `districts` VALUES (320106, 3201, 2, '鼓楼', 'gu lou', 'gul', '鼓楼区', NULL, NULL, '');
INSERT INTO `districts` VALUES (320111, 3201, 2, '浦口', 'pu kou', 'puk', '浦口区', NULL, NULL, '');
INSERT INTO `districts` VALUES (320113, 3201, 2, '栖霞', 'qi xia', 'qix', '栖霞区', NULL, NULL, '');
INSERT INTO `districts` VALUES (320114, 3201, 2, '雨花台', 'yu hua tai', 'yuht', '雨花台区', NULL, NULL, '');
INSERT INTO `districts` VALUES (320115, 3201, 2, '江宁', 'jiang ning', 'jin', '江宁区', NULL, NULL, '');
INSERT INTO `districts` VALUES (320116, 3201, 2, '六合', 'liu he', 'lih', '六合区', NULL, NULL, '');
INSERT INTO `districts` VALUES (320117, 3201, 2, '溧水', 'li shui', 'lis', '溧水区', NULL, NULL, '');
INSERT INTO `districts` VALUES (320118, 3201, 2, '高淳', 'gao chun', 'gac', '高淳区', NULL, NULL, '');
INSERT INTO `districts` VALUES (320205, 3202, 2, '锡山', 'xi shan', 'xis', '锡山区', NULL, NULL, '');
INSERT INTO `districts` VALUES (320206, 3202, 2, '惠山', 'hui shan', 'hus', '惠山区', NULL, NULL, '');
INSERT INTO `districts` VALUES (320211, 3202, 2, '滨湖', 'bin hu', 'bih', '滨湖区', NULL, NULL, '');
INSERT INTO `districts` VALUES (320213, 3202, 2, '梁溪', 'liang xi', 'lix', '梁溪区', NULL, NULL, '');
INSERT INTO `districts` VALUES (320214, 3202, 2, '新吴', 'xin wu', 'xiw', '新吴区', NULL, NULL, '');
INSERT INTO `districts` VALUES (320281, 3202, 2, '江阴', 'jiang yin', 'jiy', '江阴市', NULL, NULL, '');
INSERT INTO `districts` VALUES (320282, 3202, 2, '宜兴', 'yi xing', 'yix', '宜兴市', NULL, NULL, '');
INSERT INTO `districts` VALUES (320302, 3203, 2, '鼓楼', 'gu lou', 'gul', '鼓楼区', NULL, NULL, '');
INSERT INTO `districts` VALUES (320303, 3203, 2, '云龙', 'yun long', 'yul', '云龙区', NULL, NULL, '');
INSERT INTO `districts` VALUES (320305, 3203, 2, '贾汪', 'jia wang', 'jiw', '贾汪区', NULL, NULL, '');
INSERT INTO `districts` VALUES (320311, 3203, 2, '泉山', 'quan shan', 'qus', '泉山区', NULL, NULL, '');
INSERT INTO `districts` VALUES (320312, 3203, 2, '铜山', 'tong shan', 'tos', '铜山区', NULL, NULL, '');
INSERT INTO `districts` VALUES (320321, 3203, 2, '丰县', 'feng xian', 'fex', '丰县', NULL, NULL, '');
INSERT INTO `districts` VALUES (320322, 3203, 2, '沛县', 'pei xian', 'pex', '沛县', NULL, NULL, '');
INSERT INTO `districts` VALUES (320324, 3203, 2, '睢宁', 'sui ning', 'sun', '睢宁县', NULL, NULL, '');
INSERT INTO `districts` VALUES (320371, 3203, 2, '徐州经济技术开发区', 'xu zhou jing ji ji shu kai fa qu', 'xuzj', '徐州经济技术开发区', NULL, NULL, '');
INSERT INTO `districts` VALUES (320381, 3203, 2, '新沂', 'xin yi', 'xiy', '新沂市', NULL, NULL, '');
INSERT INTO `districts` VALUES (320382, 3203, 2, '邳州', 'pi zhou', 'piz', '邳州市', NULL, NULL, '');
INSERT INTO `districts` VALUES (320402, 3204, 2, '天宁', 'tian ning', 'tin', '天宁区', NULL, NULL, '');
INSERT INTO `districts` VALUES (320404, 3204, 2, '钟楼', 'zhong lou', 'zhl', '钟楼区', NULL, NULL, '');
INSERT INTO `districts` VALUES (320411, 3204, 2, '新北', 'xin bei', 'xib', '新北区', NULL, NULL, '');
INSERT INTO `districts` VALUES (320412, 3204, 2, '武进', 'wu jin', 'wuj', '武进区', NULL, NULL, '');
INSERT INTO `districts` VALUES (320413, 3204, 2, '金坛', 'jin tan', 'jit', '金坛区', NULL, NULL, '');
INSERT INTO `districts` VALUES (320481, 3204, 2, '溧阳', 'li yang', 'liy', '溧阳市', NULL, NULL, '');
INSERT INTO `districts` VALUES (320505, 3205, 2, '虎丘', 'hu qiu', 'huq', '虎丘区', NULL, NULL, '');
INSERT INTO `districts` VALUES (320506, 3205, 2, '吴中', 'wu zhong', 'wuz', '吴中区', NULL, NULL, '');
INSERT INTO `districts` VALUES (320507, 3205, 2, '相城', 'xiang cheng', 'xic', '相城区', NULL, NULL, '');
INSERT INTO `districts` VALUES (320508, 3205, 2, '姑苏', 'gu su', 'gus', '姑苏区', NULL, NULL, '');
INSERT INTO `districts` VALUES (320509, 3205, 2, '吴江', 'wu jiang', 'wuj', '吴江区', NULL, NULL, '');
INSERT INTO `districts` VALUES (320571, 3205, 2, '苏州工业园', 'su zhou gong ye yuan', 'suzg', '苏州工业园区', NULL, NULL, '');
INSERT INTO `districts` VALUES (320581, 3205, 2, '常熟', 'chang shu', 'chs', '常熟市', NULL, NULL, '');
INSERT INTO `districts` VALUES (320582, 3205, 2, '张家港', 'zhang jia gang', 'zhjg', '张家港市', NULL, NULL, '');
INSERT INTO `districts` VALUES (320583, 3205, 2, '昆山', 'kun shan', 'kus', '昆山市', NULL, NULL, '');
INSERT INTO `districts` VALUES (320585, 3205, 2, '太仓', 'tai cang', 'tac', '太仓市', NULL, NULL, '');
INSERT INTO `districts` VALUES (320602, 3206, 2, '崇川', 'chong chuan', 'chc', '崇川区', NULL, NULL, '');
INSERT INTO `districts` VALUES (320611, 3206, 2, '港闸', 'gang zha', 'gaz', '港闸区', NULL, NULL, '');
INSERT INTO `districts` VALUES (320612, 3206, 2, '通州', 'tong zhou', 'toz', '通州区', NULL, NULL, '');
INSERT INTO `districts` VALUES (320621, 3206, 2, '海安', 'hai an', 'haa', '海安县', NULL, NULL, '');
INSERT INTO `districts` VALUES (320623, 3206, 2, '如东', 'ru dong', 'rud', '如东县', NULL, NULL, '');
INSERT INTO `districts` VALUES (320671, 3206, 2, '南通经济技术开发区', 'nan tong jing ji ji shu kai fa qu', 'natj', '南通经济技术开发区', NULL, NULL, '');
INSERT INTO `districts` VALUES (320681, 3206, 2, '启东', 'qi dong', 'qid', '启东市', NULL, NULL, '');
INSERT INTO `districts` VALUES (320682, 3206, 2, '如皋', 'ru gao', 'rug', '如皋市', NULL, NULL, '');
INSERT INTO `districts` VALUES (320684, 3206, 2, '海门', 'hai men', 'ham', '海门市', NULL, NULL, '');
INSERT INTO `districts` VALUES (320703, 3207, 2, '连云', 'lian yun', 'liy', '连云区', NULL, NULL, '');
INSERT INTO `districts` VALUES (320706, 3207, 2, '海州', 'hai zhou', 'haz', '海州区', NULL, NULL, '');
INSERT INTO `districts` VALUES (320707, 3207, 2, '赣榆', 'gan yu', 'gay', '赣榆区', NULL, NULL, '');
INSERT INTO `districts` VALUES (320722, 3207, 2, '东海', 'dong hai', 'doh', '东海县', NULL, NULL, '');
INSERT INTO `districts` VALUES (320723, 3207, 2, '灌云', 'guan yun', 'guy', '灌云县', NULL, NULL, '');
INSERT INTO `districts` VALUES (320724, 3207, 2, '灌南', 'guan nan', 'gun', '灌南县', NULL, NULL, '');
INSERT INTO `districts` VALUES (320771, 3207, 2, '连云港经济技术开发区', 'lian yun gang jing ji ji shu kai fa qu', 'liyg', '连云港经济技术开发区', NULL, NULL, '');
INSERT INTO `districts` VALUES (320772, 3207, 2, '连云港高新技术产业开发区', 'lian yun gang gao xin ji shu chan ye kai fa qu', 'liyg', '连云港高新技术产业开发区', NULL, NULL, '');
INSERT INTO `districts` VALUES (320803, 3208, 2, '淮安', 'huai an', 'hua', '淮安区', NULL, NULL, '');
INSERT INTO `districts` VALUES (320804, 3208, 2, '淮阴', 'huai yin', 'huy', '淮阴区', NULL, NULL, '');
INSERT INTO `districts` VALUES (320812, 3208, 2, '清江浦', 'qing jiang pu', 'qijp', '清江浦区', NULL, NULL, '');
INSERT INTO `districts` VALUES (320813, 3208, 2, '洪泽', 'hong ze', 'hoz', '洪泽区', NULL, NULL, '');
INSERT INTO `districts` VALUES (320826, 3208, 2, '涟水', 'lian shui', 'lis', '涟水县', NULL, NULL, '');
INSERT INTO `districts` VALUES (320830, 3208, 2, '盱眙', 'xu yi', 'xuy', '盱眙县', NULL, NULL, '');
INSERT INTO `districts` VALUES (320831, 3208, 2, '金湖', 'jin hu', 'jih', '金湖县', NULL, NULL, '');
INSERT INTO `districts` VALUES (320871, 3208, 2, '淮安经济技术开发区', 'huai an jing ji ji shu kai fa qu', 'huaj', '淮安经济技术开发区', NULL, NULL, '');
INSERT INTO `districts` VALUES (320902, 3209, 2, '亭湖', 'ting hu', 'tih', '亭湖区', NULL, NULL, '');
INSERT INTO `districts` VALUES (320903, 3209, 2, '盐都', 'yan du', 'yad', '盐都区', NULL, NULL, '');
INSERT INTO `districts` VALUES (320904, 3209, 2, '大丰', 'da feng', 'daf', '大丰区', NULL, NULL, '');
INSERT INTO `districts` VALUES (320921, 3209, 2, '响水', 'xiang shui', 'xis', '响水县', NULL, NULL, '');
INSERT INTO `districts` VALUES (320922, 3209, 2, '滨海', 'bin hai', 'bih', '滨海县', NULL, NULL, '');
INSERT INTO `districts` VALUES (320923, 3209, 2, '阜宁', 'fu ning', 'fun', '阜宁县', NULL, NULL, '');
INSERT INTO `districts` VALUES (320924, 3209, 2, '射阳', 'she yang', 'shy', '射阳县', NULL, NULL, '');
INSERT INTO `districts` VALUES (320925, 3209, 2, '建湖', 'jian hu', 'jih', '建湖县', NULL, NULL, '');
INSERT INTO `districts` VALUES (320971, 3209, 2, '盐城经济技术开发区', 'yan cheng jing ji ji shu kai fa qu', 'yacj', '盐城经济技术开发区', NULL, NULL, '');
INSERT INTO `districts` VALUES (320981, 3209, 2, '东台', 'dong tai', 'dot', '东台市', NULL, NULL, '');
INSERT INTO `districts` VALUES (321002, 3210, 2, '广陵', 'guang ling', 'gul', '广陵区', NULL, NULL, '');
INSERT INTO `districts` VALUES (321003, 3210, 2, '邗江', 'han jiang', 'haj', '邗江区', NULL, NULL, '');
INSERT INTO `districts` VALUES (321012, 3210, 2, '江都', 'jiang du', 'jid', '江都区', NULL, NULL, '');
INSERT INTO `districts` VALUES (321023, 3210, 2, '宝应', 'bao ying', 'bay', '宝应县', NULL, NULL, '');
INSERT INTO `districts` VALUES (321071, 3210, 2, '扬州经济技术开发区', 'yang zhou jing ji ji shu kai fa qu', 'yazj', '扬州经济技术开发区', NULL, NULL, '');
INSERT INTO `districts` VALUES (321081, 3210, 2, '仪征', 'yi zheng', 'yiz', '仪征市', NULL, NULL, '');
INSERT INTO `districts` VALUES (321084, 3210, 2, '高邮', 'gao you', 'gay', '高邮市', NULL, NULL, '');
INSERT INTO `districts` VALUES (321102, 3211, 2, '京口', 'jing kou', 'jik', '京口区', NULL, NULL, '');
INSERT INTO `districts` VALUES (321111, 3211, 2, '润州', 'run zhou', 'ruz', '润州区', NULL, NULL, '');
INSERT INTO `districts` VALUES (321112, 3211, 2, '丹徒', 'dan tu', 'dat', '丹徒区', NULL, NULL, '');
INSERT INTO `districts` VALUES (321171, 3211, 2, '镇江新区', 'zhen jiang xin qu', 'zhjx', '镇江新区', NULL, NULL, '');
INSERT INTO `districts` VALUES (321181, 3211, 2, '丹阳', 'dan yang', 'day', '丹阳市', NULL, NULL, '');
INSERT INTO `districts` VALUES (321182, 3211, 2, '扬中', 'yang zhong', 'yaz', '扬中市', NULL, NULL, '');
INSERT INTO `districts` VALUES (321183, 3211, 2, '句容', 'ju rong', 'jur', '句容市', NULL, NULL, '');
INSERT INTO `districts` VALUES (321202, 3212, 2, '海陵', 'hai ling', 'hal', '海陵区', NULL, NULL, '');
INSERT INTO `districts` VALUES (321203, 3212, 2, '高港', 'gao gang', 'gag', '高港区', NULL, NULL, '');
INSERT INTO `districts` VALUES (321204, 3212, 2, '姜堰', 'jiang yan', 'jiy', '姜堰区', NULL, NULL, '');
INSERT INTO `districts` VALUES (321271, 3212, 2, '泰州医药高新技术产业开发区', 'tai zhou yi yao gao xin ji shu chan ye kai fa qu', 'tazy', '泰州医药高新技术产业开发区', NULL, NULL, '');
INSERT INTO `districts` VALUES (321281, 3212, 2, '兴化', 'xing hua', 'xih', '兴化市', NULL, NULL, '');
INSERT INTO `districts` VALUES (321282, 3212, 2, '靖江', 'jing jiang', 'jij', '靖江市', NULL, NULL, '');
INSERT INTO `districts` VALUES (321283, 3212, 2, '泰兴', 'tai xing', 'tax', '泰兴市', NULL, NULL, '');
INSERT INTO `districts` VALUES (321302, 3213, 2, '宿城', 'su cheng', 'suc', '宿城区', NULL, NULL, '');
INSERT INTO `districts` VALUES (321311, 3213, 2, '宿豫', 'su yu', 'suy', '宿豫区', NULL, NULL, '');
INSERT INTO `districts` VALUES (321322, 3213, 2, '沭阳', 'shu yang', 'shy', '沭阳县', NULL, NULL, '');
INSERT INTO `districts` VALUES (321323, 3213, 2, '泗阳', 'si yang', 'siy', '泗阳县', NULL, NULL, '');
INSERT INTO `districts` VALUES (321324, 3213, 2, '泗洪', 'si hong', 'sih', '泗洪县', NULL, NULL, '');
INSERT INTO `districts` VALUES (321371, 3213, 2, '宿迁经济技术开发区', 'su qian jing ji ji shu kai fa qu', 'suqj', '宿迁经济技术开发区', NULL, NULL, '');
INSERT INTO `districts` VALUES (330102, 3301, 2, '上城', 'shang cheng', 'shc', '上城区', NULL, NULL, '');
INSERT INTO `districts` VALUES (330103, 3301, 2, '下城', 'xia cheng', 'xic', '下城区', NULL, NULL, '');
INSERT INTO `districts` VALUES (330104, 3301, 2, '江干', 'jiang gan', 'jig', '江干区', NULL, NULL, '');
INSERT INTO `districts` VALUES (330105, 3301, 2, '拱墅', 'gong shu', 'gos', '拱墅区', NULL, NULL, '');
INSERT INTO `districts` VALUES (330106, 3301, 2, '西湖', 'xi hu', 'xih', '西湖区', NULL, NULL, '');
INSERT INTO `districts` VALUES (330108, 3301, 2, '滨江', 'bin jiang', 'bij', '滨江区', NULL, NULL, '');
INSERT INTO `districts` VALUES (330109, 3301, 2, '萧山', 'xiao shan', 'xis', '萧山区', NULL, NULL, '');
INSERT INTO `districts` VALUES (330110, 3301, 2, '余杭', 'yu hang', 'yuh', '余杭区', NULL, NULL, '');
INSERT INTO `districts` VALUES (330111, 3301, 2, '富阳', 'fu yang', 'fuy', '富阳区', NULL, NULL, '');
INSERT INTO `districts` VALUES (330112, 3301, 2, '临安', 'lin an', 'lia', '临安区', NULL, NULL, '');
INSERT INTO `districts` VALUES (330122, 3301, 2, '桐庐', 'tong lu', 'tol', '桐庐县', NULL, NULL, '');
INSERT INTO `districts` VALUES (330127, 3301, 2, '淳安', 'chun an', 'cha', '淳安县', NULL, NULL, '');
INSERT INTO `districts` VALUES (330182, 3301, 2, '建德', 'jian de', 'jid', '建德市', NULL, NULL, '');
INSERT INTO `districts` VALUES (330203, 3302, 2, '海曙', 'hai shu', 'has', '海曙区', NULL, NULL, '');
INSERT INTO `districts` VALUES (330205, 3302, 2, '江北', 'jiang bei', 'jib', '江北区', NULL, NULL, '');
INSERT INTO `districts` VALUES (330206, 3302, 2, '北仑', 'bei lun', 'bel', '北仑区', NULL, NULL, '');
INSERT INTO `districts` VALUES (330211, 3302, 2, '镇海', 'zhen hai', 'zhh', '镇海区', NULL, NULL, '');
INSERT INTO `districts` VALUES (330212, 3302, 2, '鄞州', 'yin zhou', 'yiz', '鄞州区', NULL, NULL, '');
INSERT INTO `districts` VALUES (330213, 3302, 2, '奉化', 'feng hua', 'feh', '奉化区', NULL, NULL, '');
INSERT INTO `districts` VALUES (330225, 3302, 2, '象山', 'xiang shan', 'xis', '象山县', NULL, NULL, '');
INSERT INTO `districts` VALUES (330226, 3302, 2, '宁海', 'ning hai', 'nih', '宁海县', NULL, NULL, '');
INSERT INTO `districts` VALUES (330281, 3302, 2, '余姚', 'yu yao', 'yuy', '余姚市', NULL, NULL, '');
INSERT INTO `districts` VALUES (330282, 3302, 2, '慈溪', 'ci xi', 'cix', '慈溪市', NULL, NULL, '');
INSERT INTO `districts` VALUES (330302, 3303, 2, '鹿城', 'lu cheng', 'luc', '鹿城区', NULL, NULL, '');
INSERT INTO `districts` VALUES (330303, 3303, 2, '龙湾', 'long wan', 'low', '龙湾区', NULL, NULL, '');
INSERT INTO `districts` VALUES (330304, 3303, 2, '瓯海', 'ou hai', 'ouh', '瓯海区', NULL, NULL, '');
INSERT INTO `districts` VALUES (330305, 3303, 2, '洞头', 'dong tou', 'dot', '洞头区', NULL, NULL, '');
INSERT INTO `districts` VALUES (330324, 3303, 2, '永嘉', 'yong jia', 'yoj', '永嘉县', NULL, NULL, '');
INSERT INTO `districts` VALUES (330326, 3303, 2, '平阳', 'ping yang', 'piy', '平阳县', NULL, NULL, '');
INSERT INTO `districts` VALUES (330327, 3303, 2, '苍南', 'cang nan', 'can', '苍南县', NULL, NULL, '');
INSERT INTO `districts` VALUES (330328, 3303, 2, '文成', 'wen cheng', 'wec', '文成县', NULL, NULL, '');
INSERT INTO `districts` VALUES (330329, 3303, 2, '泰顺', 'tai shun', 'tas', '泰顺县', NULL, NULL, '');
INSERT INTO `districts` VALUES (330371, 3303, 2, '温州经济技术开发区', 'wen zhou jing ji ji shu kai fa qu', 'wezj', '温州经济技术开发区', NULL, NULL, '');
INSERT INTO `districts` VALUES (330381, 3303, 2, '瑞安', 'rui an', 'rua', '瑞安市', NULL, NULL, '');
INSERT INTO `districts` VALUES (330382, 3303, 2, '乐清', 'yue qing', 'yuq', '乐清市', NULL, NULL, '');
INSERT INTO `districts` VALUES (330402, 3304, 2, '南湖', 'nan hu', 'nah', '南湖区', NULL, NULL, '');
INSERT INTO `districts` VALUES (330411, 3304, 2, '秀洲', 'xiu zhou', 'xiz', '秀洲区', NULL, NULL, '');
INSERT INTO `districts` VALUES (330421, 3304, 2, '嘉善', 'jia shan', 'jis', '嘉善县', NULL, NULL, '');
INSERT INTO `districts` VALUES (330424, 3304, 2, '海盐', 'hai yan', 'hay', '海盐县', NULL, NULL, '');
INSERT INTO `districts` VALUES (330481, 3304, 2, '海宁', 'hai ning', 'han', '海宁市', NULL, NULL, '');
INSERT INTO `districts` VALUES (330482, 3304, 2, '平湖', 'ping hu', 'pih', '平湖市', NULL, NULL, '');
INSERT INTO `districts` VALUES (330483, 3304, 2, '桐乡', 'tong xiang', 'tox', '桐乡市', NULL, NULL, '');
INSERT INTO `districts` VALUES (330502, 3305, 2, '吴兴', 'wu xing', 'wux', '吴兴区', NULL, NULL, '');
INSERT INTO `districts` VALUES (330503, 3305, 2, '南浔', 'nan xun', 'nax', '南浔区', NULL, NULL, '');
INSERT INTO `districts` VALUES (330521, 3305, 2, '德清', 'de qing', 'deq', '德清县', NULL, NULL, '');
INSERT INTO `districts` VALUES (330522, 3305, 2, '长兴', 'chang xing', 'chx', '长兴县', NULL, NULL, '');
INSERT INTO `districts` VALUES (330523, 3305, 2, '安吉', 'an ji', 'anj', '安吉县', NULL, NULL, '');
INSERT INTO `districts` VALUES (330602, 3306, 2, '越城', 'yue cheng', 'yuc', '越城区', NULL, NULL, '');
INSERT INTO `districts` VALUES (330603, 3306, 2, '柯桥', 'ke qiao', 'keq', '柯桥区', NULL, NULL, '');
INSERT INTO `districts` VALUES (330604, 3306, 2, '上虞', 'shang yu', 'shy', '上虞区', NULL, NULL, '');
INSERT INTO `districts` VALUES (330624, 3306, 2, '新昌', 'xin chang', 'xic', '新昌县', NULL, NULL, '');
INSERT INTO `districts` VALUES (330681, 3306, 2, '诸暨', 'zhu ji', 'zhj', '诸暨市', NULL, NULL, '');
INSERT INTO `districts` VALUES (330683, 3306, 2, '嵊州', 'sheng zhou', 'shz', '嵊州市', NULL, NULL, '');
INSERT INTO `districts` VALUES (330702, 3307, 2, '婺城', 'wu cheng', 'wuc', '婺城区', NULL, NULL, '');
INSERT INTO `districts` VALUES (330703, 3307, 2, '金东', 'jin dong', 'jid', '金东区', NULL, NULL, '');
INSERT INTO `districts` VALUES (330723, 3307, 2, '武义', 'wu yi', 'wuy', '武义县', NULL, NULL, '');
INSERT INTO `districts` VALUES (330726, 3307, 2, '浦江', 'pu jiang', 'puj', '浦江县', NULL, NULL, '');
INSERT INTO `districts` VALUES (330727, 3307, 2, '磐安', 'pan an', 'paa', '磐安县', NULL, NULL, '');
INSERT INTO `districts` VALUES (330781, 3307, 2, '兰溪', 'lan xi', 'lax', '兰溪市', NULL, NULL, '');
INSERT INTO `districts` VALUES (330782, 3307, 2, '义乌', 'yi wu', 'yiw', '义乌市', NULL, NULL, '');
INSERT INTO `districts` VALUES (330783, 3307, 2, '东阳', 'dong yang', 'doy', '东阳市', NULL, NULL, '');
INSERT INTO `districts` VALUES (330784, 3307, 2, '永康', 'yong kang', 'yok', '永康市', NULL, NULL, '');
INSERT INTO `districts` VALUES (330802, 3308, 2, '柯城', 'ke cheng', 'kec', '柯城区', NULL, NULL, '');
INSERT INTO `districts` VALUES (330803, 3308, 2, '衢江', 'qu jiang', 'quj', '衢江区', NULL, NULL, '');
INSERT INTO `districts` VALUES (330822, 3308, 2, '常山', 'chang shan', 'chs', '常山县', NULL, NULL, '');
INSERT INTO `districts` VALUES (330824, 3308, 2, '开化', 'kai hua', 'kah', '开化县', NULL, NULL, '');
INSERT INTO `districts` VALUES (330825, 3308, 2, '龙游', 'long you', 'loy', '龙游县', NULL, NULL, '');
INSERT INTO `districts` VALUES (330881, 3308, 2, '江山', 'jiang shan', 'jis', '江山市', NULL, NULL, '');
INSERT INTO `districts` VALUES (330902, 3309, 2, '定海', 'ding hai', 'dih', '定海区', NULL, NULL, '');
INSERT INTO `districts` VALUES (330903, 3309, 2, '普陀', 'pu tuo', 'put', '普陀区', NULL, NULL, '');
INSERT INTO `districts` VALUES (330921, 3309, 2, '岱山', 'dai shan', 'das', '岱山县', NULL, NULL, '');
INSERT INTO `districts` VALUES (330922, 3309, 2, '嵊泗', 'sheng si', 'shs', '嵊泗县', NULL, NULL, '');
INSERT INTO `districts` VALUES (331002, 3310, 2, '椒江', 'jiao jiang', 'jij', '椒江区', NULL, NULL, '');
INSERT INTO `districts` VALUES (331003, 3310, 2, '黄岩', 'huang yan', 'huy', '黄岩区', NULL, NULL, '');
INSERT INTO `districts` VALUES (331004, 3310, 2, '路桥', 'lu qiao', 'luq', '路桥区', NULL, NULL, '');
INSERT INTO `districts` VALUES (331022, 3310, 2, '三门', 'san men', 'sam', '三门县', NULL, NULL, '');
INSERT INTO `districts` VALUES (331023, 3310, 2, '天台', 'tian tai', 'tit', '天台县', NULL, NULL, '');
INSERT INTO `districts` VALUES (331024, 3310, 2, '仙居', 'xian ju', 'xij', '仙居县', NULL, NULL, '');
INSERT INTO `districts` VALUES (331081, 3310, 2, '温岭', 'wen ling', 'wel', '温岭市', NULL, NULL, '');
INSERT INTO `districts` VALUES (331082, 3310, 2, '临海', 'lin hai', 'lih', '临海市', NULL, NULL, '');
INSERT INTO `districts` VALUES (331083, 3310, 2, '玉环', 'yu huan', 'yuh', '玉环市', NULL, NULL, '');
INSERT INTO `districts` VALUES (331102, 3311, 2, '莲都', 'lian du', 'lid', '莲都区', NULL, NULL, '');
INSERT INTO `districts` VALUES (331121, 3311, 2, '青田', 'qing tian', 'qit', '青田县', NULL, NULL, '');
INSERT INTO `districts` VALUES (331122, 3311, 2, '缙云', 'jin yun', 'jiy', '缙云县', NULL, NULL, '');
INSERT INTO `districts` VALUES (331123, 3311, 2, '遂昌', 'sui chang', 'suc', '遂昌县', NULL, NULL, '');
INSERT INTO `districts` VALUES (331124, 3311, 2, '松阳', 'song yang', 'soy', '松阳县', NULL, NULL, '');
INSERT INTO `districts` VALUES (331125, 3311, 2, '云和', 'yun he', 'yuh', '云和县', NULL, NULL, '');
INSERT INTO `districts` VALUES (331126, 3311, 2, '庆元', 'qing yuan', 'qiy', '庆元县', NULL, NULL, '');
INSERT INTO `districts` VALUES (331127, 3311, 2, '景宁畲族自治县', 'jing ning she zu zi zhi xian', 'jins', '景宁畲族自治县', NULL, NULL, '');
INSERT INTO `districts` VALUES (331181, 3311, 2, '龙泉', 'long quan', 'loq', '龙泉市', NULL, NULL, '');
INSERT INTO `districts` VALUES (340102, 3401, 2, '瑶海', 'yao hai', 'yah', '瑶海区', NULL, NULL, '');
INSERT INTO `districts` VALUES (340103, 3401, 2, '庐阳', 'lu yang', 'luy', '庐阳区', NULL, NULL, '');
INSERT INTO `districts` VALUES (340104, 3401, 2, '蜀山', 'shu shan', 'shs', '蜀山区', NULL, NULL, '');
INSERT INTO `districts` VALUES (340111, 3401, 2, '包河', 'bao he', 'bah', '包河区', NULL, NULL, '');
INSERT INTO `districts` VALUES (340121, 3401, 2, '长丰', 'chang feng', 'chf', '长丰县', NULL, NULL, '');
INSERT INTO `districts` VALUES (340122, 3401, 2, '肥东', 'fei dong', 'fed', '肥东县', NULL, NULL, '');
INSERT INTO `districts` VALUES (340123, 3401, 2, '肥西', 'fei xi', 'fex', '肥西县', NULL, NULL, '');
INSERT INTO `districts` VALUES (340124, 3401, 2, '庐江', 'lu jiang', 'luj', '庐江县', NULL, NULL, '');
INSERT INTO `districts` VALUES (340171, 3401, 2, '合肥高新技术产业开发区', 'he fei gao xin ji shu chan ye kai fa qu', 'hefg', '合肥高新技术产业开发区', NULL, NULL, '');
INSERT INTO `districts` VALUES (340172, 3401, 2, '合肥经济技术开发区', 'he fei jing ji ji shu kai fa qu', 'hefj', '合肥经济技术开发区', NULL, NULL, '');
INSERT INTO `districts` VALUES (340173, 3401, 2, '合肥新站高新技术产业开发区', 'he fei xin zhan gao xin ji shu chan ye kai fa qu', 'hefx', '合肥新站高新技术产业开发区', NULL, NULL, '');
INSERT INTO `districts` VALUES (340181, 3401, 2, '巢湖', 'chao hu', 'chh', '巢湖市', NULL, NULL, '');
INSERT INTO `districts` VALUES (340202, 3402, 2, '镜湖', 'jing hu', 'jih', '镜湖区', NULL, NULL, '');
INSERT INTO `districts` VALUES (340203, 3402, 2, '弋江', 'yi jiang', 'yij', '弋江区', NULL, NULL, '');
INSERT INTO `districts` VALUES (340207, 3402, 2, '鸠江', 'jiu jiang', 'jij', '鸠江区', NULL, NULL, '');
INSERT INTO `districts` VALUES (340208, 3402, 2, '三山', 'san shan', 'sas', '三山区', NULL, NULL, '');
INSERT INTO `districts` VALUES (340221, 3402, 2, '芜湖', 'wu hu', 'wuh', '芜湖县', NULL, NULL, '');
INSERT INTO `districts` VALUES (340222, 3402, 2, '繁昌', 'fan chang', 'fac', '繁昌县', NULL, NULL, '');
INSERT INTO `districts` VALUES (340223, 3402, 2, '南陵', 'nan ling', 'nal', '南陵县', NULL, NULL, '');
INSERT INTO `districts` VALUES (340225, 3402, 2, '无为', 'wu wei', 'wuw', '无为县', NULL, NULL, '');
INSERT INTO `districts` VALUES (340271, 3402, 2, '芜湖经济技术开发区', 'wu hu jing ji ji shu kai fa qu', 'wuhj', '芜湖经济技术开发区', NULL, NULL, '');
INSERT INTO `districts` VALUES (340272, 3402, 2, '安徽芜湖长江大桥经济开发区', 'an hui wu hu chang jiang da qiao jing ji kai fa qu', 'anhw', '安徽芜湖长江大桥经济开发区', NULL, NULL, '');
INSERT INTO `districts` VALUES (340302, 3403, 2, '龙子湖', 'long zi hu', 'lozh', '龙子湖区', NULL, NULL, '');
INSERT INTO `districts` VALUES (340303, 3403, 2, '蚌山', 'beng shan', 'bes', '蚌山区', NULL, NULL, '');
INSERT INTO `districts` VALUES (340304, 3403, 2, '禹会', 'yu hui', 'yuh', '禹会区', NULL, NULL, '');
INSERT INTO `districts` VALUES (340311, 3403, 2, '淮上', 'huai shang', 'hus', '淮上区', NULL, NULL, '');
INSERT INTO `districts` VALUES (340321, 3403, 2, '怀远', 'huai yuan', 'huy', '怀远县', NULL, NULL, '');
INSERT INTO `districts` VALUES (340322, 3403, 2, '五河', 'wu he', 'wuh', '五河县', NULL, NULL, '');
INSERT INTO `districts` VALUES (340323, 3403, 2, '固镇', 'gu zhen', 'guz', '固镇县', NULL, NULL, '');
INSERT INTO `districts` VALUES (340371, 3403, 2, '蚌埠市高新技术开发区', 'beng bu shi gao xin ji shu kai fa qu', 'bebs', '蚌埠市高新技术开发区', NULL, NULL, '');
INSERT INTO `districts` VALUES (340372, 3403, 2, '蚌埠市经济开发区', 'beng bu shi jing ji kai fa qu', 'bebs', '蚌埠市经济开发区', NULL, NULL, '');
INSERT INTO `districts` VALUES (340402, 3404, 2, '大通', 'da tong', 'dat', '大通区', NULL, NULL, '');
INSERT INTO `districts` VALUES (340403, 3404, 2, '田家庵', 'tian jia an', 'tija', '田家庵区', NULL, NULL, '');
INSERT INTO `districts` VALUES (340404, 3404, 2, '谢家集', 'xie jia ji', 'xijj', '谢家集区', NULL, NULL, '');
INSERT INTO `districts` VALUES (340405, 3404, 2, '八公山', 'ba gong shan', 'bags', '八公山区', NULL, NULL, '');
INSERT INTO `districts` VALUES (340406, 3404, 2, '潘集', 'pan ji', 'paj', '潘集区', NULL, NULL, '');
INSERT INTO `districts` VALUES (340421, 3404, 2, '凤台', 'feng tai', 'fet', '凤台县', NULL, NULL, '');
INSERT INTO `districts` VALUES (340422, 3404, 2, '寿县', 'shou xian', 'shx', '寿县', NULL, NULL, '');
INSERT INTO `districts` VALUES (340503, 3405, 2, '花山', 'hua shan', 'hus', '花山区', NULL, NULL, '');
INSERT INTO `districts` VALUES (340504, 3405, 2, '雨山', 'yu shan', 'yus', '雨山区', NULL, NULL, '');
INSERT INTO `districts` VALUES (340506, 3405, 2, '博望', 'bo wang', 'bow', '博望区', NULL, NULL, '');
INSERT INTO `districts` VALUES (340521, 3405, 2, '当涂', 'dang tu', 'dat', '当涂县', NULL, NULL, '');
INSERT INTO `districts` VALUES (340522, 3405, 2, '含山', 'han shan', 'has', '含山县', NULL, NULL, '');
INSERT INTO `districts` VALUES (340523, 3405, 2, '和县', 'he xian', 'hex', '和县', NULL, NULL, '');
INSERT INTO `districts` VALUES (340602, 3406, 2, '杜集', 'du ji', 'duj', '杜集区', NULL, NULL, '');
INSERT INTO `districts` VALUES (340603, 3406, 2, '相山', 'xiang shan', 'xis', '相山区', NULL, NULL, '');
INSERT INTO `districts` VALUES (340604, 3406, 2, '烈山', 'lie shan', 'lis', '烈山区', NULL, NULL, '');
INSERT INTO `districts` VALUES (340621, 3406, 2, '濉溪', 'sui xi', 'sux', '濉溪县', NULL, NULL, '');
INSERT INTO `districts` VALUES (340705, 3407, 2, '铜官', 'tong guan', 'tog', '铜官区', NULL, NULL, '');
INSERT INTO `districts` VALUES (340706, 3407, 2, '义安', 'yi an', 'yia', '义安区', NULL, NULL, '');
INSERT INTO `districts` VALUES (340711, 3407, 2, '郊区', 'jiao qu', 'jiq', '郊区', NULL, NULL, '');
INSERT INTO `districts` VALUES (340722, 3407, 2, '枞阳', 'zong yang', 'zoy', '枞阳县', NULL, NULL, '');
INSERT INTO `districts` VALUES (340802, 3408, 2, '迎江', 'ying jiang', 'yij', '迎江区', NULL, NULL, '');
INSERT INTO `districts` VALUES (340803, 3408, 2, '大观', 'da guan', 'dag', '大观区', NULL, NULL, '');
INSERT INTO `districts` VALUES (340811, 3408, 2, '宜秀', 'yi xiu', 'yix', '宜秀区', NULL, NULL, '');
INSERT INTO `districts` VALUES (340822, 3408, 2, '怀宁', 'huai ning', 'hun', '怀宁县', NULL, NULL, '');
INSERT INTO `districts` VALUES (340824, 3408, 2, '潜山', 'qian shan', 'qis', '潜山县', NULL, NULL, '');
INSERT INTO `districts` VALUES (340825, 3408, 2, '太湖', 'tai hu', 'tah', '太湖县', NULL, NULL, '');
INSERT INTO `districts` VALUES (340826, 3408, 2, '宿松', 'su song', 'sus', '宿松县', NULL, NULL, '');
INSERT INTO `districts` VALUES (340827, 3408, 2, '望江', 'wang jiang', 'waj', '望江县', NULL, NULL, '');
INSERT INTO `districts` VALUES (340828, 3408, 2, '岳西', 'yue xi', 'yux', '岳西县', NULL, NULL, '');
INSERT INTO `districts` VALUES (340871, 3408, 2, '安徽安庆经济开发区', 'an hui an qing jing ji kai fa qu', 'anha', '安徽安庆经济开发区', NULL, NULL, '');
INSERT INTO `districts` VALUES (340881, 3408, 2, '桐城', 'tong cheng', 'toc', '桐城市', NULL, NULL, '');
INSERT INTO `districts` VALUES (341002, 3410, 2, '屯溪', 'tun xi', 'tux', '屯溪区', NULL, NULL, '');
INSERT INTO `districts` VALUES (341003, 3410, 2, '黄山', 'huang shan', 'hus', '黄山区', NULL, NULL, '');
INSERT INTO `districts` VALUES (341004, 3410, 2, '徽州', 'hui zhou', 'huz', '徽州区', NULL, NULL, '');
INSERT INTO `districts` VALUES (341021, 3410, 2, '歙县', 'she xian', 'shx', '歙县', NULL, NULL, '');
INSERT INTO `districts` VALUES (341022, 3410, 2, '休宁', 'xiu ning', 'xin', '休宁县', NULL, NULL, '');
INSERT INTO `districts` VALUES (341023, 3410, 2, '黟县', 'yi xian', 'yix', '黟县', NULL, NULL, '');
INSERT INTO `districts` VALUES (341024, 3410, 2, '祁门', 'qi men', 'qim', '祁门县', NULL, NULL, '');
INSERT INTO `districts` VALUES (341102, 3411, 2, '琅琊', 'lang ya', 'lay', '琅琊区', NULL, NULL, '');
INSERT INTO `districts` VALUES (341103, 3411, 2, '南谯', 'nan qiao', 'naq', '南谯区', NULL, NULL, '');
INSERT INTO `districts` VALUES (341122, 3411, 2, '来安', 'lai an', 'laa', '来安县', NULL, NULL, '');
INSERT INTO `districts` VALUES (341124, 3411, 2, '全椒', 'quan jiao', 'quj', '全椒县', NULL, NULL, '');
INSERT INTO `districts` VALUES (341125, 3411, 2, '定远', 'ding yuan', 'diy', '定远县', NULL, NULL, '');
INSERT INTO `districts` VALUES (341126, 3411, 2, '凤阳', 'feng yang', 'fey', '凤阳县', NULL, NULL, '');
INSERT INTO `districts` VALUES (341171, 3411, 2, '苏滁现代产业园', 'su chu xian dai chan ye yuan', 'sucx', '苏滁现代产业园', NULL, NULL, '');
INSERT INTO `districts` VALUES (341172, 3411, 2, '滁州经济技术开发区', 'chu zhou jing ji ji shu kai fa qu', 'chzj', '滁州经济技术开发区', NULL, NULL, '');
INSERT INTO `districts` VALUES (341181, 3411, 2, '天长', 'tian chang', 'tic', '天长市', NULL, NULL, '');
INSERT INTO `districts` VALUES (341182, 3411, 2, '明光', 'ming guang', 'mig', '明光市', NULL, NULL, '');
INSERT INTO `districts` VALUES (341202, 3412, 2, '颍州', 'ying zhou', 'yiz', '颍州区', NULL, NULL, '');
INSERT INTO `districts` VALUES (341203, 3412, 2, '颍东', 'ying dong', 'yid', '颍东区', NULL, NULL, '');
INSERT INTO `districts` VALUES (341204, 3412, 2, '颍泉', 'ying quan', 'yiq', '颍泉区', NULL, NULL, '');
INSERT INTO `districts` VALUES (341221, 3412, 2, '临泉', 'lin quan', 'liq', '临泉县', NULL, NULL, '');
INSERT INTO `districts` VALUES (341222, 3412, 2, '太和', 'tai he', 'tah', '太和县', NULL, NULL, '');
INSERT INTO `districts` VALUES (341225, 3412, 2, '阜南', 'fu nan', 'fun', '阜南县', NULL, NULL, '');
INSERT INTO `districts` VALUES (341226, 3412, 2, '颍上', 'ying shang', 'yis', '颍上县', NULL, NULL, '');
INSERT INTO `districts` VALUES (341271, 3412, 2, '阜阳合肥现代产业园', 'fu yang he fei xian dai chan ye yuan', 'fuyh', '阜阳合肥现代产业园区', NULL, NULL, '');
INSERT INTO `districts` VALUES (341272, 3412, 2, '阜阳经济技术开发区', 'fu yang jing ji ji shu kai fa qu', 'fuyj', '阜阳经济技术开发区', NULL, NULL, '');
INSERT INTO `districts` VALUES (341282, 3412, 2, '界首', 'jie shou', 'jis', '界首市', NULL, NULL, '');
INSERT INTO `districts` VALUES (341302, 3413, 2, '埇桥', 'yong qiao', 'yoq', '埇桥区', NULL, NULL, '');
INSERT INTO `districts` VALUES (341321, 3413, 2, '砀山', 'dang shan', 'das', '砀山县', NULL, NULL, '');
INSERT INTO `districts` VALUES (341322, 3413, 2, '萧县', 'xiao xian', 'xix', '萧县', NULL, NULL, '');
INSERT INTO `districts` VALUES (341323, 3413, 2, '灵璧', 'ling bi', 'lib', '灵璧县', NULL, NULL, '');
INSERT INTO `districts` VALUES (341324, 3413, 2, '泗县', 'si xian', 'six', '泗县', NULL, NULL, '');
INSERT INTO `districts` VALUES (341371, 3413, 2, '宿州马鞍山现代产业园', 'su zhou ma an shan xian dai chan ye yuan', 'suzm', '宿州马鞍山现代产业园区', NULL, NULL, '');
INSERT INTO `districts` VALUES (341372, 3413, 2, '宿州经济技术开发区', 'su zhou jing ji ji shu kai fa qu', 'suzj', '宿州经济技术开发区', NULL, NULL, '');
INSERT INTO `districts` VALUES (341502, 3415, 2, '金安', 'jin an', 'jia', '金安区', NULL, NULL, '');
INSERT INTO `districts` VALUES (341503, 3415, 2, '裕安', 'yu an', 'yua', '裕安区', NULL, NULL, '');
INSERT INTO `districts` VALUES (341504, 3415, 2, '叶集', 'ye ji', 'yej', '叶集区', NULL, NULL, '');
INSERT INTO `districts` VALUES (341522, 3415, 2, '霍邱', 'huo qiu', 'huq', '霍邱县', NULL, NULL, '');
INSERT INTO `districts` VALUES (341523, 3415, 2, '舒城', 'shu cheng', 'shc', '舒城县', NULL, NULL, '');
INSERT INTO `districts` VALUES (341524, 3415, 2, '金寨', 'jin zhai', 'jiz', '金寨县', NULL, NULL, '');
INSERT INTO `districts` VALUES (341525, 3415, 2, '霍山', 'huo shan', 'hus', '霍山县', NULL, NULL, '');
INSERT INTO `districts` VALUES (341602, 3416, 2, '谯城', 'qiao cheng', 'qic', '谯城区', NULL, NULL, '');
INSERT INTO `districts` VALUES (341621, 3416, 2, '涡阳', 'guo yang', 'guy', '涡阳县', NULL, NULL, '');
INSERT INTO `districts` VALUES (341622, 3416, 2, '蒙城', 'meng cheng', 'mec', '蒙城县', NULL, NULL, '');
INSERT INTO `districts` VALUES (341623, 3416, 2, '利辛', 'li xin', 'lix', '利辛县', NULL, NULL, '');
INSERT INTO `districts` VALUES (341702, 3417, 2, '贵池', 'gui chi', 'guc', '贵池区', NULL, NULL, '');
INSERT INTO `districts` VALUES (341721, 3417, 2, '东至', 'dong zhi', 'doz', '东至县', NULL, NULL, '');
INSERT INTO `districts` VALUES (341722, 3417, 2, '石台', 'shi tai', 'sht', '石台县', NULL, NULL, '');
INSERT INTO `districts` VALUES (341723, 3417, 2, '青阳', 'qing yang', 'qiy', '青阳县', NULL, NULL, '');
INSERT INTO `districts` VALUES (341802, 3418, 2, '宣州', 'xuan zhou', 'xuz', '宣州区', NULL, NULL, '');
INSERT INTO `districts` VALUES (341821, 3418, 2, '郎溪', 'lang xi', 'lax', '郎溪县', NULL, NULL, '');
INSERT INTO `districts` VALUES (341822, 3418, 2, '广德', 'guang de', 'gud', '广德县', NULL, NULL, '');
INSERT INTO `districts` VALUES (341823, 3418, 2, '泾县', 'jing xian', 'jix', '泾县', NULL, NULL, '');
INSERT INTO `districts` VALUES (341824, 3418, 2, '绩溪', 'ji xi', 'jix', '绩溪县', NULL, NULL, '');
INSERT INTO `districts` VALUES (341825, 3418, 2, '旌德', 'jing de', 'jid', '旌德县', NULL, NULL, '');
INSERT INTO `districts` VALUES (341871, 3418, 2, '宣城市经济开发区', 'xuan cheng shi jing ji kai fa qu', 'xucs', '宣城市经济开发区', NULL, NULL, '');
INSERT INTO `districts` VALUES (341881, 3418, 2, '宁国', 'ning guo', 'nig', '宁国市', NULL, NULL, '');
INSERT INTO `districts` VALUES (350102, 3501, 2, '鼓楼', 'gu lou', 'gul', '鼓楼区', NULL, NULL, '');
INSERT INTO `districts` VALUES (350103, 3501, 2, '台江', 'tai jiang', 'taj', '台江区', NULL, NULL, '');
INSERT INTO `districts` VALUES (350104, 3501, 2, '仓山', 'cang shan', 'cas', '仓山区', NULL, NULL, '');
INSERT INTO `districts` VALUES (350105, 3501, 2, '马尾', 'ma wei', 'maw', '马尾区', NULL, NULL, '');
INSERT INTO `districts` VALUES (350111, 3501, 2, '晋安', 'jin an', 'jia', '晋安区', NULL, NULL, '');
INSERT INTO `districts` VALUES (350121, 3501, 2, '闽侯', 'min hou', 'mih', '闽侯县', NULL, NULL, '');
INSERT INTO `districts` VALUES (350122, 3501, 2, '连江', 'lian jiang', 'lij', '连江县', NULL, NULL, '');
INSERT INTO `districts` VALUES (350123, 3501, 2, '罗源', 'luo yuan', 'luy', '罗源县', NULL, NULL, '');
INSERT INTO `districts` VALUES (350124, 3501, 2, '闽清', 'min qing', 'miq', '闽清县', NULL, NULL, '');
INSERT INTO `districts` VALUES (350125, 3501, 2, '永泰', 'yong tai', 'yot', '永泰县', NULL, NULL, '');
INSERT INTO `districts` VALUES (350128, 3501, 2, '平潭', 'ping tan', 'pit', '平潭县', NULL, NULL, '');
INSERT INTO `districts` VALUES (350181, 3501, 2, '福清', 'fu qing', 'fuq', '福清市', NULL, NULL, '');
INSERT INTO `districts` VALUES (350182, 3501, 2, '长乐', 'chang le', 'chl', '长乐市', NULL, NULL, '');
INSERT INTO `districts` VALUES (350203, 3502, 2, '思明', 'si ming', 'sim', '思明区', NULL, NULL, '');
INSERT INTO `districts` VALUES (350205, 3502, 2, '海沧', 'hai cang', 'hac', '海沧区', NULL, NULL, '');
INSERT INTO `districts` VALUES (350206, 3502, 2, '湖里', 'hu li', 'hul', '湖里区', NULL, NULL, '');
INSERT INTO `districts` VALUES (350211, 3502, 2, '集美', 'ji mei', 'jim', '集美区', NULL, NULL, '');
INSERT INTO `districts` VALUES (350212, 3502, 2, '同安', 'tong an', 'toa', '同安区', NULL, NULL, '');
INSERT INTO `districts` VALUES (350213, 3502, 2, '翔安', 'xiang an', 'xia', '翔安区', NULL, NULL, '');
INSERT INTO `districts` VALUES (350302, 3503, 2, '城厢', 'cheng xiang', 'chx', '城厢区', NULL, NULL, '');
INSERT INTO `districts` VALUES (350303, 3503, 2, '涵江', 'han jiang', 'haj', '涵江区', NULL, NULL, '');
INSERT INTO `districts` VALUES (350304, 3503, 2, '荔城', 'li cheng', 'lic', '荔城区', NULL, NULL, '');
INSERT INTO `districts` VALUES (350305, 3503, 2, '秀屿', 'xiu yu', 'xiy', '秀屿区', NULL, NULL, '');
INSERT INTO `districts` VALUES (350322, 3503, 2, '仙游', 'xian you', 'xiy', '仙游县', NULL, NULL, '');
INSERT INTO `districts` VALUES (350402, 3504, 2, '梅列', 'mei lie', 'mel', '梅列区', NULL, NULL, '');
INSERT INTO `districts` VALUES (350403, 3504, 2, '三元', 'san yuan', 'say', '三元区', NULL, NULL, '');
INSERT INTO `districts` VALUES (350421, 3504, 2, '明溪', 'ming xi', 'mix', '明溪县', NULL, NULL, '');
INSERT INTO `districts` VALUES (350423, 3504, 2, '清流', 'qing liu', 'qil', '清流县', NULL, NULL, '');
INSERT INTO `districts` VALUES (350424, 3504, 2, '宁化', 'ning hua', 'nih', '宁化县', NULL, NULL, '');
INSERT INTO `districts` VALUES (350425, 3504, 2, '大田', 'da tian', 'dat', '大田县', NULL, NULL, '');
INSERT INTO `districts` VALUES (350426, 3504, 2, '尤溪', 'you xi', 'yox', '尤溪县', NULL, NULL, '');
INSERT INTO `districts` VALUES (350427, 3504, 2, '沙县', 'sha xian', 'shx', '沙县', NULL, NULL, '');
INSERT INTO `districts` VALUES (350428, 3504, 2, '将乐', 'jiang le', 'jil', '将乐县', NULL, NULL, '');
INSERT INTO `districts` VALUES (350429, 3504, 2, '泰宁', 'tai ning', 'tan', '泰宁县', NULL, NULL, '');
INSERT INTO `districts` VALUES (350430, 3504, 2, '建宁', 'jian ning', 'jin', '建宁县', NULL, NULL, '');
INSERT INTO `districts` VALUES (350481, 3504, 2, '永安', 'yong an', 'yoa', '永安市', NULL, NULL, '');
INSERT INTO `districts` VALUES (350502, 3505, 2, '鲤城', 'li cheng', 'lic', '鲤城区', NULL, NULL, '');
INSERT INTO `districts` VALUES (350503, 3505, 2, '丰泽', 'feng ze', 'fez', '丰泽区', NULL, NULL, '');
INSERT INTO `districts` VALUES (350504, 3505, 2, '洛江', 'luo jiang', 'luj', '洛江区', NULL, NULL, '');
INSERT INTO `districts` VALUES (350505, 3505, 2, '泉港', 'quan gang', 'qug', '泉港区', NULL, NULL, '');
INSERT INTO `districts` VALUES (350521, 3505, 2, '惠安', 'hui an', 'hua', '惠安县', NULL, NULL, '');
INSERT INTO `districts` VALUES (350524, 3505, 2, '安溪', 'an xi', 'anx', '安溪县', NULL, NULL, '');
INSERT INTO `districts` VALUES (350525, 3505, 2, '永春', 'yong chun', 'yoc', '永春县', NULL, NULL, '');
INSERT INTO `districts` VALUES (350526, 3505, 2, '德化', 'de hua', 'deh', '德化县', NULL, NULL, '');
INSERT INTO `districts` VALUES (350527, 3505, 2, '金门', 'jin men', 'jim', '金门县', NULL, NULL, '');
INSERT INTO `districts` VALUES (350581, 3505, 2, '石狮', 'shi shi', 'shs', '石狮市', NULL, NULL, '');
INSERT INTO `districts` VALUES (350582, 3505, 2, '晋江', 'jin jiang', 'jij', '晋江市', NULL, NULL, '');
INSERT INTO `districts` VALUES (350583, 3505, 2, '南安', 'nan an', 'naa', '南安市', NULL, NULL, '');
INSERT INTO `districts` VALUES (350602, 3506, 2, '芗城', 'xiang cheng', 'xic', '芗城区', NULL, NULL, '');
INSERT INTO `districts` VALUES (350603, 3506, 2, '龙文', 'long wen', 'low', '龙文区', NULL, NULL, '');
INSERT INTO `districts` VALUES (350622, 3506, 2, '云霄', 'yun xiao', 'yux', '云霄县', NULL, NULL, '');
INSERT INTO `districts` VALUES (350623, 3506, 2, '漳浦', 'zhang pu', 'zhp', '漳浦县', NULL, NULL, '');
INSERT INTO `districts` VALUES (350624, 3506, 2, '诏安', 'zhao an', 'zha', '诏安县', NULL, NULL, '');
INSERT INTO `districts` VALUES (350625, 3506, 2, '长泰', 'chang tai', 'cht', '长泰县', NULL, NULL, '');
INSERT INTO `districts` VALUES (350626, 3506, 2, '东山', 'dong shan', 'dos', '东山县', NULL, NULL, '');
INSERT INTO `districts` VALUES (350627, 3506, 2, '南靖', 'nan jing', 'naj', '南靖县', NULL, NULL, '');
INSERT INTO `districts` VALUES (350628, 3506, 2, '平和', 'ping he', 'pih', '平和县', NULL, NULL, '');
INSERT INTO `districts` VALUES (350629, 3506, 2, '华安', 'hua an', 'hua', '华安县', NULL, NULL, '');
INSERT INTO `districts` VALUES (350681, 3506, 2, '龙海', 'long hai', 'loh', '龙海市', NULL, NULL, '');
INSERT INTO `districts` VALUES (350702, 3507, 2, '延平', 'yan ping', 'yap', '延平区', NULL, NULL, '');
INSERT INTO `districts` VALUES (350703, 3507, 2, '建阳', 'jian yang', 'jiy', '建阳区', NULL, NULL, '');
INSERT INTO `districts` VALUES (350721, 3507, 2, '顺昌', 'shun chang', 'shc', '顺昌县', NULL, NULL, '');
INSERT INTO `districts` VALUES (350722, 3507, 2, '浦城', 'pu cheng', 'puc', '浦城县', NULL, NULL, '');
INSERT INTO `districts` VALUES (350723, 3507, 2, '光泽', 'guang ze', 'guz', '光泽县', NULL, NULL, '');
INSERT INTO `districts` VALUES (350724, 3507, 2, '松溪', 'song xi', 'sox', '松溪县', NULL, NULL, '');
INSERT INTO `districts` VALUES (350725, 3507, 2, '政和', 'zheng he', 'zhh', '政和县', NULL, NULL, '');
INSERT INTO `districts` VALUES (350781, 3507, 2, '邵武', 'shao wu', 'shw', '邵武市', NULL, NULL, '');
INSERT INTO `districts` VALUES (350782, 3507, 2, '武夷山', 'wu yi shan', 'wuys', '武夷山市', NULL, NULL, '');
INSERT INTO `districts` VALUES (350783, 3507, 2, '建瓯', 'jian ou', 'jio', '建瓯市', NULL, NULL, '');
INSERT INTO `districts` VALUES (350802, 3508, 2, '新罗', 'xin luo', 'xil', '新罗区', NULL, NULL, '');
INSERT INTO `districts` VALUES (350803, 3508, 2, '永定', 'yong ding', 'yod', '永定区', NULL, NULL, '');
INSERT INTO `districts` VALUES (350821, 3508, 2, '长汀', 'chang ting', 'cht', '长汀县', NULL, NULL, '');
INSERT INTO `districts` VALUES (350823, 3508, 2, '上杭', 'shang hang', 'shh', '上杭县', NULL, NULL, '');
INSERT INTO `districts` VALUES (350824, 3508, 2, '武平', 'wu ping', 'wup', '武平县', NULL, NULL, '');
INSERT INTO `districts` VALUES (350825, 3508, 2, '连城', 'lian cheng', 'lic', '连城县', NULL, NULL, '');
INSERT INTO `districts` VALUES (350881, 3508, 2, '漳平', 'zhang ping', 'zhp', '漳平市', NULL, NULL, '');
INSERT INTO `districts` VALUES (350902, 3509, 2, '蕉城', 'jiao cheng', 'jic', '蕉城区', NULL, NULL, '');
INSERT INTO `districts` VALUES (350921, 3509, 2, '霞浦', 'xia pu', 'xip', '霞浦县', NULL, NULL, '');
INSERT INTO `districts` VALUES (350922, 3509, 2, '古田', 'gu tian', 'gut', '古田县', NULL, NULL, '');
INSERT INTO `districts` VALUES (350923, 3509, 2, '屏南', 'ping nan', 'pin', '屏南县', NULL, NULL, '');
INSERT INTO `districts` VALUES (350924, 3509, 2, '寿宁', 'shou ning', 'shn', '寿宁县', NULL, NULL, '');
INSERT INTO `districts` VALUES (350925, 3509, 2, '周宁', 'zhou ning', 'zhn', '周宁县', NULL, NULL, '');
INSERT INTO `districts` VALUES (350926, 3509, 2, '柘荣', 'zhe rong', 'zhr', '柘荣县', NULL, NULL, '');
INSERT INTO `districts` VALUES (350981, 3509, 2, '福安', 'fu an', 'fua', '福安市', NULL, NULL, '');
INSERT INTO `districts` VALUES (350982, 3509, 2, '福鼎', 'fu ding', 'fud', '福鼎市', NULL, NULL, '');
INSERT INTO `districts` VALUES (360102, 3601, 2, '东湖', 'dong hu', 'doh', '东湖区', NULL, NULL, '');
INSERT INTO `districts` VALUES (360103, 3601, 2, '西湖', 'xi hu', 'xih', '西湖区', NULL, NULL, '');
INSERT INTO `districts` VALUES (360104, 3601, 2, '青云谱', 'qing yun pu', 'qiyp', '青云谱区', NULL, NULL, '');
INSERT INTO `districts` VALUES (360105, 3601, 2, '湾里', 'wan li', 'wal', '湾里区', NULL, NULL, '');
INSERT INTO `districts` VALUES (360111, 3601, 2, '青山湖', 'qing shan hu', 'qish', '青山湖区', NULL, NULL, '');
INSERT INTO `districts` VALUES (360112, 3601, 2, '新建', 'xin jian', 'xij', '新建区', NULL, NULL, '');
INSERT INTO `districts` VALUES (360121, 3601, 2, '南昌', 'nan chang', 'nac', '南昌县', NULL, NULL, '');
INSERT INTO `districts` VALUES (360123, 3601, 2, '安义', 'an yi', 'any', '安义县', NULL, NULL, '');
INSERT INTO `districts` VALUES (360124, 3601, 2, '进贤', 'jin xian', 'jix', '进贤县', NULL, NULL, '');
INSERT INTO `districts` VALUES (360202, 3602, 2, '昌江', 'chang jiang', 'chj', '昌江区', NULL, NULL, '');
INSERT INTO `districts` VALUES (360203, 3602, 2, '珠山', 'zhu shan', 'zhs', '珠山区', NULL, NULL, '');
INSERT INTO `districts` VALUES (360222, 3602, 2, '浮梁', 'fu liang', 'ful', '浮梁县', NULL, NULL, '');
INSERT INTO `districts` VALUES (360281, 3602, 2, '乐平', 'le ping', 'lep', '乐平市', NULL, NULL, '');
INSERT INTO `districts` VALUES (360302, 3603, 2, '安源', 'an yuan', 'any', '安源区', NULL, NULL, '');
INSERT INTO `districts` VALUES (360313, 3603, 2, '湘东', 'xiang dong', 'xid', '湘东区', NULL, NULL, '');
INSERT INTO `districts` VALUES (360321, 3603, 2, '莲花', 'lian hua', 'lih', '莲花县', NULL, NULL, '');
INSERT INTO `districts` VALUES (360322, 3603, 2, '上栗', 'shang li', 'shl', '上栗县', NULL, NULL, '');
INSERT INTO `districts` VALUES (360323, 3603, 2, '芦溪', 'lu xi', 'lux', '芦溪县', NULL, NULL, '');
INSERT INTO `districts` VALUES (360402, 3604, 2, '濂溪', 'lian xi', 'lix', '濂溪区', NULL, NULL, '');
INSERT INTO `districts` VALUES (360403, 3604, 2, '浔阳', 'xun yang', 'xuy', '浔阳区', NULL, NULL, '');
INSERT INTO `districts` VALUES (360404, 3604, 2, '柴桑', 'chai sang', 'chs', '柴桑区', NULL, NULL, '');
INSERT INTO `districts` VALUES (360423, 3604, 2, '武宁', 'wu ning', 'wun', '武宁县', NULL, NULL, '');
INSERT INTO `districts` VALUES (360424, 3604, 2, '修水', 'xiu shui', 'xis', '修水县', NULL, NULL, '');
INSERT INTO `districts` VALUES (360425, 3604, 2, '永修', 'yong xiu', 'yox', '永修县', NULL, NULL, '');
INSERT INTO `districts` VALUES (360426, 3604, 2, '德安', 'de an', 'dea', '德安县', NULL, NULL, '');
INSERT INTO `districts` VALUES (360428, 3604, 2, '都昌', 'du chang', 'duc', '都昌县', NULL, NULL, '');
INSERT INTO `districts` VALUES (360429, 3604, 2, '湖口', 'hu kou', 'huk', '湖口县', NULL, NULL, '');
INSERT INTO `districts` VALUES (360430, 3604, 2, '彭泽', 'peng ze', 'pez', '彭泽县', NULL, NULL, '');
INSERT INTO `districts` VALUES (360481, 3604, 2, '瑞昌', 'rui chang', 'ruc', '瑞昌市', NULL, NULL, '');
INSERT INTO `districts` VALUES (360482, 3604, 2, '共青城', 'gong qing cheng', 'goqc', '共青城市', NULL, NULL, '');
INSERT INTO `districts` VALUES (360483, 3604, 2, '庐山', 'lu shan', 'lus', '庐山市', NULL, NULL, '');
INSERT INTO `districts` VALUES (360502, 3605, 2, '渝水', 'yu shui', 'yus', '渝水区', NULL, NULL, '');
INSERT INTO `districts` VALUES (360521, 3605, 2, '分宜', 'fen yi', 'fey', '分宜县', NULL, NULL, '');
INSERT INTO `districts` VALUES (360602, 3606, 2, '月湖', 'yue hu', 'yuh', '月湖区', NULL, NULL, '');
INSERT INTO `districts` VALUES (360622, 3606, 2, '余江', 'yu jiang', 'yuj', '余江县', NULL, NULL, '');
INSERT INTO `districts` VALUES (360681, 3606, 2, '贵溪', 'gui xi', 'gux', '贵溪市', NULL, NULL, '');
INSERT INTO `districts` VALUES (360702, 3607, 2, '章贡', 'zhang gong', 'zhg', '章贡区', NULL, NULL, '');
INSERT INTO `districts` VALUES (360703, 3607, 2, '南康', 'nan kang', 'nak', '南康区', NULL, NULL, '');
INSERT INTO `districts` VALUES (360704, 3607, 2, '赣县', 'gan xian', 'gax', '赣县区', NULL, NULL, '');
INSERT INTO `districts` VALUES (360722, 3607, 2, '信丰', 'xin feng', 'xif', '信丰县', NULL, NULL, '');
INSERT INTO `districts` VALUES (360723, 3607, 2, '大余', 'da yu', 'day', '大余县', NULL, NULL, '');
INSERT INTO `districts` VALUES (360724, 3607, 2, '上犹', 'shang you', 'shy', '上犹县', NULL, NULL, '');
INSERT INTO `districts` VALUES (360725, 3607, 2, '崇义', 'chong yi', 'chy', '崇义县', NULL, NULL, '');
INSERT INTO `districts` VALUES (360726, 3607, 2, '安远', 'an yuan', 'any', '安远县', NULL, NULL, '');
INSERT INTO `districts` VALUES (360727, 3607, 2, '龙南', 'long nan', 'lon', '龙南县', NULL, NULL, '');
INSERT INTO `districts` VALUES (360728, 3607, 2, '定南', 'ding nan', 'din', '定南县', NULL, NULL, '');
INSERT INTO `districts` VALUES (360729, 3607, 2, '全南', 'quan nan', 'qun', '全南县', NULL, NULL, '');
INSERT INTO `districts` VALUES (360730, 3607, 2, '宁都', 'ning du', 'nid', '宁都县', NULL, NULL, '');
INSERT INTO `districts` VALUES (360731, 3607, 2, '于都', 'yu du', 'yud', '于都县', NULL, NULL, '');
INSERT INTO `districts` VALUES (360732, 3607, 2, '兴国', 'xing guo', 'xig', '兴国县', NULL, NULL, '');
INSERT INTO `districts` VALUES (360733, 3607, 2, '会昌', 'hui chang', 'huc', '会昌县', NULL, NULL, '');
INSERT INTO `districts` VALUES (360734, 3607, 2, '寻乌', 'xun wu', 'xuw', '寻乌县', NULL, NULL, '');
INSERT INTO `districts` VALUES (360735, 3607, 2, '石城', 'shi cheng', 'shc', '石城县', NULL, NULL, '');
INSERT INTO `districts` VALUES (360781, 3607, 2, '瑞金', 'rui jin', 'ruj', '瑞金市', NULL, NULL, '');
INSERT INTO `districts` VALUES (360802, 3608, 2, '吉州', 'ji zhou', 'jiz', '吉州区', NULL, NULL, '');
INSERT INTO `districts` VALUES (360803, 3608, 2, '青原', 'qing yuan', 'qiy', '青原区', NULL, NULL, '');
INSERT INTO `districts` VALUES (360821, 3608, 2, '吉安', 'ji an', 'jia', '吉安县', NULL, NULL, '');
INSERT INTO `districts` VALUES (360822, 3608, 2, '吉水', 'ji shui', 'jis', '吉水县', NULL, NULL, '');
INSERT INTO `districts` VALUES (360823, 3608, 2, '峡江', 'xia jiang', 'xij', '峡江县', NULL, NULL, '');
INSERT INTO `districts` VALUES (360824, 3608, 2, '新干', 'xin gan', 'xig', '新干县', NULL, NULL, '');
INSERT INTO `districts` VALUES (360825, 3608, 2, '永丰', 'yong feng', 'yof', '永丰县', NULL, NULL, '');
INSERT INTO `districts` VALUES (360826, 3608, 2, '泰和', 'tai he', 'tah', '泰和县', NULL, NULL, '');
INSERT INTO `districts` VALUES (360827, 3608, 2, '遂川', 'sui chuan', 'suc', '遂川县', NULL, NULL, '');
INSERT INTO `districts` VALUES (360828, 3608, 2, '万安', 'wan an', 'waa', '万安县', NULL, NULL, '');
INSERT INTO `districts` VALUES (360829, 3608, 2, '安福', 'an fu', 'anf', '安福县', NULL, NULL, '');
INSERT INTO `districts` VALUES (360830, 3608, 2, '永新', 'yong xin', 'yox', '永新县', NULL, NULL, '');
INSERT INTO `districts` VALUES (360881, 3608, 2, '井冈山', 'jing gang shan', 'jigs', '井冈山市', NULL, NULL, '');
INSERT INTO `districts` VALUES (360902, 3609, 2, '袁州', 'yuan zhou', 'yuz', '袁州区', NULL, NULL, '');
INSERT INTO `districts` VALUES (360921, 3609, 2, '奉新', 'feng xin', 'fex', '奉新县', NULL, NULL, '');
INSERT INTO `districts` VALUES (360922, 3609, 2, '万载', 'wan zai', 'waz', '万载县', NULL, NULL, '');
INSERT INTO `districts` VALUES (360923, 3609, 2, '上高', 'shang gao', 'shg', '上高县', NULL, NULL, '');
INSERT INTO `districts` VALUES (360924, 3609, 2, '宜丰', 'yi feng', 'yif', '宜丰县', NULL, NULL, '');
INSERT INTO `districts` VALUES (360925, 3609, 2, '靖安', 'jing an', 'jia', '靖安县', NULL, NULL, '');
INSERT INTO `districts` VALUES (360926, 3609, 2, '铜鼓', 'tong gu', 'tog', '铜鼓县', NULL, NULL, '');
INSERT INTO `districts` VALUES (360981, 3609, 2, '丰城', 'feng cheng', 'fec', '丰城市', NULL, NULL, '');
INSERT INTO `districts` VALUES (360982, 3609, 2, '樟树', 'zhang shu', 'zhs', '樟树市', NULL, NULL, '');
INSERT INTO `districts` VALUES (360983, 3609, 2, '高安', 'gao an', 'gaa', '高安市', NULL, NULL, '');
INSERT INTO `districts` VALUES (361002, 3610, 2, '临川', 'lin chuan', 'lic', '临川区', NULL, NULL, '');
INSERT INTO `districts` VALUES (361003, 3610, 2, '东乡', 'dong xiang', 'dox', '东乡区', NULL, NULL, '');
INSERT INTO `districts` VALUES (361021, 3610, 2, '南城', 'nan cheng', 'nac', '南城县', NULL, NULL, '');
INSERT INTO `districts` VALUES (361022, 3610, 2, '黎川', 'li chuan', 'lic', '黎川县', NULL, NULL, '');
INSERT INTO `districts` VALUES (361023, 3610, 2, '南丰', 'nan feng', 'naf', '南丰县', NULL, NULL, '');
INSERT INTO `districts` VALUES (361024, 3610, 2, '崇仁', 'chong ren', 'chr', '崇仁县', NULL, NULL, '');
INSERT INTO `districts` VALUES (361025, 3610, 2, '乐安', 'le an', 'lea', '乐安县', NULL, NULL, '');
INSERT INTO `districts` VALUES (361026, 3610, 2, '宜黄', 'yi huang', 'yih', '宜黄县', NULL, NULL, '');
INSERT INTO `districts` VALUES (361027, 3610, 2, '金溪', 'jin xi', 'jix', '金溪县', NULL, NULL, '');
INSERT INTO `districts` VALUES (361028, 3610, 2, '资溪', 'zi xi', 'zix', '资溪县', NULL, NULL, '');
INSERT INTO `districts` VALUES (361030, 3610, 2, '广昌', 'guang chang', 'guc', '广昌县', NULL, NULL, '');
INSERT INTO `districts` VALUES (361102, 3611, 2, '信州', 'xin zhou', 'xiz', '信州区', NULL, NULL, '');
INSERT INTO `districts` VALUES (361103, 3611, 2, '广丰', 'guang feng', 'guf', '广丰区', NULL, NULL, '');
INSERT INTO `districts` VALUES (361121, 3611, 2, '上饶', 'shang rao', 'shr', '上饶县', NULL, NULL, '');
INSERT INTO `districts` VALUES (361123, 3611, 2, '玉山', 'yu shan', 'yus', '玉山县', NULL, NULL, '');
INSERT INTO `districts` VALUES (361124, 3611, 2, '铅山', 'yan shan', 'yas', '铅山县', NULL, NULL, '');
INSERT INTO `districts` VALUES (361125, 3611, 2, '横峰', 'heng feng', 'hef', '横峰县', NULL, NULL, '');
INSERT INTO `districts` VALUES (361126, 3611, 2, '弋阳', 'yi yang', 'yiy', '弋阳县', NULL, NULL, '');
INSERT INTO `districts` VALUES (361127, 3611, 2, '余干', 'yu gan', 'yug', '余干县', NULL, NULL, '');
INSERT INTO `districts` VALUES (361128, 3611, 2, '鄱阳', 'po yang', 'poy', '鄱阳县', NULL, NULL, '');
INSERT INTO `districts` VALUES (361129, 3611, 2, '万年', 'wan nian', 'wan', '万年县', NULL, NULL, '');
INSERT INTO `districts` VALUES (361130, 3611, 2, '婺源', 'wu yuan', 'wuy', '婺源县', NULL, NULL, '');
INSERT INTO `districts` VALUES (361181, 3611, 2, '德兴', 'de xing', 'dex', '德兴市', NULL, NULL, '');
INSERT INTO `districts` VALUES (370102, 3701, 2, '历下', 'li xia', 'lix', '历下区', NULL, NULL, '');
INSERT INTO `districts` VALUES (370103, 3701, 2, '市中', 'shi zhong', 'shz', '市中区', NULL, NULL, '');
INSERT INTO `districts` VALUES (370104, 3701, 2, '槐荫', 'huai yin', 'huy', '槐荫区', NULL, NULL, '');
INSERT INTO `districts` VALUES (370105, 3701, 2, '天桥', 'tian qiao', 'tiq', '天桥区', NULL, NULL, '');
INSERT INTO `districts` VALUES (370112, 3701, 2, '历城', 'li cheng', 'lic', '历城区', NULL, NULL, '');
INSERT INTO `districts` VALUES (370113, 3701, 2, '长清', 'chang qing', 'chq', '长清区', NULL, NULL, '');
INSERT INTO `districts` VALUES (370114, 3701, 2, '章丘', 'zhang qiu', 'zhq', '章丘区', NULL, NULL, '');
INSERT INTO `districts` VALUES (370124, 3701, 2, '平阴', 'ping yin', 'piy', '平阴县', NULL, NULL, '');
INSERT INTO `districts` VALUES (370125, 3701, 2, '济阳', 'ji yang', 'jiy', '济阳县', NULL, NULL, '');
INSERT INTO `districts` VALUES (370126, 3701, 2, '商河', 'shang he', 'shh', '商河县', NULL, NULL, '');
INSERT INTO `districts` VALUES (370171, 3701, 2, '济南高新技术产业开发区', 'ji nan gao xin ji shu chan ye kai fa qu', 'jing', '济南高新技术产业开发区', NULL, NULL, '');
INSERT INTO `districts` VALUES (370202, 3702, 2, '市南', 'shi nan', 'shn', '市南区', NULL, NULL, '');
INSERT INTO `districts` VALUES (370203, 3702, 2, '市北', 'shi bei', 'shb', '市北区', NULL, NULL, '');
INSERT INTO `districts` VALUES (370211, 3702, 2, '黄岛', 'huang dao', 'hud', '黄岛区', NULL, NULL, '');
INSERT INTO `districts` VALUES (370212, 3702, 2, '崂山', 'lao shan', 'las', '崂山区', NULL, NULL, '');
INSERT INTO `districts` VALUES (370213, 3702, 2, '李沧', 'li cang', 'lic', '李沧区', NULL, NULL, '');
INSERT INTO `districts` VALUES (370214, 3702, 2, '城阳', 'cheng yang', 'chy', '城阳区', NULL, NULL, '');
INSERT INTO `districts` VALUES (370215, 3702, 2, '即墨', 'ji mo', 'jim', '即墨区', NULL, NULL, '');
INSERT INTO `districts` VALUES (370271, 3702, 2, '青岛高新技术产业开发区', 'qing dao gao xin ji shu chan ye kai fa qu', 'qidg', '青岛高新技术产业开发区', NULL, NULL, '');
INSERT INTO `districts` VALUES (370281, 3702, 2, '胶州', 'jiao zhou', 'jiz', '胶州市', NULL, NULL, '');
INSERT INTO `districts` VALUES (370283, 3702, 2, '平度', 'ping du', 'pid', '平度市', NULL, NULL, '');
INSERT INTO `districts` VALUES (370285, 3702, 2, '莱西', 'lai xi', 'lax', '莱西市', NULL, NULL, '');
INSERT INTO `districts` VALUES (370302, 3703, 2, '淄川', 'zi chuan', 'zic', '淄川区', NULL, NULL, '');
INSERT INTO `districts` VALUES (370303, 3703, 2, '张店', 'zhang dian', 'zhd', '张店区', NULL, NULL, '');
INSERT INTO `districts` VALUES (370304, 3703, 2, '博山', 'bo shan', 'bos', '博山区', NULL, NULL, '');
INSERT INTO `districts` VALUES (370305, 3703, 2, '临淄', 'lin zi', 'liz', '临淄区', NULL, NULL, '');
INSERT INTO `districts` VALUES (370306, 3703, 2, '周村', 'zhou cun', 'zhc', '周村区', NULL, NULL, '');
INSERT INTO `districts` VALUES (370321, 3703, 2, '桓台', 'huan tai', 'hut', '桓台县', NULL, NULL, '');
INSERT INTO `districts` VALUES (370322, 3703, 2, '高青', 'gao qing', 'gaq', '高青县', NULL, NULL, '');
INSERT INTO `districts` VALUES (370323, 3703, 2, '沂源', 'yi yuan', 'yiy', '沂源县', NULL, NULL, '');
INSERT INTO `districts` VALUES (370402, 3704, 2, '市中', 'shi zhong', 'shz', '市中区', NULL, NULL, '');
INSERT INTO `districts` VALUES (370403, 3704, 2, '薛城', 'xue cheng', 'xuc', '薛城区', NULL, NULL, '');
INSERT INTO `districts` VALUES (370404, 3704, 2, '峄城', 'yi cheng', 'yic', '峄城区', NULL, NULL, '');
INSERT INTO `districts` VALUES (370405, 3704, 2, '台儿庄', 'tai er zhuang', 'taez', '台儿庄区', NULL, NULL, '');
INSERT INTO `districts` VALUES (370406, 3704, 2, '山亭', 'shan ting', 'sht', '山亭区', NULL, NULL, '');
INSERT INTO `districts` VALUES (370481, 3704, 2, '滕州', 'teng zhou', 'tez', '滕州市', NULL, NULL, '');
INSERT INTO `districts` VALUES (370502, 3705, 2, '东营', 'dong ying', 'doy', '东营区', NULL, NULL, '');
INSERT INTO `districts` VALUES (370503, 3705, 2, '河口', 'he kou', 'hek', '河口区', NULL, NULL, '');
INSERT INTO `districts` VALUES (370505, 3705, 2, '垦利', 'ken li', 'kel', '垦利区', NULL, NULL, '');
INSERT INTO `districts` VALUES (370522, 3705, 2, '利津', 'li jin', 'lij', '利津县', NULL, NULL, '');
INSERT INTO `districts` VALUES (370523, 3705, 2, '广饶', 'guang rao', 'gur', '广饶县', NULL, NULL, '');
INSERT INTO `districts` VALUES (370571, 3705, 2, '东营经济技术开发区', 'dong ying jing ji ji shu kai fa qu', 'doyj', '东营经济技术开发区', NULL, NULL, '');
INSERT INTO `districts` VALUES (370572, 3705, 2, '东营港经济开发区', 'dong ying gang jing ji kai fa qu', 'doyg', '东营港经济开发区', NULL, NULL, '');
INSERT INTO `districts` VALUES (370602, 3706, 2, '芝罘', 'zhi fu', 'zhf', '芝罘区', NULL, NULL, '');
INSERT INTO `districts` VALUES (370611, 3706, 2, '福山', 'fu shan', 'fus', '福山区', NULL, NULL, '');
INSERT INTO `districts` VALUES (370612, 3706, 2, '牟平', 'mu ping', 'mup', '牟平区', NULL, NULL, '');
INSERT INTO `districts` VALUES (370613, 3706, 2, '莱山', 'lai shan', 'las', '莱山区', NULL, NULL, '');
INSERT INTO `districts` VALUES (370634, 3706, 2, '长岛', 'chang dao', 'chd', '长岛县', NULL, NULL, '');
INSERT INTO `districts` VALUES (370671, 3706, 2, '烟台高新技术产业开发区', 'yan tai gao xin ji shu chan ye kai fa qu', 'yatg', '烟台高新技术产业开发区', NULL, NULL, '');
INSERT INTO `districts` VALUES (370672, 3706, 2, '烟台经济技术开发区', 'yan tai jing ji ji shu kai fa qu', 'yatj', '烟台经济技术开发区', NULL, NULL, '');
INSERT INTO `districts` VALUES (370681, 3706, 2, '龙口', 'long kou', 'lok', '龙口市', NULL, NULL, '');
INSERT INTO `districts` VALUES (370682, 3706, 2, '莱阳', 'lai yang', 'lay', '莱阳市', NULL, NULL, '');
INSERT INTO `districts` VALUES (370683, 3706, 2, '莱州', 'lai zhou', 'laz', '莱州市', NULL, NULL, '');
INSERT INTO `districts` VALUES (370684, 3706, 2, '蓬莱', 'peng lai', 'pel', '蓬莱市', NULL, NULL, '');
INSERT INTO `districts` VALUES (370685, 3706, 2, '招远', 'zhao yuan', 'zhy', '招远市', NULL, NULL, '');
INSERT INTO `districts` VALUES (370686, 3706, 2, '栖霞', 'qi xia', 'qix', '栖霞市', NULL, NULL, '');
INSERT INTO `districts` VALUES (370687, 3706, 2, '海阳', 'hai yang', 'hay', '海阳市', NULL, NULL, '');
INSERT INTO `districts` VALUES (370702, 3707, 2, '潍城', 'wei cheng', 'wec', '潍城区', NULL, NULL, '');
INSERT INTO `districts` VALUES (370703, 3707, 2, '寒亭', 'han ting', 'hat', '寒亭区', NULL, NULL, '');
INSERT INTO `districts` VALUES (370704, 3707, 2, '坊子', 'fang zi', 'faz', '坊子区', NULL, NULL, '');
INSERT INTO `districts` VALUES (370705, 3707, 2, '奎文', 'kui wen', 'kuw', '奎文区', NULL, NULL, '');
INSERT INTO `districts` VALUES (370724, 3707, 2, '临朐', 'lin qu', 'liq', '临朐县', NULL, NULL, '');
INSERT INTO `districts` VALUES (370725, 3707, 2, '昌乐', 'chang le', 'chl', '昌乐县', NULL, NULL, '');
INSERT INTO `districts` VALUES (370772, 3707, 2, '潍坊滨海经济技术开发区', 'wei fang bin hai jing ji ji shu kai fa qu', 'wefb', '潍坊滨海经济技术开发区', NULL, NULL, '');
INSERT INTO `districts` VALUES (370781, 3707, 2, '青州', 'qing zhou', 'qiz', '青州市', NULL, NULL, '');
INSERT INTO `districts` VALUES (370782, 3707, 2, '诸城', 'zhu cheng', 'zhc', '诸城市', NULL, NULL, '');
INSERT INTO `districts` VALUES (370783, 3707, 2, '寿光', 'shou guang', 'shg', '寿光市', NULL, NULL, '');
INSERT INTO `districts` VALUES (370784, 3707, 2, '安丘', 'an qiu', 'anq', '安丘市', NULL, NULL, '');
INSERT INTO `districts` VALUES (370785, 3707, 2, '高密', 'gao mi', 'gam', '高密市', NULL, NULL, '');
INSERT INTO `districts` VALUES (370786, 3707, 2, '昌邑', 'chang yi', 'chy', '昌邑市', NULL, NULL, '');
INSERT INTO `districts` VALUES (370811, 3708, 2, '任城', 'ren cheng', 'rec', '任城区', NULL, NULL, '');
INSERT INTO `districts` VALUES (370812, 3708, 2, '兖州', 'yan zhou', 'yaz', '兖州区', NULL, NULL, '');
INSERT INTO `districts` VALUES (370826, 3708, 2, '微山', 'wei shan', 'wes', '微山县', NULL, NULL, '');
INSERT INTO `districts` VALUES (370827, 3708, 2, '鱼台', 'yu tai', 'yut', '鱼台县', NULL, NULL, '');
INSERT INTO `districts` VALUES (370828, 3708, 2, '金乡', 'jin xiang', 'jix', '金乡县', NULL, NULL, '');
INSERT INTO `districts` VALUES (370829, 3708, 2, '嘉祥', 'jia xiang', 'jix', '嘉祥县', NULL, NULL, '');
INSERT INTO `districts` VALUES (370830, 3708, 2, '汶上', 'wen shang', 'wes', '汶上县', NULL, NULL, '');
INSERT INTO `districts` VALUES (370831, 3708, 2, '泗水', 'si shui', 'sis', '泗水县', NULL, NULL, '');
INSERT INTO `districts` VALUES (370832, 3708, 2, '梁山', 'liang shan', 'lis', '梁山县', NULL, NULL, '');
INSERT INTO `districts` VALUES (370871, 3708, 2, '济宁高新技术产业开发区', 'ji ning gao xin ji shu chan ye kai fa qu', 'jing', '济宁高新技术产业开发区', NULL, NULL, '');
INSERT INTO `districts` VALUES (370881, 3708, 2, '曲阜', 'qu fu', 'quf', '曲阜市', NULL, NULL, '');
INSERT INTO `districts` VALUES (370883, 3708, 2, '邹城', 'zou cheng', 'zoc', '邹城市', NULL, NULL, '');
INSERT INTO `districts` VALUES (370902, 3709, 2, '泰山', 'tai shan', 'tas', '泰山区', NULL, NULL, '');
INSERT INTO `districts` VALUES (370911, 3709, 2, '岱岳', 'dai yue', 'day', '岱岳区', NULL, NULL, '');
INSERT INTO `districts` VALUES (370921, 3709, 2, '宁阳', 'ning yang', 'niy', '宁阳县', NULL, NULL, '');
INSERT INTO `districts` VALUES (370923, 3709, 2, '东平', 'dong ping', 'dop', '东平县', NULL, NULL, '');
INSERT INTO `districts` VALUES (370982, 3709, 2, '新泰', 'xin tai', 'xit', '新泰市', NULL, NULL, '');
INSERT INTO `districts` VALUES (370983, 3709, 2, '肥城', 'fei cheng', 'fec', '肥城市', NULL, NULL, '');
INSERT INTO `districts` VALUES (371002, 3710, 2, '环翠', 'huan cui', 'huc', '环翠区', NULL, NULL, '');
INSERT INTO `districts` VALUES (371003, 3710, 2, '文登', 'wen deng', 'wed', '文登区', NULL, NULL, '');
INSERT INTO `districts` VALUES (371071, 3710, 2, '威海火炬高技术产业开发区', 'wei hai huo ju gao ji shu chan ye kai fa qu', 'wehh', '威海火炬高技术产业开发区', NULL, NULL, '');
INSERT INTO `districts` VALUES (371072, 3710, 2, '威海经济技术开发区', 'wei hai jing ji ji shu kai fa qu', 'wehj', '威海经济技术开发区', NULL, NULL, '');
INSERT INTO `districts` VALUES (371073, 3710, 2, '威海临港经济技术开发区', 'wei hai lin gang jing ji ji shu kai fa qu', 'wehl', '威海临港经济技术开发区', NULL, NULL, '');
INSERT INTO `districts` VALUES (371082, 3710, 2, '荣成', 'rong cheng', 'roc', '荣成市', NULL, NULL, '');
INSERT INTO `districts` VALUES (371083, 3710, 2, '乳山', 'ru shan', 'rus', '乳山市', NULL, NULL, '');
INSERT INTO `districts` VALUES (371102, 3711, 2, '东港', 'dong gang', 'dog', '东港区', NULL, NULL, '');
INSERT INTO `districts` VALUES (371103, 3711, 2, '岚山', 'lan shan', 'las', '岚山区', NULL, NULL, '');
INSERT INTO `districts` VALUES (371121, 3711, 2, '五莲', 'wu lian', 'wul', '五莲县', NULL, NULL, '');
INSERT INTO `districts` VALUES (371122, 3711, 2, '莒县', 'ju xian', 'jux', '莒县', NULL, NULL, '');
INSERT INTO `districts` VALUES (371171, 3711, 2, '日照经济技术开发区', 'ri zhao jing ji ji shu kai fa qu', 'rizj', '日照经济技术开发区', NULL, NULL, '');
INSERT INTO `districts` VALUES (371172, 3711, 2, '日照国际海洋城', 'ri zhao guo ji hai yang cheng', 'rizg', '日照国际海洋城', NULL, NULL, '');
INSERT INTO `districts` VALUES (371202, 3712, 2, '莱城', 'lai cheng', 'lac', '莱城区', NULL, NULL, '');
INSERT INTO `districts` VALUES (371203, 3712, 2, '钢城', 'gang cheng', 'gac', '钢城区', NULL, NULL, '');
INSERT INTO `districts` VALUES (371302, 3713, 2, '兰山', 'lan shan', 'las', '兰山区', NULL, NULL, '');
INSERT INTO `districts` VALUES (371311, 3713, 2, '罗庄', 'luo zhuang', 'luz', '罗庄区', NULL, NULL, '');
INSERT INTO `districts` VALUES (371312, 3713, 2, '河东', 'he dong', 'hed', '河东区', NULL, NULL, '');
INSERT INTO `districts` VALUES (371321, 3713, 2, '沂南', 'yi nan', 'yin', '沂南县', NULL, NULL, '');
INSERT INTO `districts` VALUES (371322, 3713, 2, '郯城', 'tan cheng', 'tac', '郯城县', NULL, NULL, '');
INSERT INTO `districts` VALUES (371323, 3713, 2, '沂水', 'yi shui', 'yis', '沂水县', NULL, NULL, '');
INSERT INTO `districts` VALUES (371324, 3713, 2, '兰陵', 'lan ling', 'lal', '兰陵县', NULL, NULL, '');
INSERT INTO `districts` VALUES (371325, 3713, 2, '费县', 'fei xian', 'fex', '费县', NULL, NULL, '');
INSERT INTO `districts` VALUES (371326, 3713, 2, '平邑', 'ping yi', 'piy', '平邑县', NULL, NULL, '');
INSERT INTO `districts` VALUES (371327, 3713, 2, '莒南', 'ju nan', 'jun', '莒南县', NULL, NULL, '');
INSERT INTO `districts` VALUES (371328, 3713, 2, '蒙阴', 'meng yin', 'mey', '蒙阴县', NULL, NULL, '');
INSERT INTO `districts` VALUES (371329, 3713, 2, '临沭', 'lin shu', 'lis', '临沭县', NULL, NULL, '');
INSERT INTO `districts` VALUES (371371, 3713, 2, '临沂高新技术产业开发区', 'lin yi gao xin ji shu chan ye kai fa qu', 'liyg', '临沂高新技术产业开发区', NULL, NULL, '');
INSERT INTO `districts` VALUES (371372, 3713, 2, '临沂经济技术开发区', 'lin yi jing ji ji shu kai fa qu', 'liyj', '临沂经济技术开发区', NULL, NULL, '');
INSERT INTO `districts` VALUES (371373, 3713, 2, '临沂临港经济开发区', 'lin yi lin gang jing ji kai fa qu', 'liyl', '临沂临港经济开发区', NULL, NULL, '');
INSERT INTO `districts` VALUES (371402, 3714, 2, '德城', 'de cheng', 'dec', '德城区', NULL, NULL, '');
INSERT INTO `districts` VALUES (371403, 3714, 2, '陵城', 'ling cheng', 'lic', '陵城区', NULL, NULL, '');
INSERT INTO `districts` VALUES (371422, 3714, 2, '宁津', 'ning jin', 'nij', '宁津县', NULL, NULL, '');
INSERT INTO `districts` VALUES (371423, 3714, 2, '庆云', 'qing yun', 'qiy', '庆云县', NULL, NULL, '');
INSERT INTO `districts` VALUES (371424, 3714, 2, '临邑', 'lin yi', 'liy', '临邑县', NULL, NULL, '');
INSERT INTO `districts` VALUES (371425, 3714, 2, '齐河', 'qi he', 'qih', '齐河县', NULL, NULL, '');
INSERT INTO `districts` VALUES (371426, 3714, 2, '平原', 'ping yuan', 'piy', '平原县', NULL, NULL, '');
INSERT INTO `districts` VALUES (371427, 3714, 2, '夏津', 'xia jin', 'xij', '夏津县', NULL, NULL, '');
INSERT INTO `districts` VALUES (371428, 3714, 2, '武城', 'wu cheng', 'wuc', '武城县', NULL, NULL, '');
INSERT INTO `districts` VALUES (371471, 3714, 2, '德州经济技术开发区', 'de zhou jing ji ji shu kai fa qu', 'dezj', '德州经济技术开发区', NULL, NULL, '');
INSERT INTO `districts` VALUES (371472, 3714, 2, '德州运河经济开发区', 'de zhou yun he jing ji kai fa qu', 'dezy', '德州运河经济开发区', NULL, NULL, '');
INSERT INTO `districts` VALUES (371481, 3714, 2, '乐陵', 'le ling', 'lel', '乐陵市', NULL, NULL, '');
INSERT INTO `districts` VALUES (371482, 3714, 2, '禹城', 'yu cheng', 'yuc', '禹城市', NULL, NULL, '');
INSERT INTO `districts` VALUES (371502, 3715, 2, '东昌府', 'dong chang fu', 'docf', '东昌府区', NULL, NULL, '');
INSERT INTO `districts` VALUES (371521, 3715, 2, '阳谷', 'yang gu', 'yag', '阳谷县', NULL, NULL, '');
INSERT INTO `districts` VALUES (371522, 3715, 2, '莘县', 'shen xian', 'shx', '莘县', NULL, NULL, '');
INSERT INTO `districts` VALUES (371523, 3715, 2, '茌平', 'chi ping', 'chp', '茌平县', NULL, NULL, '');
INSERT INTO `districts` VALUES (371524, 3715, 2, '东阿', 'dong e', 'doe', '东阿县', NULL, NULL, '');
INSERT INTO `districts` VALUES (371525, 3715, 2, '冠县', 'guan xian', 'gux', '冠县', NULL, NULL, '');
INSERT INTO `districts` VALUES (371526, 3715, 2, '高唐', 'gao tang', 'gat', '高唐县', NULL, NULL, '');
INSERT INTO `districts` VALUES (371581, 3715, 2, '临清', 'lin qing', 'liq', '临清市', NULL, NULL, '');
INSERT INTO `districts` VALUES (371602, 3716, 2, '滨城', 'bin cheng', 'bic', '滨城区', NULL, NULL, '');
INSERT INTO `districts` VALUES (371603, 3716, 2, '沾化', 'zhan hua', 'zhh', '沾化区', NULL, NULL, '');
INSERT INTO `districts` VALUES (371621, 3716, 2, '惠民', 'hui min', 'hum', '惠民县', NULL, NULL, '');
INSERT INTO `districts` VALUES (371622, 3716, 2, '阳信', 'yang xin', 'yax', '阳信县', NULL, NULL, '');
INSERT INTO `districts` VALUES (371623, 3716, 2, '无棣', 'wu di', 'wud', '无棣县', NULL, NULL, '');
INSERT INTO `districts` VALUES (371625, 3716, 2, '博兴', 'bo xing', 'box', '博兴县', NULL, NULL, '');
INSERT INTO `districts` VALUES (371626, 3716, 2, '邹平', 'zou ping', 'zop', '邹平县', NULL, NULL, '');
INSERT INTO `districts` VALUES (371702, 3717, 2, '牡丹', 'mu dan', 'mud', '牡丹区', NULL, NULL, '');
INSERT INTO `districts` VALUES (371703, 3717, 2, '定陶', 'ding tao', 'dit', '定陶区', NULL, NULL, '');
INSERT INTO `districts` VALUES (371721, 3717, 2, '曹县', 'cao xian', 'cax', '曹县', NULL, NULL, '');
INSERT INTO `districts` VALUES (371722, 3717, 2, '单县', 'shan xian', 'shx', '单县', NULL, NULL, '');
INSERT INTO `districts` VALUES (371723, 3717, 2, '成武', 'cheng wu', 'chw', '成武县', NULL, NULL, '');
INSERT INTO `districts` VALUES (371724, 3717, 2, '巨野', 'ju ye', 'juy', '巨野县', NULL, NULL, '');
INSERT INTO `districts` VALUES (371725, 3717, 2, '郓城', 'yun cheng', 'yuc', '郓城县', NULL, NULL, '');
INSERT INTO `districts` VALUES (371726, 3717, 2, '鄄城', 'juan cheng', 'juc', '鄄城县', NULL, NULL, '');
INSERT INTO `districts` VALUES (371728, 3717, 2, '东明', 'dong ming', 'dom', '东明县', NULL, NULL, '');
INSERT INTO `districts` VALUES (371771, 3717, 2, '菏泽经济技术开发区', 'he ze jing ji ji shu kai fa qu', 'hezj', '菏泽经济技术开发区', NULL, NULL, '');
INSERT INTO `districts` VALUES (371772, 3717, 2, '菏泽高新技术开发区', 'he ze gao xin ji shu kai fa qu', 'hezg', '菏泽高新技术开发区', NULL, NULL, '');
INSERT INTO `districts` VALUES (410102, 4101, 2, '中原', 'zhong yuan', 'zhy', '中原区', NULL, NULL, '');
INSERT INTO `districts` VALUES (410103, 4101, 2, '二七', 'er qi', 'erq', '二七区', NULL, NULL, '');
INSERT INTO `districts` VALUES (410104, 4101, 2, '管城回族', 'guan cheng hui zu', 'guch', '管城回族区', NULL, NULL, '');
INSERT INTO `districts` VALUES (410105, 4101, 2, '金水', 'jin shui', 'jis', '金水区', NULL, NULL, '');
INSERT INTO `districts` VALUES (410106, 4101, 2, '上街', 'shang jie', 'shj', '上街区', NULL, NULL, '');
INSERT INTO `districts` VALUES (410108, 4101, 2, '惠济', 'hui ji', 'huj', '惠济区', NULL, NULL, '');
INSERT INTO `districts` VALUES (410122, 4101, 2, '中牟', 'zhong mu', 'zhm', '中牟县', NULL, NULL, '');
INSERT INTO `districts` VALUES (410171, 4101, 2, '郑州经济技术开发区', 'zheng zhou jing ji ji shu kai fa qu', 'zhzj', '郑州经济技术开发区', NULL, NULL, '');
INSERT INTO `districts` VALUES (410172, 4101, 2, '郑州高新技术产业开发区', 'zheng zhou gao xin ji shu chan ye kai fa qu', 'zhzg', '郑州高新技术产业开发区', NULL, NULL, '');
INSERT INTO `districts` VALUES (410173, 4101, 2, '郑州航空港经济综合实验', 'zheng zhou hang kong gang jing ji zong he shi yan', 'zhzh', '郑州航空港经济综合实验区', NULL, NULL, '');
INSERT INTO `districts` VALUES (410181, 4101, 2, '巩义', 'gong yi', 'goy', '巩义市', NULL, NULL, '');
INSERT INTO `districts` VALUES (410182, 4101, 2, '荥阳', 'xing yang', 'xiy', '荥阳市', NULL, NULL, '');
INSERT INTO `districts` VALUES (410183, 4101, 2, '新密', 'xin mi', 'xim', '新密市', NULL, NULL, '');
INSERT INTO `districts` VALUES (410184, 4101, 2, '新郑', 'xin zheng', 'xiz', '新郑市', NULL, NULL, '');
INSERT INTO `districts` VALUES (410185, 4101, 2, '登封', 'deng feng', 'def', '登封市', NULL, NULL, '');
INSERT INTO `districts` VALUES (410202, 4102, 2, '龙亭', 'long ting', 'lot', '龙亭区', NULL, NULL, '');
INSERT INTO `districts` VALUES (410203, 4102, 2, '顺河回族', 'shun he hui zu', 'shhh', '顺河回族区', NULL, NULL, '');
INSERT INTO `districts` VALUES (410204, 4102, 2, '鼓楼', 'gu lou', 'gul', '鼓楼区', NULL, NULL, '');
INSERT INTO `districts` VALUES (410205, 4102, 2, '禹王台', 'yu wang tai', 'yuwt', '禹王台区', NULL, NULL, '');
INSERT INTO `districts` VALUES (410212, 4102, 2, '祥符', 'xiang fu', 'xif', '祥符区', NULL, NULL, '');
INSERT INTO `districts` VALUES (410221, 4102, 2, '杞县', 'qi xian', 'qix', '杞县', NULL, NULL, '');
INSERT INTO `districts` VALUES (410222, 4102, 2, '通许', 'tong xu', 'tox', '通许县', NULL, NULL, '');
INSERT INTO `districts` VALUES (410223, 4102, 2, '尉氏', 'wei shi', 'wes', '尉氏县', NULL, NULL, '');
INSERT INTO `districts` VALUES (410225, 4102, 2, '兰考', 'lan kao', 'lak', '兰考县', NULL, NULL, '');
INSERT INTO `districts` VALUES (410302, 4103, 2, '老城', 'lao cheng', 'lac', '老城区', NULL, NULL, '');
INSERT INTO `districts` VALUES (410303, 4103, 2, '西工', 'xi gong', 'xig', '西工区', NULL, NULL, '');
INSERT INTO `districts` VALUES (410304, 4103, 2, '瀍河回族', 'chan he hui zu', 'chhh', '瀍河回族区', NULL, NULL, '');
INSERT INTO `districts` VALUES (410305, 4103, 2, '涧西', 'jian xi', 'jix', '涧西区', NULL, NULL, '');
INSERT INTO `districts` VALUES (410306, 4103, 2, '吉利', 'ji li', 'jil', '吉利区', NULL, NULL, '');
INSERT INTO `districts` VALUES (410311, 4103, 2, '洛龙', 'luo long', 'lul', '洛龙区', NULL, NULL, '');
INSERT INTO `districts` VALUES (410322, 4103, 2, '孟津', 'meng jin', 'mej', '孟津县', NULL, NULL, '');
INSERT INTO `districts` VALUES (410323, 4103, 2, '新安', 'xin an', 'xia', '新安县', NULL, NULL, '');
INSERT INTO `districts` VALUES (410324, 4103, 2, '栾川', 'luan chuan', 'luc', '栾川县', NULL, NULL, '');
INSERT INTO `districts` VALUES (410325, 4103, 2, '嵩县', 'song xian', 'sox', '嵩县', NULL, NULL, '');
INSERT INTO `districts` VALUES (410326, 4103, 2, '汝阳', 'ru yang', 'ruy', '汝阳县', NULL, NULL, '');
INSERT INTO `districts` VALUES (410327, 4103, 2, '宜阳', 'yi yang', 'yiy', '宜阳县', NULL, NULL, '');
INSERT INTO `districts` VALUES (410328, 4103, 2, '洛宁', 'luo ning', 'lun', '洛宁县', NULL, NULL, '');
INSERT INTO `districts` VALUES (410329, 4103, 2, '伊川', 'yi chuan', 'yic', '伊川县', NULL, NULL, '');
INSERT INTO `districts` VALUES (410371, 4103, 2, '洛阳高新技术产业开发区', 'luo yang gao xin ji shu chan ye kai fa qu', 'luyg', '洛阳高新技术产业开发区', NULL, NULL, '');
INSERT INTO `districts` VALUES (410381, 4103, 2, '偃师', 'yan shi', 'yas', '偃师市', NULL, NULL, '');
INSERT INTO `districts` VALUES (410402, 4104, 2, '新华', 'xin hua', 'xih', '新华区', NULL, NULL, '');
INSERT INTO `districts` VALUES (410403, 4104, 2, '卫东', 'wei dong', 'wed', '卫东区', NULL, NULL, '');
INSERT INTO `districts` VALUES (410404, 4104, 2, '石龙', 'shi long', 'shl', '石龙区', NULL, NULL, '');
INSERT INTO `districts` VALUES (410411, 4104, 2, '湛河', 'zhan he', 'zhh', '湛河区', NULL, NULL, '');
INSERT INTO `districts` VALUES (410421, 4104, 2, '宝丰', 'bao feng', 'baf', '宝丰县', NULL, NULL, '');
INSERT INTO `districts` VALUES (410422, 4104, 2, '叶县', 'ye xian', 'yex', '叶县', NULL, NULL, '');
INSERT INTO `districts` VALUES (410423, 4104, 2, '鲁山', 'lu shan', 'lus', '鲁山县', NULL, NULL, '');
INSERT INTO `districts` VALUES (410425, 4104, 2, '郏县', 'jia xian', 'jix', '郏县', NULL, NULL, '');
INSERT INTO `districts` VALUES (410471, 4104, 2, '平顶山高新技术产业开发区', 'ping ding shan gao xin ji shu chan ye kai fa qu', 'pids', '平顶山高新技术产业开发区', NULL, NULL, '');
INSERT INTO `districts` VALUES (410472, 4104, 2, '平顶山市新城', 'ping ding shan shi xin cheng', 'pids', '平顶山市新城区', NULL, NULL, '');
INSERT INTO `districts` VALUES (410481, 4104, 2, '舞钢', 'wu gang', 'wug', '舞钢市', NULL, NULL, '');
INSERT INTO `districts` VALUES (410482, 4104, 2, '汝州', 'ru zhou', 'ruz', '汝州市', NULL, NULL, '');
INSERT INTO `districts` VALUES (410502, 4105, 2, '文峰', 'wen feng', 'wef', '文峰区', NULL, NULL, '');
INSERT INTO `districts` VALUES (410503, 4105, 2, '北关', 'bei guan', 'beg', '北关区', NULL, NULL, '');
INSERT INTO `districts` VALUES (410505, 4105, 2, '殷都', 'yin du', 'yid', '殷都区', NULL, NULL, '');
INSERT INTO `districts` VALUES (410506, 4105, 2, '龙安', 'long an', 'loa', '龙安区', NULL, NULL, '');
INSERT INTO `districts` VALUES (410522, 4105, 2, '安阳', 'an yang', 'any', '安阳县', NULL, NULL, '');
INSERT INTO `districts` VALUES (410523, 4105, 2, '汤阴', 'tang yin', 'tay', '汤阴县', NULL, NULL, '');
INSERT INTO `districts` VALUES (410526, 4105, 2, '滑县', 'hua xian', 'hux', '滑县', NULL, NULL, '');
INSERT INTO `districts` VALUES (410527, 4105, 2, '内黄', 'nei huang', 'neh', '内黄县', NULL, NULL, '');
INSERT INTO `districts` VALUES (410571, 4105, 2, '安阳高新技术产业开发区', 'an yang gao xin ji shu chan ye kai fa qu', 'anyg', '安阳高新技术产业开发区', NULL, NULL, '');
INSERT INTO `districts` VALUES (410581, 4105, 2, '林州', 'lin zhou', 'liz', '林州市', NULL, NULL, '');
INSERT INTO `districts` VALUES (410602, 4106, 2, '鹤山', 'he shan', 'hes', '鹤山区', NULL, NULL, '');
INSERT INTO `districts` VALUES (410603, 4106, 2, '山城', 'shan cheng', 'shc', '山城区', NULL, NULL, '');
INSERT INTO `districts` VALUES (410611, 4106, 2, '淇滨', 'qi bin', 'qib', '淇滨区', NULL, NULL, '');
INSERT INTO `districts` VALUES (410621, 4106, 2, '浚县', 'xun xian', 'xux', '浚县', NULL, NULL, '');
INSERT INTO `districts` VALUES (410622, 4106, 2, '淇县', 'qi xian', 'qix', '淇县', NULL, NULL, '');
INSERT INTO `districts` VALUES (410671, 4106, 2, '鹤壁经济技术开发区', 'he bi jing ji ji shu kai fa qu', 'hebj', '鹤壁经济技术开发区', NULL, NULL, '');
INSERT INTO `districts` VALUES (410702, 4107, 2, '红旗', 'hong qi', 'hoq', '红旗区', NULL, NULL, '');
INSERT INTO `districts` VALUES (410703, 4107, 2, '卫滨', 'wei bin', 'web', '卫滨区', NULL, NULL, '');
INSERT INTO `districts` VALUES (410704, 4107, 2, '凤泉', 'feng quan', 'feq', '凤泉区', NULL, NULL, '');
INSERT INTO `districts` VALUES (410711, 4107, 2, '牧野', 'mu ye', 'muy', '牧野区', NULL, NULL, '');
INSERT INTO `districts` VALUES (410721, 4107, 2, '新乡', 'xin xiang', 'xix', '新乡县', NULL, NULL, '');
INSERT INTO `districts` VALUES (410724, 4107, 2, '获嘉', 'huo jia', 'huj', '获嘉县', NULL, NULL, '');
INSERT INTO `districts` VALUES (410725, 4107, 2, '原阳', 'yuan yang', 'yuy', '原阳县', NULL, NULL, '');
INSERT INTO `districts` VALUES (410726, 4107, 2, '延津', 'yan jin', 'yaj', '延津县', NULL, NULL, '');
INSERT INTO `districts` VALUES (410727, 4107, 2, '封丘', 'feng qiu', 'feq', '封丘县', NULL, NULL, '');
INSERT INTO `districts` VALUES (410728, 4107, 2, '长垣', 'chang yuan', 'chy', '长垣县', NULL, NULL, '');
INSERT INTO `districts` VALUES (410771, 4107, 2, '新乡高新技术产业开发区', 'xin xiang gao xin ji shu chan ye kai fa qu', 'xixg', '新乡高新技术产业开发区', NULL, NULL, '');
INSERT INTO `districts` VALUES (410772, 4107, 2, '新乡经济技术开发区', 'xin xiang jing ji ji shu kai fa qu', 'xixj', '新乡经济技术开发区', NULL, NULL, '');
INSERT INTO `districts` VALUES (410773, 4107, 2, '新乡市平原城乡一体化示范区', 'xin xiang shi ping yuan cheng xiang yi ti hua shi fan qu', 'xixs', '新乡市平原城乡一体化示范区', NULL, NULL, '');
INSERT INTO `districts` VALUES (410781, 4107, 2, '卫辉', 'wei hui', 'weh', '卫辉市', NULL, NULL, '');
INSERT INTO `districts` VALUES (410782, 4107, 2, '辉县', 'hui xian', 'hux', '辉县市', NULL, NULL, '');
INSERT INTO `districts` VALUES (410802, 4108, 2, '解放', 'jie fang', 'jif', '解放区', NULL, NULL, '');
INSERT INTO `districts` VALUES (410803, 4108, 2, '中站', 'zhong zhan', 'zhz', '中站区', NULL, NULL, '');
INSERT INTO `districts` VALUES (410804, 4108, 2, '马村', 'ma cun', 'mac', '马村区', NULL, NULL, '');
INSERT INTO `districts` VALUES (410811, 4108, 2, '山阳', 'shan yang', 'shy', '山阳区', NULL, NULL, '');
INSERT INTO `districts` VALUES (410821, 4108, 2, '修武', 'xiu wu', 'xiw', '修武县', NULL, NULL, '');
INSERT INTO `districts` VALUES (410822, 4108, 2, '博爱', 'bo ai', 'boa', '博爱县', NULL, NULL, '');
INSERT INTO `districts` VALUES (410823, 4108, 2, '武陟', 'wu zhi', 'wuz', '武陟县', NULL, NULL, '');
INSERT INTO `districts` VALUES (410825, 4108, 2, '温县', 'wen xian', 'wex', '温县', NULL, NULL, '');
INSERT INTO `districts` VALUES (410871, 4108, 2, '焦作城乡一体化示范区', 'jiao zuo cheng xiang yi ti hua shi fan qu', 'jizc', '焦作城乡一体化示范区', NULL, NULL, '');
INSERT INTO `districts` VALUES (410882, 4108, 2, '沁阳', 'qin yang', 'qiy', '沁阳市', NULL, NULL, '');
INSERT INTO `districts` VALUES (410883, 4108, 2, '孟州', 'meng zhou', 'mez', '孟州市', NULL, NULL, '');
INSERT INTO `districts` VALUES (410902, 4109, 2, '华龙', 'hua long', 'hul', '华龙区', NULL, NULL, '');
INSERT INTO `districts` VALUES (410922, 4109, 2, '清丰', 'qing feng', 'qif', '清丰县', NULL, NULL, '');
INSERT INTO `districts` VALUES (410923, 4109, 2, '南乐', 'nan le', 'nal', '南乐县', NULL, NULL, '');
INSERT INTO `districts` VALUES (410926, 4109, 2, '范县', 'fan xian', 'fax', '范县', NULL, NULL, '');
INSERT INTO `districts` VALUES (410927, 4109, 2, '台前', 'tai qian', 'taq', '台前县', NULL, NULL, '');
INSERT INTO `districts` VALUES (410928, 4109, 2, '濮阳', 'pu yang', 'puy', '濮阳县', NULL, NULL, '');
INSERT INTO `districts` VALUES (410971, 4109, 2, '河南濮阳工业园', 'he nan pu yang gong ye yuan', 'henp', '河南濮阳工业园区', NULL, NULL, '');
INSERT INTO `districts` VALUES (410972, 4109, 2, '濮阳经济技术开发区', 'pu yang jing ji ji shu kai fa qu', 'puyj', '濮阳经济技术开发区', NULL, NULL, '');
INSERT INTO `districts` VALUES (411002, 4110, 2, '魏都', 'wei du', 'wed', '魏都区', NULL, NULL, '');
INSERT INTO `districts` VALUES (411003, 4110, 2, '建安', 'jian an', 'jia', '建安区', NULL, NULL, '');
INSERT INTO `districts` VALUES (411024, 4110, 2, '鄢陵', 'yan ling', 'yal', '鄢陵县', NULL, NULL, '');
INSERT INTO `districts` VALUES (411025, 4110, 2, '襄城', 'xiang cheng', 'xic', '襄城县', NULL, NULL, '');
INSERT INTO `districts` VALUES (411071, 4110, 2, '许昌经济技术开发区', 'xu chang jing ji ji shu kai fa qu', 'xucj', '许昌经济技术开发区', NULL, NULL, '');
INSERT INTO `districts` VALUES (411081, 4110, 2, '禹州', 'yu zhou', 'yuz', '禹州市', NULL, NULL, '');
INSERT INTO `districts` VALUES (411082, 4110, 2, '长葛', 'chang ge', 'chg', '长葛市', NULL, NULL, '');
INSERT INTO `districts` VALUES (411102, 4111, 2, '源汇', 'yuan hui', 'yuh', '源汇区', NULL, NULL, '');
INSERT INTO `districts` VALUES (411103, 4111, 2, '郾城', 'yan cheng', 'yac', '郾城区', NULL, NULL, '');
INSERT INTO `districts` VALUES (411104, 4111, 2, '召陵', 'shao ling', 'shl', '召陵区', NULL, NULL, '');
INSERT INTO `districts` VALUES (411121, 4111, 2, '舞阳', 'wu yang', 'wuy', '舞阳县', NULL, NULL, '');
INSERT INTO `districts` VALUES (411122, 4111, 2, '临颍', 'lin ying', 'liy', '临颍县', NULL, NULL, '');
INSERT INTO `districts` VALUES (411171, 4111, 2, '漯河经济技术开发区', 'luo he jing ji ji shu kai fa qu', 'luhj', '漯河经济技术开发区', NULL, NULL, '');
INSERT INTO `districts` VALUES (411202, 4112, 2, '湖滨', 'hu bin', 'hub', '湖滨区', NULL, NULL, '');
INSERT INTO `districts` VALUES (411203, 4112, 2, '陕州', 'shan zhou', 'shz', '陕州区', NULL, NULL, '');
INSERT INTO `districts` VALUES (411221, 4112, 2, '渑池', 'mian chi', 'mic', '渑池县', NULL, NULL, '');
INSERT INTO `districts` VALUES (411224, 4112, 2, '卢氏', 'lu shi', 'lus', '卢氏县', NULL, NULL, '');
INSERT INTO `districts` VALUES (411271, 4112, 2, '河南三门峡经济开发区', 'he nan san men xia jing ji kai fa qu', 'hens', '河南三门峡经济开发区', NULL, NULL, '');
INSERT INTO `districts` VALUES (411281, 4112, 2, '义马', 'yi ma', 'yim', '义马市', NULL, NULL, '');
INSERT INTO `districts` VALUES (411282, 4112, 2, '灵宝', 'ling bao', 'lib', '灵宝市', NULL, NULL, '');
INSERT INTO `districts` VALUES (411302, 4113, 2, '宛城', 'wan cheng', 'wac', '宛城区', NULL, NULL, '');
INSERT INTO `districts` VALUES (411303, 4113, 2, '卧龙', 'wo long', 'wol', '卧龙区', NULL, NULL, '');
INSERT INTO `districts` VALUES (411321, 4113, 2, '南召', 'nan zhao', 'naz', '南召县', NULL, NULL, '');
INSERT INTO `districts` VALUES (411322, 4113, 2, '方城', 'fang cheng', 'fac', '方城县', NULL, NULL, '');
INSERT INTO `districts` VALUES (411323, 4113, 2, '西峡', 'xi xia', 'xix', '西峡县', NULL, NULL, '');
INSERT INTO `districts` VALUES (411324, 4113, 2, '镇平', 'zhen ping', 'zhp', '镇平县', NULL, NULL, '');
INSERT INTO `districts` VALUES (411325, 4113, 2, '内乡', 'nei xiang', 'nex', '内乡县', NULL, NULL, '');
INSERT INTO `districts` VALUES (411326, 4113, 2, '淅川', 'xi chuan', 'xic', '淅川县', NULL, NULL, '');
INSERT INTO `districts` VALUES (411327, 4113, 2, '社旗', 'she qi', 'shq', '社旗县', NULL, NULL, '');
INSERT INTO `districts` VALUES (411328, 4113, 2, '唐河', 'tang he', 'tah', '唐河县', NULL, NULL, '');
INSERT INTO `districts` VALUES (411329, 4113, 2, '新野', 'xin ye', 'xiy', '新野县', NULL, NULL, '');
INSERT INTO `districts` VALUES (411330, 4113, 2, '桐柏', 'tong bai', 'tob', '桐柏县', NULL, NULL, '');
INSERT INTO `districts` VALUES (411371, 4113, 2, '南阳高新技术产业开发区', 'nan yang gao xin ji shu chan ye kai fa qu', 'nayg', '南阳高新技术产业开发区', NULL, NULL, '');
INSERT INTO `districts` VALUES (411372, 4113, 2, '南阳市城乡一体化示范区', 'nan yang shi cheng xiang yi ti hua shi fan qu', 'nays', '南阳市城乡一体化示范区', NULL, NULL, '');
INSERT INTO `districts` VALUES (411381, 4113, 2, '邓州', 'deng zhou', 'dez', '邓州市', NULL, NULL, '');
INSERT INTO `districts` VALUES (411402, 4114, 2, '梁园', 'liang yuan', 'liy', '梁园区', NULL, NULL, '');
INSERT INTO `districts` VALUES (411403, 4114, 2, '睢阳', 'sui yang', 'suy', '睢阳区', NULL, NULL, '');
INSERT INTO `districts` VALUES (411421, 4114, 2, '民权', 'min quan', 'miq', '民权县', NULL, NULL, '');
INSERT INTO `districts` VALUES (411422, 4114, 2, '睢县', 'sui xian', 'sux', '睢县', NULL, NULL, '');
INSERT INTO `districts` VALUES (411423, 4114, 2, '宁陵', 'ning ling', 'nil', '宁陵县', NULL, NULL, '');
INSERT INTO `districts` VALUES (411424, 4114, 2, '柘城', 'zhe cheng', 'zhc', '柘城县', NULL, NULL, '');
INSERT INTO `districts` VALUES (411425, 4114, 2, '虞城', 'yu cheng', 'yuc', '虞城县', NULL, NULL, '');
INSERT INTO `districts` VALUES (411426, 4114, 2, '夏邑', 'xia yi', 'xiy', '夏邑县', NULL, NULL, '');
INSERT INTO `districts` VALUES (411471, 4114, 2, '豫东综合物流产业聚集', 'yu dong zong he wu liu chan ye ju ji', 'yudz', '豫东综合物流产业聚集区', NULL, NULL, '');
INSERT INTO `districts` VALUES (411472, 4114, 2, '河南商丘经济开发区', 'he nan shang qiu jing ji kai fa qu', 'hens', '河南商丘经济开发区', NULL, NULL, '');
INSERT INTO `districts` VALUES (411481, 4114, 2, '永城', 'yong cheng', 'yoc', '永城市', NULL, NULL, '');
INSERT INTO `districts` VALUES (411502, 4115, 2, '浉河', 'shi he', 'shh', '浉河区', NULL, NULL, '');
INSERT INTO `districts` VALUES (411503, 4115, 2, '平桥', 'ping qiao', 'piq', '平桥区', NULL, NULL, '');
INSERT INTO `districts` VALUES (411521, 4115, 2, '罗山', 'luo shan', 'lus', '罗山县', NULL, NULL, '');
INSERT INTO `districts` VALUES (411522, 4115, 2, '光山', 'guang shan', 'gus', '光山县', NULL, NULL, '');
INSERT INTO `districts` VALUES (411523, 4115, 2, '新县', 'xin xian', 'xix', '新县', NULL, NULL, '');
INSERT INTO `districts` VALUES (411524, 4115, 2, '商城', 'shang cheng', 'shc', '商城县', NULL, NULL, '');
INSERT INTO `districts` VALUES (411525, 4115, 2, '固始', 'gu shi', 'gus', '固始县', NULL, NULL, '');
INSERT INTO `districts` VALUES (411526, 4115, 2, '潢川', 'huang chuan', 'huc', '潢川县', NULL, NULL, '');
INSERT INTO `districts` VALUES (411527, 4115, 2, '淮滨', 'huai bin', 'hub', '淮滨县', NULL, NULL, '');
INSERT INTO `districts` VALUES (411528, 4115, 2, '息县', 'xi xian', 'xix', '息县', NULL, NULL, '');
INSERT INTO `districts` VALUES (411571, 4115, 2, '信阳高新技术产业开发区', 'xin yang gao xin ji shu chan ye kai fa qu', 'xiyg', '信阳高新技术产业开发区', NULL, NULL, '');
INSERT INTO `districts` VALUES (411602, 4116, 2, '川汇', 'chuan hui', 'chh', '川汇区', NULL, NULL, '');
INSERT INTO `districts` VALUES (411621, 4116, 2, '扶沟', 'fu gou', 'fug', '扶沟县', NULL, NULL, '');
INSERT INTO `districts` VALUES (411622, 4116, 2, '西华', 'xi hua', 'xih', '西华县', NULL, NULL, '');
INSERT INTO `districts` VALUES (411623, 4116, 2, '商水', 'shang shui', 'shs', '商水县', NULL, NULL, '');
INSERT INTO `districts` VALUES (411624, 4116, 2, '沈丘', 'shen qiu', 'shq', '沈丘县', NULL, NULL, '');
INSERT INTO `districts` VALUES (411625, 4116, 2, '郸城', 'dan cheng', 'dac', '郸城县', NULL, NULL, '');
INSERT INTO `districts` VALUES (411626, 4116, 2, '淮阳', 'huai yang', 'huy', '淮阳县', NULL, NULL, '');
INSERT INTO `districts` VALUES (411627, 4116, 2, '太康', 'tai kang', 'tak', '太康县', NULL, NULL, '');
INSERT INTO `districts` VALUES (411628, 4116, 2, '鹿邑', 'lu yi', 'luy', '鹿邑县', NULL, NULL, '');
INSERT INTO `districts` VALUES (411671, 4116, 2, '河南周口经济开发区', 'he nan zhou kou jing ji kai fa qu', 'henz', '河南周口经济开发区', NULL, NULL, '');
INSERT INTO `districts` VALUES (411681, 4116, 2, '项城', 'xiang cheng', 'xic', '项城市', NULL, NULL, '');
INSERT INTO `districts` VALUES (411702, 4117, 2, '驿城', 'yi cheng', 'yic', '驿城区', NULL, NULL, '');
INSERT INTO `districts` VALUES (411721, 4117, 2, '西平', 'xi ping', 'xip', '西平县', NULL, NULL, '');
INSERT INTO `districts` VALUES (411722, 4117, 2, '上蔡', 'shang cai', 'shc', '上蔡县', NULL, NULL, '');
INSERT INTO `districts` VALUES (411723, 4117, 2, '平舆', 'ping yu', 'piy', '平舆县', NULL, NULL, '');
INSERT INTO `districts` VALUES (411724, 4117, 2, '正阳', 'zheng yang', 'zhy', '正阳县', NULL, NULL, '');
INSERT INTO `districts` VALUES (411725, 4117, 2, '确山', 'que shan', 'qus', '确山县', NULL, NULL, '');
INSERT INTO `districts` VALUES (411726, 4117, 2, '泌阳', 'bi yang', 'biy', '泌阳县', NULL, NULL, '');
INSERT INTO `districts` VALUES (411727, 4117, 2, '汝南', 'ru nan', 'run', '汝南县', NULL, NULL, '');
INSERT INTO `districts` VALUES (411728, 4117, 2, '遂平', 'sui ping', 'sup', '遂平县', NULL, NULL, '');
INSERT INTO `districts` VALUES (411729, 4117, 2, '新蔡', 'xin cai', 'xic', '新蔡县', NULL, NULL, '');
INSERT INTO `districts` VALUES (411771, 4117, 2, '河南驻马店经济开发区', 'he nan zhu ma dian jing ji kai fa qu', 'henz', '河南驻马店经济开发区', NULL, NULL, '');
INSERT INTO `districts` VALUES (419001, 4190, 2, '济源', 'ji yuan', 'jiy', '济源市', NULL, NULL, '');
INSERT INTO `districts` VALUES (420102, 4201, 2, '江岸', 'jiang an', 'jia', '江岸区', NULL, NULL, '');
INSERT INTO `districts` VALUES (420103, 4201, 2, '江汉', 'jiang han', 'jih', '江汉区', NULL, NULL, '');
INSERT INTO `districts` VALUES (420104, 4201, 2, '硚口', 'qiao kou', 'qik', '硚口区', NULL, NULL, '');
INSERT INTO `districts` VALUES (420105, 4201, 2, '汉阳', 'han yang', 'hay', '汉阳区', NULL, NULL, '');
INSERT INTO `districts` VALUES (420106, 4201, 2, '武昌', 'wu chang', 'wuc', '武昌区', NULL, NULL, '');
INSERT INTO `districts` VALUES (420107, 4201, 2, '青山', 'qing shan', 'qis', '青山区', NULL, NULL, '');
INSERT INTO `districts` VALUES (420111, 4201, 2, '洪山', 'hong shan', 'hos', '洪山区', NULL, NULL, '');
INSERT INTO `districts` VALUES (420112, 4201, 2, '东西湖', 'dong xi hu', 'doxh', '东西湖区', NULL, NULL, '');
INSERT INTO `districts` VALUES (420113, 4201, 2, '汉南', 'han nan', 'han', '汉南区', NULL, NULL, '');
INSERT INTO `districts` VALUES (420114, 4201, 2, '蔡甸', 'cai dian', 'cad', '蔡甸区', NULL, NULL, '');
INSERT INTO `districts` VALUES (420115, 4201, 2, '江夏', 'jiang xia', 'jix', '江夏区', NULL, NULL, '');
INSERT INTO `districts` VALUES (420116, 4201, 2, '黄陂', 'huang pi', 'hup', '黄陂区', NULL, NULL, '');
INSERT INTO `districts` VALUES (420117, 4201, 2, '新洲', 'xin zhou', 'xiz', '新洲区', NULL, NULL, '');
INSERT INTO `districts` VALUES (420202, 4202, 2, '黄石港', 'huang shi gang', 'husg', '黄石港区', NULL, NULL, '');
INSERT INTO `districts` VALUES (420203, 4202, 2, '西塞山', 'xi sai shan', 'xiss', '西塞山区', NULL, NULL, '');
INSERT INTO `districts` VALUES (420204, 4202, 2, '下陆', 'xia lu', 'xil', '下陆区', NULL, NULL, '');
INSERT INTO `districts` VALUES (420205, 4202, 2, '铁山', 'tie shan', 'tis', '铁山区', NULL, NULL, '');
INSERT INTO `districts` VALUES (420222, 4202, 2, '阳新', 'yang xin', 'yax', '阳新县', NULL, NULL, '');
INSERT INTO `districts` VALUES (420281, 4202, 2, '大冶', 'da ye', 'day', '大冶市', NULL, NULL, '');
INSERT INTO `districts` VALUES (420302, 4203, 2, '茅箭', 'mao jian', 'maj', '茅箭区', NULL, NULL, '');
INSERT INTO `districts` VALUES (420303, 4203, 2, '张湾', 'zhang wan', 'zhw', '张湾区', NULL, NULL, '');
INSERT INTO `districts` VALUES (420304, 4203, 2, '郧阳', 'yun yang', 'yuy', '郧阳区', NULL, NULL, '');
INSERT INTO `districts` VALUES (420322, 4203, 2, '郧西', 'yun xi', 'yux', '郧西县', NULL, NULL, '');
INSERT INTO `districts` VALUES (420323, 4203, 2, '竹山', 'zhu shan', 'zhs', '竹山县', NULL, NULL, '');
INSERT INTO `districts` VALUES (420324, 4203, 2, '竹溪', 'zhu xi', 'zhx', '竹溪县', NULL, NULL, '');
INSERT INTO `districts` VALUES (420325, 4203, 2, '房县', 'fang xian', 'fax', '房县', NULL, NULL, '');
INSERT INTO `districts` VALUES (420381, 4203, 2, '丹江口', 'dan jiang kou', 'dajk', '丹江口市', NULL, NULL, '');
INSERT INTO `districts` VALUES (420502, 4205, 2, '西陵', 'xi ling', 'xil', '西陵区', NULL, NULL, '');
INSERT INTO `districts` VALUES (420503, 4205, 2, '伍家岗', 'wu jia gang', 'wujg', '伍家岗区', NULL, NULL, '');
INSERT INTO `districts` VALUES (420504, 4205, 2, '点军', 'dian jun', 'dij', '点军区', NULL, NULL, '');
INSERT INTO `districts` VALUES (420505, 4205, 2, '猇亭', 'xiao ting', 'xit', '猇亭区', NULL, NULL, '');
INSERT INTO `districts` VALUES (420506, 4205, 2, '夷陵', 'yi ling', 'yil', '夷陵区', NULL, NULL, '');
INSERT INTO `districts` VALUES (420525, 4205, 2, '远安', 'yuan an', 'yua', '远安县', NULL, NULL, '');
INSERT INTO `districts` VALUES (420526, 4205, 2, '兴山', 'xing shan', 'xis', '兴山县', NULL, NULL, '');
INSERT INTO `districts` VALUES (420527, 4205, 2, '秭归', 'zi gui', 'zig', '秭归县', NULL, NULL, '');
INSERT INTO `districts` VALUES (420528, 4205, 2, '长阳土家族自治县', 'chang yang tu jia zu zi zhi xian', 'chyt', '长阳土家族自治县', NULL, NULL, '');
INSERT INTO `districts` VALUES (420529, 4205, 2, '五峰土家族自治县', 'wu feng tu jia zu zi zhi xian', 'wuft', '五峰土家族自治县', NULL, NULL, '');
INSERT INTO `districts` VALUES (420581, 4205, 2, '宜都', 'yi du', 'yid', '宜都市', NULL, NULL, '');
INSERT INTO `districts` VALUES (420582, 4205, 2, '当阳', 'dang yang', 'day', '当阳市', NULL, NULL, '');
INSERT INTO `districts` VALUES (420583, 4205, 2, '枝江', 'zhi jiang', 'zhj', '枝江市', NULL, NULL, '');
INSERT INTO `districts` VALUES (420602, 4206, 2, '襄城', 'xiang cheng', 'xic', '襄城区', NULL, NULL, '');
INSERT INTO `districts` VALUES (420606, 4206, 2, '樊城', 'fan cheng', 'fac', '樊城区', NULL, NULL, '');
INSERT INTO `districts` VALUES (420607, 4206, 2, '襄州', 'xiang zhou', 'xiz', '襄州区', NULL, NULL, '');
INSERT INTO `districts` VALUES (420624, 4206, 2, '南漳', 'nan zhang', 'naz', '南漳县', NULL, NULL, '');
INSERT INTO `districts` VALUES (420625, 4206, 2, '谷城', 'gu cheng', 'guc', '谷城县', NULL, NULL, '');
INSERT INTO `districts` VALUES (420626, 4206, 2, '保康', 'bao kang', 'bak', '保康县', NULL, NULL, '');
INSERT INTO `districts` VALUES (420682, 4206, 2, '老河口', 'lao he kou', 'lahk', '老河口市', NULL, NULL, '');
INSERT INTO `districts` VALUES (420683, 4206, 2, '枣阳', 'zao yang', 'zay', '枣阳市', NULL, NULL, '');
INSERT INTO `districts` VALUES (420684, 4206, 2, '宜城', 'yi cheng', 'yic', '宜城市', NULL, NULL, '');
INSERT INTO `districts` VALUES (420702, 4207, 2, '梁子湖', 'liang zi hu', 'lizh', '梁子湖区', NULL, NULL, '');
INSERT INTO `districts` VALUES (420703, 4207, 2, '华容', 'hua rong', 'hur', '华容区', NULL, NULL, '');
INSERT INTO `districts` VALUES (420704, 4207, 2, '鄂城', 'e cheng', 'ec', '鄂城区', NULL, NULL, '');
INSERT INTO `districts` VALUES (420802, 4208, 2, '东宝', 'dong bao', 'dob', '东宝区', NULL, NULL, '');
INSERT INTO `districts` VALUES (420804, 4208, 2, '掇刀', 'duo dao', 'dud', '掇刀区', NULL, NULL, '');
INSERT INTO `districts` VALUES (420821, 4208, 2, '京山', 'jing shan', 'jis', '京山县', NULL, NULL, '');
INSERT INTO `districts` VALUES (420822, 4208, 2, '沙洋', 'sha yang', 'shy', '沙洋县', NULL, NULL, '');
INSERT INTO `districts` VALUES (420881, 4208, 2, '钟祥', 'zhong xiang', 'zhx', '钟祥市', NULL, NULL, '');
INSERT INTO `districts` VALUES (420902, 4209, 2, '孝南', 'xiao nan', 'xin', '孝南区', NULL, NULL, '');
INSERT INTO `districts` VALUES (420921, 4209, 2, '孝昌', 'xiao chang', 'xic', '孝昌县', NULL, NULL, '');
INSERT INTO `districts` VALUES (420922, 4209, 2, '大悟', 'da wu', 'daw', '大悟县', NULL, NULL, '');
INSERT INTO `districts` VALUES (420923, 4209, 2, '云梦', 'yun meng', 'yum', '云梦县', NULL, NULL, '');
INSERT INTO `districts` VALUES (420981, 4209, 2, '应城', 'ying cheng', 'yic', '应城市', NULL, NULL, '');
INSERT INTO `districts` VALUES (420982, 4209, 2, '安陆', 'an lu', 'anl', '安陆市', NULL, NULL, '');
INSERT INTO `districts` VALUES (420984, 4209, 2, '汉川', 'han chuan', 'hac', '汉川市', NULL, NULL, '');
INSERT INTO `districts` VALUES (421002, 4210, 2, '沙市', 'sha shi', 'shs', '沙市区', NULL, NULL, '');
INSERT INTO `districts` VALUES (421003, 4210, 2, '荆州', 'jing zhou', 'jiz', '荆州区', NULL, NULL, '');
INSERT INTO `districts` VALUES (421022, 4210, 2, '公安', 'gong an', 'goa', '公安县', NULL, NULL, '');
INSERT INTO `districts` VALUES (421023, 4210, 2, '监利', 'jian li', 'jil', '监利县', NULL, NULL, '');
INSERT INTO `districts` VALUES (421024, 4210, 2, '江陵', 'jiang ling', 'jil', '江陵县', NULL, NULL, '');
INSERT INTO `districts` VALUES (421071, 4210, 2, '荆州经济技术开发区', 'jing zhou jing ji ji shu kai fa qu', 'jizj', '荆州经济技术开发区', NULL, NULL, '');
INSERT INTO `districts` VALUES (421081, 4210, 2, '石首', 'shi shou', 'shs', '石首市', NULL, NULL, '');
INSERT INTO `districts` VALUES (421083, 4210, 2, '洪湖', 'hong hu', 'hoh', '洪湖市', NULL, NULL, '');
INSERT INTO `districts` VALUES (421087, 4210, 2, '松滋', 'song zi', 'soz', '松滋市', NULL, NULL, '');
INSERT INTO `districts` VALUES (421102, 4211, 2, '黄州', 'huang zhou', 'huz', '黄州区', NULL, NULL, '');
INSERT INTO `districts` VALUES (421121, 4211, 2, '团风', 'tuan feng', 'tuf', '团风县', NULL, NULL, '');
INSERT INTO `districts` VALUES (421122, 4211, 2, '红安', 'hong an', 'hoa', '红安县', NULL, NULL, '');
INSERT INTO `districts` VALUES (421123, 4211, 2, '罗田', 'luo tian', 'lut', '罗田县', NULL, NULL, '');
INSERT INTO `districts` VALUES (421124, 4211, 2, '英山', 'ying shan', 'yis', '英山县', NULL, NULL, '');
INSERT INTO `districts` VALUES (421125, 4211, 2, '浠水', 'xi shui', 'xis', '浠水县', NULL, NULL, '');
INSERT INTO `districts` VALUES (421126, 4211, 2, '蕲春', 'qi chun', 'qic', '蕲春县', NULL, NULL, '');
INSERT INTO `districts` VALUES (421127, 4211, 2, '黄梅', 'huang mei', 'hum', '黄梅县', NULL, NULL, '');
INSERT INTO `districts` VALUES (421171, 4211, 2, '龙感湖管理区', 'long gan hu guan li qu', 'logh', '龙感湖管理区', NULL, NULL, '');
INSERT INTO `districts` VALUES (421181, 4211, 2, '麻城', 'ma cheng', 'mac', '麻城市', NULL, NULL, '');
INSERT INTO `districts` VALUES (421182, 4211, 2, '武穴', 'wu xue', 'wux', '武穴市', NULL, NULL, '');
INSERT INTO `districts` VALUES (421202, 4212, 2, '咸安', 'xian an', 'xia', '咸安区', NULL, NULL, '');
INSERT INTO `districts` VALUES (421221, 4212, 2, '嘉鱼', 'jia yu', 'jiy', '嘉鱼县', NULL, NULL, '');
INSERT INTO `districts` VALUES (421222, 4212, 2, '通城', 'tong cheng', 'toc', '通城县', NULL, NULL, '');
INSERT INTO `districts` VALUES (421223, 4212, 2, '崇阳', 'chong yang', 'chy', '崇阳县', NULL, NULL, '');
INSERT INTO `districts` VALUES (421224, 4212, 2, '通山', 'tong shan', 'tos', '通山县', NULL, NULL, '');
INSERT INTO `districts` VALUES (421281, 4212, 2, '赤壁', 'chi bi', 'chb', '赤壁市', NULL, NULL, '');
INSERT INTO `districts` VALUES (421303, 4213, 2, '曾都', 'zeng du', 'zed', '曾都区', NULL, NULL, '');
INSERT INTO `districts` VALUES (421321, 4213, 2, '随县', 'sui xian', 'sux', '随县', NULL, NULL, '');
INSERT INTO `districts` VALUES (421381, 4213, 2, '广水', 'guang shui', 'gus', '广水市', NULL, NULL, '');
INSERT INTO `districts` VALUES (422801, 4228, 2, '恩施', 'en shi', 'ens', '恩施市', NULL, NULL, '');
INSERT INTO `districts` VALUES (422802, 4228, 2, '利川', 'li chuan', 'lic', '利川市', NULL, NULL, '');
INSERT INTO `districts` VALUES (422822, 4228, 2, '建始', 'jian shi', 'jis', '建始县', NULL, NULL, '');
INSERT INTO `districts` VALUES (422823, 4228, 2, '巴东', 'ba dong', 'bad', '巴东县', NULL, NULL, '');
INSERT INTO `districts` VALUES (422825, 4228, 2, '宣恩', 'xuan en', 'xue', '宣恩县', NULL, NULL, '');
INSERT INTO `districts` VALUES (422826, 4228, 2, '咸丰', 'xian feng', 'xif', '咸丰县', NULL, NULL, '');
INSERT INTO `districts` VALUES (422827, 4228, 2, '来凤', 'lai feng', 'laf', '来凤县', NULL, NULL, '');
INSERT INTO `districts` VALUES (422828, 4228, 2, '鹤峰', 'he feng', 'hef', '鹤峰县', NULL, NULL, '');
INSERT INTO `districts` VALUES (429004, 4290, 2, '仙桃', 'xian tao', 'xit', '仙桃市', NULL, NULL, '');
INSERT INTO `districts` VALUES (429005, 4290, 2, '潜江', 'qian jiang', 'qij', '潜江市', NULL, NULL, '');
INSERT INTO `districts` VALUES (429006, 4290, 2, '天门', 'tian men', 'tim', '天门市', NULL, NULL, '');
INSERT INTO `districts` VALUES (429021, 4290, 2, '神农架林', 'shen nong jia lin', 'shnj', '神农架林区', NULL, NULL, '');
INSERT INTO `districts` VALUES (430102, 4301, 2, '芙蓉', 'fu rong', 'fur', '芙蓉区', NULL, NULL, '');
INSERT INTO `districts` VALUES (430103, 4301, 2, '天心', 'tian xin', 'tix', '天心区', NULL, NULL, '');
INSERT INTO `districts` VALUES (430104, 4301, 2, '岳麓', 'yue lu', 'yul', '岳麓区', NULL, NULL, '');
INSERT INTO `districts` VALUES (430105, 4301, 2, '开福', 'kai fu', 'kaf', '开福区', NULL, NULL, '');
INSERT INTO `districts` VALUES (430111, 4301, 2, '雨花', 'yu hua', 'yuh', '雨花区', NULL, NULL, '');
INSERT INTO `districts` VALUES (430112, 4301, 2, '望城', 'wang cheng', 'wac', '望城区', NULL, NULL, '');
INSERT INTO `districts` VALUES (430121, 4301, 2, '长沙', 'chang sha', 'chs', '长沙县', NULL, NULL, '');
INSERT INTO `districts` VALUES (430181, 4301, 2, '浏阳', 'liu yang', 'liy', '浏阳市', NULL, NULL, '');
INSERT INTO `districts` VALUES (430182, 4301, 2, '宁乡', 'ning xiang', 'nix', '宁乡市', NULL, NULL, '');
INSERT INTO `districts` VALUES (430202, 4302, 2, '荷塘', 'he tang', 'het', '荷塘区', NULL, NULL, '');
INSERT INTO `districts` VALUES (430203, 4302, 2, '芦淞', 'lu song', 'lus', '芦淞区', NULL, NULL, '');
INSERT INTO `districts` VALUES (430204, 4302, 2, '石峰', 'shi feng', 'shf', '石峰区', NULL, NULL, '');
INSERT INTO `districts` VALUES (430211, 4302, 2, '天元', 'tian yuan', 'tiy', '天元区', NULL, NULL, '');
INSERT INTO `districts` VALUES (430221, 4302, 2, '株洲', 'zhu zhou', 'zhz', '株洲县', NULL, NULL, '');
INSERT INTO `districts` VALUES (430223, 4302, 2, '攸县', 'you xian', 'yox', '攸县', NULL, NULL, '');
INSERT INTO `districts` VALUES (430224, 4302, 2, '茶陵', 'cha ling', 'chl', '茶陵县', NULL, NULL, '');
INSERT INTO `districts` VALUES (430225, 4302, 2, '炎陵', 'yan ling', 'yal', '炎陵县', NULL, NULL, '');
INSERT INTO `districts` VALUES (430271, 4302, 2, '云龙示范区', 'yun long shi fan qu', 'yuls', '云龙示范区', NULL, NULL, '');
INSERT INTO `districts` VALUES (430281, 4302, 2, '醴陵', 'li ling', 'lil', '醴陵市', NULL, NULL, '');
INSERT INTO `districts` VALUES (430302, 4303, 2, '雨湖', 'yu hu', 'yuh', '雨湖区', NULL, NULL, '');
INSERT INTO `districts` VALUES (430304, 4303, 2, '岳塘', 'yue tang', 'yut', '岳塘区', NULL, NULL, '');
INSERT INTO `districts` VALUES (430321, 4303, 2, '湘潭', 'xiang tan', 'xit', '湘潭县', NULL, NULL, '');
INSERT INTO `districts` VALUES (430371, 4303, 2, '湖南湘潭高新技术产业园', 'hu nan xiang tan gao xin ji shu chan ye yuan', 'hunx', '湖南湘潭高新技术产业园区', NULL, NULL, '');
INSERT INTO `districts` VALUES (430372, 4303, 2, '湘潭昭山示范区', 'xiang tan zhao shan shi fan qu', 'xitz', '湘潭昭山示范区', NULL, NULL, '');
INSERT INTO `districts` VALUES (430373, 4303, 2, '湘潭九华示范区', 'xiang tan jiu hua shi fan qu', 'xitj', '湘潭九华示范区', NULL, NULL, '');
INSERT INTO `districts` VALUES (430381, 4303, 2, '湘乡', 'xiang xiang', 'xix', '湘乡市', NULL, NULL, '');
INSERT INTO `districts` VALUES (430382, 4303, 2, '韶山', 'shao shan', 'shs', '韶山市', NULL, NULL, '');
INSERT INTO `districts` VALUES (430405, 4304, 2, '珠晖', 'zhu hui', 'zhh', '珠晖区', NULL, NULL, '');
INSERT INTO `districts` VALUES (430406, 4304, 2, '雁峰', 'yan feng', 'yaf', '雁峰区', NULL, NULL, '');
INSERT INTO `districts` VALUES (430407, 4304, 2, '石鼓', 'shi gu', 'shg', '石鼓区', NULL, NULL, '');
INSERT INTO `districts` VALUES (430408, 4304, 2, '蒸湘', 'zheng xiang', 'zhx', '蒸湘区', NULL, NULL, '');
INSERT INTO `districts` VALUES (430412, 4304, 2, '南岳', 'nan yue', 'nay', '南岳区', NULL, NULL, '');
INSERT INTO `districts` VALUES (430421, 4304, 2, '衡阳', 'heng yang', 'hey', '衡阳县', NULL, NULL, '');
INSERT INTO `districts` VALUES (430422, 4304, 2, '衡南', 'heng nan', 'hen', '衡南县', NULL, NULL, '');
INSERT INTO `districts` VALUES (430423, 4304, 2, '衡山', 'heng shan', 'hes', '衡山县', NULL, NULL, '');
INSERT INTO `districts` VALUES (430424, 4304, 2, '衡东', 'heng dong', 'hed', '衡东县', NULL, NULL, '');
INSERT INTO `districts` VALUES (430426, 4304, 2, '祁东', 'qi dong', 'qid', '祁东县', NULL, NULL, '');
INSERT INTO `districts` VALUES (430471, 4304, 2, '衡阳综合保税', 'heng yang zong he bao shui', 'heyz', '衡阳综合保税区', NULL, NULL, '');
INSERT INTO `districts` VALUES (430472, 4304, 2, '湖南衡阳高新技术产业园', 'hu nan heng yang gao xin ji shu chan ye yuan', 'hunh', '湖南衡阳高新技术产业园区', NULL, NULL, '');
INSERT INTO `districts` VALUES (430473, 4304, 2, '湖南衡阳松木经济开发区', 'hu nan heng yang song mu jing ji kai fa qu', 'hunh', '湖南衡阳松木经济开发区', NULL, NULL, '');
INSERT INTO `districts` VALUES (430481, 4304, 2, '耒阳', 'lei yang', 'ley', '耒阳市', NULL, NULL, '');
INSERT INTO `districts` VALUES (430482, 4304, 2, '常宁', 'chang ning', 'chn', '常宁市', NULL, NULL, '');
INSERT INTO `districts` VALUES (430502, 4305, 2, '双清', 'shuang qing', 'shq', '双清区', NULL, NULL, '');
INSERT INTO `districts` VALUES (430503, 4305, 2, '大祥', 'da xiang', 'dax', '大祥区', NULL, NULL, '');
INSERT INTO `districts` VALUES (430511, 4305, 2, '北塔', 'bei ta', 'bet', '北塔区', NULL, NULL, '');
INSERT INTO `districts` VALUES (430521, 4305, 2, '邵东', 'shao dong', 'shd', '邵东县', NULL, NULL, '');
INSERT INTO `districts` VALUES (430522, 4305, 2, '新邵', 'xin shao', 'xis', '新邵县', NULL, NULL, '');
INSERT INTO `districts` VALUES (430523, 4305, 2, '邵阳', 'shao yang', 'shy', '邵阳县', NULL, NULL, '');
INSERT INTO `districts` VALUES (430524, 4305, 2, '隆回', 'long hui', 'loh', '隆回县', NULL, NULL, '');
INSERT INTO `districts` VALUES (430525, 4305, 2, '洞口', 'dong kou', 'dok', '洞口县', NULL, NULL, '');
INSERT INTO `districts` VALUES (430527, 4305, 2, '绥宁', 'sui ning', 'sun', '绥宁县', NULL, NULL, '');
INSERT INTO `districts` VALUES (430528, 4305, 2, '新宁', 'xin ning', 'xin', '新宁县', NULL, NULL, '');
INSERT INTO `districts` VALUES (430529, 4305, 2, '城步苗族自治县', 'cheng bu miao zu zi zhi xian', 'chbm', '城步苗族自治县', NULL, NULL, '');
INSERT INTO `districts` VALUES (430581, 4305, 2, '武冈', 'wu gang', 'wug', '武冈市', NULL, NULL, '');
INSERT INTO `districts` VALUES (430602, 4306, 2, '岳阳楼', 'yue yang lou', 'yuyl', '岳阳楼区', NULL, NULL, '');
INSERT INTO `districts` VALUES (430603, 4306, 2, '云溪', 'yun xi', 'yux', '云溪区', NULL, NULL, '');
INSERT INTO `districts` VALUES (430611, 4306, 2, '君山', 'jun shan', 'jus', '君山区', NULL, NULL, '');
INSERT INTO `districts` VALUES (430621, 4306, 2, '岳阳', 'yue yang', 'yuy', '岳阳县', NULL, NULL, '');
INSERT INTO `districts` VALUES (430623, 4306, 2, '华容', 'hua rong', 'hur', '华容县', NULL, NULL, '');
INSERT INTO `districts` VALUES (430624, 4306, 2, '湘阴', 'xiang yin', 'xiy', '湘阴县', NULL, NULL, '');
INSERT INTO `districts` VALUES (430626, 4306, 2, '平江', 'ping jiang', 'pij', '平江县', NULL, NULL, '');
INSERT INTO `districts` VALUES (430671, 4306, 2, '岳阳市屈原管理区', 'yue yang shi qu yuan guan li qu', 'yuys', '岳阳市屈原管理区', NULL, NULL, '');
INSERT INTO `districts` VALUES (430681, 4306, 2, '汨罗', 'mi luo', 'mil', '汨罗市', NULL, NULL, '');
INSERT INTO `districts` VALUES (430682, 4306, 2, '临湘', 'lin xiang', 'lix', '临湘市', NULL, NULL, '');
INSERT INTO `districts` VALUES (430702, 4307, 2, '武陵', 'wu ling', 'wul', '武陵区', NULL, NULL, '');
INSERT INTO `districts` VALUES (430703, 4307, 2, '鼎城', 'ding cheng', 'dic', '鼎城区', NULL, NULL, '');
INSERT INTO `districts` VALUES (430721, 4307, 2, '安乡', 'an xiang', 'anx', '安乡县', NULL, NULL, '');
INSERT INTO `districts` VALUES (430722, 4307, 2, '汉寿', 'han shou', 'has', '汉寿县', NULL, NULL, '');
INSERT INTO `districts` VALUES (430723, 4307, 2, '澧县', 'li xian', 'lix', '澧县', NULL, NULL, '');
INSERT INTO `districts` VALUES (430724, 4307, 2, '临澧', 'lin li', 'lil', '临澧县', NULL, NULL, '');
INSERT INTO `districts` VALUES (430725, 4307, 2, '桃源', 'tao yuan', 'tay', '桃源县', NULL, NULL, '');
INSERT INTO `districts` VALUES (430726, 4307, 2, '石门', 'shi men', 'shm', '石门县', NULL, NULL, '');
INSERT INTO `districts` VALUES (430771, 4307, 2, '常德市西洞庭管理区', 'chang de shi xi dong ting guan li qu', 'chds', '常德市西洞庭管理区', NULL, NULL, '');
INSERT INTO `districts` VALUES (430781, 4307, 2, '津市', 'jin shi', 'jis', '津市市', NULL, NULL, '');
INSERT INTO `districts` VALUES (430802, 4308, 2, '永定', 'yong ding', 'yod', '永定区', NULL, NULL, '');
INSERT INTO `districts` VALUES (430811, 4308, 2, '武陵源', 'wu ling yuan', 'wuly', '武陵源区', NULL, NULL, '');
INSERT INTO `districts` VALUES (430821, 4308, 2, '慈利', 'ci li', 'cil', '慈利县', NULL, NULL, '');
INSERT INTO `districts` VALUES (430822, 4308, 2, '桑植', 'sang zhi', 'saz', '桑植县', NULL, NULL, '');
INSERT INTO `districts` VALUES (430902, 4309, 2, '资阳', 'zi yang', 'ziy', '资阳区', NULL, NULL, '');
INSERT INTO `districts` VALUES (430903, 4309, 2, '赫山', 'he shan', 'hes', '赫山区', NULL, NULL, '');
INSERT INTO `districts` VALUES (430921, 4309, 2, '南县', 'nan xian', 'nax', '南县', NULL, NULL, '');
INSERT INTO `districts` VALUES (430922, 4309, 2, '桃江', 'tao jiang', 'taj', '桃江县', NULL, NULL, '');
INSERT INTO `districts` VALUES (430923, 4309, 2, '安化', 'an hua', 'anh', '安化县', NULL, NULL, '');
INSERT INTO `districts` VALUES (430971, 4309, 2, '益阳市大通湖管理区', 'yi yang shi da tong hu guan li qu', 'yiys', '益阳市大通湖管理区', NULL, NULL, '');
INSERT INTO `districts` VALUES (430972, 4309, 2, '湖南益阳高新技术产业园', 'hu nan yi yang gao xin ji shu chan ye yuan', 'huny', '湖南益阳高新技术产业园区', NULL, NULL, '');
INSERT INTO `districts` VALUES (430981, 4309, 2, '沅江', 'yuan jiang', 'yuj', '沅江市', NULL, NULL, '');
INSERT INTO `districts` VALUES (431002, 4310, 2, '北湖', 'bei hu', 'beh', '北湖区', NULL, NULL, '');
INSERT INTO `districts` VALUES (431003, 4310, 2, '苏仙', 'su xian', 'sux', '苏仙区', NULL, NULL, '');
INSERT INTO `districts` VALUES (431021, 4310, 2, '桂阳', 'gui yang', 'guy', '桂阳县', NULL, NULL, '');
INSERT INTO `districts` VALUES (431022, 4310, 2, '宜章', 'yi zhang', 'yiz', '宜章县', NULL, NULL, '');
INSERT INTO `districts` VALUES (431023, 4310, 2, '永兴', 'yong xing', 'yox', '永兴县', NULL, NULL, '');
INSERT INTO `districts` VALUES (431024, 4310, 2, '嘉禾', 'jia he', 'jih', '嘉禾县', NULL, NULL, '');
INSERT INTO `districts` VALUES (431025, 4310, 2, '临武', 'lin wu', 'liw', '临武县', NULL, NULL, '');
INSERT INTO `districts` VALUES (431026, 4310, 2, '汝城', 'ru cheng', 'ruc', '汝城县', NULL, NULL, '');
INSERT INTO `districts` VALUES (431027, 4310, 2, '桂东', 'gui dong', 'gud', '桂东县', NULL, NULL, '');
INSERT INTO `districts` VALUES (431028, 4310, 2, '安仁', 'an ren', 'anr', '安仁县', NULL, NULL, '');
INSERT INTO `districts` VALUES (431081, 4310, 2, '资兴', 'zi xing', 'zix', '资兴市', NULL, NULL, '');
INSERT INTO `districts` VALUES (431102, 4311, 2, '零陵', 'ling ling', 'lil', '零陵区', NULL, NULL, '');
INSERT INTO `districts` VALUES (431103, 4311, 2, '冷水滩', 'leng shui tan', 'lest', '冷水滩区', NULL, NULL, '');
INSERT INTO `districts` VALUES (431121, 4311, 2, '祁阳', 'qi yang', 'qiy', '祁阳县', NULL, NULL, '');
INSERT INTO `districts` VALUES (431122, 4311, 2, '东安', 'dong an', 'doa', '东安县', NULL, NULL, '');
INSERT INTO `districts` VALUES (431123, 4311, 2, '双牌', 'shuang pai', 'shp', '双牌县', NULL, NULL, '');
INSERT INTO `districts` VALUES (431124, 4311, 2, '道县', 'dao xian', 'dax', '道县', NULL, NULL, '');
INSERT INTO `districts` VALUES (431125, 4311, 2, '江永', 'jiang yong', 'jiy', '江永县', NULL, NULL, '');
INSERT INTO `districts` VALUES (431126, 4311, 2, '宁远', 'ning yuan', 'niy', '宁远县', NULL, NULL, '');
INSERT INTO `districts` VALUES (431127, 4311, 2, '蓝山', 'lan shan', 'las', '蓝山县', NULL, NULL, '');
INSERT INTO `districts` VALUES (431128, 4311, 2, '新田', 'xin tian', 'xit', '新田县', NULL, NULL, '');
INSERT INTO `districts` VALUES (431129, 4311, 2, '江华瑶族自治县', 'jiang hua yao zu zi zhi xian', 'jihy', '江华瑶族自治县', NULL, NULL, '');
INSERT INTO `districts` VALUES (431171, 4311, 2, '永州经济技术开发区', 'yong zhou jing ji ji shu kai fa qu', 'yozj', '永州经济技术开发区', NULL, NULL, '');
INSERT INTO `districts` VALUES (431172, 4311, 2, '永州市金洞管理区', 'yong zhou shi jin dong guan li qu', 'yozs', '永州市金洞管理区', NULL, NULL, '');
INSERT INTO `districts` VALUES (431173, 4311, 2, '永州市回龙圩管理区', 'yong zhou shi hui long xu guan li qu', 'yozs', '永州市回龙圩管理区', NULL, NULL, '');
INSERT INTO `districts` VALUES (431202, 4312, 2, '鹤城', 'he cheng', 'hec', '鹤城区', NULL, NULL, '');
INSERT INTO `districts` VALUES (431221, 4312, 2, '中方', 'zhong fang', 'zhf', '中方县', NULL, NULL, '');
INSERT INTO `districts` VALUES (431222, 4312, 2, '沅陵', 'yuan ling', 'yul', '沅陵县', NULL, NULL, '');
INSERT INTO `districts` VALUES (431223, 4312, 2, '辰溪', 'chen xi', 'chx', '辰溪县', NULL, NULL, '');
INSERT INTO `districts` VALUES (431224, 4312, 2, '溆浦', 'xu pu', 'xup', '溆浦县', NULL, NULL, '');
INSERT INTO `districts` VALUES (431225, 4312, 2, '会同', 'hui tong', 'hut', '会同县', NULL, NULL, '');
INSERT INTO `districts` VALUES (431226, 4312, 2, '麻阳苗族自治县', 'ma yang miao zu zi zhi xian', 'maym', '麻阳苗族自治县', NULL, NULL, '');
INSERT INTO `districts` VALUES (431227, 4312, 2, '新晃侗族自治县', 'xin huang dong zu zi zhi xian', 'xihd', '新晃侗族自治县', NULL, NULL, '');
INSERT INTO `districts` VALUES (431228, 4312, 2, '芷江侗族自治县', 'zhi jiang dong zu zi zhi xian', 'zhjd', '芷江侗族自治县', NULL, NULL, '');
INSERT INTO `districts` VALUES (431229, 4312, 2, '靖州苗族侗族自治县', 'jing zhou miao zu dong zu zi zhi xian', 'jizm', '靖州苗族侗族自治县', NULL, NULL, '');
INSERT INTO `districts` VALUES (431230, 4312, 2, '通道侗族自治县', 'tong dao dong zu zi zhi xian', 'todd', '通道侗族自治县', NULL, NULL, '');
INSERT INTO `districts` VALUES (431271, 4312, 2, '怀化市洪江管理区', 'huai hua shi hong jiang guan li qu', 'huhs', '怀化市洪江管理区', NULL, NULL, '');
INSERT INTO `districts` VALUES (431281, 4312, 2, '洪江', 'hong jiang', 'hoj', '洪江市', NULL, NULL, '');
INSERT INTO `districts` VALUES (431302, 4313, 2, '娄星', 'lou xing', 'lox', '娄星区', NULL, NULL, '');
INSERT INTO `districts` VALUES (431321, 4313, 2, '双峰', 'shuang feng', 'shf', '双峰县', NULL, NULL, '');
INSERT INTO `districts` VALUES (431322, 4313, 2, '新化', 'xin hua', 'xih', '新化县', NULL, NULL, '');
INSERT INTO `districts` VALUES (431381, 4313, 2, '冷水江', 'leng shui jiang', 'lesj', '冷水江市', NULL, NULL, '');
INSERT INTO `districts` VALUES (431382, 4313, 2, '涟源', 'lian yuan', 'liy', '涟源市', NULL, NULL, '');
INSERT INTO `districts` VALUES (433101, 4331, 2, '吉首', 'ji shou', 'jis', '吉首市', NULL, NULL, '');
INSERT INTO `districts` VALUES (433122, 4331, 2, '泸溪', 'lu xi', 'lux', '泸溪县', NULL, NULL, '');
INSERT INTO `districts` VALUES (433123, 4331, 2, '凤凰', 'feng huang', 'feh', '凤凰县', NULL, NULL, '');
INSERT INTO `districts` VALUES (433124, 4331, 2, '花垣', 'hua yuan', 'huy', '花垣县', NULL, NULL, '');
INSERT INTO `districts` VALUES (433125, 4331, 2, '保靖', 'bao jing', 'baj', '保靖县', NULL, NULL, '');
INSERT INTO `districts` VALUES (433126, 4331, 2, '古丈', 'gu zhang', 'guz', '古丈县', NULL, NULL, '');
INSERT INTO `districts` VALUES (433127, 4331, 2, '永顺', 'yong shun', 'yos', '永顺县', NULL, NULL, '');
INSERT INTO `districts` VALUES (433130, 4331, 2, '龙山', 'long shan', 'los', '龙山县', NULL, NULL, '');
INSERT INTO `districts` VALUES (433172, 4331, 2, '湖南吉首经济开发区', 'hu nan ji shou jing ji kai fa qu', 'hunj', '湖南吉首经济开发区', NULL, NULL, '');
INSERT INTO `districts` VALUES (433173, 4331, 2, '湖南永顺经济开发区', 'hu nan yong shun jing ji kai fa qu', 'huny', '湖南永顺经济开发区', NULL, NULL, '');
INSERT INTO `districts` VALUES (440103, 4401, 2, '荔湾', 'li wan', 'liw', '荔湾区', NULL, NULL, '');
INSERT INTO `districts` VALUES (440104, 4401, 2, '越秀', 'yue xiu', 'yux', '越秀区', NULL, NULL, '');
INSERT INTO `districts` VALUES (440105, 4401, 2, '海珠', 'hai zhu', 'haz', '海珠区', NULL, NULL, '');
INSERT INTO `districts` VALUES (440106, 4401, 2, '天河', 'tian he', 'tih', '天河区', NULL, NULL, '');
INSERT INTO `districts` VALUES (440111, 4401, 2, '白云', 'bai yun', 'bay', '白云区', NULL, NULL, '');
INSERT INTO `districts` VALUES (440112, 4401, 2, '黄埔', 'huang pu', 'hup', '黄埔区', NULL, NULL, '');
INSERT INTO `districts` VALUES (440113, 4401, 2, '番禺', 'pan yu', 'pay', '番禺区', NULL, NULL, '');
INSERT INTO `districts` VALUES (440114, 4401, 2, '花都', 'hua du', 'hud', '花都区', NULL, NULL, '');
INSERT INTO `districts` VALUES (440115, 4401, 2, '南沙', 'nan sha', 'nas', '南沙区', NULL, NULL, '');
INSERT INTO `districts` VALUES (440117, 4401, 2, '从化', 'cong hua', 'coh', '从化区', NULL, NULL, '');
INSERT INTO `districts` VALUES (440118, 4401, 2, '增城', 'zeng cheng', 'zec', '增城区', NULL, NULL, '');
INSERT INTO `districts` VALUES (440203, 4402, 2, '武江', 'wu jiang', 'wuj', '武江区', NULL, NULL, '');
INSERT INTO `districts` VALUES (440204, 4402, 2, '浈江', 'zhen jiang', 'zhj', '浈江区', NULL, NULL, '');
INSERT INTO `districts` VALUES (440205, 4402, 2, '曲江', 'qu jiang', 'quj', '曲江区', NULL, NULL, '');
INSERT INTO `districts` VALUES (440222, 4402, 2, '始兴', 'shi xing', 'shx', '始兴县', NULL, NULL, '');
INSERT INTO `districts` VALUES (440224, 4402, 2, '仁化', 'ren hua', 'reh', '仁化县', NULL, NULL, '');
INSERT INTO `districts` VALUES (440229, 4402, 2, '翁源', 'weng yuan', 'wey', '翁源县', NULL, NULL, '');
INSERT INTO `districts` VALUES (440232, 4402, 2, '乳源瑶族自治县', 'ru yuan yao zu zi zhi xian', 'ruyy', '乳源瑶族自治县', NULL, NULL, '');
INSERT INTO `districts` VALUES (440233, 4402, 2, '新丰', 'xin feng', 'xif', '新丰县', NULL, NULL, '');
INSERT INTO `districts` VALUES (440281, 4402, 2, '乐昌', 'le chang', 'lec', '乐昌市', NULL, NULL, '');
INSERT INTO `districts` VALUES (440282, 4402, 2, '南雄', 'nan xiong', 'nax', '南雄市', NULL, NULL, '');
INSERT INTO `districts` VALUES (440303, 4403, 2, '罗湖', 'luo hu', 'luh', '罗湖区', NULL, NULL, '');
INSERT INTO `districts` VALUES (440304, 4403, 2, '福田', 'fu tian', 'fut', '福田区', NULL, NULL, '');
INSERT INTO `districts` VALUES (440305, 4403, 2, '南山', 'nan shan', 'nas', '南山区', NULL, NULL, '');
INSERT INTO `districts` VALUES (440306, 4403, 2, '宝安', 'bao an', 'baa', '宝安区', NULL, NULL, '');
INSERT INTO `districts` VALUES (440307, 4403, 2, '龙岗', 'long gang', 'log', '龙岗区', NULL, NULL, '');
INSERT INTO `districts` VALUES (440308, 4403, 2, '盐田', 'yan tian', 'yat', '盐田区', NULL, NULL, '');
INSERT INTO `districts` VALUES (440309, 4403, 2, '龙华', 'long hua', 'loh', '龙华区', NULL, NULL, '');
INSERT INTO `districts` VALUES (440310, 4403, 2, '坪山', 'ping shan', 'pis', '坪山区', NULL, NULL, '');
INSERT INTO `districts` VALUES (440402, 4404, 2, '香洲', 'xiang zhou', 'xiz', '香洲区', NULL, NULL, '');
INSERT INTO `districts` VALUES (440403, 4404, 2, '斗门', 'dou men', 'dom', '斗门区', NULL, NULL, '');
INSERT INTO `districts` VALUES (440404, 4404, 2, '金湾', 'jin wan', 'jiw', '金湾区', NULL, NULL, '');
INSERT INTO `districts` VALUES (440507, 4405, 2, '龙湖', 'long hu', 'loh', '龙湖区', NULL, NULL, '');
INSERT INTO `districts` VALUES (440511, 4405, 2, '金平', 'jin ping', 'jip', '金平区', NULL, NULL, '');
INSERT INTO `districts` VALUES (440512, 4405, 2, '濠江', 'hao jiang', 'haj', '濠江区', NULL, NULL, '');
INSERT INTO `districts` VALUES (440513, 4405, 2, '潮阳', 'chao yang', 'chy', '潮阳区', NULL, NULL, '');
INSERT INTO `districts` VALUES (440514, 4405, 2, '潮南', 'chao nan', 'chn', '潮南区', NULL, NULL, '');
INSERT INTO `districts` VALUES (440515, 4405, 2, '澄海', 'cheng hai', 'chh', '澄海区', NULL, NULL, '');
INSERT INTO `districts` VALUES (440523, 4405, 2, '南澳', 'nan ao', 'naa', '南澳县', NULL, NULL, '');
INSERT INTO `districts` VALUES (440604, 4406, 2, '禅城', 'chan cheng', 'chc', '禅城区', NULL, NULL, '');
INSERT INTO `districts` VALUES (440605, 4406, 2, '南海', 'nan hai', 'nah', '南海区', NULL, NULL, '');
INSERT INTO `districts` VALUES (440606, 4406, 2, '顺德', 'shun de', 'shd', '顺德区', NULL, NULL, '');
INSERT INTO `districts` VALUES (440607, 4406, 2, '三水', 'san shui', 'sas', '三水区', NULL, NULL, '');
INSERT INTO `districts` VALUES (440608, 4406, 2, '高明', 'gao ming', 'gam', '高明区', NULL, NULL, '');
INSERT INTO `districts` VALUES (440703, 4407, 2, '蓬江', 'peng jiang', 'pej', '蓬江区', NULL, NULL, '');
INSERT INTO `districts` VALUES (440704, 4407, 2, '江海', 'jiang hai', 'jih', '江海区', NULL, NULL, '');
INSERT INTO `districts` VALUES (440705, 4407, 2, '新会', 'xin hui', 'xih', '新会区', NULL, NULL, '');
INSERT INTO `districts` VALUES (440781, 4407, 2, '台山', 'tai shan', 'tas', '台山市', NULL, NULL, '');
INSERT INTO `districts` VALUES (440783, 4407, 2, '开平', 'kai ping', 'kap', '开平市', NULL, NULL, '');
INSERT INTO `districts` VALUES (440784, 4407, 2, '鹤山', 'he shan', 'hes', '鹤山市', NULL, NULL, '');
INSERT INTO `districts` VALUES (440785, 4407, 2, '恩平', 'en ping', 'enp', '恩平市', NULL, NULL, '');
INSERT INTO `districts` VALUES (440802, 4408, 2, '赤坎', 'chi kan', 'chk', '赤坎区', NULL, NULL, '');
INSERT INTO `districts` VALUES (440803, 4408, 2, '霞山', 'xia shan', 'xis', '霞山区', NULL, NULL, '');
INSERT INTO `districts` VALUES (440804, 4408, 2, '坡头', 'po tou', 'pot', '坡头区', NULL, NULL, '');
INSERT INTO `districts` VALUES (440811, 4408, 2, '麻章', 'ma zhang', 'maz', '麻章区', NULL, NULL, '');
INSERT INTO `districts` VALUES (440823, 4408, 2, '遂溪', 'sui xi', 'sux', '遂溪县', NULL, NULL, '');
INSERT INTO `districts` VALUES (440825, 4408, 2, '徐闻', 'xu wen', 'xuw', '徐闻县', NULL, NULL, '');
INSERT INTO `districts` VALUES (440881, 4408, 2, '廉江', 'lian jiang', 'lij', '廉江市', NULL, NULL, '');
INSERT INTO `districts` VALUES (440882, 4408, 2, '雷州', 'lei zhou', 'lez', '雷州市', NULL, NULL, '');
INSERT INTO `districts` VALUES (440883, 4408, 2, '吴川', 'wu chuan', 'wuc', '吴川市', NULL, NULL, '');
INSERT INTO `districts` VALUES (440902, 4409, 2, '茂南', 'mao nan', 'man', '茂南区', NULL, NULL, '');
INSERT INTO `districts` VALUES (440904, 4409, 2, '电白', 'dian bai', 'dib', '电白区', NULL, NULL, '');
INSERT INTO `districts` VALUES (440981, 4409, 2, '高州', 'gao zhou', 'gaz', '高州市', NULL, NULL, '');
INSERT INTO `districts` VALUES (440982, 4409, 2, '化州', 'hua zhou', 'huz', '化州市', NULL, NULL, '');
INSERT INTO `districts` VALUES (440983, 4409, 2, '信宜', 'xin yi', 'xiy', '信宜市', NULL, NULL, '');
INSERT INTO `districts` VALUES (441202, 4412, 2, '端州', 'duan zhou', 'duz', '端州区', NULL, NULL, '');
INSERT INTO `districts` VALUES (441203, 4412, 2, '鼎湖', 'ding hu', 'dih', '鼎湖区', NULL, NULL, '');
INSERT INTO `districts` VALUES (441204, 4412, 2, '高要', 'gao yao', 'gay', '高要区', NULL, NULL, '');
INSERT INTO `districts` VALUES (441223, 4412, 2, '广宁', 'guang ning', 'gun', '广宁县', NULL, NULL, '');
INSERT INTO `districts` VALUES (441224, 4412, 2, '怀集', 'huai ji', 'huj', '怀集县', NULL, NULL, '');
INSERT INTO `districts` VALUES (441225, 4412, 2, '封开', 'feng kai', 'fek', '封开县', NULL, NULL, '');
INSERT INTO `districts` VALUES (441226, 4412, 2, '德庆', 'de qing', 'deq', '德庆县', NULL, NULL, '');
INSERT INTO `districts` VALUES (441284, 4412, 2, '四会', 'si hui', 'sih', '四会市', NULL, NULL, '');
INSERT INTO `districts` VALUES (441302, 4413, 2, '惠城', 'hui cheng', 'huc', '惠城区', NULL, NULL, '');
INSERT INTO `districts` VALUES (441303, 4413, 2, '惠阳', 'hui yang', 'huy', '惠阳区', NULL, NULL, '');
INSERT INTO `districts` VALUES (441322, 4413, 2, '博罗', 'bo luo', 'bol', '博罗县', NULL, NULL, '');
INSERT INTO `districts` VALUES (441323, 4413, 2, '惠东', 'hui dong', 'hud', '惠东县', NULL, NULL, '');
INSERT INTO `districts` VALUES (441324, 4413, 2, '龙门', 'long men', 'lom', '龙门县', NULL, NULL, '');
INSERT INTO `districts` VALUES (441402, 4414, 2, '梅江', 'mei jiang', 'mej', '梅江区', NULL, NULL, '');
INSERT INTO `districts` VALUES (441403, 4414, 2, '梅县', 'mei xian', 'mex', '梅县区', NULL, NULL, '');
INSERT INTO `districts` VALUES (441422, 4414, 2, '大埔', 'da bu', 'dab', '大埔县', NULL, NULL, '');
INSERT INTO `districts` VALUES (441423, 4414, 2, '丰顺', 'feng shun', 'fes', '丰顺县', NULL, NULL, '');
INSERT INTO `districts` VALUES (441424, 4414, 2, '五华', 'wu hua', 'wuh', '五华县', NULL, NULL, '');
INSERT INTO `districts` VALUES (441426, 4414, 2, '平远', 'ping yuan', 'piy', '平远县', NULL, NULL, '');
INSERT INTO `districts` VALUES (441427, 4414, 2, '蕉岭', 'jiao ling', 'jil', '蕉岭县', NULL, NULL, '');
INSERT INTO `districts` VALUES (441481, 4414, 2, '兴宁', 'xing ning', 'xin', '兴宁市', NULL, NULL, '');
INSERT INTO `districts` VALUES (441502, 4415, 2, '城区', 'cheng qu', 'chq', '城区', NULL, NULL, '');
INSERT INTO `districts` VALUES (441521, 4415, 2, '海丰', 'hai feng', 'haf', '海丰县', NULL, NULL, '');
INSERT INTO `districts` VALUES (441523, 4415, 2, '陆河', 'lu he', 'luh', '陆河县', NULL, NULL, '');
INSERT INTO `districts` VALUES (441581, 4415, 2, '陆丰', 'lu feng', 'luf', '陆丰市', NULL, NULL, '');
INSERT INTO `districts` VALUES (441602, 4416, 2, '源城', 'yuan cheng', 'yuc', '源城区', NULL, NULL, '');
INSERT INTO `districts` VALUES (441621, 4416, 2, '紫金', 'zi jin', 'zij', '紫金县', NULL, NULL, '');
INSERT INTO `districts` VALUES (441622, 4416, 2, '龙川', 'long chuan', 'loc', '龙川县', NULL, NULL, '');
INSERT INTO `districts` VALUES (441623, 4416, 2, '连平', 'lian ping', 'lip', '连平县', NULL, NULL, '');
INSERT INTO `districts` VALUES (441624, 4416, 2, '和平', 'he ping', 'hep', '和平县', NULL, NULL, '');
INSERT INTO `districts` VALUES (441625, 4416, 2, '东源', 'dong yuan', 'doy', '东源县', NULL, NULL, '');
INSERT INTO `districts` VALUES (441702, 4417, 2, '江城', 'jiang cheng', 'jic', '江城区', NULL, NULL, '');
INSERT INTO `districts` VALUES (441704, 4417, 2, '阳东', 'yang dong', 'yad', '阳东区', NULL, NULL, '');
INSERT INTO `districts` VALUES (441721, 4417, 2, '阳西', 'yang xi', 'yax', '阳西县', NULL, NULL, '');
INSERT INTO `districts` VALUES (441781, 4417, 2, '阳春', 'yang chun', 'yac', '阳春市', NULL, NULL, '');
INSERT INTO `districts` VALUES (441802, 4418, 2, '清城', 'qing cheng', 'qic', '清城区', NULL, NULL, '');
INSERT INTO `districts` VALUES (441803, 4418, 2, '清新区', 'qing xin qu', 'qixq', '清新区', NULL, NULL, '');
INSERT INTO `districts` VALUES (441821, 4418, 2, '佛冈', 'fo gang', 'fog', '佛冈县', NULL, NULL, '');
INSERT INTO `districts` VALUES (441823, 4418, 2, '阳山', 'yang shan', 'yas', '阳山县', NULL, NULL, '');
INSERT INTO `districts` VALUES (441825, 4418, 2, '连山壮族瑶族自治县', 'lian shan zhuang zu yao zu zi zhi xian', 'lisz', '连山壮族瑶族自治县', NULL, NULL, '');
INSERT INTO `districts` VALUES (441826, 4418, 2, '连南瑶族自治县', 'lian nan yao zu zi zhi xian', 'liny', '连南瑶族自治县', NULL, NULL, '');
INSERT INTO `districts` VALUES (441881, 4418, 2, '英德', 'ying de', 'yid', '英德市', NULL, NULL, '');
INSERT INTO `districts` VALUES (441882, 4418, 2, '连州', 'lian zhou', 'liz', '连州市', NULL, NULL, '');
INSERT INTO `districts` VALUES (445102, 4451, 2, '湘桥', 'xiang qiao', 'xiq', '湘桥区', NULL, NULL, '');
INSERT INTO `districts` VALUES (445103, 4451, 2, '潮安', 'chao an', 'cha', '潮安区', NULL, NULL, '');
INSERT INTO `districts` VALUES (445122, 4451, 2, '饶平', 'rao ping', 'rap', '饶平县', NULL, NULL, '');
INSERT INTO `districts` VALUES (445202, 4452, 2, '榕城', 'rong cheng', 'roc', '榕城区', NULL, NULL, '');
INSERT INTO `districts` VALUES (445203, 4452, 2, '揭东', 'jie dong', 'jid', '揭东区', NULL, NULL, '');
INSERT INTO `districts` VALUES (445222, 4452, 2, '揭西', 'jie xi', 'jix', '揭西县', NULL, NULL, '');
INSERT INTO `districts` VALUES (445224, 4452, 2, '惠来', 'hui lai', 'hul', '惠来县', NULL, NULL, '');
INSERT INTO `districts` VALUES (445281, 4452, 2, '普宁', 'pu ning', 'pun', '普宁市', NULL, NULL, '');
INSERT INTO `districts` VALUES (445302, 4453, 2, '云城', 'yun cheng', 'yuc', '云城区', NULL, NULL, '');
INSERT INTO `districts` VALUES (445303, 4453, 2, '云安', 'yun an', 'yua', '云安区', NULL, NULL, '');
INSERT INTO `districts` VALUES (445321, 4453, 2, '新兴', 'xin xing', 'xix', '新兴县', NULL, NULL, '');
INSERT INTO `districts` VALUES (445322, 4453, 2, '郁南', 'yu nan', 'yun', '郁南县', NULL, NULL, '');
INSERT INTO `districts` VALUES (445381, 4453, 2, '罗定', 'luo ding', 'lud', '罗定市', NULL, NULL, '');
INSERT INTO `districts` VALUES (450102, 4501, 2, '兴宁', 'xing ning', 'xin', '兴宁区', NULL, NULL, '');
INSERT INTO `districts` VALUES (450103, 4501, 2, '青秀', 'qing xiu', 'qix', '青秀区', NULL, NULL, '');
INSERT INTO `districts` VALUES (450105, 4501, 2, '江南', 'jiang nan', 'jin', '江南区', NULL, NULL, '');
INSERT INTO `districts` VALUES (450107, 4501, 2, '西乡塘', 'xi xiang tang', 'xixt', '西乡塘区', NULL, NULL, '');
INSERT INTO `districts` VALUES (450108, 4501, 2, '良庆', 'liang qing', 'liq', '良庆区', NULL, NULL, '');
INSERT INTO `districts` VALUES (450109, 4501, 2, '邕宁', 'yong ning', 'yon', '邕宁区', NULL, NULL, '');
INSERT INTO `districts` VALUES (450110, 4501, 2, '武鸣', 'wu ming', 'wum', '武鸣区', NULL, NULL, '');
INSERT INTO `districts` VALUES (450123, 4501, 2, '隆安', 'long an', 'loa', '隆安县', NULL, NULL, '');
INSERT INTO `districts` VALUES (450124, 4501, 2, '马山', 'ma shan', 'mas', '马山县', NULL, NULL, '');
INSERT INTO `districts` VALUES (450125, 4501, 2, '上林', 'shang lin', 'shl', '上林县', NULL, NULL, '');
INSERT INTO `districts` VALUES (450126, 4501, 2, '宾阳', 'bin yang', 'biy', '宾阳县', NULL, NULL, '');
INSERT INTO `districts` VALUES (450127, 4501, 2, '横县', 'heng xian', 'hex', '横县', NULL, NULL, '');
INSERT INTO `districts` VALUES (450202, 4502, 2, '城中', 'cheng zhong', 'chz', '城中区', NULL, NULL, '');
INSERT INTO `districts` VALUES (450203, 4502, 2, '鱼峰', 'yu feng', 'yuf', '鱼峰区', NULL, NULL, '');
INSERT INTO `districts` VALUES (450204, 4502, 2, '柳南', 'liu nan', 'lin', '柳南区', NULL, NULL, '');
INSERT INTO `districts` VALUES (450205, 4502, 2, '柳北', 'liu bei', 'lib', '柳北区', NULL, NULL, '');
INSERT INTO `districts` VALUES (450206, 4502, 2, '柳江', 'liu jiang', 'lij', '柳江区', NULL, NULL, '');
INSERT INTO `districts` VALUES (450222, 4502, 2, '柳城', 'liu cheng', 'lic', '柳城县', NULL, NULL, '');
INSERT INTO `districts` VALUES (450223, 4502, 2, '鹿寨', 'lu zhai', 'luz', '鹿寨县', NULL, NULL, '');
INSERT INTO `districts` VALUES (450224, 4502, 2, '融安', 'rong an', 'roa', '融安县', NULL, NULL, '');
INSERT INTO `districts` VALUES (450225, 4502, 2, '融水苗族自治县', 'rong shui miao zu zi zhi xian', 'rosm', '融水苗族自治县', NULL, NULL, '');
INSERT INTO `districts` VALUES (450226, 4502, 2, '三江侗族自治县', 'san jiang dong zu zi zhi xian', 'sajd', '三江侗族自治县', NULL, NULL, '');
INSERT INTO `districts` VALUES (450302, 4503, 2, '秀峰', 'xiu feng', 'xif', '秀峰区', NULL, NULL, '');
INSERT INTO `districts` VALUES (450303, 4503, 2, '叠彩', 'die cai', 'dic', '叠彩区', NULL, NULL, '');
INSERT INTO `districts` VALUES (450304, 4503, 2, '象山', 'xiang shan', 'xis', '象山区', NULL, NULL, '');
INSERT INTO `districts` VALUES (450305, 4503, 2, '七星', 'qi xing', 'qix', '七星区', NULL, NULL, '');
INSERT INTO `districts` VALUES (450311, 4503, 2, '雁山', 'yan shan', 'yas', '雁山区', NULL, NULL, '');
INSERT INTO `districts` VALUES (450312, 4503, 2, '临桂', 'lin gui', 'lig', '临桂区', NULL, NULL, '');
INSERT INTO `districts` VALUES (450321, 4503, 2, '阳朔', 'yang shuo', 'yas', '阳朔县', NULL, NULL, '');
INSERT INTO `districts` VALUES (450323, 4503, 2, '灵川', 'ling chuan', 'lic', '灵川县', NULL, NULL, '');
INSERT INTO `districts` VALUES (450324, 4503, 2, '全州', 'quan zhou', 'quz', '全州县', NULL, NULL, '');
INSERT INTO `districts` VALUES (450325, 4503, 2, '兴安', 'xing an', 'xia', '兴安县', NULL, NULL, '');
INSERT INTO `districts` VALUES (450326, 4503, 2, '永福', 'yong fu', 'yof', '永福县', NULL, NULL, '');
INSERT INTO `districts` VALUES (450327, 4503, 2, '灌阳', 'guan yang', 'guy', '灌阳县', NULL, NULL, '');
INSERT INTO `districts` VALUES (450328, 4503, 2, '龙胜各族自治县', 'long sheng ge zu zi zhi xian', 'losg', '龙胜各族自治县', NULL, NULL, '');
INSERT INTO `districts` VALUES (450329, 4503, 2, '资源', 'zi yuan', 'ziy', '资源县', NULL, NULL, '');
INSERT INTO `districts` VALUES (450330, 4503, 2, '平乐', 'ping le', 'pil', '平乐县', NULL, NULL, '');
INSERT INTO `districts` VALUES (450331, 4503, 2, '荔浦', 'li pu', 'lip', '荔浦县', NULL, NULL, '');
INSERT INTO `districts` VALUES (450332, 4503, 2, '恭城瑶族自治县', 'gong cheng yao zu zi zhi xian', 'gocy', '恭城瑶族自治县', NULL, NULL, '');
INSERT INTO `districts` VALUES (450403, 4504, 2, '万秀', 'wan xiu', 'wax', '万秀区', NULL, NULL, '');
INSERT INTO `districts` VALUES (450405, 4504, 2, '长洲', 'chang zhou', 'chz', '长洲区', NULL, NULL, '');
INSERT INTO `districts` VALUES (450406, 4504, 2, '龙圩', 'long xu', 'lox', '龙圩区', NULL, NULL, '');
INSERT INTO `districts` VALUES (450421, 4504, 2, '苍梧', 'cang wu', 'caw', '苍梧县', NULL, NULL, '');
INSERT INTO `districts` VALUES (450422, 4504, 2, '藤县', 'teng xian', 'tex', '藤县', NULL, NULL, '');
INSERT INTO `districts` VALUES (450423, 4504, 2, '蒙山', 'meng shan', 'mes', '蒙山县', NULL, NULL, '');
INSERT INTO `districts` VALUES (450481, 4504, 2, '岑溪', 'cen xi', 'cex', '岑溪市', NULL, NULL, '');
INSERT INTO `districts` VALUES (450502, 4505, 2, '海城', 'hai cheng', 'hac', '海城区', NULL, NULL, '');
INSERT INTO `districts` VALUES (450503, 4505, 2, '银海', 'yin hai', 'yih', '银海区', NULL, NULL, '');
INSERT INTO `districts` VALUES (450512, 4505, 2, '铁山港', 'tie shan gang', 'tisg', '铁山港区', NULL, NULL, '');
INSERT INTO `districts` VALUES (450521, 4505, 2, '合浦', 'he pu', 'hep', '合浦县', NULL, NULL, '');
INSERT INTO `districts` VALUES (450602, 4506, 2, '港口', 'gang kou', 'gak', '港口区', NULL, NULL, '');
INSERT INTO `districts` VALUES (450603, 4506, 2, '防城', 'fang cheng', 'fac', '防城区', NULL, NULL, '');
INSERT INTO `districts` VALUES (450621, 4506, 2, '上思', 'shang si', 'shs', '上思县', NULL, NULL, '');
INSERT INTO `districts` VALUES (450681, 4506, 2, '东兴', 'dong xing', 'dox', '东兴市', NULL, NULL, '');
INSERT INTO `districts` VALUES (450702, 4507, 2, '钦南', 'qin nan', 'qin', '钦南区', NULL, NULL, '');
INSERT INTO `districts` VALUES (450703, 4507, 2, '钦北', 'qin bei', 'qib', '钦北区', NULL, NULL, '');
INSERT INTO `districts` VALUES (450721, 4507, 2, '灵山', 'ling shan', 'lis', '灵山县', NULL, NULL, '');
INSERT INTO `districts` VALUES (450722, 4507, 2, '浦北', 'pu bei', 'pub', '浦北县', NULL, NULL, '');
INSERT INTO `districts` VALUES (450802, 4508, 2, '港北', 'gang bei', 'gab', '港北区', NULL, NULL, '');
INSERT INTO `districts` VALUES (450803, 4508, 2, '港南', 'gang nan', 'gan', '港南区', NULL, NULL, '');
INSERT INTO `districts` VALUES (450804, 4508, 2, '覃塘', 'qin tang', 'qit', '覃塘区', NULL, NULL, '');
INSERT INTO `districts` VALUES (450821, 4508, 2, '平南', 'ping nan', 'pin', '平南县', NULL, NULL, '');
INSERT INTO `districts` VALUES (450881, 4508, 2, '桂平', 'gui ping', 'gup', '桂平市', NULL, NULL, '');
INSERT INTO `districts` VALUES (450902, 4509, 2, '玉州', 'yu zhou', 'yuz', '玉州区', NULL, NULL, '');
INSERT INTO `districts` VALUES (450903, 4509, 2, '福绵', 'fu mian', 'fum', '福绵区', NULL, NULL, '');
INSERT INTO `districts` VALUES (450921, 4509, 2, '容县', 'rong xian', 'rox', '容县', NULL, NULL, '');
INSERT INTO `districts` VALUES (450922, 4509, 2, '陆川', 'lu chuan', 'luc', '陆川县', NULL, NULL, '');
INSERT INTO `districts` VALUES (450923, 4509, 2, '博白', 'bo bai', 'bob', '博白县', NULL, NULL, '');
INSERT INTO `districts` VALUES (450924, 4509, 2, '兴业', 'xing ye', 'xiy', '兴业县', NULL, NULL, '');
INSERT INTO `districts` VALUES (450981, 4509, 2, '北流', 'bei liu', 'bel', '北流市', NULL, NULL, '');
INSERT INTO `districts` VALUES (451002, 4510, 2, '右江', 'you jiang', 'yoj', '右江区', NULL, NULL, '');
INSERT INTO `districts` VALUES (451021, 4510, 2, '田阳', 'tian yang', 'tiy', '田阳县', NULL, NULL, '');
INSERT INTO `districts` VALUES (451022, 4510, 2, '田东', 'tian dong', 'tid', '田东县', NULL, NULL, '');
INSERT INTO `districts` VALUES (451023, 4510, 2, '平果', 'ping guo', 'pig', '平果县', NULL, NULL, '');
INSERT INTO `districts` VALUES (451024, 4510, 2, '德保', 'de bao', 'deb', '德保县', NULL, NULL, '');
INSERT INTO `districts` VALUES (451026, 4510, 2, '那坡', 'na po', 'nap', '那坡县', NULL, NULL, '');
INSERT INTO `districts` VALUES (451027, 4510, 2, '凌云', 'ling yun', 'liy', '凌云县', NULL, NULL, '');
INSERT INTO `districts` VALUES (451028, 4510, 2, '乐业', 'le ye', 'ley', '乐业县', NULL, NULL, '');
INSERT INTO `districts` VALUES (451029, 4510, 2, '田林', 'tian lin', 'til', '田林县', NULL, NULL, '');
INSERT INTO `districts` VALUES (451030, 4510, 2, '西林', 'xi lin', 'xil', '西林县', NULL, NULL, '');
INSERT INTO `districts` VALUES (451031, 4510, 2, '隆林各族自治县', 'long lin ge zu zi zhi xian', 'lolg', '隆林各族自治县', NULL, NULL, '');
INSERT INTO `districts` VALUES (451081, 4510, 2, '靖西', 'jing xi', 'jix', '靖西市', NULL, NULL, '');
INSERT INTO `districts` VALUES (451102, 4511, 2, '八步', 'ba bu', 'bab', '八步区', NULL, NULL, '');
INSERT INTO `districts` VALUES (451103, 4511, 2, '平桂', 'ping gui', 'pig', '平桂区', NULL, NULL, '');
INSERT INTO `districts` VALUES (451121, 4511, 2, '昭平', 'zhao ping', 'zhp', '昭平县', NULL, NULL, '');
INSERT INTO `districts` VALUES (451122, 4511, 2, '钟山', 'zhong shan', 'zhs', '钟山县', NULL, NULL, '');
INSERT INTO `districts` VALUES (451123, 4511, 2, '富川瑶族自治县', 'fu chuan yao zu zi zhi xian', 'fucy', '富川瑶族自治县', NULL, NULL, '');
INSERT INTO `districts` VALUES (451202, 4512, 2, '金城江', 'jin cheng jiang', 'jicj', '金城江区', NULL, NULL, '');
INSERT INTO `districts` VALUES (451203, 4512, 2, '宜州', 'yi zhou', 'yiz', '宜州区', NULL, NULL, '');
INSERT INTO `districts` VALUES (451221, 4512, 2, '南丹', 'nan dan', 'nad', '南丹县', NULL, NULL, '');
INSERT INTO `districts` VALUES (451222, 4512, 2, '天峨', 'tian e', 'tie', '天峨县', NULL, NULL, '');
INSERT INTO `districts` VALUES (451223, 4512, 2, '凤山', 'feng shan', 'fes', '凤山县', NULL, NULL, '');
INSERT INTO `districts` VALUES (451224, 4512, 2, '东兰', 'dong lan', 'dol', '东兰县', NULL, NULL, '');
INSERT INTO `districts` VALUES (451225, 4512, 2, '罗城仫佬族自治县', 'luo cheng mu lao zu zi zhi xian', 'lucm', '罗城仫佬族自治县', NULL, NULL, '');
INSERT INTO `districts` VALUES (451226, 4512, 2, '环江毛南族自治县', 'huan jiang mao nan zu zi zhi xian', 'hujm', '环江毛南族自治县', NULL, NULL, '');
INSERT INTO `districts` VALUES (451227, 4512, 2, '巴马瑶族自治县', 'ba ma yao zu zi zhi xian', 'bamy', '巴马瑶族自治县', NULL, NULL, '');
INSERT INTO `districts` VALUES (451228, 4512, 2, '都安瑶族自治县', 'du an yao zu zi zhi xian', 'duay', '都安瑶族自治县', NULL, NULL, '');
INSERT INTO `districts` VALUES (451229, 4512, 2, '大化瑶族自治县', 'da hua yao zu zi zhi xian', 'dahy', '大化瑶族自治县', NULL, NULL, '');
INSERT INTO `districts` VALUES (451302, 4513, 2, '兴宾', 'xing bin', 'xib', '兴宾区', NULL, NULL, '');
INSERT INTO `districts` VALUES (451321, 4513, 2, '忻城', 'xin cheng', 'xic', '忻城县', NULL, NULL, '');
INSERT INTO `districts` VALUES (451322, 4513, 2, '象州', 'xiang zhou', 'xiz', '象州县', NULL, NULL, '');
INSERT INTO `districts` VALUES (451323, 4513, 2, '武宣', 'wu xuan', 'wux', '武宣县', NULL, NULL, '');
INSERT INTO `districts` VALUES (451324, 4513, 2, '金秀瑶族自治县', 'jin xiu yao zu zi zhi xian', 'jixy', '金秀瑶族自治县', NULL, NULL, '');
INSERT INTO `districts` VALUES (451381, 4513, 2, '合山', 'he shan', 'hes', '合山市', NULL, NULL, '');
INSERT INTO `districts` VALUES (451402, 4514, 2, '江州', 'jiang zhou', 'jiz', '江州区', NULL, NULL, '');
INSERT INTO `districts` VALUES (451421, 4514, 2, '扶绥', 'fu sui', 'fus', '扶绥县', NULL, NULL, '');
INSERT INTO `districts` VALUES (451422, 4514, 2, '宁明', 'ning ming', 'nim', '宁明县', NULL, NULL, '');
INSERT INTO `districts` VALUES (451423, 4514, 2, '龙州', 'long zhou', 'loz', '龙州县', NULL, NULL, '');
INSERT INTO `districts` VALUES (451424, 4514, 2, '大新', 'da xin', 'dax', '大新县', NULL, NULL, '');
INSERT INTO `districts` VALUES (451425, 4514, 2, '天等', 'tian deng', 'tid', '天等县', NULL, NULL, '');
INSERT INTO `districts` VALUES (451481, 4514, 2, '凭祥', 'ping xiang', 'pix', '凭祥市', NULL, NULL, '');
INSERT INTO `districts` VALUES (460105, 4601, 2, '秀英', 'xiu ying', 'xiy', '秀英区', NULL, NULL, '');
INSERT INTO `districts` VALUES (460106, 4601, 2, '龙华', 'long hua', 'loh', '龙华区', NULL, NULL, '');
INSERT INTO `districts` VALUES (460107, 4601, 2, '琼山', 'qiong shan', 'qis', '琼山区', NULL, NULL, '');
INSERT INTO `districts` VALUES (460108, 4601, 2, '美兰', 'mei lan', 'mel', '美兰区', NULL, NULL, '');
INSERT INTO `districts` VALUES (460202, 4602, 2, '海棠', 'hai tang', 'hat', '海棠区', NULL, NULL, '');
INSERT INTO `districts` VALUES (460203, 4602, 2, '吉阳', 'ji yang', 'jiy', '吉阳区', NULL, NULL, '');
INSERT INTO `districts` VALUES (460204, 4602, 2, '天涯', 'tian ya', 'tiy', '天涯区', NULL, NULL, '');
INSERT INTO `districts` VALUES (460205, 4602, 2, '崖州', 'ya zhou', 'yaz', '崖州区', NULL, NULL, '');
INSERT INTO `districts` VALUES (460321, 4603, 2, '西沙群岛', 'xi sha qun dao', 'xisq', '西沙群岛', NULL, NULL, '');
INSERT INTO `districts` VALUES (460322, 4603, 2, '南沙群岛', 'nan sha qun dao', 'nasq', '南沙群岛', NULL, NULL, '');
INSERT INTO `districts` VALUES (460323, 4603, 2, '中沙群岛的岛礁及其海域', 'zhong sha qun dao de dao jiao ji qi hai yu', 'zhsq', '中沙群岛的岛礁及其海域', NULL, NULL, '');
INSERT INTO `districts` VALUES (469001, 4690, 2, '五指山', 'wu zhi shan', 'wuzs', '五指山市', NULL, NULL, '');
INSERT INTO `districts` VALUES (469002, 4690, 2, '琼海', 'qiong hai', 'qih', '琼海市', NULL, NULL, '');
INSERT INTO `districts` VALUES (469005, 4690, 2, '文昌', 'wen chang', 'wec', '文昌市', NULL, NULL, '');
INSERT INTO `districts` VALUES (469006, 4690, 2, '万宁', 'wan ning', 'wan', '万宁市', NULL, NULL, '');
INSERT INTO `districts` VALUES (469007, 4690, 2, '东方', 'dong fang', 'dof', '东方市', NULL, NULL, '');
INSERT INTO `districts` VALUES (469021, 4690, 2, '定安', 'ding an', 'dia', '定安县', NULL, NULL, '');
INSERT INTO `districts` VALUES (469022, 4690, 2, '屯昌', 'tun chang', 'tuc', '屯昌县', NULL, NULL, '');
INSERT INTO `districts` VALUES (469023, 4690, 2, '澄迈', 'cheng mai', 'chm', '澄迈县', NULL, NULL, '');
INSERT INTO `districts` VALUES (469024, 4690, 2, '临高', 'lin gao', 'lig', '临高县', NULL, NULL, '');
INSERT INTO `districts` VALUES (469025, 4690, 2, '白沙黎族自治县', 'bai sha li zu zi zhi xian', 'basl', '白沙黎族自治县', NULL, NULL, '');
INSERT INTO `districts` VALUES (469026, 4690, 2, '昌江黎族自治县', 'chang jiang li zu zi zhi xian', 'chjl', '昌江黎族自治县', NULL, NULL, '');
INSERT INTO `districts` VALUES (469027, 4690, 2, '乐东黎族自治县', 'le dong li zu zi zhi xian', 'ledl', '乐东黎族自治县', NULL, NULL, '');
INSERT INTO `districts` VALUES (469028, 4690, 2, '陵水黎族自治县', 'ling shui li zu zi zhi xian', 'lisl', '陵水黎族自治县', NULL, NULL, '');
INSERT INTO `districts` VALUES (469029, 4690, 2, '保亭黎族苗族自治县', 'bao ting li zu miao zu zi zhi xian', 'batl', '保亭黎族苗族自治县', NULL, NULL, '');
INSERT INTO `districts` VALUES (469030, 4690, 2, '琼中黎族苗族自治县', 'qiong zhong li zu miao zu zi zhi xian', 'qizl', '琼中黎族苗族自治县', NULL, NULL, '');
INSERT INTO `districts` VALUES (500101, 5001, 2, '万州', 'wan zhou', 'waz', '万州区', NULL, NULL, '');
INSERT INTO `districts` VALUES (500102, 5001, 2, '涪陵', 'fu ling', 'ful', '涪陵区', NULL, NULL, '');
INSERT INTO `districts` VALUES (500103, 5001, 2, '渝中', 'yu zhong', 'yuz', '渝中区', NULL, NULL, '');
INSERT INTO `districts` VALUES (500104, 5001, 2, '大渡口', 'da du kou', 'dadk', '大渡口区', NULL, NULL, '');
INSERT INTO `districts` VALUES (500105, 5001, 2, '江北', 'jiang bei', 'jib', '江北区', NULL, NULL, '');
INSERT INTO `districts` VALUES (500106, 5001, 2, '沙坪坝', 'sha ping ba', 'shpb', '沙坪坝区', NULL, NULL, '');
INSERT INTO `districts` VALUES (500107, 5001, 2, '九龙坡', 'jiu long po', 'jilp', '九龙坡区', NULL, NULL, '');
INSERT INTO `districts` VALUES (500108, 5001, 2, '南岸', 'nan an', 'naa', '南岸区', NULL, NULL, '');
INSERT INTO `districts` VALUES (500109, 5001, 2, '北碚', 'bei bei', 'beb', '北碚区', NULL, NULL, '');
INSERT INTO `districts` VALUES (500110, 5001, 2, '綦江', 'qi jiang', 'qij', '綦江区', NULL, NULL, '');
INSERT INTO `districts` VALUES (500111, 5001, 2, '大足', 'da zu', 'daz', '大足区', NULL, NULL, '');
INSERT INTO `districts` VALUES (500112, 5001, 2, '渝北', 'yu bei', 'yub', '渝北区', NULL, NULL, '');
INSERT INTO `districts` VALUES (500113, 5001, 2, '巴南', 'ba nan', 'ban', '巴南区', NULL, NULL, '');
INSERT INTO `districts` VALUES (500114, 5001, 2, '黔江', 'qian jiang', 'qij', '黔江区', NULL, NULL, '');
INSERT INTO `districts` VALUES (500115, 5001, 2, '长寿', 'chang shou', 'chs', '长寿区', NULL, NULL, '');
INSERT INTO `districts` VALUES (500116, 5001, 2, '江津', 'jiang jin', 'jij', '江津区', NULL, NULL, '');
INSERT INTO `districts` VALUES (500117, 5001, 2, '合川', 'he chuan', 'hec', '合川区', NULL, NULL, '');
INSERT INTO `districts` VALUES (500118, 5001, 2, '永川', 'yong chuan', 'yoc', '永川区', NULL, NULL, '');
INSERT INTO `districts` VALUES (500119, 5001, 2, '南川', 'nan chuan', 'nac', '南川区', NULL, NULL, '');
INSERT INTO `districts` VALUES (500120, 5001, 2, '璧山', 'bi shan', 'bis', '璧山区', NULL, NULL, '');
INSERT INTO `districts` VALUES (500151, 5001, 2, '铜梁', 'tong liang', 'tol', '铜梁区', NULL, NULL, '');
INSERT INTO `districts` VALUES (500152, 5001, 2, '潼南', 'tong nan', 'ton', '潼南区', NULL, NULL, '');
INSERT INTO `districts` VALUES (500153, 5001, 2, '荣昌', 'rong chang', 'roc', '荣昌区', NULL, NULL, '');
INSERT INTO `districts` VALUES (500154, 5001, 2, '开州', 'kai zhou', 'kaz', '开州区', NULL, NULL, '');
INSERT INTO `districts` VALUES (500155, 5001, 2, '梁平', 'liang ping', 'lip', '梁平区', NULL, NULL, '');
INSERT INTO `districts` VALUES (500156, 5001, 2, '武隆', 'wu long', 'wul', '武隆区', NULL, NULL, '');
INSERT INTO `districts` VALUES (500229, 5002, 2, '城口', 'cheng kou', 'chk', '城口县', NULL, NULL, '');
INSERT INTO `districts` VALUES (500230, 5002, 2, '丰都', 'feng du', 'fed', '丰都县', NULL, NULL, '');
INSERT INTO `districts` VALUES (500231, 5002, 2, '垫江', 'dian jiang', 'dij', '垫江县', NULL, NULL, '');
INSERT INTO `districts` VALUES (500233, 5002, 2, '忠县', 'zhong xian', 'zhx', '忠县', NULL, NULL, '');
INSERT INTO `districts` VALUES (500235, 5002, 2, '云阳', 'yun yang', 'yuy', '云阳县', NULL, NULL, '');
INSERT INTO `districts` VALUES (500236, 5002, 2, '奉节', 'feng jie', 'fej', '奉节县', NULL, NULL, '');
INSERT INTO `districts` VALUES (500237, 5002, 2, '巫山', 'wu shan', 'wus', '巫山县', NULL, NULL, '');
INSERT INTO `districts` VALUES (500238, 5002, 2, '巫溪', 'wu xi', 'wux', '巫溪县', NULL, NULL, '');
INSERT INTO `districts` VALUES (500240, 5002, 2, '石柱土家族自治县', 'shi zhu tu jia zu zi zhi xian', 'shzt', '石柱土家族自治县', NULL, NULL, '');
INSERT INTO `districts` VALUES (500241, 5002, 2, '秀山土家族苗族自治县', 'xiu shan tu jia zu miao zu zi zhi xian', 'xist', '秀山土家族苗族自治县', NULL, NULL, '');
INSERT INTO `districts` VALUES (500242, 5002, 2, '酉阳土家族苗族自治县', 'you yang tu jia zu miao zu zi zhi xian', 'yoyt', '酉阳土家族苗族自治县', NULL, NULL, '');
INSERT INTO `districts` VALUES (500243, 5002, 2, '彭水苗族土家族自治县', 'peng shui miao zu tu jia zu zi zhi xian', 'pesm', '彭水苗族土家族自治县', NULL, NULL, '');
INSERT INTO `districts` VALUES (510104, 5101, 2, '锦江', 'jin jiang', 'jij', '锦江区', NULL, NULL, '');
INSERT INTO `districts` VALUES (510105, 5101, 2, '青羊', 'qing yang', 'qiy', '青羊区', NULL, NULL, '');
INSERT INTO `districts` VALUES (510106, 5101, 2, '金牛', 'jin niu', 'jin', '金牛区', NULL, NULL, '');
INSERT INTO `districts` VALUES (510107, 5101, 2, '武侯', 'wu hou', 'wuh', '武侯区', NULL, NULL, '');
INSERT INTO `districts` VALUES (510108, 5101, 2, '成华', 'cheng hua', 'chh', '成华区', NULL, NULL, '');
INSERT INTO `districts` VALUES (510112, 5101, 2, '龙泉驿', 'long quan yi', 'loqy', '龙泉驿区', NULL, NULL, '');
INSERT INTO `districts` VALUES (510113, 5101, 2, '青白江', 'qing bai jiang', 'qibj', '青白江区', NULL, NULL, '');
INSERT INTO `districts` VALUES (510114, 5101, 2, '新都', 'xin du', 'xid', '新都区', NULL, NULL, '');
INSERT INTO `districts` VALUES (510115, 5101, 2, '温江', 'wen jiang', 'wej', '温江区', NULL, NULL, '');
INSERT INTO `districts` VALUES (510116, 5101, 2, '双流', 'shuang liu', 'shl', '双流区', NULL, NULL, '');
INSERT INTO `districts` VALUES (510117, 5101, 2, '郫都', 'pi du', 'pid', '郫都区', NULL, NULL, '');
INSERT INTO `districts` VALUES (510121, 5101, 2, '金堂', 'jin tang', 'jit', '金堂县', NULL, NULL, '');
INSERT INTO `districts` VALUES (510129, 5101, 2, '大邑', 'da yi', 'day', '大邑县', NULL, NULL, '');
INSERT INTO `districts` VALUES (510131, 5101, 2, '蒲江', 'pu jiang', 'puj', '蒲江县', NULL, NULL, '');
INSERT INTO `districts` VALUES (510132, 5101, 2, '新津', 'xin jin', 'xij', '新津县', NULL, NULL, '');
INSERT INTO `districts` VALUES (510181, 5101, 2, '都江堰', 'du jiang yan', 'dujy', '都江堰市', NULL, NULL, '');
INSERT INTO `districts` VALUES (510182, 5101, 2, '彭州', 'peng zhou', 'pez', '彭州市', NULL, NULL, '');
INSERT INTO `districts` VALUES (510183, 5101, 2, '邛崃', 'qiong lai', 'qil', '邛崃市', NULL, NULL, '');
INSERT INTO `districts` VALUES (510184, 5101, 2, '崇州', 'chong zhou', 'chz', '崇州市', NULL, NULL, '');
INSERT INTO `districts` VALUES (510185, 5101, 2, '简阳', 'jian yang', 'jiy', '简阳市', NULL, NULL, '');
INSERT INTO `districts` VALUES (510302, 5103, 2, '自流井', 'zi liu jing', 'zilj', '自流井区', NULL, NULL, '');
INSERT INTO `districts` VALUES (510303, 5103, 2, '贡井', 'gong jing', 'goj', '贡井区', NULL, NULL, '');
INSERT INTO `districts` VALUES (510304, 5103, 2, '大安', 'da an', 'daa', '大安区', NULL, NULL, '');
INSERT INTO `districts` VALUES (510311, 5103, 2, '沿滩', 'yan tan', 'yat', '沿滩区', NULL, NULL, '');
INSERT INTO `districts` VALUES (510321, 5103, 2, '荣县', 'rong xian', 'rox', '荣县', NULL, NULL, '');
INSERT INTO `districts` VALUES (510322, 5103, 2, '富顺', 'fu shun', 'fus', '富顺县', NULL, NULL, '');
INSERT INTO `districts` VALUES (510402, 5104, 2, '东区', 'dong qu', 'doq', '东区', NULL, NULL, '');
INSERT INTO `districts` VALUES (510403, 5104, 2, '西区', 'xi qu', 'xiq', '西区', NULL, NULL, '');
INSERT INTO `districts` VALUES (510411, 5104, 2, '仁和', 'ren he', 'reh', '仁和区', NULL, NULL, '');
INSERT INTO `districts` VALUES (510421, 5104, 2, '米易', 'mi yi', 'miy', '米易县', NULL, NULL, '');
INSERT INTO `districts` VALUES (510422, 5104, 2, '盐边', 'yan bian', 'yab', '盐边县', NULL, NULL, '');
INSERT INTO `districts` VALUES (510502, 5105, 2, '江阳', 'jiang yang', 'jiy', '江阳区', NULL, NULL, '');
INSERT INTO `districts` VALUES (510503, 5105, 2, '纳溪', 'na xi', 'nax', '纳溪区', NULL, NULL, '');
INSERT INTO `districts` VALUES (510504, 5105, 2, '龙马潭', 'long ma tan', 'lomt', '龙马潭区', NULL, NULL, '');
INSERT INTO `districts` VALUES (510521, 5105, 2, '泸县', 'lu xian', 'lux', '泸县', NULL, NULL, '');
INSERT INTO `districts` VALUES (510522, 5105, 2, '合江', 'he jiang', 'hej', '合江县', NULL, NULL, '');
INSERT INTO `districts` VALUES (510524, 5105, 2, '叙永', 'xu yong', 'xuy', '叙永县', NULL, NULL, '');
INSERT INTO `districts` VALUES (510525, 5105, 2, '古蔺', 'gu lin', 'gul', '古蔺县', NULL, NULL, '');
INSERT INTO `districts` VALUES (510603, 5106, 2, '旌阳', 'jing yang', 'jiy', '旌阳区', NULL, NULL, '');
INSERT INTO `districts` VALUES (510604, 5106, 2, '罗江', 'luo jiang', 'luj', '罗江区', NULL, NULL, '');
INSERT INTO `districts` VALUES (510623, 5106, 2, '中江', 'zhong jiang', 'zhj', '中江县', NULL, NULL, '');
INSERT INTO `districts` VALUES (510681, 5106, 2, '广汉', 'guang han', 'guh', '广汉市', NULL, NULL, '');
INSERT INTO `districts` VALUES (510682, 5106, 2, '什邡', 'shi fang', 'shf', '什邡市', NULL, NULL, '');
INSERT INTO `districts` VALUES (510683, 5106, 2, '绵竹', 'mian zhu', 'miz', '绵竹市', NULL, NULL, '');
INSERT INTO `districts` VALUES (510703, 5107, 2, '涪城', 'fu cheng', 'fuc', '涪城区', NULL, NULL, '');
INSERT INTO `districts` VALUES (510704, 5107, 2, '游仙', 'you xian', 'yox', '游仙区', NULL, NULL, '');
INSERT INTO `districts` VALUES (510705, 5107, 2, '安州', 'an zhou', 'anz', '安州区', NULL, NULL, '');
INSERT INTO `districts` VALUES (510722, 5107, 2, '三台', 'san tai', 'sat', '三台县', NULL, NULL, '');
INSERT INTO `districts` VALUES (510723, 5107, 2, '盐亭', 'yan ting', 'yat', '盐亭县', NULL, NULL, '');
INSERT INTO `districts` VALUES (510725, 5107, 2, '梓潼', 'zi tong', 'zit', '梓潼县', NULL, NULL, '');
INSERT INTO `districts` VALUES (510726, 5107, 2, '北川羌族自治县', 'bei chuan qiang zu zi zhi xian', 'becq', '北川羌族自治县', NULL, NULL, '');
INSERT INTO `districts` VALUES (510727, 5107, 2, '平武', 'ping wu', 'piw', '平武县', NULL, NULL, '');
INSERT INTO `districts` VALUES (510781, 5107, 2, '江油', 'jiang you', 'jiy', '江油市', NULL, NULL, '');
INSERT INTO `districts` VALUES (510802, 5108, 2, '利州', 'li zhou', 'liz', '利州区', NULL, NULL, '');
INSERT INTO `districts` VALUES (510811, 5108, 2, '昭化', 'zhao hua', 'zhh', '昭化区', NULL, NULL, '');
INSERT INTO `districts` VALUES (510812, 5108, 2, '朝天', 'chao tian', 'cht', '朝天区', NULL, NULL, '');
INSERT INTO `districts` VALUES (510821, 5108, 2, '旺苍', 'wang cang', 'wac', '旺苍县', NULL, NULL, '');
INSERT INTO `districts` VALUES (510822, 5108, 2, '青川', 'qing chuan', 'qic', '青川县', NULL, NULL, '');
INSERT INTO `districts` VALUES (510823, 5108, 2, '剑阁', 'jian ge', 'jig', '剑阁县', NULL, NULL, '');
INSERT INTO `districts` VALUES (510824, 5108, 2, '苍溪', 'cang xi', 'cax', '苍溪县', NULL, NULL, '');
INSERT INTO `districts` VALUES (510903, 5109, 2, '船山', 'chuan shan', 'chs', '船山区', NULL, NULL, '');
INSERT INTO `districts` VALUES (510904, 5109, 2, '安居', 'an ju', 'anj', '安居区', NULL, NULL, '');
INSERT INTO `districts` VALUES (510921, 5109, 2, '蓬溪', 'peng xi', 'pex', '蓬溪县', NULL, NULL, '');
INSERT INTO `districts` VALUES (510922, 5109, 2, '射洪', 'she hong', 'shh', '射洪县', NULL, NULL, '');
INSERT INTO `districts` VALUES (510923, 5109, 2, '大英', 'da ying', 'day', '大英县', NULL, NULL, '');
INSERT INTO `districts` VALUES (511002, 5110, 2, '市中', 'shi zhong', 'shz', '市中区', NULL, NULL, '');
INSERT INTO `districts` VALUES (511011, 5110, 2, '东兴', 'dong xing', 'dox', '东兴区', NULL, NULL, '');
INSERT INTO `districts` VALUES (511024, 5110, 2, '威远', 'wei yuan', 'wey', '威远县', NULL, NULL, '');
INSERT INTO `districts` VALUES (511025, 5110, 2, '资中', 'zi zhong', 'ziz', '资中县', NULL, NULL, '');
INSERT INTO `districts` VALUES (511071, 5110, 2, '内江经济开发区', 'nei jiang jing ji kai fa qu', 'nejj', '内江经济开发区', NULL, NULL, '');
INSERT INTO `districts` VALUES (511083, 5110, 2, '隆昌', 'long chang', 'loc', '隆昌市', NULL, NULL, '');
INSERT INTO `districts` VALUES (511102, 5111, 2, '市中', 'shi zhong', 'shz', '市中区', NULL, NULL, '');
INSERT INTO `districts` VALUES (511111, 5111, 2, '沙湾', 'sha wan', 'shw', '沙湾区', NULL, NULL, '');
INSERT INTO `districts` VALUES (511112, 5111, 2, '五通桥', 'wu tong qiao', 'wutq', '五通桥区', NULL, NULL, '');
INSERT INTO `districts` VALUES (511113, 5111, 2, '金口河', 'jin kou he', 'jikh', '金口河区', NULL, NULL, '');
INSERT INTO `districts` VALUES (511123, 5111, 2, '犍为', 'qian wei', 'qiw', '犍为县', NULL, NULL, '');
INSERT INTO `districts` VALUES (511124, 5111, 2, '井研', 'jing yan', 'jiy', '井研县', NULL, NULL, '');
INSERT INTO `districts` VALUES (511126, 5111, 2, '夹江', 'jia jiang', 'jij', '夹江县', NULL, NULL, '');
INSERT INTO `districts` VALUES (511129, 5111, 2, '沐川', 'mu chuan', 'muc', '沐川县', NULL, NULL, '');
INSERT INTO `districts` VALUES (511132, 5111, 2, '峨边彝族自治县', 'e bian yi zu zi zhi xian', 'eby', '峨边彝族自治县', NULL, NULL, '');
INSERT INTO `districts` VALUES (511133, 5111, 2, '马边彝族自治县', 'ma bian yi zu zi zhi xian', 'maby', '马边彝族自治县', NULL, NULL, '');
INSERT INTO `districts` VALUES (511181, 5111, 2, '峨眉山', 'e mei shan', 'ems', '峨眉山市', NULL, NULL, '');
INSERT INTO `districts` VALUES (511302, 5113, 2, '顺庆', 'shun qing', 'shq', '顺庆区', NULL, NULL, '');
INSERT INTO `districts` VALUES (511303, 5113, 2, '高坪', 'gao ping', 'gap', '高坪区', NULL, NULL, '');
INSERT INTO `districts` VALUES (511304, 5113, 2, '嘉陵', 'jia ling', 'jil', '嘉陵区', NULL, NULL, '');
INSERT INTO `districts` VALUES (511321, 5113, 2, '南部', 'nan bu', 'nab', '南部县', NULL, NULL, '');
INSERT INTO `districts` VALUES (511322, 5113, 2, '营山', 'ying shan', 'yis', '营山县', NULL, NULL, '');
INSERT INTO `districts` VALUES (511323, 5113, 2, '蓬安', 'peng an', 'pea', '蓬安县', NULL, NULL, '');
INSERT INTO `districts` VALUES (511324, 5113, 2, '仪陇', 'yi long', 'yil', '仪陇县', NULL, NULL, '');
INSERT INTO `districts` VALUES (511325, 5113, 2, '西充', 'xi chong', 'xic', '西充县', NULL, NULL, '');
INSERT INTO `districts` VALUES (511381, 5113, 2, '阆中', 'lang zhong', 'laz', '阆中市', NULL, NULL, '');
INSERT INTO `districts` VALUES (511402, 5114, 2, '东坡', 'dong po', 'dop', '东坡区', NULL, NULL, '');
INSERT INTO `districts` VALUES (511403, 5114, 2, '彭山', 'peng shan', 'pes', '彭山区', NULL, NULL, '');
INSERT INTO `districts` VALUES (511421, 5114, 2, '仁寿', 'ren shou', 'res', '仁寿县', NULL, NULL, '');
INSERT INTO `districts` VALUES (511423, 5114, 2, '洪雅', 'hong ya', 'hoy', '洪雅县', NULL, NULL, '');
INSERT INTO `districts` VALUES (511424, 5114, 2, '丹棱', 'dan leng', 'dal', '丹棱县', NULL, NULL, '');
INSERT INTO `districts` VALUES (511425, 5114, 2, '青神', 'qing shen', 'qis', '青神县', NULL, NULL, '');
INSERT INTO `districts` VALUES (511502, 5115, 2, '翠屏', 'cui ping', 'cup', '翠屏区', NULL, NULL, '');
INSERT INTO `districts` VALUES (511503, 5115, 2, '南溪', 'nan xi', 'nax', '南溪区', NULL, NULL, '');
INSERT INTO `districts` VALUES (511521, 5115, 2, '宜宾', 'yi bin', 'yib', '宜宾县', NULL, NULL, '');
INSERT INTO `districts` VALUES (511523, 5115, 2, '江安', 'jiang an', 'jia', '江安县', NULL, NULL, '');
INSERT INTO `districts` VALUES (511524, 5115, 2, '长宁', 'chang ning', 'chn', '长宁县', NULL, NULL, '');
INSERT INTO `districts` VALUES (511525, 5115, 2, '高县', 'gao xian', 'gax', '高县', NULL, NULL, '');
INSERT INTO `districts` VALUES (511526, 5115, 2, '珙县', 'gong xian', 'gox', '珙县', NULL, NULL, '');
INSERT INTO `districts` VALUES (511527, 5115, 2, '筠连', 'jun lian', 'jul', '筠连县', NULL, NULL, '');
INSERT INTO `districts` VALUES (511528, 5115, 2, '兴文', 'xing wen', 'xiw', '兴文县', NULL, NULL, '');
INSERT INTO `districts` VALUES (511529, 5115, 2, '屏山', 'ping shan', 'pis', '屏山县', NULL, NULL, '');
INSERT INTO `districts` VALUES (511602, 5116, 2, '广安', 'guang an', 'gua', '广安区', NULL, NULL, '');
INSERT INTO `districts` VALUES (511603, 5116, 2, '前锋', 'qian feng', 'qif', '前锋区', NULL, NULL, '');
INSERT INTO `districts` VALUES (511621, 5116, 2, '岳池', 'yue chi', 'yuc', '岳池县', NULL, NULL, '');
INSERT INTO `districts` VALUES (511622, 5116, 2, '武胜', 'wu sheng', 'wus', '武胜县', NULL, NULL, '');
INSERT INTO `districts` VALUES (511623, 5116, 2, '邻水', 'lin shui', 'lis', '邻水县', NULL, NULL, '');
INSERT INTO `districts` VALUES (511681, 5116, 2, '华蓥', 'hua ying', 'huy', '华蓥市', NULL, NULL, '');
INSERT INTO `districts` VALUES (511702, 5117, 2, '通川', 'tong chuan', 'toc', '通川区', NULL, NULL, '');
INSERT INTO `districts` VALUES (511703, 5117, 2, '达川', 'da chuan', 'dac', '达川区', NULL, NULL, '');
INSERT INTO `districts` VALUES (511722, 5117, 2, '宣汉', 'xuan han', 'xuh', '宣汉县', NULL, NULL, '');
INSERT INTO `districts` VALUES (511723, 5117, 2, '开江', 'kai jiang', 'kaj', '开江县', NULL, NULL, '');
INSERT INTO `districts` VALUES (511724, 5117, 2, '大竹', 'da zhu', 'daz', '大竹县', NULL, NULL, '');
INSERT INTO `districts` VALUES (511725, 5117, 2, '渠县', 'qu xian', 'qux', '渠县', NULL, NULL, '');
INSERT INTO `districts` VALUES (511771, 5117, 2, '达州经济开发区', 'da zhou jing ji kai fa qu', 'dazj', '达州经济开发区', NULL, NULL, '');
INSERT INTO `districts` VALUES (511781, 5117, 2, '万源', 'wan yuan', 'way', '万源市', NULL, NULL, '');
INSERT INTO `districts` VALUES (511802, 5118, 2, '雨城', 'yu cheng', 'yuc', '雨城区', NULL, NULL, '');
INSERT INTO `districts` VALUES (511803, 5118, 2, '名山', 'ming shan', 'mis', '名山区', NULL, NULL, '');
INSERT INTO `districts` VALUES (511822, 5118, 2, '荥经', 'ying jing', 'yij', '荥经县', NULL, NULL, '');
INSERT INTO `districts` VALUES (511823, 5118, 2, '汉源', 'han yuan', 'hay', '汉源县', NULL, NULL, '');
INSERT INTO `districts` VALUES (511824, 5118, 2, '石棉', 'shi mian', 'shm', '石棉县', NULL, NULL, '');
INSERT INTO `districts` VALUES (511825, 5118, 2, '天全', 'tian quan', 'tiq', '天全县', NULL, NULL, '');
INSERT INTO `districts` VALUES (511826, 5118, 2, '芦山', 'lu shan', 'lus', '芦山县', NULL, NULL, '');
INSERT INTO `districts` VALUES (511827, 5118, 2, '宝兴', 'bao xing', 'bax', '宝兴县', NULL, NULL, '');
INSERT INTO `districts` VALUES (511902, 5119, 2, '巴州', 'ba zhou', 'baz', '巴州区', NULL, NULL, '');
INSERT INTO `districts` VALUES (511903, 5119, 2, '恩阳', 'en yang', 'eny', '恩阳区', NULL, NULL, '');
INSERT INTO `districts` VALUES (511921, 5119, 2, '通江', 'tong jiang', 'toj', '通江县', NULL, NULL, '');
INSERT INTO `districts` VALUES (511922, 5119, 2, '南江', 'nan jiang', 'naj', '南江县', NULL, NULL, '');
INSERT INTO `districts` VALUES (511923, 5119, 2, '平昌', 'ping chang', 'pic', '平昌县', NULL, NULL, '');
INSERT INTO `districts` VALUES (511971, 5119, 2, '巴中经济开发区', 'ba zhong jing ji kai fa qu', 'bazj', '巴中经济开发区', NULL, NULL, '');
INSERT INTO `districts` VALUES (512002, 5120, 2, '雁江', 'yan jiang', 'yaj', '雁江区', NULL, NULL, '');
INSERT INTO `districts` VALUES (512021, 5120, 2, '安岳', 'an yue', 'any', '安岳县', NULL, NULL, '');
INSERT INTO `districts` VALUES (512022, 5120, 2, '乐至', 'le zhi', 'lez', '乐至县', NULL, NULL, '');
INSERT INTO `districts` VALUES (513201, 5132, 2, '马尔康', 'ma er kang', 'maek', '马尔康市', NULL, NULL, '');
INSERT INTO `districts` VALUES (513221, 5132, 2, '汶川', 'wen chuan', 'wec', '汶川县', NULL, NULL, '');
INSERT INTO `districts` VALUES (513222, 5132, 2, '理县', 'li xian', 'lix', '理县', NULL, NULL, '');
INSERT INTO `districts` VALUES (513223, 5132, 2, '茂县', 'mao xian', 'max', '茂县', NULL, NULL, '');
INSERT INTO `districts` VALUES (513224, 5132, 2, '松潘', 'song pan', 'sop', '松潘县', NULL, NULL, '');
INSERT INTO `districts` VALUES (513225, 5132, 2, '九寨沟', 'jiu zhai gou', 'jizg', '九寨沟县', NULL, NULL, '');
INSERT INTO `districts` VALUES (513226, 5132, 2, '金川', 'jin chuan', 'jic', '金川县', NULL, NULL, '');
INSERT INTO `districts` VALUES (513227, 5132, 2, '小金', 'xiao jin', 'xij', '小金县', NULL, NULL, '');
INSERT INTO `districts` VALUES (513228, 5132, 2, '黑水', 'hei shui', 'hes', '黑水县', NULL, NULL, '');
INSERT INTO `districts` VALUES (513230, 5132, 2, '壤塘', 'rang tang', 'rat', '壤塘县', NULL, NULL, '');
INSERT INTO `districts` VALUES (513231, 5132, 2, '阿坝', 'a ba', 'ab', '阿坝县', NULL, NULL, '');
INSERT INTO `districts` VALUES (513232, 5132, 2, '若尔盖', 'ruo er gai', 'rueg', '若尔盖县', NULL, NULL, '');
INSERT INTO `districts` VALUES (513233, 5132, 2, '红原', 'hong yuan', 'hoy', '红原县', NULL, NULL, '');
INSERT INTO `districts` VALUES (513301, 5133, 2, '康定', 'kang ding', 'kad', '康定市', NULL, NULL, '');
INSERT INTO `districts` VALUES (513322, 5133, 2, '泸定', 'lu ding', 'lud', '泸定县', NULL, NULL, '');
INSERT INTO `districts` VALUES (513323, 5133, 2, '丹巴', 'dan ba', 'dab', '丹巴县', NULL, NULL, '');
INSERT INTO `districts` VALUES (513324, 5133, 2, '九龙', 'jiu long', 'jil', '九龙县', NULL, NULL, '');
INSERT INTO `districts` VALUES (513325, 5133, 2, '雅江', 'ya jiang', 'yaj', '雅江县', NULL, NULL, '');
INSERT INTO `districts` VALUES (513326, 5133, 2, '道孚', 'dao fu', 'daf', '道孚县', NULL, NULL, '');
INSERT INTO `districts` VALUES (513327, 5133, 2, '炉霍', 'lu huo', 'luh', '炉霍县', NULL, NULL, '');
INSERT INTO `districts` VALUES (513328, 5133, 2, '甘孜', 'gan zi', 'gaz', '甘孜县', NULL, NULL, '');
INSERT INTO `districts` VALUES (513329, 5133, 2, '新龙', 'xin long', 'xil', '新龙县', NULL, NULL, '');
INSERT INTO `districts` VALUES (513330, 5133, 2, '德格', 'de ge', 'deg', '德格县', NULL, NULL, '');
INSERT INTO `districts` VALUES (513331, 5133, 2, '白玉', 'bai yu', 'bay', '白玉县', NULL, NULL, '');
INSERT INTO `districts` VALUES (513332, 5133, 2, '石渠', 'shi qu', 'shq', '石渠县', NULL, NULL, '');
INSERT INTO `districts` VALUES (513333, 5133, 2, '色达', 'se da', 'sed', '色达县', NULL, NULL, '');
INSERT INTO `districts` VALUES (513334, 5133, 2, '理塘', 'li tang', 'lit', '理塘县', NULL, NULL, '');
INSERT INTO `districts` VALUES (513335, 5133, 2, '巴塘', 'ba tang', 'bat', '巴塘县', NULL, NULL, '');
INSERT INTO `districts` VALUES (513336, 5133, 2, '乡城', 'xiang cheng', 'xic', '乡城县', NULL, NULL, '');
INSERT INTO `districts` VALUES (513337, 5133, 2, '稻城', 'dao cheng', 'dac', '稻城县', NULL, NULL, '');
INSERT INTO `districts` VALUES (513338, 5133, 2, '得荣', 'de rong', 'der', '得荣县', NULL, NULL, '');
INSERT INTO `districts` VALUES (513401, 5134, 2, '西昌', 'xi chang', 'xic', '西昌市', NULL, NULL, '');
INSERT INTO `districts` VALUES (513422, 5134, 2, '木里藏族自治县', 'mu li zang zu zi zhi xian', 'mulz', '木里藏族自治县', NULL, NULL, '');
INSERT INTO `districts` VALUES (513423, 5134, 2, '盐源', 'yan yuan', 'yay', '盐源县', NULL, NULL, '');
INSERT INTO `districts` VALUES (513424, 5134, 2, '德昌', 'de chang', 'dec', '德昌县', NULL, NULL, '');
INSERT INTO `districts` VALUES (513425, 5134, 2, '会理', 'hui li', 'hul', '会理县', NULL, NULL, '');
INSERT INTO `districts` VALUES (513426, 5134, 2, '会东', 'hui dong', 'hud', '会东县', NULL, NULL, '');
INSERT INTO `districts` VALUES (513427, 5134, 2, '宁南', 'ning nan', 'nin', '宁南县', NULL, NULL, '');
INSERT INTO `districts` VALUES (513428, 5134, 2, '普格', 'pu ge', 'pug', '普格县', NULL, NULL, '');
INSERT INTO `districts` VALUES (513429, 5134, 2, '布拖', 'bu tuo', 'but', '布拖县', NULL, NULL, '');
INSERT INTO `districts` VALUES (513430, 5134, 2, '金阳', 'jin yang', 'jiy', '金阳县', NULL, NULL, '');
INSERT INTO `districts` VALUES (513431, 5134, 2, '昭觉', 'zhao jue', 'zhj', '昭觉县', NULL, NULL, '');
INSERT INTO `districts` VALUES (513432, 5134, 2, '喜德', 'xi de', 'xid', '喜德县', NULL, NULL, '');
INSERT INTO `districts` VALUES (513433, 5134, 2, '冕宁', 'mian ning', 'min', '冕宁县', NULL, NULL, '');
INSERT INTO `districts` VALUES (513434, 5134, 2, '越西', 'yue xi', 'yux', '越西县', NULL, NULL, '');
INSERT INTO `districts` VALUES (513435, 5134, 2, '甘洛', 'gan luo', 'gal', '甘洛县', NULL, NULL, '');
INSERT INTO `districts` VALUES (513436, 5134, 2, '美姑', 'mei gu', 'meg', '美姑县', NULL, NULL, '');
INSERT INTO `districts` VALUES (513437, 5134, 2, '雷波', 'lei bo', 'leb', '雷波县', NULL, NULL, '');
INSERT INTO `districts` VALUES (520102, 5201, 2, '南明', 'nan ming', 'nam', '南明区', NULL, NULL, '');
INSERT INTO `districts` VALUES (520103, 5201, 2, '云岩', 'yun yan', 'yuy', '云岩区', NULL, NULL, '');
INSERT INTO `districts` VALUES (520111, 5201, 2, '花溪', 'hua xi', 'hux', '花溪区', NULL, NULL, '');
INSERT INTO `districts` VALUES (520112, 5201, 2, '乌当', 'wu dang', 'wud', '乌当区', NULL, NULL, '');
INSERT INTO `districts` VALUES (520113, 5201, 2, '白云', 'bai yun', 'bay', '白云区', NULL, NULL, '');
INSERT INTO `districts` VALUES (520115, 5201, 2, '观山湖', 'guan shan hu', 'gush', '观山湖区', NULL, NULL, '');
INSERT INTO `districts` VALUES (520121, 5201, 2, '开阳', 'kai yang', 'kay', '开阳县', NULL, NULL, '');
INSERT INTO `districts` VALUES (520122, 5201, 2, '息烽', 'xi feng', 'xif', '息烽县', NULL, NULL, '');
INSERT INTO `districts` VALUES (520123, 5201, 2, '修文', 'xiu wen', 'xiw', '修文县', NULL, NULL, '');
INSERT INTO `districts` VALUES (520181, 5201, 2, '清镇', 'qing zhen', 'qiz', '清镇市', NULL, NULL, '');
INSERT INTO `districts` VALUES (520201, 5202, 2, '钟山', 'zhong shan', 'zhs', '钟山区', NULL, NULL, '');
INSERT INTO `districts` VALUES (520203, 5202, 2, '六枝特', 'liu zhi te', 'lizt', '六枝特区', NULL, NULL, '');
INSERT INTO `districts` VALUES (520221, 5202, 2, '水城', 'shui cheng', 'shc', '水城县', NULL, NULL, '');
INSERT INTO `districts` VALUES (520281, 5202, 2, '盘州', 'pan zhou', 'paz', '盘州市', NULL, NULL, '');
INSERT INTO `districts` VALUES (520302, 5203, 2, '红花岗', 'hong hua gang', 'hohg', '红花岗区', NULL, NULL, '');
INSERT INTO `districts` VALUES (520303, 5203, 2, '汇川', 'hui chuan', 'huc', '汇川区', NULL, NULL, '');
INSERT INTO `districts` VALUES (520304, 5203, 2, '播州', 'bo zhou', 'boz', '播州区', NULL, NULL, '');
INSERT INTO `districts` VALUES (520322, 5203, 2, '桐梓', 'tong zi', 'toz', '桐梓县', NULL, NULL, '');
INSERT INTO `districts` VALUES (520323, 5203, 2, '绥阳', 'sui yang', 'suy', '绥阳县', NULL, NULL, '');
INSERT INTO `districts` VALUES (520324, 5203, 2, '正安', 'zheng an', 'zha', '正安县', NULL, NULL, '');
INSERT INTO `districts` VALUES (520325, 5203, 2, '道真仡佬族苗族自治县', 'dao zhen ge lao zu miao zu zi zhi xian', 'dazg', '道真仡佬族苗族自治县', NULL, NULL, '');
INSERT INTO `districts` VALUES (520326, 5203, 2, '务川仡佬族苗族自治县', 'wu chuan ge lao zu miao zu zi zhi xian', 'wucg', '务川仡佬族苗族自治县', NULL, NULL, '');
INSERT INTO `districts` VALUES (520327, 5203, 2, '凤冈', 'feng gang', 'feg', '凤冈县', NULL, NULL, '');
INSERT INTO `districts` VALUES (520328, 5203, 2, '湄潭', 'mei tan', 'met', '湄潭县', NULL, NULL, '');
INSERT INTO `districts` VALUES (520329, 5203, 2, '余庆', 'yu qing', 'yuq', '余庆县', NULL, NULL, '');
INSERT INTO `districts` VALUES (520330, 5203, 2, '习水', 'xi shui', 'xis', '习水县', NULL, NULL, '');
INSERT INTO `districts` VALUES (520381, 5203, 2, '赤水', 'chi shui', 'chs', '赤水市', NULL, NULL, '');
INSERT INTO `districts` VALUES (520382, 5203, 2, '仁怀', 'ren huai', 'reh', '仁怀市', NULL, NULL, '');
INSERT INTO `districts` VALUES (520402, 5204, 2, '西秀', 'xi xiu', 'xix', '西秀区', NULL, NULL, '');
INSERT INTO `districts` VALUES (520403, 5204, 2, '平坝', 'ping ba', 'pib', '平坝区', NULL, NULL, '');
INSERT INTO `districts` VALUES (520422, 5204, 2, '普定', 'pu ding', 'pud', '普定县', NULL, NULL, '');
INSERT INTO `districts` VALUES (520423, 5204, 2, '镇宁布依族苗族自治县', 'zhen ning bu yi zu miao zu zi zhi xian', 'zhnb', '镇宁布依族苗族自治县', NULL, NULL, '');
INSERT INTO `districts` VALUES (520424, 5204, 2, '关岭布依族苗族自治县', 'guan ling bu yi zu miao zu zi zhi xian', 'gulb', '关岭布依族苗族自治县', NULL, NULL, '');
INSERT INTO `districts` VALUES (520425, 5204, 2, '紫云苗族布依族自治县', 'zi yun miao zu bu yi zu zi zhi xian', 'ziym', '紫云苗族布依族自治县', NULL, NULL, '');
INSERT INTO `districts` VALUES (520502, 5205, 2, '七星关', 'qi xing guan', 'qixg', '七星关区', NULL, NULL, '');
INSERT INTO `districts` VALUES (520521, 5205, 2, '大方', 'da fang', 'daf', '大方县', NULL, NULL, '');
INSERT INTO `districts` VALUES (520522, 5205, 2, '黔西', 'qian xi', 'qix', '黔西县', NULL, NULL, '');
INSERT INTO `districts` VALUES (520523, 5205, 2, '金沙', 'jin sha', 'jis', '金沙县', NULL, NULL, '');
INSERT INTO `districts` VALUES (520524, 5205, 2, '织金', 'zhi jin', 'zhj', '织金县', NULL, NULL, '');
INSERT INTO `districts` VALUES (520525, 5205, 2, '纳雍', 'na yong', 'nay', '纳雍县', NULL, NULL, '');
INSERT INTO `districts` VALUES (520526, 5205, 2, '威宁彝族回族苗族自治县', 'wei ning yi zu hui zu miao zu zi zhi xian', 'weny', '威宁彝族回族苗族自治县', NULL, NULL, '');
INSERT INTO `districts` VALUES (520527, 5205, 2, '赫章', 'he zhang', 'hez', '赫章县', NULL, NULL, '');
INSERT INTO `districts` VALUES (520602, 5206, 2, '碧江', 'bi jiang', 'bij', '碧江区', NULL, NULL, '');
INSERT INTO `districts` VALUES (520603, 5206, 2, '万山', 'wan shan', 'was', '万山区', NULL, NULL, '');
INSERT INTO `districts` VALUES (520621, 5206, 2, '江口', 'jiang kou', 'jik', '江口县', NULL, NULL, '');
INSERT INTO `districts` VALUES (520622, 5206, 2, '玉屏侗族自治县', 'yu ping dong zu zi zhi xian', 'yupd', '玉屏侗族自治县', NULL, NULL, '');
INSERT INTO `districts` VALUES (520623, 5206, 2, '石阡', 'shi qian', 'shq', '石阡县', NULL, NULL, '');
INSERT INTO `districts` VALUES (520624, 5206, 2, '思南', 'si nan', 'sin', '思南县', NULL, NULL, '');
INSERT INTO `districts` VALUES (520625, 5206, 2, '印江土家族苗族自治县', 'yin jiang tu jia zu miao zu zi zhi xian', 'yijt', '印江土家族苗族自治县', NULL, NULL, '');
INSERT INTO `districts` VALUES (520626, 5206, 2, '德江', 'de jiang', 'dej', '德江县', NULL, NULL, '');
INSERT INTO `districts` VALUES (520627, 5206, 2, '沿河土家族自治县', 'yan he tu jia zu zi zhi xian', 'yaht', '沿河土家族自治县', NULL, NULL, '');
INSERT INTO `districts` VALUES (520628, 5206, 2, '松桃苗族自治县', 'song tao miao zu zi zhi xian', 'sotm', '松桃苗族自治县', NULL, NULL, '');
INSERT INTO `districts` VALUES (522301, 5223, 2, '兴义', 'xing yi', 'xiy', '兴义市', NULL, NULL, '');
INSERT INTO `districts` VALUES (522322, 5223, 2, '兴仁', 'xing ren', 'xir', '兴仁县', NULL, NULL, '');
INSERT INTO `districts` VALUES (522323, 5223, 2, '普安', 'pu an', 'pua', '普安县', NULL, NULL, '');
INSERT INTO `districts` VALUES (522324, 5223, 2, '晴隆', 'qing long', 'qil', '晴隆县', NULL, NULL, '');
INSERT INTO `districts` VALUES (522325, 5223, 2, '贞丰', 'zhen feng', 'zhf', '贞丰县', NULL, NULL, '');
INSERT INTO `districts` VALUES (522326, 5223, 2, '望谟', 'wang mo', 'wam', '望谟县', NULL, NULL, '');
INSERT INTO `districts` VALUES (522327, 5223, 2, '册亨', 'ce heng', 'ceh', '册亨县', NULL, NULL, '');
INSERT INTO `districts` VALUES (522328, 5223, 2, '安龙', 'an long', 'anl', '安龙县', NULL, NULL, '');
INSERT INTO `districts` VALUES (522601, 5226, 2, '凯里', 'kai li', 'kal', '凯里市', NULL, NULL, '');
INSERT INTO `districts` VALUES (522622, 5226, 2, '黄平', 'huang ping', 'hup', '黄平县', NULL, NULL, '');
INSERT INTO `districts` VALUES (522623, 5226, 2, '施秉', 'shi bing', 'shb', '施秉县', NULL, NULL, '');
INSERT INTO `districts` VALUES (522624, 5226, 2, '三穗', 'san sui', 'sas', '三穗县', NULL, NULL, '');
INSERT INTO `districts` VALUES (522625, 5226, 2, '镇远', 'zhen yuan', 'zhy', '镇远县', NULL, NULL, '');
INSERT INTO `districts` VALUES (522626, 5226, 2, '岑巩', 'cen gong', 'ceg', '岑巩县', NULL, NULL, '');
INSERT INTO `districts` VALUES (522627, 5226, 2, '天柱', 'tian zhu', 'tiz', '天柱县', NULL, NULL, '');
INSERT INTO `districts` VALUES (522628, 5226, 2, '锦屏', 'jin ping', 'jip', '锦屏县', NULL, NULL, '');
INSERT INTO `districts` VALUES (522629, 5226, 2, '剑河', 'jian he', 'jih', '剑河县', NULL, NULL, '');
INSERT INTO `districts` VALUES (522630, 5226, 2, '台江', 'tai jiang', 'taj', '台江县', NULL, NULL, '');
INSERT INTO `districts` VALUES (522631, 5226, 2, '黎平', 'li ping', 'lip', '黎平县', NULL, NULL, '');
INSERT INTO `districts` VALUES (522632, 5226, 2, '榕江', 'rong jiang', 'roj', '榕江县', NULL, NULL, '');
INSERT INTO `districts` VALUES (522633, 5226, 2, '从江', 'cong jiang', 'coj', '从江县', NULL, NULL, '');
INSERT INTO `districts` VALUES (522634, 5226, 2, '雷山', 'lei shan', 'les', '雷山县', NULL, NULL, '');
INSERT INTO `districts` VALUES (522635, 5226, 2, '麻江', 'ma jiang', 'maj', '麻江县', NULL, NULL, '');
INSERT INTO `districts` VALUES (522636, 5226, 2, '丹寨', 'dan zhai', 'daz', '丹寨县', NULL, NULL, '');
INSERT INTO `districts` VALUES (522701, 5227, 2, '都匀', 'du yun', 'duy', '都匀市', NULL, NULL, '');
INSERT INTO `districts` VALUES (522702, 5227, 2, '福泉', 'fu quan', 'fuq', '福泉市', NULL, NULL, '');
INSERT INTO `districts` VALUES (522722, 5227, 2, '荔波', 'li bo', 'lib', '荔波县', NULL, NULL, '');
INSERT INTO `districts` VALUES (522723, 5227, 2, '贵定', 'gui ding', 'gud', '贵定县', NULL, NULL, '');
INSERT INTO `districts` VALUES (522725, 5227, 2, '瓮安', 'weng an', 'wea', '瓮安县', NULL, NULL, '');
INSERT INTO `districts` VALUES (522726, 5227, 2, '独山', 'du shan', 'dus', '独山县', NULL, NULL, '');
INSERT INTO `districts` VALUES (522727, 5227, 2, '平塘', 'ping tang', 'pit', '平塘县', NULL, NULL, '');
INSERT INTO `districts` VALUES (522728, 5227, 2, '罗甸', 'luo dian', 'lud', '罗甸县', NULL, NULL, '');
INSERT INTO `districts` VALUES (522729, 5227, 2, '长顺', 'chang shun', 'chs', '长顺县', NULL, NULL, '');
INSERT INTO `districts` VALUES (522730, 5227, 2, '龙里', 'long li', 'lol', '龙里县', NULL, NULL, '');
INSERT INTO `districts` VALUES (522731, 5227, 2, '惠水', 'hui shui', 'hus', '惠水县', NULL, NULL, '');
INSERT INTO `districts` VALUES (522732, 5227, 2, '三都水族自治县', 'san du shui zu zi zhi xian', 'sads', '三都水族自治县', NULL, NULL, '');
INSERT INTO `districts` VALUES (530102, 5301, 2, '五华', 'wu hua', 'wuh', '五华区', NULL, NULL, '');
INSERT INTO `districts` VALUES (530103, 5301, 2, '盘龙', 'pan long', 'pal', '盘龙区', NULL, NULL, '');
INSERT INTO `districts` VALUES (530111, 5301, 2, '官渡', 'guan du', 'gud', '官渡区', NULL, NULL, '');
INSERT INTO `districts` VALUES (530112, 5301, 2, '西山', 'xi shan', 'xis', '西山区', NULL, NULL, '');
INSERT INTO `districts` VALUES (530113, 5301, 2, '东川', 'dong chuan', 'doc', '东川区', NULL, NULL, '');
INSERT INTO `districts` VALUES (530114, 5301, 2, '呈贡', 'cheng gong', 'chg', '呈贡区', NULL, NULL, '');
INSERT INTO `districts` VALUES (530115, 5301, 2, '晋宁', 'jin ning', 'jin', '晋宁区', NULL, NULL, '');
INSERT INTO `districts` VALUES (530124, 5301, 2, '富民', 'fu min', 'fum', '富民县', NULL, NULL, '');
INSERT INTO `districts` VALUES (530125, 5301, 2, '宜良', 'yi liang', 'yil', '宜良县', NULL, NULL, '');
INSERT INTO `districts` VALUES (530126, 5301, 2, '石林彝族自治县', 'shi lin yi zu zi zhi xian', 'shly', '石林彝族自治县', NULL, NULL, '');
INSERT INTO `districts` VALUES (530127, 5301, 2, '嵩明', 'song ming', 'som', '嵩明县', NULL, NULL, '');
INSERT INTO `districts` VALUES (530128, 5301, 2, '禄劝彝族苗族自治县', 'lu quan yi zu miao zu zi zhi xian', 'luqy', '禄劝彝族苗族自治县', NULL, NULL, '');
INSERT INTO `districts` VALUES (530129, 5301, 2, '寻甸回族彝族自治县', 'xun dian hui zu yi zu zi zhi xian', 'xudh', '寻甸回族彝族自治县', NULL, NULL, '');
INSERT INTO `districts` VALUES (530181, 5301, 2, '安宁', 'an ning', 'ann', '安宁市', NULL, NULL, '');
INSERT INTO `districts` VALUES (530302, 5303, 2, '麒麟', 'qi lin', 'qil', '麒麟区', NULL, NULL, '');
INSERT INTO `districts` VALUES (530303, 5303, 2, '沾益', 'zhan yi', 'zhy', '沾益区', NULL, NULL, '');
INSERT INTO `districts` VALUES (530321, 5303, 2, '马龙', 'ma long', 'mal', '马龙县', NULL, NULL, '');
INSERT INTO `districts` VALUES (530322, 5303, 2, '陆良', 'lu liang', 'lul', '陆良县', NULL, NULL, '');
INSERT INTO `districts` VALUES (530323, 5303, 2, '师宗', 'shi zong', 'shz', '师宗县', NULL, NULL, '');
INSERT INTO `districts` VALUES (530324, 5303, 2, '罗平', 'luo ping', 'lup', '罗平县', NULL, NULL, '');
INSERT INTO `districts` VALUES (530325, 5303, 2, '富源', 'fu yuan', 'fuy', '富源县', NULL, NULL, '');
INSERT INTO `districts` VALUES (530326, 5303, 2, '会泽', 'hui ze', 'huz', '会泽县', NULL, NULL, '');
INSERT INTO `districts` VALUES (530381, 5303, 2, '宣威', 'xuan wei', 'xuw', '宣威市', NULL, NULL, '');
INSERT INTO `districts` VALUES (530402, 5304, 2, '红塔', 'hong ta', 'hot', '红塔区', NULL, NULL, '');
INSERT INTO `districts` VALUES (530403, 5304, 2, '江川', 'jiang chuan', 'jic', '江川区', NULL, NULL, '');
INSERT INTO `districts` VALUES (530422, 5304, 2, '澄江', 'cheng jiang', 'chj', '澄江县', NULL, NULL, '');
INSERT INTO `districts` VALUES (530423, 5304, 2, '通海', 'tong hai', 'toh', '通海县', NULL, NULL, '');
INSERT INTO `districts` VALUES (530424, 5304, 2, '华宁', 'hua ning', 'hun', '华宁县', NULL, NULL, '');
INSERT INTO `districts` VALUES (530425, 5304, 2, '易门', 'yi men', 'yim', '易门县', NULL, NULL, '');
INSERT INTO `districts` VALUES (530426, 5304, 2, '峨山彝族自治县', 'e shan yi zu zi zhi xian', 'esy', '峨山彝族自治县', NULL, NULL, '');
INSERT INTO `districts` VALUES (530427, 5304, 2, '新平彝族傣族自治县', 'xin ping yi zu dai zu zi zhi xian', 'xipy', '新平彝族傣族自治县', NULL, NULL, '');
INSERT INTO `districts` VALUES (530428, 5304, 2, '元江哈尼族彝族傣族自治县', 'yuan jiang ha ni zu yi zu dai zu zi zhi xian', 'yujh', '元江哈尼族彝族傣族自治县', NULL, NULL, '');
INSERT INTO `districts` VALUES (530502, 5305, 2, '隆阳', 'long yang', 'loy', '隆阳区', NULL, NULL, '');
INSERT INTO `districts` VALUES (530521, 5305, 2, '施甸', 'shi dian', 'shd', '施甸县', NULL, NULL, '');
INSERT INTO `districts` VALUES (530523, 5305, 2, '龙陵', 'long ling', 'lol', '龙陵县', NULL, NULL, '');
INSERT INTO `districts` VALUES (530524, 5305, 2, '昌宁', 'chang ning', 'chn', '昌宁县', NULL, NULL, '');
INSERT INTO `districts` VALUES (530581, 5305, 2, '腾冲', 'teng chong', 'tec', '腾冲市', NULL, NULL, '');
INSERT INTO `districts` VALUES (530602, 5306, 2, '昭阳', 'zhao yang', 'zhy', '昭阳区', NULL, NULL, '');
INSERT INTO `districts` VALUES (530621, 5306, 2, '鲁甸', 'lu dian', 'lud', '鲁甸县', NULL, NULL, '');
INSERT INTO `districts` VALUES (530622, 5306, 2, '巧家', 'qiao jia', 'qij', '巧家县', NULL, NULL, '');
INSERT INTO `districts` VALUES (530623, 5306, 2, '盐津', 'yan jin', 'yaj', '盐津县', NULL, NULL, '');
INSERT INTO `districts` VALUES (530624, 5306, 2, '大关', 'da guan', 'dag', '大关县', NULL, NULL, '');
INSERT INTO `districts` VALUES (530625, 5306, 2, '永善', 'yong shan', 'yos', '永善县', NULL, NULL, '');
INSERT INTO `districts` VALUES (530626, 5306, 2, '绥江', 'sui jiang', 'suj', '绥江县', NULL, NULL, '');
INSERT INTO `districts` VALUES (530627, 5306, 2, '镇雄', 'zhen xiong', 'zhx', '镇雄县', NULL, NULL, '');
INSERT INTO `districts` VALUES (530628, 5306, 2, '彝良', 'yi liang', 'yil', '彝良县', NULL, NULL, '');
INSERT INTO `districts` VALUES (530629, 5306, 2, '威信', 'wei xin', 'wex', '威信县', NULL, NULL, '');
INSERT INTO `districts` VALUES (530630, 5306, 2, '水富', 'shui fu', 'shf', '水富县', NULL, NULL, '');
INSERT INTO `districts` VALUES (530702, 5307, 2, '古城', 'gu cheng', 'guc', '古城区', NULL, NULL, '');
INSERT INTO `districts` VALUES (530721, 5307, 2, '玉龙纳西族自治县', 'yu long na xi zu zi zhi xian', 'yuln', '玉龙纳西族自治县', NULL, NULL, '');
INSERT INTO `districts` VALUES (530722, 5307, 2, '永胜', 'yong sheng', 'yos', '永胜县', NULL, NULL, '');
INSERT INTO `districts` VALUES (530723, 5307, 2, '华坪', 'hua ping', 'hup', '华坪县', NULL, NULL, '');
INSERT INTO `districts` VALUES (530724, 5307, 2, '宁蒗彝族自治县', 'ning lang yi zu zi zhi xian', 'nily', '宁蒗彝族自治县', NULL, NULL, '');
INSERT INTO `districts` VALUES (530802, 5308, 2, '思茅', 'si mao', 'sim', '思茅区', NULL, NULL, '');
INSERT INTO `districts` VALUES (530821, 5308, 2, '宁洱哈尼族彝族自治县', 'ning er ha ni zu yi zu zi zhi xian', 'nieh', '宁洱哈尼族彝族自治县', NULL, NULL, '');
INSERT INTO `districts` VALUES (530822, 5308, 2, '墨江哈尼族自治县', 'mo jiang ha ni zu zi zhi xian', 'mojh', '墨江哈尼族自治县', NULL, NULL, '');
INSERT INTO `districts` VALUES (530823, 5308, 2, '景东彝族自治县', 'jing dong yi zu zi zhi xian', 'jidy', '景东彝族自治县', NULL, NULL, '');
INSERT INTO `districts` VALUES (530824, 5308, 2, '景谷傣族彝族自治县', 'jing gu dai zu yi zu zi zhi xian', 'jigd', '景谷傣族彝族自治县', NULL, NULL, '');
INSERT INTO `districts` VALUES (530825, 5308, 2, '镇沅彝族哈尼族拉祜族自治县', 'zhen yuan yi zu ha ni zu la hu zu zi zhi xian', 'zhyy', '镇沅彝族哈尼族拉祜族自治县', NULL, NULL, '');
INSERT INTO `districts` VALUES (530826, 5308, 2, '江城哈尼族彝族自治县', 'jiang cheng ha ni zu yi zu zi zhi xian', 'jich', '江城哈尼族彝族自治县', NULL, NULL, '');
INSERT INTO `districts` VALUES (530827, 5308, 2, '孟连傣族拉祜族佤族自治县', 'meng lian dai zu la hu zu wa zu zi zhi xian', 'meld', '孟连傣族拉祜族佤族自治县', NULL, NULL, '');
INSERT INTO `districts` VALUES (530828, 5308, 2, '澜沧拉祜族自治县', 'lan cang la hu zu zi zhi xian', 'lacl', '澜沧拉祜族自治县', NULL, NULL, '');
INSERT INTO `districts` VALUES (530829, 5308, 2, '西盟佤族自治县', 'xi meng wa zu zi zhi xian', 'ximw', '西盟佤族自治县', NULL, NULL, '');
INSERT INTO `districts` VALUES (530902, 5309, 2, '临翔', 'lin xiang', 'lix', '临翔区', NULL, NULL, '');
INSERT INTO `districts` VALUES (530921, 5309, 2, '凤庆', 'feng qing', 'feq', '凤庆县', NULL, NULL, '');
INSERT INTO `districts` VALUES (530922, 5309, 2, '云县', 'yun xian', 'yux', '云县', NULL, NULL, '');
INSERT INTO `districts` VALUES (530923, 5309, 2, '永德', 'yong de', 'yod', '永德县', NULL, NULL, '');
INSERT INTO `districts` VALUES (530924, 5309, 2, '镇康', 'zhen kang', 'zhk', '镇康县', NULL, NULL, '');
INSERT INTO `districts` VALUES (530925, 5309, 2, '双江拉祜族佤族布朗族傣族自治县', 'shuang jiang la hu zu wa zu bu lang zu dai zu zi zhi xian', 'shjl', '双江拉祜族佤族布朗族傣族自治县', NULL, NULL, '');
INSERT INTO `districts` VALUES (530926, 5309, 2, '耿马傣族佤族自治县', 'geng ma dai zu wa zu zi zhi xian', 'gemd', '耿马傣族佤族自治县', NULL, NULL, '');
INSERT INTO `districts` VALUES (530927, 5309, 2, '沧源佤族自治县', 'cang yuan wa zu zi zhi xian', 'cayw', '沧源佤族自治县', NULL, NULL, '');
INSERT INTO `districts` VALUES (532301, 5323, 2, '楚雄', 'chu xiong', 'chx', '楚雄市', NULL, NULL, '');
INSERT INTO `districts` VALUES (532322, 5323, 2, '双柏', 'shuang bai', 'shb', '双柏县', NULL, NULL, '');
INSERT INTO `districts` VALUES (532323, 5323, 2, '牟定', 'mou ding', 'mod', '牟定县', NULL, NULL, '');
INSERT INTO `districts` VALUES (532324, 5323, 2, '南华', 'nan hua', 'nah', '南华县', NULL, NULL, '');
INSERT INTO `districts` VALUES (532325, 5323, 2, '姚安', 'yao an', 'yaa', '姚安县', NULL, NULL, '');
INSERT INTO `districts` VALUES (532326, 5323, 2, '大姚', 'da yao', 'day', '大姚县', NULL, NULL, '');
INSERT INTO `districts` VALUES (532327, 5323, 2, '永仁', 'yong ren', 'yor', '永仁县', NULL, NULL, '');
INSERT INTO `districts` VALUES (532328, 5323, 2, '元谋', 'yuan mou', 'yum', '元谋县', NULL, NULL, '');
INSERT INTO `districts` VALUES (532329, 5323, 2, '武定', 'wu ding', 'wud', '武定县', NULL, NULL, '');
INSERT INTO `districts` VALUES (532331, 5323, 2, '禄丰', 'lu feng', 'luf', '禄丰县', NULL, NULL, '');
INSERT INTO `districts` VALUES (532501, 5325, 2, '个旧', 'ge jiu', 'gej', '个旧市', NULL, NULL, '');
INSERT INTO `districts` VALUES (532502, 5325, 2, '开远', 'kai yuan', 'kay', '开远市', NULL, NULL, '');
INSERT INTO `districts` VALUES (532503, 5325, 2, '蒙自', 'meng zi', 'mez', '蒙自市', NULL, NULL, '');
INSERT INTO `districts` VALUES (532504, 5325, 2, '弥勒', 'mi le', 'mil', '弥勒市', NULL, NULL, '');
INSERT INTO `districts` VALUES (532523, 5325, 2, '屏边苗族自治县', 'ping bian miao zu zi zhi xian', 'pibm', '屏边苗族自治县', NULL, NULL, '');
INSERT INTO `districts` VALUES (532524, 5325, 2, '建水', 'jian shui', 'jis', '建水县', NULL, NULL, '');
INSERT INTO `districts` VALUES (532525, 5325, 2, '石屏', 'shi ping', 'shp', '石屏县', NULL, NULL, '');
INSERT INTO `districts` VALUES (532527, 5325, 2, '泸西', 'lu xi', 'lux', '泸西县', NULL, NULL, '');
INSERT INTO `districts` VALUES (532528, 5325, 2, '元阳', 'yuan yang', 'yuy', '元阳县', NULL, NULL, '');
INSERT INTO `districts` VALUES (532529, 5325, 2, '红河', 'hong he', 'hoh', '红河县', NULL, NULL, '');
INSERT INTO `districts` VALUES (532530, 5325, 2, '金平苗族瑶族傣族自治县', 'jin ping miao zu yao zu dai zu zi zhi xian', 'jipm', '金平苗族瑶族傣族自治县', NULL, NULL, '');
INSERT INTO `districts` VALUES (532531, 5325, 2, '绿春', 'lv chun', 'lvc', '绿春县', NULL, NULL, '');
INSERT INTO `districts` VALUES (532532, 5325, 2, '河口瑶族自治县', 'he kou yao zu zi zhi xian', 'heky', '河口瑶族自治县', NULL, NULL, '');
INSERT INTO `districts` VALUES (532601, 5326, 2, '文山', 'wen shan', 'wes', '文山市', NULL, NULL, '');
INSERT INTO `districts` VALUES (532622, 5326, 2, '砚山', 'yan shan', 'yas', '砚山县', NULL, NULL, '');
INSERT INTO `districts` VALUES (532623, 5326, 2, '西畴', 'xi chou', 'xic', '西畴县', NULL, NULL, '');
INSERT INTO `districts` VALUES (532624, 5326, 2, '麻栗坡', 'ma li po', 'malp', '麻栗坡县', NULL, NULL, '');
INSERT INTO `districts` VALUES (532625, 5326, 2, '马关', 'ma guan', 'mag', '马关县', NULL, NULL, '');
INSERT INTO `districts` VALUES (532626, 5326, 2, '丘北', 'qiu bei', 'qib', '丘北县', NULL, NULL, '');
INSERT INTO `districts` VALUES (532627, 5326, 2, '广南', 'guang nan', 'gun', '广南县', NULL, NULL, '');
INSERT INTO `districts` VALUES (532628, 5326, 2, '富宁', 'fu ning', 'fun', '富宁县', NULL, NULL, '');
INSERT INTO `districts` VALUES (532801, 5328, 2, '景洪', 'jing hong', 'jih', '景洪市', NULL, NULL, '');
INSERT INTO `districts` VALUES (532822, 5328, 2, '勐海', 'meng hai', 'meh', '勐海县', NULL, NULL, '');
INSERT INTO `districts` VALUES (532823, 5328, 2, '勐腊', 'meng la', 'mel', '勐腊县', NULL, NULL, '');
INSERT INTO `districts` VALUES (532901, 5329, 2, '大理', 'da li', 'dal', '大理市', NULL, NULL, '');
INSERT INTO `districts` VALUES (532922, 5329, 2, '漾濞彝族自治县', 'yang bi yi zu zi zhi xian', 'yaby', '漾濞彝族自治县', NULL, NULL, '');
INSERT INTO `districts` VALUES (532923, 5329, 2, '祥云', 'xiang yun', 'xiy', '祥云县', NULL, NULL, '');
INSERT INTO `districts` VALUES (532924, 5329, 2, '宾川', 'bin chuan', 'bic', '宾川县', NULL, NULL, '');
INSERT INTO `districts` VALUES (532925, 5329, 2, '弥渡', 'mi du', 'mid', '弥渡县', NULL, NULL, '');
INSERT INTO `districts` VALUES (532926, 5329, 2, '南涧彝族自治县', 'nan jian yi zu zi zhi xian', 'najy', '南涧彝族自治县', NULL, NULL, '');
INSERT INTO `districts` VALUES (532927, 5329, 2, '巍山彝族回族自治县', 'wei shan yi zu hui zu zi zhi xian', 'wesy', '巍山彝族回族自治县', NULL, NULL, '');
INSERT INTO `districts` VALUES (532928, 5329, 2, '永平', 'yong ping', 'yop', '永平县', NULL, NULL, '');
INSERT INTO `districts` VALUES (532929, 5329, 2, '云龙', 'yun long', 'yul', '云龙县', NULL, NULL, '');
INSERT INTO `districts` VALUES (532930, 5329, 2, '洱源', 'er yuan', 'ery', '洱源县', NULL, NULL, '');
INSERT INTO `districts` VALUES (532931, 5329, 2, '剑川', 'jian chuan', 'jic', '剑川县', NULL, NULL, '');
INSERT INTO `districts` VALUES (532932, 5329, 2, '鹤庆', 'he qing', 'heq', '鹤庆县', NULL, NULL, '');
INSERT INTO `districts` VALUES (533102, 5331, 2, '瑞丽', 'rui li', 'rul', '瑞丽市', NULL, NULL, '');
INSERT INTO `districts` VALUES (533103, 5331, 2, '芒市', 'mang shi', 'mas', '芒市', NULL, NULL, '');
INSERT INTO `districts` VALUES (533122, 5331, 2, '梁河', 'liang he', 'lih', '梁河县', NULL, NULL, '');
INSERT INTO `districts` VALUES (533123, 5331, 2, '盈江', 'ying jiang', 'yij', '盈江县', NULL, NULL, '');
INSERT INTO `districts` VALUES (533124, 5331, 2, '陇川', 'long chuan', 'loc', '陇川县', NULL, NULL, '');
INSERT INTO `districts` VALUES (533301, 5333, 2, '泸水', 'lu shui', 'lus', '泸水市', NULL, NULL, '');
INSERT INTO `districts` VALUES (533323, 5333, 2, '福贡', 'fu gong', 'fug', '福贡县', NULL, NULL, '');
INSERT INTO `districts` VALUES (533324, 5333, 2, '贡山独龙族怒族自治县', 'gong shan du long zu nu zu zi zhi xian', 'gosd', '贡山独龙族怒族自治县', NULL, NULL, '');
INSERT INTO `districts` VALUES (533325, 5333, 2, '兰坪白族普米族自治县', 'lan ping bai zu pu mi zu zi zhi xian', 'lapb', '兰坪白族普米族自治县', NULL, NULL, '');
INSERT INTO `districts` VALUES (533401, 5334, 2, '香格里拉', 'xiang ge li la', 'xigl', '香格里拉市', NULL, NULL, '');
INSERT INTO `districts` VALUES (533422, 5334, 2, '德钦', 'de qin', 'deq', '德钦县', NULL, NULL, '');
INSERT INTO `districts` VALUES (533423, 5334, 2, '维西傈僳族自治县', 'wei xi li su zu zi zhi xian', 'wexl', '维西傈僳族自治县', NULL, NULL, '');
INSERT INTO `districts` VALUES (540102, 5401, 2, '城关', 'cheng guan', 'chg', '城关区', NULL, NULL, '');
INSERT INTO `districts` VALUES (540103, 5401, 2, '堆龙德庆', 'dui long de qing', 'duld', '堆龙德庆区', NULL, NULL, '');
INSERT INTO `districts` VALUES (540121, 5401, 2, '林周', 'lin zhou', 'liz', '林周县', NULL, NULL, '');
INSERT INTO `districts` VALUES (540122, 5401, 2, '当雄', 'dang xiong', 'dax', '当雄县', NULL, NULL, '');
INSERT INTO `districts` VALUES (540123, 5401, 2, '尼木', 'ni mu', 'nim', '尼木县', NULL, NULL, '');
INSERT INTO `districts` VALUES (540124, 5401, 2, '曲水', 'qu shui', 'qus', '曲水县', NULL, NULL, '');
INSERT INTO `districts` VALUES (540126, 5401, 2, '达孜', 'da zi', 'daz', '达孜县', NULL, NULL, '');
INSERT INTO `districts` VALUES (540127, 5401, 2, '墨竹工卡', 'mo zhu gong ka', 'mozg', '墨竹工卡县', NULL, NULL, '');
INSERT INTO `districts` VALUES (540171, 5401, 2, '格尔木藏青工业园', 'ge er mu zang qing gong ye yuan', 'geem', '格尔木藏青工业园区', NULL, NULL, '');
INSERT INTO `districts` VALUES (540172, 5401, 2, '拉萨经济技术开发区', 'la sa jing ji ji shu kai fa qu', 'lasj', '拉萨经济技术开发区', NULL, NULL, '');
INSERT INTO `districts` VALUES (540173, 5401, 2, '西藏文化旅游创意园', 'xi zang wen hua lv you chuang yi yuan', 'xizw', '西藏文化旅游创意园区', NULL, NULL, '');
INSERT INTO `districts` VALUES (540174, 5401, 2, '达孜工业园', 'da zi gong ye yuan', 'dazg', '达孜工业园区', NULL, NULL, '');
INSERT INTO `districts` VALUES (540202, 5402, 2, '桑珠孜', 'sang zhu zi', 'sazz', '桑珠孜区', NULL, NULL, '');
INSERT INTO `districts` VALUES (540221, 5402, 2, '南木林', 'nan mu lin', 'naml', '南木林县', NULL, NULL, '');
INSERT INTO `districts` VALUES (540222, 5402, 2, '江孜', 'jiang zi', 'jiz', '江孜县', NULL, NULL, '');
INSERT INTO `districts` VALUES (540223, 5402, 2, '定日', 'ding ri', 'dir', '定日县', NULL, NULL, '');
INSERT INTO `districts` VALUES (540224, 5402, 2, '萨迦', 'sa jia', 'saj', '萨迦县', NULL, NULL, '');
INSERT INTO `districts` VALUES (540225, 5402, 2, '拉孜', 'la zi', 'laz', '拉孜县', NULL, NULL, '');
INSERT INTO `districts` VALUES (540226, 5402, 2, '昂仁', 'ang ren', 'anr', '昂仁县', NULL, NULL, '');
INSERT INTO `districts` VALUES (540227, 5402, 2, '谢通门', 'xie tong men', 'xitm', '谢通门县', NULL, NULL, '');
INSERT INTO `districts` VALUES (540228, 5402, 2, '白朗', 'bai lang', 'bal', '白朗县', NULL, NULL, '');
INSERT INTO `districts` VALUES (540229, 5402, 2, '仁布', 'ren bu', 'reb', '仁布县', NULL, NULL, '');
INSERT INTO `districts` VALUES (540230, 5402, 2, '康马', 'kang ma', 'kam', '康马县', NULL, NULL, '');
INSERT INTO `districts` VALUES (540231, 5402, 2, '定结', 'ding jie', 'dij', '定结县', NULL, NULL, '');
INSERT INTO `districts` VALUES (540232, 5402, 2, '仲巴', 'zhong ba', 'zhb', '仲巴县', NULL, NULL, '');
INSERT INTO `districts` VALUES (540233, 5402, 2, '亚东', 'ya dong', 'yad', '亚东县', NULL, NULL, '');
INSERT INTO `districts` VALUES (540234, 5402, 2, '吉隆', 'ji long', 'jil', '吉隆县', NULL, NULL, '');
INSERT INTO `districts` VALUES (540235, 5402, 2, '聂拉木', 'nie la mu', 'nilm', '聂拉木县', NULL, NULL, '');
INSERT INTO `districts` VALUES (540236, 5402, 2, '萨嘎', 'sa ga', 'sag', '萨嘎县', NULL, NULL, '');
INSERT INTO `districts` VALUES (540237, 5402, 2, '岗巴', 'gang ba', 'gab', '岗巴县', NULL, NULL, '');
INSERT INTO `districts` VALUES (540302, 5403, 2, '卡若', 'ka ruo', 'kar', '卡若区', NULL, NULL, '');
INSERT INTO `districts` VALUES (540321, 5403, 2, '江达', 'jiang da', 'jid', '江达县', NULL, NULL, '');
INSERT INTO `districts` VALUES (540322, 5403, 2, '贡觉', 'gong jue', 'goj', '贡觉县', NULL, NULL, '');
INSERT INTO `districts` VALUES (540323, 5403, 2, '类乌齐', 'lei wu qi', 'lewq', '类乌齐县', NULL, NULL, '');
INSERT INTO `districts` VALUES (540324, 5403, 2, '丁青', 'ding qing', 'diq', '丁青县', NULL, NULL, '');
INSERT INTO `districts` VALUES (540325, 5403, 2, '察雅', 'cha ya', 'chy', '察雅县', NULL, NULL, '');
INSERT INTO `districts` VALUES (540326, 5403, 2, '八宿', 'ba su', 'bas', '八宿县', NULL, NULL, '');
INSERT INTO `districts` VALUES (540327, 5403, 2, '左贡', 'zuo gong', 'zug', '左贡县', NULL, NULL, '');
INSERT INTO `districts` VALUES (540328, 5403, 2, '芒康', 'mang kang', 'mak', '芒康县', NULL, NULL, '');
INSERT INTO `districts` VALUES (540329, 5403, 2, '洛隆', 'luo long', 'lul', '洛隆县', NULL, NULL, '');
INSERT INTO `districts` VALUES (540330, 5403, 2, '边坝', 'bian ba', 'bib', '边坝县', NULL, NULL, '');
INSERT INTO `districts` VALUES (540402, 5404, 2, '巴宜', 'ba yi', 'bay', '巴宜区', NULL, NULL, '');
INSERT INTO `districts` VALUES (540421, 5404, 2, '工布江达', 'gong bu jiang da', 'gobj', '工布江达县', NULL, NULL, '');
INSERT INTO `districts` VALUES (540422, 5404, 2, '米林', 'mi lin', 'mil', '米林县', NULL, NULL, '');
INSERT INTO `districts` VALUES (540423, 5404, 2, '墨脱', 'mo tuo', 'mot', '墨脱县', NULL, NULL, '');
INSERT INTO `districts` VALUES (540424, 5404, 2, '波密', 'bo mi', 'bom', '波密县', NULL, NULL, '');
INSERT INTO `districts` VALUES (540425, 5404, 2, '察隅', 'cha yu', 'chy', '察隅县', NULL, NULL, '');
INSERT INTO `districts` VALUES (540426, 5404, 2, '朗县', 'lang xian', 'lax', '朗县', NULL, NULL, '');
INSERT INTO `districts` VALUES (540502, 5405, 2, '乃东', 'nai dong', 'nad', '乃东区', NULL, NULL, '');
INSERT INTO `districts` VALUES (540521, 5405, 2, '扎囊', 'zha nang', 'zhn', '扎囊县', NULL, NULL, '');
INSERT INTO `districts` VALUES (540522, 5405, 2, '贡嘎', 'gong ga', 'gog', '贡嘎县', NULL, NULL, '');
INSERT INTO `districts` VALUES (540523, 5405, 2, '桑日', 'sang ri', 'sar', '桑日县', NULL, NULL, '');
INSERT INTO `districts` VALUES (540524, 5405, 2, '琼结', 'qiong jie', 'qij', '琼结县', NULL, NULL, '');
INSERT INTO `districts` VALUES (540525, 5405, 2, '曲松', 'qu song', 'qus', '曲松县', NULL, NULL, '');
INSERT INTO `districts` VALUES (540526, 5405, 2, '措美', 'cuo mei', 'cum', '措美县', NULL, NULL, '');
INSERT INTO `districts` VALUES (540527, 5405, 2, '洛扎', 'luo zha', 'luz', '洛扎县', NULL, NULL, '');
INSERT INTO `districts` VALUES (540528, 5405, 2, '加查', 'jia cha', 'jic', '加查县', NULL, NULL, '');
INSERT INTO `districts` VALUES (540529, 5405, 2, '隆子', 'long zi', 'loz', '隆子县', NULL, NULL, '');
INSERT INTO `districts` VALUES (540530, 5405, 2, '错那', 'cuo na', 'cun', '错那县', NULL, NULL, '');
INSERT INTO `districts` VALUES (540531, 5405, 2, '浪卡子', 'lang qia zi', 'laqz', '浪卡子县', NULL, NULL, '');
INSERT INTO `districts` VALUES (542421, 5424, 2, '那曲', 'na qu', 'naq', '那曲县', NULL, NULL, '');
INSERT INTO `districts` VALUES (542422, 5424, 2, '嘉黎', 'jia li', 'jil', '嘉黎县', NULL, NULL, '');
INSERT INTO `districts` VALUES (542423, 5424, 2, '比如', 'bi ru', 'bir', '比如县', NULL, NULL, '');
INSERT INTO `districts` VALUES (542424, 5424, 2, '聂荣', 'nie rong', 'nir', '聂荣县', NULL, NULL, '');
INSERT INTO `districts` VALUES (542425, 5424, 2, '安多', 'an duo', 'and', '安多县', NULL, NULL, '');
INSERT INTO `districts` VALUES (542426, 5424, 2, '申扎', 'shen zha', 'shz', '申扎县', NULL, NULL, '');
INSERT INTO `districts` VALUES (542427, 5424, 2, '索县', 'suo xian', 'sux', '索县', NULL, NULL, '');
INSERT INTO `districts` VALUES (542428, 5424, 2, '班戈', 'ban ge', 'bag', '班戈县', NULL, NULL, '');
INSERT INTO `districts` VALUES (542429, 5424, 2, '巴青', 'ba qing', 'baq', '巴青县', NULL, NULL, '');
INSERT INTO `districts` VALUES (542430, 5424, 2, '尼玛', 'ni ma', 'nim', '尼玛县', NULL, NULL, '');
INSERT INTO `districts` VALUES (542431, 5424, 2, '双湖', 'shuang hu', 'shh', '双湖县', NULL, NULL, '');
INSERT INTO `districts` VALUES (542521, 5425, 2, '普兰', 'pu lan', 'pul', '普兰县', NULL, NULL, '');
INSERT INTO `districts` VALUES (542522, 5425, 2, '札达', 'zha da', 'zhd', '札达县', NULL, NULL, '');
INSERT INTO `districts` VALUES (542523, 5425, 2, '噶尔', 'ga er', 'gae', '噶尔县', NULL, NULL, '');
INSERT INTO `districts` VALUES (542524, 5425, 2, '日土', 'ri tu', 'rit', '日土县', NULL, NULL, '');
INSERT INTO `districts` VALUES (542525, 5425, 2, '革吉', 'ge ji', 'gej', '革吉县', NULL, NULL, '');
INSERT INTO `districts` VALUES (542526, 5425, 2, '改则', 'gai ze', 'gaz', '改则县', NULL, NULL, '');
INSERT INTO `districts` VALUES (542527, 5425, 2, '措勤', 'cuo qin', 'cuq', '措勤县', NULL, NULL, '');
INSERT INTO `districts` VALUES (610102, 6101, 2, '新城', 'xin cheng', 'xic', '新城区', NULL, NULL, '');
INSERT INTO `districts` VALUES (610103, 6101, 2, '碑林', 'bei lin', 'bel', '碑林区', NULL, NULL, '');
INSERT INTO `districts` VALUES (610104, 6101, 2, '莲湖', 'lian hu', 'lih', '莲湖区', NULL, NULL, '');
INSERT INTO `districts` VALUES (610111, 6101, 2, '灞桥', 'ba qiao', 'baq', '灞桥区', NULL, NULL, '');
INSERT INTO `districts` VALUES (610112, 6101, 2, '未央', 'wei yang', 'wey', '未央区', NULL, NULL, '');
INSERT INTO `districts` VALUES (610113, 6101, 2, '雁塔', 'yan ta', 'yat', '雁塔区', NULL, NULL, '');
INSERT INTO `districts` VALUES (610114, 6101, 2, '阎良', 'yan liang', 'yal', '阎良区', NULL, NULL, '');
INSERT INTO `districts` VALUES (610115, 6101, 2, '临潼', 'lin tong', 'lit', '临潼区', NULL, NULL, '');
INSERT INTO `districts` VALUES (610116, 6101, 2, '长安', 'chang an', 'cha', '长安区', NULL, NULL, '');
INSERT INTO `districts` VALUES (610117, 6101, 2, '高陵', 'gao ling', 'gal', '高陵区', NULL, NULL, '');
INSERT INTO `districts` VALUES (610118, 6101, 2, '鄠邑', 'hu yi', 'huy', '鄠邑区', NULL, NULL, '');
INSERT INTO `districts` VALUES (610122, 6101, 2, '蓝田', 'lan tian', 'lat', '蓝田县', NULL, NULL, '');
INSERT INTO `districts` VALUES (610124, 6101, 2, '周至', 'zhou zhi', 'zhz', '周至县', NULL, NULL, '');
INSERT INTO `districts` VALUES (610202, 6102, 2, '王益', 'wang yi', 'way', '王益区', NULL, NULL, '');
INSERT INTO `districts` VALUES (610203, 6102, 2, '印台', 'yin tai', 'yit', '印台区', NULL, NULL, '');
INSERT INTO `districts` VALUES (610204, 6102, 2, '耀州', 'yao zhou', 'yaz', '耀州区', NULL, NULL, '');
INSERT INTO `districts` VALUES (610222, 6102, 2, '宜君', 'yi jun', 'yij', '宜君县', NULL, NULL, '');
INSERT INTO `districts` VALUES (610302, 6103, 2, '渭滨', 'wei bin', 'web', '渭滨区', NULL, NULL, '');
INSERT INTO `districts` VALUES (610303, 6103, 2, '金台', 'jin tai', 'jit', '金台区', NULL, NULL, '');
INSERT INTO `districts` VALUES (610304, 6103, 2, '陈仓', 'chen cang', 'chc', '陈仓区', NULL, NULL, '');
INSERT INTO `districts` VALUES (610322, 6103, 2, '凤翔', 'feng xiang', 'fex', '凤翔县', NULL, NULL, '');
INSERT INTO `districts` VALUES (610323, 6103, 2, '岐山', 'qi shan', 'qis', '岐山县', NULL, NULL, '');
INSERT INTO `districts` VALUES (610324, 6103, 2, '扶风', 'fu feng', 'fuf', '扶风县', NULL, NULL, '');
INSERT INTO `districts` VALUES (610326, 6103, 2, '眉县', 'mei xian', 'mex', '眉县', NULL, NULL, '');
INSERT INTO `districts` VALUES (610327, 6103, 2, '陇县', 'long xian', 'lox', '陇县', NULL, NULL, '');
INSERT INTO `districts` VALUES (610328, 6103, 2, '千阳', 'qian yang', 'qiy', '千阳县', NULL, NULL, '');
INSERT INTO `districts` VALUES (610329, 6103, 2, '麟游', 'lin you', 'liy', '麟游县', NULL, NULL, '');
INSERT INTO `districts` VALUES (610330, 6103, 2, '凤县', 'feng xian', 'fex', '凤县', NULL, NULL, '');
INSERT INTO `districts` VALUES (610331, 6103, 2, '太白', 'tai bai', 'tab', '太白县', NULL, NULL, '');
INSERT INTO `districts` VALUES (610402, 6104, 2, '秦都', 'qin du', 'qid', '秦都区', NULL, NULL, '');
INSERT INTO `districts` VALUES (610403, 6104, 2, '杨陵', 'yang ling', 'yal', '杨陵区', NULL, NULL, '');
INSERT INTO `districts` VALUES (610404, 6104, 2, '渭城', 'wei cheng', 'wec', '渭城区', NULL, NULL, '');
INSERT INTO `districts` VALUES (610422, 6104, 2, '三原', 'san yuan', 'say', '三原县', NULL, NULL, '');
INSERT INTO `districts` VALUES (610423, 6104, 2, '泾阳', 'jing yang', 'jiy', '泾阳县', NULL, NULL, '');
INSERT INTO `districts` VALUES (610424, 6104, 2, '乾县', 'qian xian', 'qix', '乾县', NULL, NULL, '');
INSERT INTO `districts` VALUES (610425, 6104, 2, '礼泉', 'li quan', 'liq', '礼泉县', NULL, NULL, '');
INSERT INTO `districts` VALUES (610426, 6104, 2, '永寿', 'yong shou', 'yos', '永寿县', NULL, NULL, '');
INSERT INTO `districts` VALUES (610427, 6104, 2, '彬县', 'bin xian', 'bix', '彬县', NULL, NULL, '');
INSERT INTO `districts` VALUES (610428, 6104, 2, '长武', 'chang wu', 'chw', '长武县', NULL, NULL, '');
INSERT INTO `districts` VALUES (610429, 6104, 2, '旬邑', 'xun yi', 'xuy', '旬邑县', NULL, NULL, '');
INSERT INTO `districts` VALUES (610430, 6104, 2, '淳化', 'chun hua', 'chh', '淳化县', NULL, NULL, '');
INSERT INTO `districts` VALUES (610431, 6104, 2, '武功', 'wu gong', 'wug', '武功县', NULL, NULL, '');
INSERT INTO `districts` VALUES (610481, 6104, 2, '兴平', 'xing ping', 'xip', '兴平市', NULL, NULL, '');
INSERT INTO `districts` VALUES (610502, 6105, 2, '临渭', 'lin wei', 'liw', '临渭区', NULL, NULL, '');
INSERT INTO `districts` VALUES (610503, 6105, 2, '华州', 'hua zhou', 'huz', '华州区', NULL, NULL, '');
INSERT INTO `districts` VALUES (610522, 6105, 2, '潼关', 'tong guan', 'tog', '潼关县', NULL, NULL, '');
INSERT INTO `districts` VALUES (610523, 6105, 2, '大荔', 'da li', 'dal', '大荔县', NULL, NULL, '');
INSERT INTO `districts` VALUES (610524, 6105, 2, '合阳', 'he yang', 'hey', '合阳县', NULL, NULL, '');
INSERT INTO `districts` VALUES (610525, 6105, 2, '澄城', 'cheng cheng', 'chc', '澄城县', NULL, NULL, '');
INSERT INTO `districts` VALUES (610526, 6105, 2, '蒲城', 'pu cheng', 'puc', '蒲城县', NULL, NULL, '');
INSERT INTO `districts` VALUES (610527, 6105, 2, '白水', 'bai shui', 'bas', '白水县', NULL, NULL, '');
INSERT INTO `districts` VALUES (610528, 6105, 2, '富平', 'fu ping', 'fup', '富平县', NULL, NULL, '');
INSERT INTO `districts` VALUES (610581, 6105, 2, '韩城', 'han cheng', 'hac', '韩城市', NULL, NULL, '');
INSERT INTO `districts` VALUES (610582, 6105, 2, '华阴', 'hua yin', 'huy', '华阴市', NULL, NULL, '');
INSERT INTO `districts` VALUES (610602, 6106, 2, '宝塔', 'bao ta', 'bat', '宝塔区', NULL, NULL, '');
INSERT INTO `districts` VALUES (610603, 6106, 2, '安塞', 'an sai', 'ans', '安塞区', NULL, NULL, '');
INSERT INTO `districts` VALUES (610621, 6106, 2, '延长', 'yan chang', 'yac', '延长县', NULL, NULL, '');
INSERT INTO `districts` VALUES (610622, 6106, 2, '延川', 'yan chuan', 'yac', '延川县', NULL, NULL, '');
INSERT INTO `districts` VALUES (610623, 6106, 2, '子长', 'zi chang', 'zic', '子长县', NULL, NULL, '');
INSERT INTO `districts` VALUES (610625, 6106, 2, '志丹', 'zhi dan', 'zhd', '志丹县', NULL, NULL, '');
INSERT INTO `districts` VALUES (610626, 6106, 2, '吴起', 'wu qi', 'wuq', '吴起县', NULL, NULL, '');
INSERT INTO `districts` VALUES (610627, 6106, 2, '甘泉', 'gan quan', 'gaq', '甘泉县', NULL, NULL, '');
INSERT INTO `districts` VALUES (610628, 6106, 2, '富县', 'fu xian', 'fux', '富县', NULL, NULL, '');
INSERT INTO `districts` VALUES (610629, 6106, 2, '洛川', 'luo chuan', 'luc', '洛川县', NULL, NULL, '');
INSERT INTO `districts` VALUES (610630, 6106, 2, '宜川', 'yi chuan', 'yic', '宜川县', NULL, NULL, '');
INSERT INTO `districts` VALUES (610631, 6106, 2, '黄龙', 'huang long', 'hul', '黄龙县', NULL, NULL, '');
INSERT INTO `districts` VALUES (610632, 6106, 2, '黄陵', 'huang ling', 'hul', '黄陵县', NULL, NULL, '');
INSERT INTO `districts` VALUES (610702, 6107, 2, '汉台', 'han tai', 'hat', '汉台区', NULL, NULL, '');
INSERT INTO `districts` VALUES (610703, 6107, 2, '南郑', 'nan zheng', 'naz', '南郑区', NULL, NULL, '');
INSERT INTO `districts` VALUES (610722, 6107, 2, '城固', 'cheng gu', 'chg', '城固县', NULL, NULL, '');
INSERT INTO `districts` VALUES (610723, 6107, 2, '洋县', 'yang xian', 'yax', '洋县', NULL, NULL, '');
INSERT INTO `districts` VALUES (610724, 6107, 2, '西乡', 'xi xiang', 'xix', '西乡县', NULL, NULL, '');
INSERT INTO `districts` VALUES (610725, 6107, 2, '勉县', 'mian xian', 'mix', '勉县', NULL, NULL, '');
INSERT INTO `districts` VALUES (610726, 6107, 2, '宁强', 'ning qiang', 'niq', '宁强县', NULL, NULL, '');
INSERT INTO `districts` VALUES (610727, 6107, 2, '略阳', 'lve yang', 'lvy', '略阳县', NULL, NULL, '');
INSERT INTO `districts` VALUES (610728, 6107, 2, '镇巴', 'zhen ba', 'zhb', '镇巴县', NULL, NULL, '');
INSERT INTO `districts` VALUES (610729, 6107, 2, '留坝', 'liu ba', 'lib', '留坝县', NULL, NULL, '');
INSERT INTO `districts` VALUES (610730, 6107, 2, '佛坪', 'fo ping', 'fop', '佛坪县', NULL, NULL, '');
INSERT INTO `districts` VALUES (610802, 6108, 2, '榆阳', 'yu yang', 'yuy', '榆阳区', NULL, NULL, '');
INSERT INTO `districts` VALUES (610803, 6108, 2, '横山', 'heng shan', 'hes', '横山区', NULL, NULL, '');
INSERT INTO `districts` VALUES (610822, 6108, 2, '府谷', 'fu gu', 'fug', '府谷县', NULL, NULL, '');
INSERT INTO `districts` VALUES (610824, 6108, 2, '靖边', 'jing bian', 'jib', '靖边县', NULL, NULL, '');
INSERT INTO `districts` VALUES (610825, 6108, 2, '定边', 'ding bian', 'dib', '定边县', NULL, NULL, '');
INSERT INTO `districts` VALUES (610826, 6108, 2, '绥德', 'sui de', 'sud', '绥德县', NULL, NULL, '');
INSERT INTO `districts` VALUES (610827, 6108, 2, '米脂', 'mi zhi', 'miz', '米脂县', NULL, NULL, '');
INSERT INTO `districts` VALUES (610828, 6108, 2, '佳县', 'jia xian', 'jix', '佳县', NULL, NULL, '');
INSERT INTO `districts` VALUES (610829, 6108, 2, '吴堡', 'wu bu', 'wub', '吴堡县', NULL, NULL, '');
INSERT INTO `districts` VALUES (610830, 6108, 2, '清涧', 'qing jian', 'qij', '清涧县', NULL, NULL, '');
INSERT INTO `districts` VALUES (610831, 6108, 2, '子洲', 'zi zhou', 'ziz', '子洲县', NULL, NULL, '');
INSERT INTO `districts` VALUES (610881, 6108, 2, '神木', 'shen mu', 'shm', '神木市', NULL, NULL, '');
INSERT INTO `districts` VALUES (610902, 6109, 2, '汉滨', 'han bin', 'hab', '汉滨区', NULL, NULL, '');
INSERT INTO `districts` VALUES (610921, 6109, 2, '汉阴', 'han yin', 'hay', '汉阴县', NULL, NULL, '');
INSERT INTO `districts` VALUES (610922, 6109, 2, '石泉', 'shi quan', 'shq', '石泉县', NULL, NULL, '');
INSERT INTO `districts` VALUES (610923, 6109, 2, '宁陕', 'ning shan', 'nis', '宁陕县', NULL, NULL, '');
INSERT INTO `districts` VALUES (610924, 6109, 2, '紫阳', 'zi yang', 'ziy', '紫阳县', NULL, NULL, '');
INSERT INTO `districts` VALUES (610925, 6109, 2, '岚皋', 'lan gao', 'lag', '岚皋县', NULL, NULL, '');
INSERT INTO `districts` VALUES (610926, 6109, 2, '平利', 'ping li', 'pil', '平利县', NULL, NULL, '');
INSERT INTO `districts` VALUES (610927, 6109, 2, '镇坪', 'zhen ping', 'zhp', '镇坪县', NULL, NULL, '');
INSERT INTO `districts` VALUES (610928, 6109, 2, '旬阳', 'xun yang', 'xuy', '旬阳县', NULL, NULL, '');
INSERT INTO `districts` VALUES (610929, 6109, 2, '白河', 'bai he', 'bah', '白河县', NULL, NULL, '');
INSERT INTO `districts` VALUES (611002, 6110, 2, '商州', 'shang zhou', 'shz', '商州区', NULL, NULL, '');
INSERT INTO `districts` VALUES (611021, 6110, 2, '洛南', 'luo nan', 'lun', '洛南县', NULL, NULL, '');
INSERT INTO `districts` VALUES (611022, 6110, 2, '丹凤', 'dan feng', 'daf', '丹凤县', NULL, NULL, '');
INSERT INTO `districts` VALUES (611023, 6110, 2, '商南', 'shang nan', 'shn', '商南县', NULL, NULL, '');
INSERT INTO `districts` VALUES (611024, 6110, 2, '山阳', 'shan yang', 'shy', '山阳县', NULL, NULL, '');
INSERT INTO `districts` VALUES (611025, 6110, 2, '镇安', 'zhen an', 'zha', '镇安县', NULL, NULL, '');
INSERT INTO `districts` VALUES (611026, 6110, 2, '柞水', 'zha shui', 'zhs', '柞水县', NULL, NULL, '');
INSERT INTO `districts` VALUES (620102, 6201, 2, '城关', 'cheng guan', 'chg', '城关区', NULL, NULL, '');
INSERT INTO `districts` VALUES (620103, 6201, 2, '七里河', 'qi li he', 'qilh', '七里河区', NULL, NULL, '');
INSERT INTO `districts` VALUES (620104, 6201, 2, '西固', 'xi gu', 'xig', '西固区', NULL, NULL, '');
INSERT INTO `districts` VALUES (620105, 6201, 2, '安宁', 'an ning', 'ann', '安宁区', NULL, NULL, '');
INSERT INTO `districts` VALUES (620111, 6201, 2, '红古', 'hong gu', 'hog', '红古区', NULL, NULL, '');
INSERT INTO `districts` VALUES (620121, 6201, 2, '永登', 'yong deng', 'yod', '永登县', NULL, NULL, '');
INSERT INTO `districts` VALUES (620122, 6201, 2, '皋兰', 'gao lan', 'gal', '皋兰县', NULL, NULL, '');
INSERT INTO `districts` VALUES (620123, 6201, 2, '榆中', 'yu zhong', 'yuz', '榆中县', NULL, NULL, '');
INSERT INTO `districts` VALUES (620171, 6201, 2, '兰州新区', 'lan zhou xin qu', 'lazx', '兰州新区', NULL, NULL, '');
INSERT INTO `districts` VALUES (620201, 6202, 2, '市辖区', 'shi xia qu', 'shxq', '市辖区', NULL, NULL, '');
INSERT INTO `districts` VALUES (620302, 6203, 2, '金川', 'jin chuan', 'jic', '金川区', NULL, NULL, '');
INSERT INTO `districts` VALUES (620321, 6203, 2, '永昌', 'yong chang', 'yoc', '永昌县', NULL, NULL, '');
INSERT INTO `districts` VALUES (620402, 6204, 2, '白银', 'bai yin', 'bay', '白银区', NULL, NULL, '');
INSERT INTO `districts` VALUES (620403, 6204, 2, '平川', 'ping chuan', 'pic', '平川区', NULL, NULL, '');
INSERT INTO `districts` VALUES (620421, 6204, 2, '靖远', 'jing yuan', 'jiy', '靖远县', NULL, NULL, '');
INSERT INTO `districts` VALUES (620422, 6204, 2, '会宁', 'hui ning', 'hun', '会宁县', NULL, NULL, '');
INSERT INTO `districts` VALUES (620423, 6204, 2, '景泰', 'jing tai', 'jit', '景泰县', NULL, NULL, '');
INSERT INTO `districts` VALUES (620502, 6205, 2, '秦州', 'qin zhou', 'qiz', '秦州区', NULL, NULL, '');
INSERT INTO `districts` VALUES (620503, 6205, 2, '麦积', 'mai ji', 'maj', '麦积区', NULL, NULL, '');
INSERT INTO `districts` VALUES (620521, 6205, 2, '清水', 'qing shui', 'qis', '清水县', NULL, NULL, '');
INSERT INTO `districts` VALUES (620522, 6205, 2, '秦安', 'qin an', 'qia', '秦安县', NULL, NULL, '');
INSERT INTO `districts` VALUES (620523, 6205, 2, '甘谷', 'gan gu', 'gag', '甘谷县', NULL, NULL, '');
INSERT INTO `districts` VALUES (620524, 6205, 2, '武山', 'wu shan', 'wus', '武山县', NULL, NULL, '');
INSERT INTO `districts` VALUES (620525, 6205, 2, '张家川回族自治县', 'zhang jia chuan hui zu zi zhi xian', 'zhjc', '张家川回族自治县', NULL, NULL, '');
INSERT INTO `districts` VALUES (620602, 6206, 2, '凉州', 'liang zhou', 'liz', '凉州区', NULL, NULL, '');
INSERT INTO `districts` VALUES (620621, 6206, 2, '民勤', 'min qin', 'miq', '民勤县', NULL, NULL, '');
INSERT INTO `districts` VALUES (620622, 6206, 2, '古浪', 'gu lang', 'gul', '古浪县', NULL, NULL, '');
INSERT INTO `districts` VALUES (620623, 6206, 2, '天祝藏族自治县', 'tian zhu zang zu zi zhi xian', 'tizz', '天祝藏族自治县', NULL, NULL, '');
INSERT INTO `districts` VALUES (620702, 6207, 2, '甘州', 'gan zhou', 'gaz', '甘州区', NULL, NULL, '');
INSERT INTO `districts` VALUES (620721, 6207, 2, '肃南裕固族自治县', 'su nan yu gu zu zi zhi xian', 'suny', '肃南裕固族自治县', NULL, NULL, '');
INSERT INTO `districts` VALUES (620722, 6207, 2, '民乐', 'min yue', 'miy', '民乐县', NULL, NULL, '');
INSERT INTO `districts` VALUES (620723, 6207, 2, '临泽', 'lin ze', 'liz', '临泽县', NULL, NULL, '');
INSERT INTO `districts` VALUES (620724, 6207, 2, '高台', 'gao tai', 'gat', '高台县', NULL, NULL, '');
INSERT INTO `districts` VALUES (620725, 6207, 2, '山丹', 'shan dan', 'shd', '山丹县', NULL, NULL, '');
INSERT INTO `districts` VALUES (620802, 6208, 2, '崆峒', 'kong tong', 'kot', '崆峒区', NULL, NULL, '');
INSERT INTO `districts` VALUES (620821, 6208, 2, '泾川', 'jing chuan', 'jic', '泾川县', NULL, NULL, '');
INSERT INTO `districts` VALUES (620822, 6208, 2, '灵台', 'ling tai', 'lit', '灵台县', NULL, NULL, '');
INSERT INTO `districts` VALUES (620823, 6208, 2, '崇信', 'chong xin', 'chx', '崇信县', NULL, NULL, '');
INSERT INTO `districts` VALUES (620824, 6208, 2, '华亭', 'hua ting', 'hut', '华亭县', NULL, NULL, '');
INSERT INTO `districts` VALUES (620825, 6208, 2, '庄浪', 'zhuang lang', 'zhl', '庄浪县', NULL, NULL, '');
INSERT INTO `districts` VALUES (620826, 6208, 2, '静宁', 'jing ning', 'jin', '静宁县', NULL, NULL, '');
INSERT INTO `districts` VALUES (620871, 6208, 2, '平凉工业园', 'ping liang gong ye yuan', 'pilg', '平凉工业园区', NULL, NULL, '');
INSERT INTO `districts` VALUES (620902, 6209, 2, '肃州', 'su zhou', 'suz', '肃州区', NULL, NULL, '');
INSERT INTO `districts` VALUES (620921, 6209, 2, '金塔', 'jin ta', 'jit', '金塔县', NULL, NULL, '');
INSERT INTO `districts` VALUES (620922, 6209, 2, '瓜州', 'gua zhou', 'guz', '瓜州县', NULL, NULL, '');
INSERT INTO `districts` VALUES (620923, 6209, 2, '肃北蒙古族自治县', 'su bei meng gu zu zi zhi xian', 'subm', '肃北蒙古族自治县', NULL, NULL, '');
INSERT INTO `districts` VALUES (620924, 6209, 2, '阿克塞哈萨克族自治县', 'a ke sai ha sa ke zu zi zhi xian', 'aks', '阿克塞哈萨克族自治县', NULL, NULL, '');
INSERT INTO `districts` VALUES (620981, 6209, 2, '玉门', 'yu men', 'yum', '玉门市', NULL, NULL, '');
INSERT INTO `districts` VALUES (620982, 6209, 2, '敦煌', 'dun huang', 'duh', '敦煌市', NULL, NULL, '');
INSERT INTO `districts` VALUES (621002, 6210, 2, '西峰', 'xi feng', 'xif', '西峰区', NULL, NULL, '');
INSERT INTO `districts` VALUES (621021, 6210, 2, '庆城', 'qing cheng', 'qic', '庆城县', NULL, NULL, '');
INSERT INTO `districts` VALUES (621022, 6210, 2, '环县', 'huan xian', 'hux', '环县', NULL, NULL, '');
INSERT INTO `districts` VALUES (621023, 6210, 2, '华池', 'hua chi', 'huc', '华池县', NULL, NULL, '');
INSERT INTO `districts` VALUES (621024, 6210, 2, '合水', 'he shui', 'hes', '合水县', NULL, NULL, '');
INSERT INTO `districts` VALUES (621025, 6210, 2, '正宁', 'zheng ning', 'zhn', '正宁县', NULL, NULL, '');
INSERT INTO `districts` VALUES (621026, 6210, 2, '宁县', 'ning xian', 'nix', '宁县', NULL, NULL, '');
INSERT INTO `districts` VALUES (621027, 6210, 2, '镇原', 'zhen yuan', 'zhy', '镇原县', NULL, NULL, '');
INSERT INTO `districts` VALUES (621102, 6211, 2, '安定', 'an ding', 'and', '安定区', NULL, NULL, '');
INSERT INTO `districts` VALUES (621121, 6211, 2, '通渭', 'tong wei', 'tow', '通渭县', NULL, NULL, '');
INSERT INTO `districts` VALUES (621122, 6211, 2, '陇西', 'long xi', 'lox', '陇西县', NULL, NULL, '');
INSERT INTO `districts` VALUES (621123, 6211, 2, '渭源', 'wei yuan', 'wey', '渭源县', NULL, NULL, '');
INSERT INTO `districts` VALUES (621124, 6211, 2, '临洮', 'lin tao', 'lit', '临洮县', NULL, NULL, '');
INSERT INTO `districts` VALUES (621125, 6211, 2, '漳县', 'zhang xian', 'zhx', '漳县', NULL, NULL, '');
INSERT INTO `districts` VALUES (621126, 6211, 2, '岷县', 'min xian', 'mix', '岷县', NULL, NULL, '');
INSERT INTO `districts` VALUES (621202, 6212, 2, '武都', 'wu du', 'wud', '武都区', NULL, NULL, '');
INSERT INTO `districts` VALUES (621221, 6212, 2, '成县', 'cheng xian', 'chx', '成县', NULL, NULL, '');
INSERT INTO `districts` VALUES (621222, 6212, 2, '文县', 'wen xian', 'wex', '文县', NULL, NULL, '');
INSERT INTO `districts` VALUES (621223, 6212, 2, '宕昌', 'dang chang', 'dac', '宕昌县', NULL, NULL, '');
INSERT INTO `districts` VALUES (621224, 6212, 2, '康县', 'kang xian', 'kax', '康县', NULL, NULL, '');
INSERT INTO `districts` VALUES (621225, 6212, 2, '西和', 'xi he', 'xih', '西和县', NULL, NULL, '');
INSERT INTO `districts` VALUES (621226, 6212, 2, '礼县', 'li xian', 'lix', '礼县', NULL, NULL, '');
INSERT INTO `districts` VALUES (621227, 6212, 2, '徽县', 'hui xian', 'hux', '徽县', NULL, NULL, '');
INSERT INTO `districts` VALUES (621228, 6212, 2, '两当', 'liang dang', 'lid', '两当县', NULL, NULL, '');
INSERT INTO `districts` VALUES (622901, 6229, 2, '临夏市', 'lin xia shi', 'lixs', '临夏市', NULL, NULL, '');
INSERT INTO `districts` VALUES (622921, 6229, 2, '临夏县', 'lin xia xian', 'lixx', '临夏县', NULL, NULL, '');
INSERT INTO `districts` VALUES (622922, 6229, 2, '康乐', 'kang le', 'kal', '康乐县', NULL, NULL, '');
INSERT INTO `districts` VALUES (622923, 6229, 2, '永靖', 'yong jing', 'yoj', '永靖县', NULL, NULL, '');
INSERT INTO `districts` VALUES (622924, 6229, 2, '广河', 'guang he', 'guh', '广河县', NULL, NULL, '');
INSERT INTO `districts` VALUES (622925, 6229, 2, '和政', 'he zheng', 'hez', '和政县', NULL, NULL, '');
INSERT INTO `districts` VALUES (622926, 6229, 2, '东乡族自治县', 'dong xiang zu zi zhi xian', 'doxz', '东乡族自治县', NULL, NULL, '');
INSERT INTO `districts` VALUES (622927, 6229, 2, '积石山保安族东乡族撒拉族自治县', 'ji shi shan bao an zu dong xiang zu sa la zu zi zhi xian', 'jiss', '积石山保安族东乡族撒拉族自治县', NULL, NULL, '');
INSERT INTO `districts` VALUES (623001, 6230, 2, '合作', 'he zuo', 'hez', '合作市', NULL, NULL, '');
INSERT INTO `districts` VALUES (623021, 6230, 2, '临潭', 'lin tan', 'lit', '临潭县', NULL, NULL, '');
INSERT INTO `districts` VALUES (623022, 6230, 2, '卓尼', 'zhuo ni', 'zhn', '卓尼县', NULL, NULL, '');
INSERT INTO `districts` VALUES (623023, 6230, 2, '舟曲', 'zhou qu', 'zhq', '舟曲县', NULL, NULL, '');
INSERT INTO `districts` VALUES (623024, 6230, 2, '迭部', 'die bu', 'dib', '迭部县', NULL, NULL, '');
INSERT INTO `districts` VALUES (623025, 6230, 2, '玛曲', 'ma qu', 'maq', '玛曲县', NULL, NULL, '');
INSERT INTO `districts` VALUES (623026, 6230, 2, '碌曲', 'lu qu', 'luq', '碌曲县', NULL, NULL, '');
INSERT INTO `districts` VALUES (623027, 6230, 2, '夏河', 'xia he', 'xih', '夏河县', NULL, NULL, '');
INSERT INTO `districts` VALUES (630102, 6301, 2, '城东', 'cheng dong', 'chd', '城东区', NULL, NULL, '');
INSERT INTO `districts` VALUES (630103, 6301, 2, '城中', 'cheng zhong', 'chz', '城中区', NULL, NULL, '');
INSERT INTO `districts` VALUES (630104, 6301, 2, '城西', 'cheng xi', 'chx', '城西区', NULL, NULL, '');
INSERT INTO `districts` VALUES (630105, 6301, 2, '城北', 'cheng bei', 'chb', '城北区', NULL, NULL, '');
INSERT INTO `districts` VALUES (630121, 6301, 2, '大通回族土族自治县', 'da tong hui zu tu zu zi zhi xian', 'dath', '大通回族土族自治县', NULL, NULL, '');
INSERT INTO `districts` VALUES (630122, 6301, 2, '湟中', 'huang zhong', 'huz', '湟中县', NULL, NULL, '');
INSERT INTO `districts` VALUES (630123, 6301, 2, '湟源', 'huang yuan', 'huy', '湟源县', NULL, NULL, '');
INSERT INTO `districts` VALUES (630202, 6302, 2, '乐都', 'le du', 'led', '乐都区', NULL, NULL, '');
INSERT INTO `districts` VALUES (630203, 6302, 2, '平安', 'ping an', 'pia', '平安区', NULL, NULL, '');
INSERT INTO `districts` VALUES (630222, 6302, 2, '民和回族土族自治县', 'min he hui zu tu zu zi zhi xian', 'mihh', '民和回族土族自治县', NULL, NULL, '');
INSERT INTO `districts` VALUES (630223, 6302, 2, '互助土族自治县', 'hu zhu tu zu zi zhi xian', 'huzt', '互助土族自治县', NULL, NULL, '');
INSERT INTO `districts` VALUES (630224, 6302, 2, '化隆回族自治县', 'hua long hui zu zi zhi xian', 'hulh', '化隆回族自治县', NULL, NULL, '');
INSERT INTO `districts` VALUES (630225, 6302, 2, '循化撒拉族自治县', 'xun hua sa la zu zi zhi xian', 'xuhs', '循化撒拉族自治县', NULL, NULL, '');
INSERT INTO `districts` VALUES (632221, 6322, 2, '门源回族自治县', 'men yuan hui zu zi zhi xian', 'meyh', '门源回族自治县', NULL, NULL, '');
INSERT INTO `districts` VALUES (632222, 6322, 2, '祁连', 'qi lian', 'qil', '祁连县', NULL, NULL, '');
INSERT INTO `districts` VALUES (632223, 6322, 2, '海晏', 'hai yan', 'hay', '海晏县', NULL, NULL, '');
INSERT INTO `districts` VALUES (632224, 6322, 2, '刚察', 'gang cha', 'gac', '刚察县', NULL, NULL, '');
INSERT INTO `districts` VALUES (632321, 6323, 2, '同仁', 'tong ren', 'tor', '同仁县', NULL, NULL, '');
INSERT INTO `districts` VALUES (632322, 6323, 2, '尖扎', 'jian zha', 'jiz', '尖扎县', NULL, NULL, '');
INSERT INTO `districts` VALUES (632323, 6323, 2, '泽库', 'ze ku', 'zek', '泽库县', NULL, NULL, '');
INSERT INTO `districts` VALUES (632324, 6323, 2, '河南蒙古族自治县', 'he nan meng gu zu zi zhi xian', 'henm', '河南蒙古族自治县', NULL, NULL, '');
INSERT INTO `districts` VALUES (632521, 6325, 2, '共和', 'gong he', 'goh', '共和县', NULL, NULL, '');
INSERT INTO `districts` VALUES (632522, 6325, 2, '同德', 'tong de', 'tod', '同德县', NULL, NULL, '');
INSERT INTO `districts` VALUES (632523, 6325, 2, '贵德', 'gui de', 'gud', '贵德县', NULL, NULL, '');
INSERT INTO `districts` VALUES (632524, 6325, 2, '兴海', 'xing hai', 'xih', '兴海县', NULL, NULL, '');
INSERT INTO `districts` VALUES (632525, 6325, 2, '贵南', 'gui nan', 'gun', '贵南县', NULL, NULL, '');
INSERT INTO `districts` VALUES (632621, 6326, 2, '玛沁', 'ma qin', 'maq', '玛沁县', NULL, NULL, '');
INSERT INTO `districts` VALUES (632622, 6326, 2, '班玛', 'ban ma', 'bam', '班玛县', NULL, NULL, '');
INSERT INTO `districts` VALUES (632623, 6326, 2, '甘德', 'gan de', 'gad', '甘德县', NULL, NULL, '');
INSERT INTO `districts` VALUES (632624, 6326, 2, '达日', 'da ri', 'dar', '达日县', NULL, NULL, '');
INSERT INTO `districts` VALUES (632625, 6326, 2, '久治', 'jiu zhi', 'jiz', '久治县', NULL, NULL, '');
INSERT INTO `districts` VALUES (632626, 6326, 2, '玛多', 'ma duo', 'mad', '玛多县', NULL, NULL, '');
INSERT INTO `districts` VALUES (632701, 6327, 2, '玉树', 'yu shu', 'yus', '玉树市', NULL, NULL, '');
INSERT INTO `districts` VALUES (632722, 6327, 2, '杂多', 'za duo', 'zad', '杂多县', NULL, NULL, '');
INSERT INTO `districts` VALUES (632723, 6327, 2, '称多', 'cheng duo', 'chd', '称多县', NULL, NULL, '');
INSERT INTO `districts` VALUES (632724, 6327, 2, '治多', 'zhi duo', 'zhd', '治多县', NULL, NULL, '');
INSERT INTO `districts` VALUES (632725, 6327, 2, '囊谦', 'nang qian', 'naq', '囊谦县', NULL, NULL, '');
INSERT INTO `districts` VALUES (632726, 6327, 2, '曲麻莱', 'qu ma lai', 'quml', '曲麻莱县', NULL, NULL, '');
INSERT INTO `districts` VALUES (632801, 6328, 2, '格尔木', 'ge er mu', 'geem', '格尔木市', NULL, NULL, '');
INSERT INTO `districts` VALUES (632802, 6328, 2, '德令哈', 'de ling ha', 'delh', '德令哈市', NULL, NULL, '');
INSERT INTO `districts` VALUES (632821, 6328, 2, '乌兰', 'wu lan', 'wul', '乌兰县', NULL, NULL, '');
INSERT INTO `districts` VALUES (632822, 6328, 2, '都兰', 'du lan', 'dul', '都兰县', NULL, NULL, '');
INSERT INTO `districts` VALUES (632823, 6328, 2, '天峻', 'tian jun', 'tij', '天峻县', NULL, NULL, '');
INSERT INTO `districts` VALUES (632857, 6328, 2, '大柴旦行政委员会', 'da chai dan xing zheng wei yuan hui', 'dacd', '大柴旦行政委员会', NULL, NULL, '');
INSERT INTO `districts` VALUES (632858, 6328, 2, '冷湖行政委员会', 'leng hu xing zheng wei yuan hui', 'lehx', '冷湖行政委员会', NULL, NULL, '');
INSERT INTO `districts` VALUES (632859, 6328, 2, '茫崖行政委员会', 'mang ya xing zheng wei yuan hui', 'mayx', '茫崖行政委员会', NULL, NULL, '');
INSERT INTO `districts` VALUES (640104, 6401, 2, '兴庆', 'xing qing', 'xiq', '兴庆区', NULL, NULL, '');
INSERT INTO `districts` VALUES (640105, 6401, 2, '西夏', 'xi xia', 'xix', '西夏区', NULL, NULL, '');
INSERT INTO `districts` VALUES (640106, 6401, 2, '金凤', 'jin feng', 'jif', '金凤区', NULL, NULL, '');
INSERT INTO `districts` VALUES (640121, 6401, 2, '永宁', 'yong ning', 'yon', '永宁县', NULL, NULL, '');
INSERT INTO `districts` VALUES (640122, 6401, 2, '贺兰', 'he lan', 'hel', '贺兰县', NULL, NULL, '');
INSERT INTO `districts` VALUES (640181, 6401, 2, '灵武', 'ling wu', 'liw', '灵武市', NULL, NULL, '');
INSERT INTO `districts` VALUES (640202, 6402, 2, '大武口', 'da wu kou', 'dawk', '大武口区', NULL, NULL, '');
INSERT INTO `districts` VALUES (640205, 6402, 2, '惠农', 'hui nong', 'hun', '惠农区', NULL, NULL, '');
INSERT INTO `districts` VALUES (640221, 6402, 2, '平罗', 'ping luo', 'pil', '平罗县', NULL, NULL, '');
INSERT INTO `districts` VALUES (640302, 6403, 2, '利通', 'li tong', 'lit', '利通区', NULL, NULL, '');
INSERT INTO `districts` VALUES (640303, 6403, 2, '红寺堡', 'hong si bu', 'hosb', '红寺堡区', NULL, NULL, '');
INSERT INTO `districts` VALUES (640323, 6403, 2, '盐池', 'yan chi', 'yac', '盐池县', NULL, NULL, '');
INSERT INTO `districts` VALUES (640324, 6403, 2, '同心', 'tong xin', 'tox', '同心县', NULL, NULL, '');
INSERT INTO `districts` VALUES (640381, 6403, 2, '青铜峡', 'qing tong xia', 'qitx', '青铜峡市', NULL, NULL, '');
INSERT INTO `districts` VALUES (640402, 6404, 2, '原州', 'yuan zhou', 'yuz', '原州区', NULL, NULL, '');
INSERT INTO `districts` VALUES (640422, 6404, 2, '西吉', 'xi ji', 'xij', '西吉县', NULL, NULL, '');
INSERT INTO `districts` VALUES (640423, 6404, 2, '隆德', 'long de', 'lod', '隆德县', NULL, NULL, '');
INSERT INTO `districts` VALUES (640424, 6404, 2, '泾源', 'jing yuan', 'jiy', '泾源县', NULL, NULL, '');
INSERT INTO `districts` VALUES (640425, 6404, 2, '彭阳', 'peng yang', 'pey', '彭阳县', NULL, NULL, '');
INSERT INTO `districts` VALUES (640502, 6405, 2, '沙坡头', 'sha po tou', 'shpt', '沙坡头区', NULL, NULL, '');
INSERT INTO `districts` VALUES (640521, 6405, 2, '中宁', 'zhong ning', 'zhn', '中宁县', NULL, NULL, '');
INSERT INTO `districts` VALUES (640522, 6405, 2, '海原', 'hai yuan', 'hay', '海原县', NULL, NULL, '');
INSERT INTO `districts` VALUES (650102, 6501, 2, '天山', 'tian shan', 'tis', '天山区', NULL, NULL, '');
INSERT INTO `districts` VALUES (650103, 6501, 2, '沙依巴克', 'sha yi ba ke', 'shyb', '沙依巴克区', NULL, NULL, '');
INSERT INTO `districts` VALUES (650104, 6501, 2, '新市', 'xin shi', 'xis', '新市区', NULL, NULL, '');
INSERT INTO `districts` VALUES (650105, 6501, 2, '水磨沟', 'shui mo gou', 'shmg', '水磨沟区', NULL, NULL, '');
INSERT INTO `districts` VALUES (650106, 6501, 2, '头屯河', 'tou tun he', 'toth', '头屯河区', NULL, NULL, '');
INSERT INTO `districts` VALUES (650107, 6501, 2, '达坂城', 'da ban cheng', 'dabc', '达坂城区', NULL, NULL, '');
INSERT INTO `districts` VALUES (650109, 6501, 2, '米东', 'mi dong', 'mid', '米东区', NULL, NULL, '');
INSERT INTO `districts` VALUES (650121, 6501, 2, '乌鲁木齐', 'wu lu mu qi', 'wulm', '乌鲁木齐县', NULL, NULL, '');
INSERT INTO `districts` VALUES (650171, 6501, 2, '乌鲁木齐经济技术开发区', 'wu lu mu qi jing ji ji shu kai fa qu', 'wulm', '乌鲁木齐经济技术开发区', NULL, NULL, '');
INSERT INTO `districts` VALUES (650172, 6501, 2, '乌鲁木齐高新技术产业开发区', 'wu lu mu qi gao xin ji shu chan ye kai fa qu', 'wulm', '乌鲁木齐高新技术产业开发区', NULL, NULL, '');
INSERT INTO `districts` VALUES (650202, 6502, 2, '独山子', 'du shan zi', 'dusz', '独山子区', NULL, NULL, '');
INSERT INTO `districts` VALUES (650203, 6502, 2, '克拉玛依', 'ke la ma yi', 'kelm', '克拉玛依区', NULL, NULL, '');
INSERT INTO `districts` VALUES (650204, 6502, 2, '白碱滩', 'bai jian tan', 'bajt', '白碱滩区', NULL, NULL, '');
INSERT INTO `districts` VALUES (650205, 6502, 2, '乌尔禾', 'wu er he', 'wueh', '乌尔禾区', NULL, NULL, '');
INSERT INTO `districts` VALUES (650402, 6504, 2, '高昌', 'gao chang', 'gac', '高昌区', NULL, NULL, '');
INSERT INTO `districts` VALUES (650421, 6504, 2, '鄯善', 'shan shan', 'shs', '鄯善县', NULL, NULL, '');
INSERT INTO `districts` VALUES (650422, 6504, 2, '托克逊', 'tuo ke xun', 'tukx', '托克逊县', NULL, NULL, '');
INSERT INTO `districts` VALUES (650502, 6505, 2, '伊州', 'yi zhou', 'yiz', '伊州区', NULL, NULL, '');
INSERT INTO `districts` VALUES (650521, 6505, 2, '巴里坤哈萨克自治县', 'ba li kun ha sa ke zi zhi xian', 'balk', '巴里坤哈萨克自治县', NULL, NULL, '');
INSERT INTO `districts` VALUES (650522, 6505, 2, '伊吾', 'yi wu', 'yiw', '伊吾县', NULL, NULL, '');
INSERT INTO `districts` VALUES (652301, 6523, 2, '昌吉', 'chang ji', 'chj', '昌吉市', NULL, NULL, '');
INSERT INTO `districts` VALUES (652302, 6523, 2, '阜康', 'fu kang', 'fuk', '阜康市', NULL, NULL, '');
INSERT INTO `districts` VALUES (652323, 6523, 2, '呼图壁', 'hu tu bi', 'hutb', '呼图壁县', NULL, NULL, '');
INSERT INTO `districts` VALUES (652324, 6523, 2, '玛纳斯', 'ma na si', 'mans', '玛纳斯县', NULL, NULL, '');
INSERT INTO `districts` VALUES (652325, 6523, 2, '奇台', 'qi tai', 'qit', '奇台县', NULL, NULL, '');
INSERT INTO `districts` VALUES (652327, 6523, 2, '吉木萨尔', 'ji mu sa er', 'jims', '吉木萨尔县', NULL, NULL, '');
INSERT INTO `districts` VALUES (652328, 6523, 2, '木垒哈萨克自治县', 'mu lei ha sa ke zi zhi xian', 'mulh', '木垒哈萨克自治县', NULL, NULL, '');
INSERT INTO `districts` VALUES (652701, 6527, 2, '博乐', 'bo le', 'bol', '博乐市', NULL, NULL, '');
INSERT INTO `districts` VALUES (652702, 6527, 2, '阿拉山口', 'a la shan kou', 'als', '阿拉山口市', NULL, NULL, '');
INSERT INTO `districts` VALUES (652722, 6527, 2, '精河', 'jing he', 'jih', '精河县', NULL, NULL, '');
INSERT INTO `districts` VALUES (652723, 6527, 2, '温泉', 'wen quan', 'weq', '温泉县', NULL, NULL, '');
INSERT INTO `districts` VALUES (652801, 6528, 2, '库尔勒', 'ku er le', 'kuel', '库尔勒市', NULL, NULL, '');
INSERT INTO `districts` VALUES (652822, 6528, 2, '轮台', 'lun tai', 'lut', '轮台县', NULL, NULL, '');
INSERT INTO `districts` VALUES (652823, 6528, 2, '尉犁', 'yu li', 'yul', '尉犁县', NULL, NULL, '');
INSERT INTO `districts` VALUES (652824, 6528, 2, '若羌', 'ruo qiang', 'ruq', '若羌县', NULL, NULL, '');
INSERT INTO `districts` VALUES (652825, 6528, 2, '且末', 'qie mo', 'qim', '且末县', NULL, NULL, '');
INSERT INTO `districts` VALUES (652826, 6528, 2, '焉耆回族自治县', 'yan qi hui zu zi zhi xian', 'yaqh', '焉耆回族自治县', NULL, NULL, '');
INSERT INTO `districts` VALUES (652827, 6528, 2, '和静', 'he jing', 'hej', '和静县', NULL, NULL, '');
INSERT INTO `districts` VALUES (652828, 6528, 2, '和硕', 'he shuo', 'hes', '和硕县', NULL, NULL, '');
INSERT INTO `districts` VALUES (652829, 6528, 2, '博湖', 'bo hu', 'boh', '博湖县', NULL, NULL, '');
INSERT INTO `districts` VALUES (652871, 6528, 2, '库尔勒经济技术开发区', 'ku er le jing ji ji shu kai fa qu', 'kuel', '库尔勒经济技术开发区', NULL, NULL, '');
INSERT INTO `districts` VALUES (652901, 6529, 2, '阿克苏', 'a ke su', 'aks', '阿克苏市', NULL, NULL, '');
INSERT INTO `districts` VALUES (652922, 6529, 2, '温宿', 'wen su', 'wes', '温宿县', NULL, NULL, '');
INSERT INTO `districts` VALUES (652923, 6529, 2, '库车', 'ku che', 'kuc', '库车县', NULL, NULL, '');
INSERT INTO `districts` VALUES (652924, 6529, 2, '沙雅', 'sha ya', 'shy', '沙雅县', NULL, NULL, '');
INSERT INTO `districts` VALUES (652925, 6529, 2, '新和', 'xin he', 'xih', '新和县', NULL, NULL, '');
INSERT INTO `districts` VALUES (652926, 6529, 2, '拜城', 'bai cheng', 'bac', '拜城县', NULL, NULL, '');
INSERT INTO `districts` VALUES (652927, 6529, 2, '乌什', 'wu shi', 'wus', '乌什县', NULL, NULL, '');
INSERT INTO `districts` VALUES (652928, 6529, 2, '阿瓦提', 'a wa ti', 'awt', '阿瓦提县', NULL, NULL, '');
INSERT INTO `districts` VALUES (652929, 6529, 2, '柯坪', 'ke ping', 'kep', '柯坪县', NULL, NULL, '');
INSERT INTO `districts` VALUES (653001, 6530, 2, '阿图什', 'a tu shi', 'ats', '阿图什市', NULL, NULL, '');
INSERT INTO `districts` VALUES (653022, 6530, 2, '阿克陶', 'a ke tao', 'akt', '阿克陶县', NULL, NULL, '');
INSERT INTO `districts` VALUES (653023, 6530, 2, '阿合奇', 'a he qi', 'ahq', '阿合奇县', NULL, NULL, '');
INSERT INTO `districts` VALUES (653024, 6530, 2, '乌恰', 'wu qia', 'wuq', '乌恰县', NULL, NULL, '');
INSERT INTO `districts` VALUES (653101, 6531, 2, '喀什', 'ka shi', 'kas', '喀什市', NULL, NULL, '');
INSERT INTO `districts` VALUES (653121, 6531, 2, '疏附', 'shu fu', 'shf', '疏附县', NULL, NULL, '');
INSERT INTO `districts` VALUES (653122, 6531, 2, '疏勒', 'shu le', 'shl', '疏勒县', NULL, NULL, '');
INSERT INTO `districts` VALUES (653123, 6531, 2, '英吉沙', 'ying ji sha', 'yijs', '英吉沙县', NULL, NULL, '');
INSERT INTO `districts` VALUES (653124, 6531, 2, '泽普', 'ze pu', 'zep', '泽普县', NULL, NULL, '');
INSERT INTO `districts` VALUES (653125, 6531, 2, '莎车', 'sha che', 'shc', '莎车县', NULL, NULL, '');
INSERT INTO `districts` VALUES (653126, 6531, 2, '叶城', 'ye cheng', 'yec', '叶城县', NULL, NULL, '');
INSERT INTO `districts` VALUES (653127, 6531, 2, '麦盖提', 'mai gai ti', 'magt', '麦盖提县', NULL, NULL, '');
INSERT INTO `districts` VALUES (653128, 6531, 2, '岳普湖', 'yue pu hu', 'yuph', '岳普湖县', NULL, NULL, '');
INSERT INTO `districts` VALUES (653129, 6531, 2, '伽师', 'jia shi', 'jis', '伽师县', NULL, NULL, '');
INSERT INTO `districts` VALUES (653130, 6531, 2, '巴楚', 'ba chu', 'bac', '巴楚县', NULL, NULL, '');
INSERT INTO `districts` VALUES (653131, 6531, 2, '塔什库尔干塔吉克自治县', 'ta shi ku er gan ta ji ke zi zhi xian', 'task', '塔什库尔干塔吉克自治县', NULL, NULL, '');
INSERT INTO `districts` VALUES (653201, 6532, 2, '和田市', 'he tian shi', 'hets', '和田市', NULL, NULL, '');
INSERT INTO `districts` VALUES (653221, 6532, 2, '和田县', 'he tian xian', 'hetx', '和田县', NULL, NULL, '');
INSERT INTO `districts` VALUES (653222, 6532, 2, '墨玉', 'mo yu', 'moy', '墨玉县', NULL, NULL, '');
INSERT INTO `districts` VALUES (653223, 6532, 2, '皮山', 'pi shan', 'pis', '皮山县', NULL, NULL, '');
INSERT INTO `districts` VALUES (653224, 6532, 2, '洛浦', 'luo pu', 'lup', '洛浦县', NULL, NULL, '');
INSERT INTO `districts` VALUES (653225, 6532, 2, '策勒', 'ce le', 'cel', '策勒县', NULL, NULL, '');
INSERT INTO `districts` VALUES (653226, 6532, 2, '于田', 'yu tian', 'yut', '于田县', NULL, NULL, '');
INSERT INTO `districts` VALUES (653227, 6532, 2, '民丰', 'min feng', 'mif', '民丰县', NULL, NULL, '');
INSERT INTO `districts` VALUES (654002, 6540, 2, '伊宁市', 'yi ning shi', 'yins', '伊宁市', NULL, NULL, '');
INSERT INTO `districts` VALUES (654003, 6540, 2, '奎屯', 'kui tun', 'kut', '奎屯市', NULL, NULL, '');
INSERT INTO `districts` VALUES (654004, 6540, 2, '霍尔果斯', 'huo er guo si', 'hueg', '霍尔果斯市', NULL, NULL, '');
INSERT INTO `districts` VALUES (654021, 6540, 2, '伊宁县', 'yi ning xian', 'yinx', '伊宁县', NULL, NULL, '');
INSERT INTO `districts` VALUES (654022, 6540, 2, '察布查尔锡伯自治县', 'cha bu cha er xi bo zi zhi xian', 'chbc', '察布查尔锡伯自治县', NULL, NULL, '');
INSERT INTO `districts` VALUES (654023, 6540, 2, '霍城', 'huo cheng', 'huc', '霍城县', NULL, NULL, '');
INSERT INTO `districts` VALUES (654024, 6540, 2, '巩留', 'gong liu', 'gol', '巩留县', NULL, NULL, '');
INSERT INTO `districts` VALUES (654025, 6540, 2, '新源', 'xin yuan', 'xiy', '新源县', NULL, NULL, '');
INSERT INTO `districts` VALUES (654026, 6540, 2, '昭苏', 'zhao su', 'zhs', '昭苏县', NULL, NULL, '');
INSERT INTO `districts` VALUES (654027, 6540, 2, '特克斯', 'te ke si', 'teks', '特克斯县', NULL, NULL, '');
INSERT INTO `districts` VALUES (654028, 6540, 2, '尼勒克', 'ni le ke', 'nilk', '尼勒克县', NULL, NULL, '');
INSERT INTO `districts` VALUES (654201, 6542, 2, '塔城', 'ta cheng', 'tac', '塔城市', NULL, NULL, '');
INSERT INTO `districts` VALUES (654202, 6542, 2, '乌苏', 'wu su', 'wus', '乌苏市', NULL, NULL, '');
INSERT INTO `districts` VALUES (654221, 6542, 2, '额敏', 'e min', 'em', '额敏县', NULL, NULL, '');
INSERT INTO `districts` VALUES (654223, 6542, 2, '沙湾', 'sha wan', 'shw', '沙湾县', NULL, NULL, '');
INSERT INTO `districts` VALUES (654224, 6542, 2, '托里', 'tuo li', 'tul', '托里县', NULL, NULL, '');
INSERT INTO `districts` VALUES (654225, 6542, 2, '裕民', 'yu min', 'yum', '裕民县', NULL, NULL, '');
INSERT INTO `districts` VALUES (654226, 6542, 2, '和布克赛尔蒙古自治县', 'he bu ke sai er meng gu zi zhi xian', 'hebk', '和布克赛尔蒙古自治县', NULL, NULL, '');
INSERT INTO `districts` VALUES (654301, 6543, 2, '阿勒泰', 'a le tai', 'alt', '阿勒泰市', NULL, NULL, '');
INSERT INTO `districts` VALUES (654321, 6543, 2, '布尔津', 'bu er jin', 'buej', '布尔津县', NULL, NULL, '');
INSERT INTO `districts` VALUES (654322, 6543, 2, '富蕴', 'fu yun', 'fuy', '富蕴县', NULL, NULL, '');
INSERT INTO `districts` VALUES (654323, 6543, 2, '福海', 'fu hai', 'fuh', '福海县', NULL, NULL, '');
INSERT INTO `districts` VALUES (654324, 6543, 2, '哈巴河', 'ha ba he', 'habh', '哈巴河县', NULL, NULL, '');
INSERT INTO `districts` VALUES (654325, 6543, 2, '青河', 'qing he', 'qih', '青河县', NULL, NULL, '');
INSERT INTO `districts` VALUES (654326, 6543, 2, '吉木乃', 'ji mu nai', 'jimn', '吉木乃县', NULL, NULL, '');
INSERT INTO `districts` VALUES (659001, 6590, 2, '石河子', 'shi he zi', 'shhz', '石河子市', NULL, NULL, '');
INSERT INTO `districts` VALUES (659002, 6590, 2, '阿拉尔', 'a la er', 'ale', '阿拉尔市', NULL, NULL, '');
INSERT INTO `districts` VALUES (659003, 6590, 2, '图木舒克', 'tu mu shu ke', 'tums', '图木舒克市', NULL, NULL, '');
INSERT INTO `districts` VALUES (659004, 6590, 2, '五家渠', 'wu jia qu', 'wujq', '五家渠市', NULL, NULL, '');
INSERT INTO `districts` VALUES (659006, 6590, 2, '铁门关', 'tie men guan', 'timg', '铁门关市', NULL, NULL, '');
INSERT INTO `districts` VALUES (900100, 9001, 2, '香港', 'xiang gang', 'xig', '', NULL, NULL, '');
INSERT INTO `districts` VALUES (900200, 9002, 2, '澳门', 'ao men', 'aom', '', NULL, NULL, '');
INSERT INTO `districts` VALUES (900300, 9003, 2, '台湾', 'tai wan', 'taw', '', NULL, NULL, '');
INSERT INTO `districts` VALUES (910100, 9101, 2, '海外', 'hai wai', 'haw', '', NULL, NULL, '');

-- ----------------------------
-- Table structure for gen_table
-- ----------------------------
DROP TABLE IF EXISTS `gen_table`;
CREATE TABLE `gen_table`  (
  `table_id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '表名称',
  `table_comment` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '表描述',
  `class_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '实体类名称',
  `tpl_category` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'crud' COMMENT '使用的模板（crud单表操作 tree树表操作）',
  `package_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '生成包路径',
  `module_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '生成模块名',
  `business_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '生成业务名',
  `function_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '生成功能名',
  `function_author` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '生成功能作者',
  `options` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '其它生成选项',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`table_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '代码生成业务表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of gen_table
-- ----------------------------
INSERT INTO `gen_table` VALUES (8, 'retail_order', '', 'RetailOrder', 'crud', 'com.marisfrolg.system', 'system', 'order', NULL, 'marisfrolg', NULL, 'admin', '2022-09-22 16:21:25', '', NULL, NULL);
INSERT INTO `gen_table` VALUES (9, 'retail_order_item', '', 'RetailOrderItem', 'crud', 'com.marisfrolg.system', 'system', 'item', NULL, 'marisfrolg', NULL, 'admin', '2022-09-22 16:21:25', '', NULL, NULL);

-- ----------------------------
-- Table structure for gen_table_column
-- ----------------------------
DROP TABLE IF EXISTS `gen_table_column`;
CREATE TABLE `gen_table_column`  (
  `column_id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '归属表编号',
  `column_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '列名称',
  `column_comment` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '列描述',
  `column_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '列类型',
  `java_type` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'JAVA类型',
  `java_field` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'JAVA字段名',
  `is_pk` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否主键（1是）',
  `is_increment` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否自增（1是）',
  `is_required` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否必填（1是）',
  `is_insert` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否为插入字段（1是）',
  `is_edit` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否编辑字段（1是）',
  `is_list` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否列表字段（1是）',
  `is_query` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否查询字段（1是）',
  `query_type` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '=' COMMENT '查询方式（等于、不等于、大于、小于、范围）',
  `html_type` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '显示类型（文本框、文本域、下拉框、复选框、单选框、日期控件）',
  `dict_type` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '字典类型',
  `sort` int NULL DEFAULT NULL COMMENT '排序',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`column_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 50 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '代码生成业务表字段' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of gen_table_column
-- ----------------------------
INSERT INTO `gen_table_column` VALUES (40, '8', 'order_id', '订单id', 'int', 'Long', 'orderId', '1', '1', NULL, '1', NULL, NULL, NULL, '=', 'input', '', 1, 'admin', '2022-09-22 16:21:25', '', NULL);
INSERT INTO `gen_table_column` VALUES (41, '8', 'name', '姓名', 'varchar(255)', 'String', 'name', '0', '0', NULL, '1', '1', '1', '1', 'LIKE', 'input', '', 2, 'admin', '2022-09-22 16:21:25', '', NULL);
INSERT INTO `gen_table_column` VALUES (42, '8', 'title', '标题', 'varchar(255)', 'String', 'title', '0', '0', NULL, '1', '1', '1', '1', '=', 'input', '', 3, 'admin', '2022-09-22 16:21:25', '', NULL);
INSERT INTO `gen_table_column` VALUES (43, '8', 'created_time', '更新时间', 'datetime', 'Date', 'createdTime', '0', '0', NULL, '1', '1', '1', '1', '=', 'datetime', '', 4, 'admin', '2022-09-22 16:21:25', '', NULL);
INSERT INTO `gen_table_column` VALUES (44, '8', 'remark', '备注', 'varchar(255)', 'String', 'remark', '0', '0', NULL, '1', '1', '1', NULL, '=', 'input', '', 5, 'admin', '2022-09-22 16:21:25', '', NULL);
INSERT INTO `gen_table_column` VALUES (45, '9', 'order_itm_id', '明细Id', 'int', 'Long', 'orderItmId', '1', '1', NULL, '1', NULL, NULL, NULL, '=', 'input', '', 1, 'admin', '2022-09-22 16:21:25', '', NULL);
INSERT INTO `gen_table_column` VALUES (46, '9', 'order_id', '订单id', 'int', 'Long', 'orderId', '0', '0', '1', '1', '1', '1', '1', '=', 'input', '', 2, 'admin', '2022-09-22 16:21:25', '', NULL);
INSERT INTO `gen_table_column` VALUES (47, '9', 'sku_id', '商品id', 'int', 'Long', 'skuId', '0', '0', '1', '1', '1', '1', '1', '=', 'input', '', 3, 'admin', '2022-09-22 16:21:25', '', NULL);
INSERT INTO `gen_table_column` VALUES (48, '9', 'price', '价格', 'decimal(7,3)', 'Double', 'price', '0', '0', '1', '1', '1', '1', '1', '=', 'input', '', 4, 'admin', '2022-09-22 16:21:25', '', NULL);
INSERT INTO `gen_table_column` VALUES (49, '9', 'created_time', '创建时间', 'datetime', 'Date', 'createdTime', '0', '0', NULL, '1', '1', '1', '1', '=', 'datetime', '', 5, 'admin', '2022-09-22 16:21:25', '', NULL);

-- ----------------------------
-- Table structure for retail_order
-- ----------------------------
DROP TABLE IF EXISTS `retail_order`;
CREATE TABLE `retail_order`  (
  `order_id` int NOT NULL AUTO_INCREMENT COMMENT '订单id',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '姓名',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '标题',
  `created_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`order_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 103 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of retail_order
-- ----------------------------
INSERT INTO `retail_order` VALUES (19, 'bmm', '1111', NULL, NULL);
INSERT INTO `retail_order` VALUES (20, 'bmm', '1111', NULL, NULL);
INSERT INTO `retail_order` VALUES (21, 'bmm', '1111', NULL, NULL);
INSERT INTO `retail_order` VALUES (22, 'bmm', '1111', NULL, NULL);
INSERT INTO `retail_order` VALUES (23, 'bmm', '1111', NULL, NULL);
INSERT INTO `retail_order` VALUES (24, 'bmm', '1111', NULL, NULL);
INSERT INTO `retail_order` VALUES (25, 'bmm', '1111', NULL, NULL);
INSERT INTO `retail_order` VALUES (26, 'bmm', '1111', NULL, NULL);
INSERT INTO `retail_order` VALUES (27, 'bmmm3', '测试', NULL, NULL);
INSERT INTO `retail_order` VALUES (28, 'bmmm3', '测试', NULL, NULL);
INSERT INTO `retail_order` VALUES (31, 'bmm', 'ccc', '2022-09-28 17:29:21', NULL);
INSERT INTO `retail_order` VALUES (32, 'bmm2', '新建订单', '2022-10-10 16:52:12', NULL);
INSERT INTO `retail_order` VALUES (33, 'bmm2', '新建订单', '2022-10-10 16:52:12', NULL);
INSERT INTO `retail_order` VALUES (34, 'bmm2', '新建订单', '2022-10-10 16:52:12', NULL);
INSERT INTO `retail_order` VALUES (35, 'bmm2', '新建订单', '2022-10-10 16:52:12', NULL);
INSERT INTO `retail_order` VALUES (36, 'bmm2', '新建订单', '2022-10-10 16:52:12', NULL);
INSERT INTO `retail_order` VALUES (37, 'bmm2', '新建订单', '2022-10-10 16:52:12', NULL);
INSERT INTO `retail_order` VALUES (38, 'bmm2', '新建订单', '2022-10-10 16:52:12', NULL);
INSERT INTO `retail_order` VALUES (39, 'bmm2', '新建订单', '2022-10-10 16:52:12', NULL);
INSERT INTO `retail_order` VALUES (40, 'bmm2', '新建订单', '2022-10-10 16:52:12', NULL);
INSERT INTO `retail_order` VALUES (41, 'bmm2', '新建订单', '2022-10-10 16:52:12', NULL);
INSERT INTO `retail_order` VALUES (42, 'bmm2', '新建订单', '2022-10-10 16:52:12', NULL);
INSERT INTO `retail_order` VALUES (43, 'bmm2', '新建订单', '2022-10-10 16:52:12', NULL);
INSERT INTO `retail_order` VALUES (44, 'bmm2', '新建订单', '2022-10-10 16:52:12', NULL);
INSERT INTO `retail_order` VALUES (45, 'bmm2', '新建订单', '2022-10-10 16:52:12', NULL);
INSERT INTO `retail_order` VALUES (46, 'bmm2', '新建订单', '2022-10-10 16:52:12', NULL);
INSERT INTO `retail_order` VALUES (47, 'bmm2', '新建订单', '2022-10-10 16:52:12', NULL);
INSERT INTO `retail_order` VALUES (48, 'bmm2', '新建订单', '2022-10-10 16:52:12', NULL);
INSERT INTO `retail_order` VALUES (49, 'bmm2', '新建订单', '2022-10-10 16:52:12', NULL);
INSERT INTO `retail_order` VALUES (50, 'bmm2', '新建订单', '2022-10-10 16:52:12', NULL);
INSERT INTO `retail_order` VALUES (51, 'bmm2', '新建订单', '2022-10-10 16:52:12', NULL);
INSERT INTO `retail_order` VALUES (52, 'bmm2', '新建订单', '2022-10-10 16:52:12', NULL);
INSERT INTO `retail_order` VALUES (53, 'aaa', 'ccc', '2022-10-11 14:50:11', NULL);
INSERT INTO `retail_order` VALUES (54, 'aaa', 'ccc', '2022-10-11 14:50:11', NULL);
INSERT INTO `retail_order` VALUES (55, 'aaa', 'ccc', '2022-10-11 14:50:11', NULL);
INSERT INTO `retail_order` VALUES (56, 'ccc', 'aaaa', '2022-10-12 14:43:21', NULL);
INSERT INTO `retail_order` VALUES (57, 'ccc', 'aaaa', '2022-10-12 14:43:21', NULL);
INSERT INTO `retail_order` VALUES (58, 'ccc', 'aaaa', '2022-10-12 14:43:21', NULL);
INSERT INTO `retail_order` VALUES (59, 'ccc', 'aaaa', '2022-10-12 14:43:21', NULL);
INSERT INTO `retail_order` VALUES (60, 'ccc', 'aaaa', '2022-10-12 14:43:21', NULL);
INSERT INTO `retail_order` VALUES (61, 'aaa', 'ccc', '2022-10-11 14:50:11', NULL);
INSERT INTO `retail_order` VALUES (62, '张三', '标题', '2022-10-13 08:30:21', NULL);
INSERT INTO `retail_order` VALUES (63, '张三', '标题', '2022-10-13 08:30:21', NULL);
INSERT INTO `retail_order` VALUES (64, '张三', '标题', '2022-10-13 08:30:21', NULL);
INSERT INTO `retail_order` VALUES (65, '张三', '标题', '2022-10-13 08:30:21', NULL);
INSERT INTO `retail_order` VALUES (66, '张三', '标题', '2022-10-13 08:30:21', NULL);
INSERT INTO `retail_order` VALUES (67, '张三', '标题', '2022-10-13 08:30:21', NULL);
INSERT INTO `retail_order` VALUES (68, '张三', '标题', '2022-10-13 08:30:21', NULL);
INSERT INTO `retail_order` VALUES (69, '张三', '标题', '2022-10-13 08:30:21', NULL);
INSERT INTO `retail_order` VALUES (70, '张三', '标题', '2022-10-13 08:30:21', NULL);
INSERT INTO `retail_order` VALUES (71, '张三', '标题', '2022-10-13 08:30:21', NULL);
INSERT INTO `retail_order` VALUES (72, '张三', '标题', '2022-10-13 08:30:21', NULL);
INSERT INTO `retail_order` VALUES (73, '张三', '标题', '2022-10-13 08:30:21', NULL);
INSERT INTO `retail_order` VALUES (74, '张三', '标题', '2022-10-13 08:30:21', NULL);
INSERT INTO `retail_order` VALUES (75, '张三', '标题', '2022-10-13 08:30:21', NULL);
INSERT INTO `retail_order` VALUES (76, '张三', '标题', '2022-10-13 08:30:21', NULL);
INSERT INTO `retail_order` VALUES (77, '张三', '标题', '2022-10-13 08:30:21', NULL);
INSERT INTO `retail_order` VALUES (78, '张三', '标题', '2022-10-13 08:30:21', NULL);
INSERT INTO `retail_order` VALUES (79, '张三', '标题', '2022-10-13 08:30:21', NULL);
INSERT INTO `retail_order` VALUES (80, '张三', '标题', '2022-10-13 08:30:21', NULL);
INSERT INTO `retail_order` VALUES (81, '张三', '标题', '2022-10-13 08:30:21', NULL);
INSERT INTO `retail_order` VALUES (82, '张三', '标题', '2022-10-13 08:30:21', NULL);
INSERT INTO `retail_order` VALUES (83, '张三', '标题', '2022-10-13 08:30:21', NULL);
INSERT INTO `retail_order` VALUES (84, '张三', '标题', '2022-10-13 08:30:21', NULL);
INSERT INTO `retail_order` VALUES (85, '张三', '标题', '2022-10-13 08:30:21', NULL);
INSERT INTO `retail_order` VALUES (86, '张三', '标题', '2022-10-13 08:30:21', NULL);
INSERT INTO `retail_order` VALUES (87, '张三', '标题', '2022-10-13 08:30:21', NULL);
INSERT INTO `retail_order` VALUES (88, '张三', '标题', '2022-10-13 08:30:21', NULL);
INSERT INTO `retail_order` VALUES (89, 'cc', 'bmmasd', '2022-10-11 13:11:11', NULL);
INSERT INTO `retail_order` VALUES (90, '张三', '标题', '2022-10-13 08:30:21', NULL);
INSERT INTO `retail_order` VALUES (91, '张三', '标题', '2022-10-13 08:30:21', NULL);
INSERT INTO `retail_order` VALUES (92, '张三', '标题', '2022-10-13 08:30:21', NULL);
INSERT INTO `retail_order` VALUES (93, '张三', '标题', '2022-10-13 08:30:21', NULL);
INSERT INTO `retail_order` VALUES (94, '张三', '标题', '2022-10-13 08:30:21', NULL);
INSERT INTO `retail_order` VALUES (95, '张三', '标题', '2022-10-13 08:30:21', NULL);
INSERT INTO `retail_order` VALUES (96, '张三', '标题', '2022-10-13 08:30:21', NULL);
INSERT INTO `retail_order` VALUES (97, '张三', '标题', '2022-10-13 08:30:21', NULL);
INSERT INTO `retail_order` VALUES (98, '张三', '标题', '2022-10-13 08:30:21', NULL);
INSERT INTO `retail_order` VALUES (99, '张三', '标题', '2022-10-13 08:30:21', NULL);
INSERT INTO `retail_order` VALUES (100, '张三', '标题', '2022-10-13 08:30:21', NULL);
INSERT INTO `retail_order` VALUES (101, '张三', '标题', '2022-10-13 08:30:21', NULL);
INSERT INTO `retail_order` VALUES (102, '张三', '标题', '2022-10-13 08:30:21', NULL);

-- ----------------------------
-- Table structure for retail_order_item
-- ----------------------------
DROP TABLE IF EXISTS `retail_order_item`;
CREATE TABLE `retail_order_item`  (
  `order_itm_id` int NOT NULL AUTO_INCREMENT COMMENT '明细Id',
  `order_id` int NOT NULL COMMENT '订单id',
  `sku_id` int NOT NULL COMMENT '商品id',
  `price` decimal(7, 3) NOT NULL COMMENT '价格',
  `created_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`order_itm_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 91 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of retail_order_item
-- ----------------------------
INSERT INTO `retail_order_item` VALUES (1, 19, 123456, 3.210, NULL);
INSERT INTO `retail_order_item` VALUES (2, 19, 456789, 3.250, NULL);
INSERT INTO `retail_order_item` VALUES (3, 20, 123456, 3.210, NULL);
INSERT INTO `retail_order_item` VALUES (4, 20, 456789, 3.250, NULL);
INSERT INTO `retail_order_item` VALUES (5, 21, 123456, 3.210, NULL);
INSERT INTO `retail_order_item` VALUES (6, 21, 456789, 3.250, NULL);
INSERT INTO `retail_order_item` VALUES (7, 22, 123456, 3.210, NULL);
INSERT INTO `retail_order_item` VALUES (8, 22, 456789, 3.250, NULL);
INSERT INTO `retail_order_item` VALUES (9, 23, 123456, 3.210, NULL);
INSERT INTO `retail_order_item` VALUES (10, 23, 456789, 3.250, NULL);
INSERT INTO `retail_order_item` VALUES (11, 24, 123456, 3.210, NULL);
INSERT INTO `retail_order_item` VALUES (12, 24, 456789, 3.250, NULL);
INSERT INTO `retail_order_item` VALUES (13, 25, 123456, 3.210, NULL);
INSERT INTO `retail_order_item` VALUES (14, 25, 456789, 3.250, NULL);
INSERT INTO `retail_order_item` VALUES (15, 26, 123456, 3.210, NULL);
INSERT INTO `retail_order_item` VALUES (16, 26, 456789, 3.250, NULL);
INSERT INTO `retail_order_item` VALUES (17, 27, 3, 1.120, NULL);
INSERT INTO `retail_order_item` VALUES (18, 28, 3, 1.120, NULL);
INSERT INTO `retail_order_item` VALUES (19, 31, 0, 0.000, NULL);
INSERT INTO `retail_order_item` VALUES (20, 32, 11, 1.000, NULL);
INSERT INTO `retail_order_item` VALUES (21, 33, 11, 1.000, NULL);
INSERT INTO `retail_order_item` VALUES (22, 34, 11, 1.000, NULL);
INSERT INTO `retail_order_item` VALUES (23, 35, 11, 1.000, NULL);
INSERT INTO `retail_order_item` VALUES (24, 36, 11, 1.000, NULL);
INSERT INTO `retail_order_item` VALUES (25, 37, 11, 1.000, NULL);
INSERT INTO `retail_order_item` VALUES (26, 38, 11, 1.000, NULL);
INSERT INTO `retail_order_item` VALUES (27, 39, 11, 1.000, NULL);
INSERT INTO `retail_order_item` VALUES (28, 40, 11, 1.000, NULL);
INSERT INTO `retail_order_item` VALUES (29, 41, 11, 1.000, NULL);
INSERT INTO `retail_order_item` VALUES (30, 42, 11, 1.000, NULL);
INSERT INTO `retail_order_item` VALUES (31, 43, 11, 1.000, NULL);
INSERT INTO `retail_order_item` VALUES (32, 44, 11, 1.000, NULL);
INSERT INTO `retail_order_item` VALUES (33, 45, 11, 1.000, NULL);
INSERT INTO `retail_order_item` VALUES (34, 46, 11, 1.000, NULL);
INSERT INTO `retail_order_item` VALUES (35, 47, 11, 1.000, NULL);
INSERT INTO `retail_order_item` VALUES (36, 48, 11, 1.000, NULL);
INSERT INTO `retail_order_item` VALUES (37, 49, 11, 1.000, NULL);
INSERT INTO `retail_order_item` VALUES (38, 50, 11, 1.000, NULL);
INSERT INTO `retail_order_item` VALUES (39, 51, 11, 1.000, NULL);
INSERT INTO `retail_order_item` VALUES (40, 52, 11, 1.000, NULL);
INSERT INTO `retail_order_item` VALUES (41, 53, 0, 0.000, NULL);
INSERT INTO `retail_order_item` VALUES (42, 54, 0, 0.000, NULL);
INSERT INTO `retail_order_item` VALUES (43, 55, 0, 0.000, NULL);
INSERT INTO `retail_order_item` VALUES (44, 56, 0, 0.000, NULL);
INSERT INTO `retail_order_item` VALUES (45, 57, 0, 0.000, NULL);
INSERT INTO `retail_order_item` VALUES (46, 58, 0, 0.000, NULL);
INSERT INTO `retail_order_item` VALUES (47, 59, 0, 0.000, NULL);
INSERT INTO `retail_order_item` VALUES (48, 60, 0, 0.000, NULL);
INSERT INTO `retail_order_item` VALUES (49, 61, 0, 0.000, NULL);
INSERT INTO `retail_order_item` VALUES (50, 62, 1325234, 298.220, NULL);
INSERT INTO `retail_order_item` VALUES (51, 63, 1325234, 298.220, NULL);
INSERT INTO `retail_order_item` VALUES (52, 64, 1325234, 298.220, NULL);
INSERT INTO `retail_order_item` VALUES (53, 65, 1325234, 298.220, NULL);
INSERT INTO `retail_order_item` VALUES (54, 66, 1325234, 298.220, NULL);
INSERT INTO `retail_order_item` VALUES (55, 67, 1325234, 298.220, NULL);
INSERT INTO `retail_order_item` VALUES (56, 68, 1325234, 298.220, NULL);
INSERT INTO `retail_order_item` VALUES (57, 69, 1325234, 298.220, NULL);
INSERT INTO `retail_order_item` VALUES (58, 70, 1325234, 298.220, NULL);
INSERT INTO `retail_order_item` VALUES (59, 71, 1325234, 298.220, NULL);
INSERT INTO `retail_order_item` VALUES (60, 72, 1325234, 298.220, NULL);
INSERT INTO `retail_order_item` VALUES (61, 73, 1325234, 298.220, NULL);
INSERT INTO `retail_order_item` VALUES (62, 74, 1325234, 298.220, NULL);
INSERT INTO `retail_order_item` VALUES (63, 75, 1325234, 298.220, NULL);
INSERT INTO `retail_order_item` VALUES (64, 76, 1325234, 298.220, NULL);
INSERT INTO `retail_order_item` VALUES (65, 77, 1325234, 298.220, NULL);
INSERT INTO `retail_order_item` VALUES (66, 78, 1325234, 298.220, NULL);
INSERT INTO `retail_order_item` VALUES (67, 79, 1325234, 298.220, NULL);
INSERT INTO `retail_order_item` VALUES (68, 80, 1325234, 298.220, NULL);
INSERT INTO `retail_order_item` VALUES (69, 81, 1325234, 298.220, NULL);
INSERT INTO `retail_order_item` VALUES (70, 82, 1325234, 298.220, NULL);
INSERT INTO `retail_order_item` VALUES (71, 83, 1325234, 298.220, NULL);
INSERT INTO `retail_order_item` VALUES (72, 84, 1325234, 298.220, NULL);
INSERT INTO `retail_order_item` VALUES (73, 85, 1325234, 298.220, NULL);
INSERT INTO `retail_order_item` VALUES (74, 86, 1325234, 298.220, NULL);
INSERT INTO `retail_order_item` VALUES (75, 87, 1325234, 298.220, NULL);
INSERT INTO `retail_order_item` VALUES (76, 88, 1325234, 298.220, NULL);
INSERT INTO `retail_order_item` VALUES (77, 89, 123124, 3.210, NULL);
INSERT INTO `retail_order_item` VALUES (78, 90, 1325234, 298.220, NULL);
INSERT INTO `retail_order_item` VALUES (79, 91, 1325234, 298.220, NULL);
INSERT INTO `retail_order_item` VALUES (80, 92, 1325234, 298.220, NULL);
INSERT INTO `retail_order_item` VALUES (81, 93, 1325234, 298.220, NULL);
INSERT INTO `retail_order_item` VALUES (82, 94, 1325234, 298.220, NULL);
INSERT INTO `retail_order_item` VALUES (83, 95, 1325234, 298.220, NULL);
INSERT INTO `retail_order_item` VALUES (84, 96, 1325234, 298.220, NULL);
INSERT INTO `retail_order_item` VALUES (85, 97, 1325234, 298.220, NULL);
INSERT INTO `retail_order_item` VALUES (86, 98, 1325234, 298.220, NULL);
INSERT INTO `retail_order_item` VALUES (87, 99, 1325234, 298.220, NULL);
INSERT INTO `retail_order_item` VALUES (88, 100, 1325234, 298.220, NULL);
INSERT INTO `retail_order_item` VALUES (89, 101, 1325234, 298.220, NULL);
INSERT INTO `retail_order_item` VALUES (90, 102, 1325234, 298.220, NULL);

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config`  (
  `config_id` int NOT NULL AUTO_INCREMENT COMMENT '参数主键',
  `config_name` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '参数名称',
  `config_key` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '参数键名',
  `config_value` varchar(1024) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '参数键值',
  `config_type` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT 'N' COMMENT '系统内置（Y是 N否）',
  `create_by` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`config_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 102 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '参数配置表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_config
-- ----------------------------
INSERT INTO `sys_config` VALUES (99, 'oss存储配置', 'sys.oss.cloudStorage', '{\"type\":1,\"qiniuDomain\":\"https://www.qiniu.com\",\"qiniuPrefix\":\"1\",\"qiniuAccessKey\":\"1\",\"qiniuSecretKey\":\"11\",\"qiniuBucketName\":\"1\",\"aliyunDomain\":\"www.baidu.com\",\"aliyunPrefix\":\"1\",\"aliyunEndPoint\":\"1\",\"aliyunAccessKeyId\":\"1\",\"aliyunAccessKeySecret\":\"1\",\"aliyunBucketName\":\"1\",\"qcloudDomain\":\"www.ali.com\",\"qcloudPrefix\":\"1\",\"qcloudSecretId\":\"1\",\"qcloudSecretKey\":\"1\",\"qcloudBucketName\":\"1\",\"qcloudRegion\":\"1\"}', 'Y', 'admin', '2018-03-16 11:33:00', '', '2022-10-14 17:18:44', 'oss存储配置11');
INSERT INTO `sys_config` VALUES (101, '测试', 'test', 'test', 'Y', '', '2022-09-26 15:07:40', '', NULL, 'parentId');

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept`  (
  `dept_id` int NOT NULL AUTO_INCREMENT COMMENT '部门id',
  `parent_id` int NULL DEFAULT 0 COMMENT '父部门id',
  `ancestors` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '0' COMMENT '祖级列表',
  `dept_name` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '部门名称',
  `order_num` int NULL DEFAULT 0 COMMENT '显示顺序',
  `leader` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '负责人',
  `leader_id` int NULL DEFAULT NULL COMMENT '负责人编号',
  `phone` varchar(11) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '联系电话',
  `email` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `status` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '0' COMMENT '部门状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`dept_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 120 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '部门表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO `sys_dept` VALUES (100, 0, '0', '玛丝菲尔', 0, '张三', 1, '15888888888', 'ry@qq.com', '0', '0', 'admin', '2018-03-16 11:33:00', 'admin', '2022-10-17 15:41:25');

-- ----------------------------
-- Table structure for sys_dict_data
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_data`;
CREATE TABLE `sys_dict_data`  (
  `dict_code` int NOT NULL AUTO_INCREMENT COMMENT '字典编码',
  `dict_sort` int NULL DEFAULT 0 COMMENT '字典排序',
  `dict_label` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '字典标签',
  `dict_value` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '字典键值',
  `dict_type` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '字典类型',
  `css_class` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '样式属性（其他样式扩展）',
  `list_class` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '表格回显样式',
  `is_default` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT 'N' COMMENT '是否默认（Y是 N否）',
  `status` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_code`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 52 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '字典数据表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_dict_data
-- ----------------------------
INSERT INTO `sys_dict_data` VALUES (1, 1, '男', '0', 'sys_user_sex', '', '', 'Y', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '性别男');
INSERT INTO `sys_dict_data` VALUES (2, 2, '女', '1', 'sys_user_sex', '', '', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '性别女');
INSERT INTO `sys_dict_data` VALUES (4, 1, '显示', '0', 'sys_show_hide', '', 'primary', 'Y', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '显示菜单');
INSERT INTO `sys_dict_data` VALUES (5, 2, '隐藏', '1', 'sys_show_hide', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '隐藏菜单');
INSERT INTO `sys_dict_data` VALUES (6, 1, '正常', '0', 'sys_normal_disable', '', 'primary', 'Y', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '正常状态');
INSERT INTO `sys_dict_data` VALUES (7, 2, '停用', '1', 'sys_normal_disable', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '停用状态');
INSERT INTO `sys_dict_data` VALUES (8, 1, '正常', '0', 'sys_job_status', '', 'primary', 'Y', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '正常状态');
INSERT INTO `sys_dict_data` VALUES (9, 2, '暂停', '1', 'sys_job_status', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '停用状态');
INSERT INTO `sys_dict_data` VALUES (10, 1, '是', 'Y', 'sys_yes_no', '', 'primary', 'Y', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '系统默认是');
INSERT INTO `sys_dict_data` VALUES (11, 2, '否', 'N', 'sys_yes_no', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '系统默认否');
INSERT INTO `sys_dict_data` VALUES (12, 1, '通知', '1', 'sys_notice_type', '', 'warning', 'Y', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '通知');
INSERT INTO `sys_dict_data` VALUES (13, 2, '公告', '2', 'sys_notice_type', '', 'success', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '公告');
INSERT INTO `sys_dict_data` VALUES (14, 1, '正常', '0', 'sys_notice_status', '', 'primary', 'Y', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '正常状态');
INSERT INTO `sys_dict_data` VALUES (15, 2, '关闭', '1', 'sys_notice_status', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '关闭状态');
INSERT INTO `sys_dict_data` VALUES (16, 1, '新增', '1', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '新增操作');
INSERT INTO `sys_dict_data` VALUES (17, 2, '修改', '2', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '修改操作');
INSERT INTO `sys_dict_data` VALUES (18, 3, '删除', '3', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '删除操作');
INSERT INTO `sys_dict_data` VALUES (19, 4, '授权', '4', 'sys_oper_type', '', 'primary', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '授权操作');
INSERT INTO `sys_dict_data` VALUES (20, 5, '导出', '5', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '导出操作');
INSERT INTO `sys_dict_data` VALUES (21, 6, '导入', '6', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '导入操作');
INSERT INTO `sys_dict_data` VALUES (22, 7, '强退', '7', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '强退操作');
INSERT INTO `sys_dict_data` VALUES (23, 8, '生成代码', '8', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '生成操作');
INSERT INTO `sys_dict_data` VALUES (24, 8, '清空数据', '9', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '清空操作');
INSERT INTO `sys_dict_data` VALUES (25, 1, '成功', '0', 'sys_common_status', '', 'primary', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '正常状态');
INSERT INTO `sys_dict_data` VALUES (26, 2, '失败', '1', 'sys_common_status', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '停用状态');
INSERT INTO `sys_dict_data` VALUES (35, 1, '年假', '1', 'act_leave_type', NULL, NULL, 'N', '0', '', '2020-01-07 14:06:17', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (36, 2, '事假', '2', 'act_leave_type', NULL, NULL, 'N', '0', '', '2020-01-07 14:06:28', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (37, 3, '病假', '3', 'act_leave_type', NULL, NULL, 'N', '0', '', '2020-01-07 14:06:35', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (38, 4, '调休', '4', 'act_leave_type', NULL, NULL, 'N', '0', '', '2020-01-07 14:06:47', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (39, 5, '产假', '5', 'act_leave_type', NULL, NULL, 'N', '0', '', '2020-01-07 14:07:01', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (40, 6, '陪产假', '6', 'act_leave_type', NULL, NULL, 'N', '0', '', '2020-01-07 14:07:08', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (41, 7, '婚假', '7', 'act_leave_type', NULL, NULL, 'N', '0', '', '2020-01-07 14:08:04', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (42, 8, '例假', '8', 'act_leave_type', NULL, NULL, 'N', '0', '', '2020-01-07 14:08:15', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (43, 9, '丧假', '9', 'act_leave_type', NULL, NULL, 'N', '0', '', '2020-01-07 14:08:24', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (44, 10, '哺乳假', '10', 'act_leave_type', NULL, NULL, 'N', '0', '', '2020-01-07 14:08:39', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (45, 11, '流产假', '11', 'act_leave_type', NULL, NULL, 'N', '0', '', '2020-01-07 14:08:48', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (46, 3, '未知', '2', 'sys_user_sex', NULL, 'default', 'N', '0', '', '2022-09-27 14:47:40', '', '2022-09-27 14:47:53', '未知22');
INSERT INTO `sys_dict_data` VALUES (47, 0, '目录', 'M', 'sys_menu_type', NULL, 'primary', 'N', '0', '', '2022-09-27 14:49:25', '', '2022-09-27 14:53:38', '目录');
INSERT INTO `sys_dict_data` VALUES (48, 1, '菜单', 'C', 'sys_menu_type', NULL, 'success', 'N', '0', '', '2022-09-27 14:49:41', '', '2022-09-27 14:53:44', '菜单');
INSERT INTO `sys_dict_data` VALUES (49, 3, '按钮', 'F', 'sys_menu_type', NULL, 'danger', 'N', '0', '', '2022-09-27 14:49:58', '', '2022-09-27 14:53:51', '按钮');

-- ----------------------------
-- Table structure for sys_dict_type
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_type`;
CREATE TABLE `sys_dict_type`  (
  `dict_id` int NOT NULL AUTO_INCREMENT COMMENT '字典主键',
  `dict_name` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '字典名称',
  `dict_type` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '字典类型',
  `status` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_id`) USING BTREE,
  UNIQUE INDEX `dict_type`(`dict_type`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 23 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '字典类型表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_dict_type
-- ----------------------------
INSERT INTO `sys_dict_type` VALUES (1, '用户性别', 'sys_user_sex', '0', 'admin', '2018-03-16 11:33:00', 'admin', '2022-10-17 14:44:06', '用户性别列表');
INSERT INTO `sys_dict_type` VALUES (2, '菜单状态', 'sys_show_hide', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '菜单状态列表');
INSERT INTO `sys_dict_type` VALUES (3, '系统开关', 'sys_normal_disable', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '系统开关列表');
INSERT INTO `sys_dict_type` VALUES (4, '任务状态', 'sys_job_status', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '任务状态列表');
INSERT INTO `sys_dict_type` VALUES (5, '系统是否', 'sys_yes_no', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '系统是否列表');
INSERT INTO `sys_dict_type` VALUES (6, '通知类型', 'sys_notice_type', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '通知类型列表');
INSERT INTO `sys_dict_type` VALUES (7, '通知状态', 'sys_notice_status', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '通知状态列表');
INSERT INTO `sys_dict_type` VALUES (8, '操作类型', 'sys_oper_type', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '操作类型列表');
INSERT INTO `sys_dict_type` VALUES (9, '系统状态', 'sys_common_status', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '登录状态列表');
INSERT INTO `sys_dict_type` VALUES (10, '请假类型', 'act_leave_type', '0', '', '2020-01-07 14:05:42', '', NULL, '请假类型');
INSERT INTO `sys_dict_type` VALUES (17, '菜单类型', 'sys_menu_type', '0', '', '2022-09-27 14:48:51', '', NULL, '菜单类型:目录，菜单，按钮');
INSERT INTO `sys_dict_type` VALUES (19, 'abcd', 'abc', '0', '', '2022-10-14 16:30:40', '', '2022-10-14 16:32:07', 'test');

-- ----------------------------
-- Table structure for sys_job
-- ----------------------------
DROP TABLE IF EXISTS `sys_job`;
CREATE TABLE `sys_job`  (
  `job_id` int NOT NULL AUTO_INCREMENT COMMENT '任务ID',
  `job_name` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '' COMMENT '任务名称',
  `job_group` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '' COMMENT '任务组名',
  `method_name` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '任务方法',
  `method_params` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '方法参数',
  `cron_expression` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT 'cron执行表达式',
  `misfire_policy` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '3' COMMENT '计划执行错误策略（1立即执行 2执行一次 3放弃执行）',
  `concurrent` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '1' COMMENT '是否并发执行（0允许 1禁止）',
  `status` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '0' COMMENT '状态（0正常 1暂停）',
  `create_by` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '备注信息',
  PRIMARY KEY (`job_id`, `job_name`, `job_group`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '定时任务调度表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_job
-- ----------------------------
INSERT INTO `sys_job` VALUES (1, 'ryTask', '系统默认（无参）', 'ryNoParams', '', '0/10 * * * * ?', '3', '1', '1', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_job` VALUES (2, 'ryTask', '系统默认（有参）', 'ryParams', 'ry', '0/20 * * * * ?', '3', '1', '1', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');

-- ----------------------------
-- Table structure for sys_job_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_job_log`;
CREATE TABLE `sys_job_log`  (
  `job_log_id` int NOT NULL AUTO_INCREMENT COMMENT '任务日志ID',
  `job_name` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '任务名称',
  `job_group` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '任务组名',
  `method_name` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '任务方法',
  `method_params` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '方法参数',
  `job_message` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '日志信息',
  `status` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '0' COMMENT '执行状态（0正常 1失败）',
  `exception_info` varchar(2000) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '异常信息',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`job_log_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '定时任务调度日志表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_job_log
-- ----------------------------

-- ----------------------------
-- Table structure for sys_logininfor
-- ----------------------------
DROP TABLE IF EXISTS `sys_logininfor`;
CREATE TABLE `sys_logininfor`  (
  `info_id` int NOT NULL AUTO_INCREMENT COMMENT '访问ID',
  `login_name` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '登录账号',
  `ipaddr` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '登录IP地址',
  `login_location` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '登录地点',
  `browser` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '操作系统',
  `status` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '0' COMMENT '登录状态（0成功 1失败）',
  `msg` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '提示消息',
  `login_time` datetime(0) NULL DEFAULT NULL COMMENT '访问时间',
  PRIMARY KEY (`info_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '系统访问记录' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_logininfor
-- ----------------------------
INSERT INTO `sys_logininfor` VALUES (1, 'admin', '192.168.12.104', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2022-10-17 16:56:09');
INSERT INTO `sys_logininfor` VALUES (2, 'admin', '192.168.12.104', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-10-17 16:56:21');
INSERT INTO `sys_logininfor` VALUES (3, 'admin', '192.168.12.104', '内网IP', 'Chrome 10', 'Mac OS X', '0', '登录成功', '2022-10-18 09:51:56');
INSERT INTO `sys_logininfor` VALUES (4, 'admin', '192.168.12.104', '内网IP', 'Chrome 10', 'Mac OS X', '0', '登录成功', '2022-10-19 08:48:02');

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`  (
  `menu_id` int NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `menu_name` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '菜单名称',
  `menu_key` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '' COMMENT '菜单标识',
  `component` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '菜单布局',
  `parent_id` int NULL DEFAULT 0 COMMENT '父菜单ID',
  `target` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '打开方式',
  `order_num` int NULL DEFAULT 0 COMMENT '显示顺序',
  `menu_type` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '菜单类型（M目录 C菜单 F按钮）',
  `visible` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '0' COMMENT '菜单状态（0显示 1隐藏）',
  `perms` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '权限标识',
  `icon` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '#' COMMENT '菜单图标',
  `path` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '链接',
  `redirect` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '重定向',
  `hidden_children` tinyint UNSIGNED NULL DEFAULT NULL COMMENT '强制菜单显示为Item而不是SubItem',
  `hidden_header` tinyint UNSIGNED NULL DEFAULT NULL COMMENT '特殊 隐藏 PageHeader 组件中的页面带的 面包屑和页面标题栏',
  `create_by` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`menu_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2034 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '菜单权限表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES (1, '系统管理', 'system', 'PageView', 0, '', 1, 'M', '0', '', 'system', '/system', NULL, NULL, NULL, 'admin', '2018-03-16 11:33:00', 'ry', '2022-09-26 16:55:22', '系统管理目录');
INSERT INTO `sys_menu` VALUES (2, '系统监控', 'monitor', 'PageView', 0, '', 2, 'M', '0', '', 'monitor', '/monitor', NULL, NULL, NULL, 'admin', '2018-03-16 11:33:00', 'ry', '2022-09-26 15:38:03', '系统监控目录');
INSERT INTO `sys_menu` VALUES (3, '系统工具', 'tool', 'PageView', 0, '', 3, 'M', '0', '', 'bars', '/tool', NULL, NULL, NULL, 'admin', '2018-03-16 11:33:00', 'ry', '2022-10-08 11:31:00', '系统工具目录');
INSERT INTO `sys_menu` VALUES (100, '用户管理', 'userIndex', 'system/user/index', 1, '', 1, 'C', '0', 'system:user:view', 'user', 'user/index', NULL, NULL, NULL, 'admin', '2018-03-16 11:33:00', 'ry', '2022-09-26 17:14:30', '用户管理菜单');
INSERT INTO `sys_menu` VALUES (101, '角色管理', 'roleIndex', 'system/role/index', 1, '', 2, 'C', '0', 'system:role:view', 'peoples', 'role/index', NULL, NULL, NULL, 'admin', '2018-03-16 11:33:00', 'ry', '2022-09-26 17:00:38', '角色管理菜单');
INSERT INTO `sys_menu` VALUES (102, '菜单管理', 'menuIndex', 'system/menu/index', 1, '', 3, 'C', '0', 'system:menu:view', 'list', 'menu/index', NULL, NULL, NULL, 'admin', '2018-03-16 11:33:00', 'ry', '2022-09-26 17:01:49', '菜单管理菜单');
INSERT INTO `sys_menu` VALUES (103, '部门管理', 'deptIndex', 'system/dept/index', 1, '', 4, 'C', '0', 'system:dept:view', 'client', 'dept/index', NULL, NULL, NULL, 'admin', '2018-03-16 11:33:00', 'ry', '2022-09-26 17:00:31', '部门管理菜单');
INSERT INTO `sys_menu` VALUES (104, '岗位管理', 'postIndex', 'system/post/index', 1, '', 5, 'C', '0', 'system:post:view', 'post', 'post/index', NULL, NULL, NULL, 'admin', '2018-03-16 11:33:00', 'ry', '2022-09-26 17:00:21', '岗位管理菜单');
INSERT INTO `sys_menu` VALUES (105, '字典管理', 'dictIndex', 'system/dict/index', 1, '', 6, 'C', '0', 'system:dict:view', 'dict', 'dict/index', NULL, NULL, NULL, 'admin', '2018-03-16 11:33:00', 'ry', '2022-09-26 17:00:15', '字典管理菜单');
INSERT INTO `sys_menu` VALUES (106, '参数设置', 'configIndex', 'system/config/index', 1, '', 7, 'C', '0', 'system:config:view', 'code', 'config/index', NULL, NULL, NULL, 'admin', '2018-03-16 11:33:00', 'ry', '2022-09-26 17:00:08', '参数设置菜单');
INSERT INTO `sys_menu` VALUES (107, '通知公告', 'noticeIndex', 'system/notice/index', 1, '', 8, 'C', '0', 'system:notice:view', 'message', 'notice/index', NULL, NULL, NULL, 'admin', '2018-03-16 11:33:00', 'ry', '2022-09-26 16:57:54', '通知公告菜单');
INSERT INTO `sys_menu` VALUES (108, '日志管理', '', NULL, 1, '', 9, 'M', '0', '', '#', NULL, NULL, NULL, NULL, 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '日志管理菜单');
INSERT INTO `sys_menu` VALUES (109, '用户日志', 'onlineIndex', 'monitor/online/index', 2, '', 2, 'C', '0', 'monitor:online:view', 'online', 'online/index', NULL, NULL, NULL, 'admin', '2018-03-16 11:33:00', 'ry', '2022-09-26 17:01:04', '在线用户菜单');
INSERT INTO `sys_menu` VALUES (110, '定时任务', 'joblogIndex', 'monitor/job/log', 2, '', 3, 'C', '0', 'monitor:job:view', 'job', 'job/log', NULL, NULL, NULL, 'admin', '2018-03-16 11:33:00', 'ry', '2022-09-26 17:01:13', '定时任务菜单');
INSERT INTO `sys_menu` VALUES (114, '代码生成', 'genIndex', 'tool/gen/index', 3, '', 2, 'C', '0', 'tool:gen:view', '#', 'gen/index', NULL, NULL, NULL, 'admin', '2018-03-16 11:33:00', 'ry', '2022-10-08 11:28:42', '代码生成菜单');
INSERT INTO `sys_menu` VALUES (115, '系统接口', '', NULL, 3, '', 3, 'C', '0', 'tool:swagger:view', '#', NULL, NULL, NULL, NULL, 'admin', '2018-03-16 11:33:00', 'admin', '2019-05-23 13:15:33', '系统接口菜单');
INSERT INTO `sys_menu` VALUES (200, '文件管理', 'oss', 'system/OssList', 1, '', 10, 'C', '1', 'system:oss:view', '#', 'system/OssList', NULL, NULL, NULL, 'admin', '2018-11-16 13:59:45', '', '2022-09-26 15:32:36', '');
INSERT INTO `sys_menu` VALUES (500, '操作日志', 'operlogIndex', 'system/operlog/index', 2, '', 5, 'C', '0', 'monitor:operlog:view', 'log', 'operlog/index', NULL, NULL, NULL, 'admin', '2018-03-16 11:33:00', 'ry', '2022-09-26 17:01:24', '操作日志菜单');
INSERT INTO `sys_menu` VALUES (501, '登录日志', 'logininforIndex', 'system/logininfor/index', 2, '', 4, 'C', '0', 'monitor:logininfor:view', 'logininfor', 'logininfor/index', NULL, NULL, NULL, 'admin', '2018-03-16 11:33:00', 'ry', '2022-09-26 17:01:19', '登录日志菜单');
INSERT INTO `sys_menu` VALUES (1000, '用户查询', '', NULL, 100, '', 1, 'F', '0', 'system:user:list', '#', NULL, NULL, NULL, NULL, 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1001, '用户新增', '', NULL, 100, '', 2, 'F', '0', 'system:user:add', '#', NULL, NULL, NULL, NULL, 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1002, '用户修改', '', NULL, 100, '', 3, 'F', '0', 'system:user:edit', '#', NULL, NULL, NULL, NULL, 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1003, '用户删除', '', NULL, 100, '', 4, 'F', '0', 'system:user:remove', '#', NULL, NULL, NULL, NULL, 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1004, '用户导出', '', NULL, 100, '', 5, 'F', '0', 'system:user:export', '#', NULL, NULL, NULL, NULL, 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1005, '用户导入', '', NULL, 100, '', 6, 'F', '0', 'system:user:import', '#', NULL, NULL, NULL, NULL, 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1006, '重置密码', '', NULL, 100, '', 7, 'F', '0', 'system:user:resetPwd', '#', NULL, NULL, NULL, NULL, 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1007, '角色查询', '', NULL, 101, '', 1, 'F', '0', 'system:role:list', '#', NULL, NULL, NULL, NULL, 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1008, '角色新增', '', NULL, 101, '', 2, 'F', '0', 'system:role:add', '#', NULL, NULL, NULL, NULL, 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1009, '角色修改', '', NULL, 101, '', 3, 'F', '0', 'system:role:edit', '#', NULL, NULL, NULL, NULL, 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1010, '角色删除', '', NULL, 101, '', 4, 'F', '0', 'system:role:remove', '#', NULL, NULL, NULL, NULL, 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1011, '角色导出', '', NULL, 101, '', 5, 'F', '0', 'system:role:export', '#', NULL, NULL, NULL, NULL, 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1012, '菜单查询', '', NULL, 102, '', 1, 'F', '0', 'system:menu:list', '#', NULL, NULL, NULL, NULL, 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1013, '菜单新增', '', NULL, 102, '', 2, 'F', '0', 'system:menu:add', '#', NULL, NULL, NULL, NULL, 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1014, '菜单修改', '', NULL, 102, '', 3, 'F', '0', 'system:menu:edit', '#', NULL, NULL, NULL, NULL, 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1015, '菜单删除', '', NULL, 102, '', 4, 'F', '0', 'system:menu:remove', '#', NULL, NULL, NULL, NULL, 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1016, '部门查询', '', NULL, 103, '', 1, 'F', '0', 'system:dept:list', '#', NULL, NULL, NULL, NULL, 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1017, '部门新增', '', NULL, 103, '', 2, 'F', '0', 'system:dept:add', '#', NULL, NULL, NULL, NULL, 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1018, '部门修改', '', NULL, 103, '', 3, 'F', '0', 'system:dept:edit', '#', NULL, NULL, NULL, NULL, 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1019, '部门删除', '', NULL, 103, '', 4, 'F', '0', 'system:dept:remove', '#', NULL, NULL, NULL, NULL, 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1020, '岗位查询', '', NULL, 104, '', 1, 'F', '0', 'system:post:list', '#', NULL, NULL, NULL, NULL, 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1021, '岗位新增', '', NULL, 104, '', 2, 'F', '0', 'system:post:add', '#', NULL, NULL, NULL, NULL, 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1022, '岗位修改', '', NULL, 104, '', 3, 'F', '0', 'system:post:edit', '#', NULL, NULL, NULL, NULL, 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1023, '岗位删除', '', NULL, 104, '', 4, 'F', '0', 'system:post:remove', '#', NULL, NULL, NULL, NULL, 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1024, '岗位导出', '', NULL, 104, '', 5, 'F', '0', 'system:post:export', '#', NULL, NULL, NULL, NULL, 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1025, '字典查询', '', NULL, 105, '', 1, 'F', '0', 'system:dict:list', '#', NULL, NULL, NULL, NULL, 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1026, '字典新增', '', NULL, 105, '', 2, 'F', '0', 'system:dict:add', '#', NULL, NULL, NULL, NULL, 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1027, '字典修改', '', NULL, 105, '', 3, 'F', '0', 'system:dict:edit', '#', NULL, NULL, NULL, NULL, 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1028, '字典删除', '', NULL, 105, '', 4, 'F', '0', 'system:dict:remove', '#', NULL, NULL, NULL, NULL, 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1029, '字典导出', '', NULL, 105, '', 5, 'F', '0', 'system:dict:export', '#', NULL, NULL, NULL, NULL, 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1030, '参数查询', '', NULL, 106, '', 1, 'F', '0', 'system:config:list', '#', NULL, NULL, NULL, NULL, 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1031, '参数新增', '', NULL, 106, '', 2, 'F', '0', 'system:config:add', '#', NULL, NULL, NULL, NULL, 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1032, '参数修改', '', NULL, 106, '', 3, 'F', '0', 'system:config:edit', '#', NULL, NULL, NULL, NULL, 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1033, '参数删除', '', NULL, 106, '', 4, 'F', '0', 'system:config:remove', '#', NULL, NULL, NULL, NULL, 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1034, '参数导出', '', NULL, 106, '', 5, 'F', '0', 'system:config:export', '#', NULL, NULL, NULL, NULL, 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1035, '公告查询', '', NULL, 107, '', 1, 'F', '0', 'system:notice:list', '#', NULL, NULL, NULL, NULL, 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1036, '公告新增', '', NULL, 107, '', 2, 'F', '0', 'system:notice:add', '#', NULL, NULL, NULL, NULL, 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1037, '公告修改', '', NULL, 107, '', 3, 'F', '0', 'system:notice:edit', '#', NULL, NULL, NULL, NULL, 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1038, '公告删除', '', NULL, 107, '', 4, 'F', '0', 'system:notice:remove', '#', NULL, NULL, NULL, NULL, 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1039, '操作查询', '', NULL, 500, '', 1, 'F', '0', 'monitor:operlog:list', '#', NULL, NULL, NULL, NULL, 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1040, '操作删除', '', NULL, 500, '', 2, 'F', '0', 'monitor:operlog:remove', '#', NULL, NULL, NULL, NULL, 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1041, '详细信息', '', NULL, 500, '', 3, 'F', '0', 'monitor:operlog:detail', '#', NULL, NULL, NULL, NULL, 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1042, '日志导出', '', NULL, 500, '', 4, 'F', '0', 'monitor:operlog:export', '#', NULL, NULL, NULL, NULL, 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1043, '登录查询', '', NULL, 501, '', 1, 'F', '0', 'monitor:logininfor:list', '#', NULL, NULL, NULL, NULL, 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1044, '登录删除', '', NULL, 501, '', 2, 'F', '0', 'monitor:logininfor:remove', '#', NULL, NULL, NULL, NULL, 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1045, '日志导出', '', NULL, 501, '', 3, 'F', '0', 'monitor:logininfor:export', '#', NULL, NULL, NULL, NULL, 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1046, '在线查询', '', NULL, 109, '', 1, 'F', '0', 'monitor:online:list', '#', NULL, NULL, NULL, NULL, 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1047, '批量强退', '', NULL, 109, '', 2, 'F', '0', 'monitor:online:batchForceLogout', '#', NULL, NULL, NULL, NULL, 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1048, '单条强退', '', NULL, 109, '', 3, 'F', '0', 'monitor:online:forceLogout', '#', NULL, NULL, NULL, NULL, 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1049, '任务查询', '', NULL, 110, '', 1, 'F', '0', 'monitor:job:list', '#', NULL, NULL, NULL, NULL, 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1050, '任务新增', '', NULL, 110, '', 2, 'F', '0', 'monitor:job:add', '#', NULL, NULL, NULL, NULL, 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1051, '任务修改', '', NULL, 110, '', 3, 'F', '0', 'monitor:job:edit', '#', NULL, NULL, NULL, NULL, 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1052, '任务删除', '', NULL, 110, '', 4, 'F', '0', 'monitor:job:remove', '#', NULL, NULL, NULL, NULL, 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1053, '状态修改', '', NULL, 110, '', 5, 'F', '0', 'monitor:job:changeStatus', '#', NULL, NULL, NULL, NULL, 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1054, '任务详细', '', NULL, 110, '', 6, 'F', '0', 'monitor:job:detail', '#', NULL, NULL, NULL, NULL, 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1055, '任务导出', '', NULL, 110, '', 7, 'F', '0', 'monitor:job:export', '#', NULL, NULL, NULL, NULL, 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1056, '生成查询', '', NULL, 114, '', 1, 'F', '0', 'tool:gen:list', '#', NULL, NULL, NULL, NULL, 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1057, '生成代码', '', NULL, 114, '', 2, 'F', '0', 'tool:gen:code', '#', NULL, NULL, NULL, NULL, 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (2000, '地区管理', 'dist', 'system/DistList', 1, '', 10, 'C', '1', 'system:districts:view', '#', 'system/DistList', NULL, NULL, NULL, 'admin', '2018-03-01 00:00:00', 'admin', '2022-09-26 15:33:33', '地区管理');
INSERT INTO `sys_menu` VALUES (2001, '地区查询', '', NULL, 2000, '', 1, 'F', '0', 'system:districts:list', '#', NULL, NULL, NULL, NULL, 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES (2002, '地区新增', '', NULL, 2000, '', 2, 'F', '0', 'system:districts:add', '#', NULL, NULL, NULL, NULL, 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES (2003, '地区修改', '', NULL, 2000, '', 3, 'F', '0', 'system:districts:edit', '#', NULL, NULL, NULL, NULL, 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES (2004, '地区删除', '', NULL, 2000, '', 4, 'F', '0', 'system:districts:remove', '#', NULL, NULL, NULL, NULL, 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES (2006, '文件上传', '', NULL, 200, '', 1, 'F', '0', 'system:oss:add', '#', NULL, NULL, NULL, NULL, 'admin', '2018-11-16 13:59:45', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2007, '文件删除', '', NULL, 200, '', 2, 'F', '0', 'system:oss:remove', '#', NULL, NULL, NULL, NULL, 'admin', '2018-11-16 13:59:45', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2008, '文件配置', '', NULL, 200, '', 3, 'F', '0', 'system:oss:config', '#', NULL, NULL, NULL, NULL, 'admin', '2018-11-16 13:59:45', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2009, '文件修改', '', NULL, 200, '', 4, 'F', '0', 'system:oss:remove', '#', NULL, NULL, NULL, NULL, 'admin', '2018-11-16 13:59:45', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2010, '表单构建', '', NULL, 3, '', 1, 'C', '0', 'tool:build:view', '#', NULL, NULL, NULL, NULL, '', '2019-05-30 18:49:16', '', '2019-05-30 18:52:43', '');
INSERT INTO `sys_menu` VALUES (2011, '生成配置', 'genEdit', 'gen/GenEdit', 3, '', 1, 'M', '1', 'tool:gen:edit', '#', NULL, NULL, 0, NULL, '', '2019-08-20 22:30:24', '', '2019-12-26 11:38:19', '');
INSERT INTO `sys_menu` VALUES (2012, '百度外链', 'baidu', NULL, 3, '_blank', 1, 'C', '0', '', '#', 'http://www.baidu.com', NULL, 0, NULL, '', '2019-12-26 10:19:01', '', '2019-12-26 12:27:15', '');
INSERT INTO `sys_menu` VALUES (2013, '流程管理', 'act', 'PageView', 0, '', 12, 'M', '1', '', 'gateway', '/gateway', NULL, 0, 0, '', '2020-01-03 12:16:51', '', '2022-09-26 15:38:23', '');
INSERT INTO `sys_menu` VALUES (2014, '模型管理', 'modelList', 'activiti/ModelList', 2013, '', 4, 'C', '0', 'activiti:models:view', '#', NULL, NULL, 0, 0, '', '2020-01-03 12:22:03', '', '2020-01-08 11:36:19', '');
INSERT INTO `sys_menu` VALUES (2015, '流程列表', 'procDefList', 'activiti/ProcDefList', 2024, '', 1, 'C', '1', 'activiti:prof:view', '#', '/act/procDef/list', NULL, 0, 0, '', '2020-01-03 12:22:03', '', '2020-01-14 13:15:17', '');
INSERT INTO `sys_menu` VALUES (2016, '运行中流程', 'procInstRuns', 'activiti/ProcInstRuns', 2013, '', 6, 'C', '0', 'activiti:procInst:view', '#', NULL, NULL, 0, 0, '', '2020-01-03 12:22:03', '', '2020-01-10 18:41:27', '');
INSERT INTO `sys_menu` VALUES (2017, '结束的流程', 'procInstFinished', 'activiti/ProcInstFinished', 2013, '', 7, 'C', '0', 'activiti:procInst:view', '#', NULL, NULL, 0, 0, '', '2020-01-03 12:22:03', '', '2020-01-10 18:41:58', '');
INSERT INTO `sys_menu` VALUES (2018, '我的申请', 'businessList', 'activiti/BusinessList', 2013, '', 1, 'C', '0', '', '#', NULL, NULL, 0, 0, '', '2020-01-03 12:22:03', '', '2020-01-14 12:55:34', '');
INSERT INTO `sys_menu` VALUES (2019, '请假', 'leave', 'activiti/modules/Leave', 2013, '', 10, 'C', '1', '', '#', NULL, NULL, 0, 0, '', '2020-01-07 10:26:13', '', '2020-01-07 13:18:49', '');
INSERT INTO `sys_menu` VALUES (2020, '我的待办', 'tasking', 'activiti/Tasking', 2013, '', 2, 'M', '0', NULL, '#', NULL, NULL, 0, 0, '', '2020-01-07 18:54:38', '', '2020-01-08 11:35:48', '');
INSERT INTO `sys_menu` VALUES (2021, '我的已办', 'taskdone', 'activiti/Taskdone', 2013, '', 3, 'M', '0', NULL, '#', NULL, NULL, 0, 0, '', '2020-01-07 18:54:38', '', '2020-01-08 11:35:54', '');
INSERT INTO `sys_menu` VALUES (2022, '报销', 'purchase', 'activiti/modules/Purchase', 2013, '', 10, 'C', '1', '', '#', NULL, NULL, 0, 0, '', '2020-01-07 10:26:13', '', '2020-01-07 13:18:49', '');
INSERT INTO `sys_menu` VALUES (2023, '流程节点配置', 'procDefNode', 'activiti/ProcDefNode', 2024, '', 2, 'C', '1', 'activiti:prof:edit', '#', '/act/procDef/node', NULL, 0, 0, '', '2020-01-14 12:54:36', '', '2020-01-14 13:15:47', '');
INSERT INTO `sys_menu` VALUES (2024, '流程定义', 'procDef', 'RouteView', 2013, '', 5, 'C', '0', '', '#', NULL, '/act/procDef/list', 1, 0, '', '2020-01-14 13:10:47', '', '2020-01-14 13:20:26', '');
INSERT INTO `sys_menu` VALUES (2028, '预览', '', NULL, 114, '', 3, 'F', '0', 'tool:gen:preview', '#', NULL, NULL, NULL, NULL, '', '2022-10-08 11:21:10', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2033, '1122', '1', NULL, 0, '', 1, 'C', '0', '', '404', '/1', NULL, NULL, NULL, 'admin', '2022-10-17 16:28:30', 'admin', '2022-10-17 16:55:50', '');

-- ----------------------------
-- Table structure for sys_notice
-- ----------------------------
DROP TABLE IF EXISTS `sys_notice`;
CREATE TABLE `sys_notice`  (
  `notice_id` int NOT NULL AUTO_INCREMENT COMMENT '公告ID',
  `notice_title` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '公告标题',
  `notice_type` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '公告类型（1通知 2公告）',
  `notice_content` varchar(2000) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '公告内容',
  `status` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '0' COMMENT '公告状态（0正常 1关闭）',
  `create_by` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`notice_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 23 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '通知公告表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_notice
-- ----------------------------
INSERT INTO `sys_notice` VALUES (4, '第6666666个公告', '1', '问问嗯嗯未付 ', '0', '', '2022-09-26 14:57:12', 'admin', '2022-10-17 15:55:58', NULL);
INSERT INTO `sys_notice` VALUES (6, '3333', '1', '3333', '0', '', '2022-09-26 15:26:36', '', NULL, NULL);
INSERT INTO `sys_notice` VALUES (7, 'ppz', '1', 'ppz', '0', '', '2022-10-14 17:02:04', '', NULL, NULL);
INSERT INTO `sys_notice` VALUES (8, 'ppz2', '1', 'ppz2', '0', '', '2022-10-14 17:11:51', '', NULL, NULL);
INSERT INTO `sys_notice` VALUES (9, '2', '3', '1', '4', 'panpeizhao', '2022-10-14 17:20:08', 'panpeizhao', '2022-10-14 17:21:00', NULL);
INSERT INTO `sys_notice` VALUES (11, '1111111111', '1', '1111111111', '0', 'admin', '2022-10-17 08:43:12', '', NULL, NULL);
INSERT INTO `sys_notice` VALUES (12, '1111111111', '1', '1111111111', '0', 'admin', '2022-10-17 08:43:12', '', NULL, NULL);
INSERT INTO `sys_notice` VALUES (13, '1111111111', '1', '1111111111', '0', 'admin', '2022-10-17 08:43:12', '', NULL, NULL);
INSERT INTO `sys_notice` VALUES (14, '1111111111', '1', '1111111111', '0', 'admin', '2022-10-17 08:43:13', '', NULL, NULL);
INSERT INTO `sys_notice` VALUES (15, '1111111111', '1', '1111111111', '0', 'admin', '2022-10-17 08:43:13', '', NULL, NULL);
INSERT INTO `sys_notice` VALUES (16, '1111111111', '1', '1111111111', '0', 'admin', '2022-10-17 08:43:13', '', NULL, NULL);
INSERT INTO `sys_notice` VALUES (17, '1111111111', '1', '1111111111', '0', 'admin', '2022-10-17 08:43:13', '', NULL, NULL);
INSERT INTO `sys_notice` VALUES (18, '1111111111', '1', '1111111111', '0', 'admin', '2022-10-17 08:43:14', '', NULL, NULL);
INSERT INTO `sys_notice` VALUES (19, '1111111111', '1', '1111111111', '0', 'admin', '2022-10-17 08:43:14', '', NULL, NULL);
INSERT INTO `sys_notice` VALUES (20, '1212', '2', '阿萨德', '0', 'admin', '2022-10-17 15:50:07', '', NULL, NULL);
INSERT INTO `sys_notice` VALUES (21, '问问', '1', '阿斯蒂芬 ', '0', 'admin', '2022-10-17 15:50:33', '', NULL, NULL);
INSERT INTO `sys_notice` VALUES (22, '为', '1', '威锋网', '0', 'admin', '2022-10-17 15:50:57', '', NULL, NULL);

-- ----------------------------
-- Table structure for sys_oper_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_oper_log`;
CREATE TABLE `sys_oper_log`  (
  `oper_id` int NOT NULL AUTO_INCREMENT COMMENT '日志主键',
  `title` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '模块标题',
  `business_type` int NULL DEFAULT 0 COMMENT '业务类型（0其它 1新增 2修改 3删除）',
  `method` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '方法名称',
  `request_method` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `operator_type` int NULL DEFAULT 0 COMMENT '操作类别（0其它 1后台用户 2手机端用户）',
  `oper_name` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '操作人员',
  `dept_name` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '部门名称',
  `oper_url` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '请求URL',
  `oper_ip` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '主机地址',
  `oper_location` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '操作地点',
  `oper_param` varchar(2000) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '请求参数',
  `status` int NULL DEFAULT 0 COMMENT '操作状态（0正常 1异常）',
  `error_msg` varchar(2000) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '错误消息',
  `oper_time` datetime(0) NULL DEFAULT NULL COMMENT '操作时间',
  PRIMARY KEY (`oper_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 60 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '操作日志记录' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_oper_log
-- ----------------------------
INSERT INTO `sys_oper_log` VALUES (4, '用户管理', 3, 'com.marisfrolg.system.controller.SysUserController.remove()', 'POST', 1, 'admin', NULL, '/user/remove', '192.168.12.104', '内网IP', '[\n	\"12\"\n]', 0, NULL, '2022-10-17 15:06:18');
INSERT INTO `sys_oper_log` VALUES (5, '角色管理', 1, 'com.marisfrolg.system.controller.SysRoleController.addSave()', 'POST', 1, 'admin', NULL, '/role/save', '192.168.12.104', '内网IP', '[\n	{\n		\"deptIds\":[],\n		\"menuIds\":[\n			1,\n			100,\n			1000,\n			1001,\n			1002,\n			1003,\n			1004,\n			1005,\n			1006,\n			101,\n			1007,\n			1008,\n			1009,\n			1010,\n			1011,\n			102,\n			1012,\n			1013,\n			1014,\n			1015,\n			103,\n			1016,\n			1017,\n			1018,\n			1019,\n			104,\n			1020,\n			1021,\n			1022,\n			1023,\n			1024,\n			105,\n			1025,\n			1026,\n			1027,\n			1028,\n			1029,\n			106,\n			1030,\n			1031,\n			1032,\n			1033,\n			1034,\n			107,\n			1035,\n			1036,\n			1037,\n			1038,\n			108,\n			200,\n			2006,\n			2007,\n			2008,\n			2009,\n			2000,\n			2001,\n			2002,\n			2003,\n			2004,\n			2,\n			109,\n			1046,\n			1047,\n			1048,\n			110,\n			1049,\n			1050,\n			1051,\n			1052,\n			1053,\n			1054,\n			1055,\n			501,\n			1043,\n			1044,\n			1045,\n			500,\n			1039,\n			1040,\n			1041,\n			1042,\n			3,\n			2010,\n			2011,\n			2012,\n			114,\n			1056,\n			1057,\n			2028,\n			115,\n			2013,\n			2018,\n			2020,\n			2021,\n			2014,\n			2024,\n			2015,\n			2023,\n			2016,\n			2017,\n			2019,\n			2022\n		],\n		\"remark\":\"1111144444444\",\n		\"roleKey\":\"4444\",\n		\"roleName\":\"444\",\n		\"roleSort\":444\n	}\n]', 0, NULL, '2022-10-17 15:08:34');
INSERT INTO `sys_oper_log` VALUES (6, '角色管理', 2, 'com.marisfrolg.system.controller.SysRoleController.changeStatus()', 'POST', 1, 'admin', NULL, '/role/changeStatus', '192.168.12.104', '内网IP', '[\n	23,\n	\"1\"\n]', 0, NULL, '2022-10-17 15:10:24');
INSERT INTO `sys_oper_log` VALUES (7, '角色管理', 2, 'com.marisfrolg.system.controller.SysRoleController.changeStatus()', 'POST', 1, 'admin', NULL, '/role/changeStatus', '192.168.12.104', '内网IP', '[\n	23,\n	\"0\"\n]', 0, NULL, '2022-10-17 15:10:27');
INSERT INTO `sys_oper_log` VALUES (8, '导出操作日志', 5, 'com.marisfrolg.system.controller.SysOperLogController.export()', 'POST', 1, 'admin', NULL, '/operLog/export', '192.168.12.104', '内网IP', '[\n	{\n		\n	}\n]', 0, NULL, '2022-10-17 15:22:56');
INSERT INTO `sys_oper_log` VALUES (9, '导出操作日志', 5, 'com.marisfrolg.system.controller.SysOperLogController.export()', 'POST', 1, 'admin', NULL, '/operLog/export', '192.168.12.104', '内网IP', '[\n	{\n		\n	}\n]', 0, NULL, '2022-10-17 15:26:20');
INSERT INTO `sys_oper_log` VALUES (10, '导出操作日志', 5, 'com.marisfrolg.system.controller.SysOperLogController.export()', 'POST', 1, 'admin', NULL, '/operLog/export', '192.168.12.104', '内网IP', '[\n	{\n		\n	}\n]', 0, NULL, '2022-10-17 15:26:46');
INSERT INTO `sys_oper_log` VALUES (11, '导出操作日志', 5, 'com.marisfrolg.system.controller.SysOperLogController.export()', 'POST', 1, 'admin', NULL, '/operLog/export', '192.168.12.104', '内网IP', '[\n	{\n		\n	}\n]', 0, NULL, '2022-10-17 15:26:51');
INSERT INTO `sys_oper_log` VALUES (12, '导出操作日志', 5, 'com.marisfrolg.system.controller.SysOperLogController.export()', 'POST', 1, 'admin', NULL, '/operLog/export', '192.168.12.104', '内网IP', '[\n	{\n		\n	}\n]', 0, NULL, '2022-10-17 15:26:59');
INSERT INTO `sys_oper_log` VALUES (13, '角色管理', 3, 'com.marisfrolg.system.controller.SysRoleController.remove()', 'POST', 1, 'admin', NULL, '/role/remove', '192.168.12.104', '内网IP', '[\n	\"23\"\n]', 0, NULL, '2022-10-17 15:27:40');
INSERT INTO `sys_oper_log` VALUES (14, '导出操作日志', 5, 'com.marisfrolg.system.controller.SysOperLogController.export()', 'POST', 1, 'admin', NULL, '/operLog/export', '192.168.12.104', '内网IP', '[\n	{\n		\n	}\n]', 0, NULL, '2022-10-17 15:28:08');
INSERT INTO `sys_oper_log` VALUES (15, '导出操作日志', 5, 'com.marisfrolg.system.controller.SysOperLogController.export()', 'POST', 1, 'admin', NULL, '/operLog/export', '192.168.12.104', '内网IP', '[\n	{\n		\n	}\n]', 0, NULL, '2022-10-17 15:28:22');
INSERT INTO `sys_oper_log` VALUES (16, '导出操作日志', 5, 'com.marisfrolg.system.controller.SysOperLogController.export()', 'POST', 1, 'admin', NULL, '/operLog/export', '192.168.12.104', '内网IP', '[\n	{\n		\n	}\n]', 0, NULL, '2022-10-17 15:29:29');
INSERT INTO `sys_oper_log` VALUES (17, '导出操作日志', 5, 'com.marisfrolg.system.controller.SysOperLogController.export()', 'POST', 1, 'admin', NULL, '/operLog/export', '192.168.12.104', '内网IP', '[\n	{\n		\n	}\n]', 0, NULL, '2022-10-17 15:29:39');
INSERT INTO `sys_oper_log` VALUES (18, '导出操作日志', 5, 'com.marisfrolg.system.controller.SysOperLogController.export()', 'POST', 1, 'admin', NULL, '/operLog/export', '192.168.12.104', '内网IP', '[\n	{\n		\n	}\n]', 0, NULL, '2022-10-17 15:29:58');
INSERT INTO `sys_oper_log` VALUES (19, '导出操作日志', 5, 'com.marisfrolg.system.controller.SysOperLogController.export()', 'POST', 1, 'admin', NULL, '/operLog/export', '192.168.12.104', '内网IP', '[\n	{\n		\n	}\n]', 0, NULL, '2022-10-17 15:30:09');
INSERT INTO `sys_oper_log` VALUES (20, '导出操作日志', 5, 'com.marisfrolg.system.controller.SysOperLogController.export()', 'POST', 1, 'admin', NULL, '/operLog/export', '192.168.12.104', '内网IP', '[\n	{\n		\n	}\n]', 0, NULL, '2022-10-17 15:30:19');
INSERT INTO `sys_oper_log` VALUES (21, '导出操作日志', 5, 'com.marisfrolg.system.controller.SysOperLogController.export()', 'POST', 1, 'admin', NULL, '/operLog/export', '192.168.12.104', '内网IP', '[\n	{\n		\n	}\n]', 0, NULL, '2022-10-17 15:30:28');
INSERT INTO `sys_oper_log` VALUES (22, '导出操作日志', 5, 'com.marisfrolg.system.controller.SysOperLogController.export()', 'POST', 1, 'admin', NULL, '/operLog/export', '192.168.12.104', '内网IP', '[\n	{\n		\n	}\n]', 0, NULL, '2022-10-17 15:30:34');
INSERT INTO `sys_oper_log` VALUES (23, '导出操作日志', 5, 'com.marisfrolg.system.controller.SysOperLogController.export()', 'POST', 1, 'admin', NULL, '/operLog/export', '192.168.12.104', '内网IP', '[\n	{\n		\n	}\n]', 0, NULL, '2022-10-17 15:30:41');
INSERT INTO `sys_oper_log` VALUES (24, '角色管理', 2, 'com.marisfrolg.system.controller.SysRoleController.authDataScopeSave()', 'POST', 1, 'admin', NULL, '/role/authDataScope', '127.0.0.1', '内网IP', '[\n	{\n		\"dataScope\":\"2\",\n		\"deptIds\":[100,101,105,102,108,109],\n		\"roleId\":2\n	}\n]', 0, NULL, '2022-10-17 15:34:14');
INSERT INTO `sys_oper_log` VALUES (25, '角色管理', 2, 'com.marisfrolg.system.controller.SysRoleController.authDataScopeSave()', 'POST', 1, 'admin', NULL, '/role/authDataScope', '192.168.12.104', '内网IP', '[\n	{\n		\"dataScope\":\"2\",\n		\"deptIds\":[100,101,105,102,108,109],\n		\"roleId\":2\n	}\n]', 0, NULL, '2022-10-17 15:40:44');
INSERT INTO `sys_oper_log` VALUES (26, '部门管理', 2, 'com.marisfrolg.system.controller.SysDeptController.editSave()', 'POST', 1, 'admin', NULL, '/dept/update', '192.168.12.104', '内网IP', '[\n	{\n		\"deptId\":101,\n		\"deptName\":\"深圳总公司\",\n		\"email\":\"ry222@qq.com\",\n		\"leader\":\"张三\",\n		\"leaderId\":1,\n		\"orderNum\":1,\n		\"parentId\":100,\n		\"phone\":\"15888888888\",\n		\"status\":\"0\"\n	}\n]', 0, NULL, '2022-10-17 15:41:25');
INSERT INTO `sys_oper_log` VALUES (27, '部门管理', 1, 'com.marisfrolg.system.controller.SysDeptController.addSave()', 'POST', 1, 'admin', NULL, '/dept/save', '192.168.12.104', '内网IP', '[\n	{\n		\"deptName\":\"测试部门\",\n		\"email\":\"22@qq.com\",\n		\"leader\":\"123\",\n		\"orderNum\":1,\n		\"parentId\":116,\n		\"phone\":\"13632685644\"\n	}\n]', 0, NULL, '2022-10-17 15:42:12');
INSERT INTO `sys_oper_log` VALUES (28, '部门管理', 2, 'com.marisfrolg.system.controller.SysDeptController.editSave()', 'POST', 1, 'admin', NULL, '/dept/update', '192.168.12.104', '内网IP', '[\n	{\n		\"deptId\":119,\n		\"deptName\":\"测试部门\",\n		\"email\":\"2233@qq.com\",\n		\"leader\":\"123\",\n		\"orderNum\":1,\n		\"parentId\":116,\n		\"phone\":\"13632685644\",\n		\"status\":\"0\"\n	}\n]', 0, NULL, '2022-10-17 15:42:35');
INSERT INTO `sys_oper_log` VALUES (29, '部门管理', 3, 'com.marisfrolg.system.controller.SysDeptController.remove()', 'POST', 1, 'admin', NULL, '/dept/remove', '192.168.12.104', '内网IP', '[\n	119\n]', 0, NULL, '2022-10-17 15:44:10');
INSERT INTO `sys_oper_log` VALUES (30, '角色管理', 1, 'com.marisfrolg.system.controller.SysRoleController.addSave()', 'POST', 1, 'admin', NULL, '/role/save', '192.168.12.104', '内网IP', '[\n	{\n		\"deptIds\":[],\n		\"menuIds\":[],\n		\"roleKey\":\"地方\",\n		\"roleName\":\"地方\",\n		\"roleSort\":1\n	}\n]', 0, NULL, '2022-10-17 15:47:24');
INSERT INTO `sys_oper_log` VALUES (31, '岗位管理', 1, 'com.marisfrolg.system.controller.SysPostController.addSave()', 'POST', 1, 'admin', NULL, '/sys/sysPost/save', '192.168.12.104', '内网IP', '[\n	{\n		\"postCode\":\"boy\",\n		\"postName\":\"boy\",\n		\"postSort\":\"11\"\n	}\n]', 0, NULL, '2022-10-17 15:47:43');
INSERT INTO `sys_oper_log` VALUES (32, '岗位管理', 2, 'com.marisfrolg.system.controller.SysPostController.editSave()', 'POST', 1, 'admin', NULL, '/sys/sysPost/update', '192.168.12.104', '内网IP', '[\n	{\n		\"postCode\":\"boy\",\n		\"postId\":11,\n		\"postName\":\"boy\",\n		\"postSort\":\"11\",\n		\"status\":\"0\"\n	}\n]', 0, NULL, '2022-10-17 15:47:55');
INSERT INTO `sys_oper_log` VALUES (33, '岗位管理', 3, 'com.marisfrolg.system.controller.SysPostController.remove()', 'POST', 1, 'admin', NULL, '/sys/sysPost/remove', '192.168.12.104', '内网IP', '[\n	\"11\"\n]', 0, NULL, '2022-10-17 15:48:42');
INSERT INTO `sys_oper_log` VALUES (34, '访问日志', 3, 'com.marisfrolg.system.controller.SysLoginInforController.remove()', 'POST', 1, 'admin', NULL, '/logininfor/remove', '192.168.12.104', '内网IP', '[\n	\"10817\"\n]', 0, NULL, '2022-10-17 16:23:35');
INSERT INTO `sys_oper_log` VALUES (35, '访问日志', 9, 'com.marisfrolg.system.controller.SysLoginInforController.clean()', 'POST', 1, 'admin', NULL, '/logininfor/clean', '192.168.12.104', '内网IP', '[]', 0, NULL, '2022-10-17 16:26:00');
INSERT INTO `sys_oper_log` VALUES (36, '菜单管理', 1, 'com.marisfrolg.system.controller.SysMenuController.addSave()', 'POST', 1, 'admin', NULL, '/menu/save', '192.168.12.104', '内网IP', '[\n	{\n		\"icon\":\"404\",\n		\"menuKey\":\"1\",\n		\"menuName\":\"11\",\n		\"menuType\":\"C\",\n		\"orderNum\":\"1\",\n		\"parentId\":0,\n		\"path\":\"1\",\n		\"visible\":\"0\"\n	}\n]', 0, NULL, '2022-10-17 16:28:30');
INSERT INTO `sys_oper_log` VALUES (37, '菜单管理', 2, 'com.marisfrolg.system.controller.SysMenuController.editSave()', 'POST', 1, 'admin', NULL, '/menu/update', '192.168.12.104', '内网IP', '[\n	{\n		\"icon\":\"404\",\n		\"menuId\":2033,\n		\"menuKey\":\"1\",\n		\"menuName\":\"1122\",\n		\"menuType\":\"C\",\n		\"orderNum\":\"1\",\n		\"parentId\":0,\n		\"path\":\"1\",\n		\"perms\":\"\",\n		\"target\":\"\",\n		\"visible\":\"0\"\n	}\n]', 0, NULL, '2022-10-17 16:29:08');
INSERT INTO `sys_oper_log` VALUES (38, '菜单管理', 3, 'com.marisfrolg.system.controller.SysMenuController.remove()', 'POST', 1, 'admin', NULL, '/menu/remove/2033', '192.168.12.104', '内网IP', '[\n	2033\n]', 1, 'HV000030: No validator could be found for constraint \'javax.validation.constraints.NotEmpty\' validating type \'java.lang.Long\'. Check configuration for \'remove.menuId\'', '2022-10-17 16:29:29');
INSERT INTO `sys_oper_log` VALUES (39, '菜单管理', 3, 'com.marisfrolg.system.controller.SysMenuController.remove()', 'POST', 1, 'admin', NULL, '/menu/remove/2033', '192.168.12.104', '内网IP', '[\n	2033\n]', 1, 'HV000030: No validator could be found for constraint \'javax.validation.constraints.NotEmpty\' validating type \'java.lang.Long\'. Check configuration for \'remove.menuId\'', '2022-10-17 16:41:46');
INSERT INTO `sys_oper_log` VALUES (40, '菜单管理', 3, 'com.marisfrolg.system.controller.SysMenuController.remove()', 'POST', 1, 'admin', NULL, '/menu/remove/2033', '192.168.12.104', '内网IP', '[\n	2033\n]', 1, 'HV000030: No validator could be found for constraint \'javax.validation.constraints.NotEmpty\' validating type \'java.lang.Long\'. Check configuration for \'remove.menuId\'', '2022-10-17 16:44:52');
INSERT INTO `sys_oper_log` VALUES (41, '菜单管理', 3, 'com.marisfrolg.system.controller.SysMenuController.remove()', 'POST', 1, 'admin', NULL, '/menu/remove/2033', '192.168.12.104', '内网IP', '[\n	2033\n]', 1, 'HV000030: No validator could be found for constraint \'javax.validation.constraints.NotEmpty\' validating type \'java.lang.Long\'. Check configuration for \'remove.menuId\'', '2022-10-17 16:55:33');
INSERT INTO `sys_oper_log` VALUES (42, '菜单管理', 3, 'com.marisfrolg.system.controller.SysMenuController.remove()', 'POST', 1, 'admin', NULL, '/menu/remove/2033', '192.168.12.104', '内网IP', '[\n	2033\n]', 1, 'HV000030: No validator could be found for constraint \'javax.validation.constraints.NotEmpty\' validating type \'java.lang.Long\'. Check configuration for \'remove.menuId\'', '2022-10-17 16:55:41');
INSERT INTO `sys_oper_log` VALUES (43, '菜单管理', 2, 'com.marisfrolg.system.controller.SysMenuController.editSave()', 'POST', 1, 'admin', NULL, '/menu/update', '192.168.12.104', '内网IP', '[\n	{\n		\"icon\":\"404\",\n		\"menuId\":2033,\n		\"menuKey\":\"1\",\n		\"menuName\":\"1122\",\n		\"menuType\":\"C\",\n		\"orderNum\":\"1\",\n		\"parentId\":0,\n		\"path\":\"/1\",\n		\"perms\":\"\",\n		\"target\":\"\",\n		\"visible\":\"0\"\n	}\n]', 0, NULL, '2022-10-17 16:55:50');
INSERT INTO `sys_oper_log` VALUES (44, '菜单管理', 3, 'com.marisfrolg.system.controller.SysMenuController.remove()', 'POST', 1, 'admin', NULL, '/menu/remove/2033', '192.168.12.104', '内网IP', '[\n	2033\n]', 1, 'HV000030: No validator could be found for constraint \'javax.validation.constraints.NotEmpty\' validating type \'java.lang.Long\'. Check configuration for \'remove.menuId\'', '2022-10-17 16:56:39');
INSERT INTO `sys_oper_log` VALUES (45, '用户管理', 1, 'com.marisfrolg.system.controller.SysUserController.addSave()', 'POST', 1, 'admin', NULL, '/user/save', '192.168.12.104', '内网IP', '[\n	{\n		\"deptId\":116,\n		\"loginName\":\"4444\",\n		\"password\":\"4444\",\n		\"postIds\":[1],\n		\"roleIds\":[\n			1\n		],\n		\"sex\":\"0\",\n		\"userName\":\"333\"\n	}\n]', 0, NULL, '2022-10-18 10:00:40');
INSERT INTO `sys_oper_log` VALUES (46, '用户管理', 2, 'com.marisfrolg.system.controller.SysUserController.updateInfo()', 'POST', 1, 'admin', NULL, '/user/update/info', '192.168.12.104', '内网IP', '[\n	{\n		\"avatar\":\"\",\n		\"delFlag\":\"0\",\n		\"deptId\":116,\n		\"email\":\"\",\n		\"phoneNumber\":\"13632554444\",\n		\"remark\":\"\",\n		\"roleIds\":[\n			1\n		],\n		\"sex\":\"0\",\n		\"status\":\"0\",\n		\"userId\":14,\n		\"userName\":\"333\"\n	}\n]', 0, NULL, '2022-10-18 10:02:38');
INSERT INTO `sys_oper_log` VALUES (47, '用户管理', 3, 'com.marisfrolg.system.controller.SysUserController.remove()', 'POST', 1, 'admin', NULL, '/user/remove', '192.168.12.104', '内网IP', '[\n	\"14\"\n]', 0, NULL, '2022-10-18 10:02:54');
INSERT INTO `sys_oper_log` VALUES (48, '用户管理', 1, 'com.marisfrolg.system.controller.SysUserController.addSave()', 'POST', 1, 'admin', NULL, '/user/save', '192.168.12.104', '内网IP', '[\n	{\n		\"deptId\":116,\n		\"loginName\":\"4444\",\n		\"password\":\"4444\",\n		\"postIds\":[],\n		\"roleIds\":[],\n		\"userName\":\"3333\"\n	}\n]', 0, NULL, '2022-10-18 10:06:24');
INSERT INTO `sys_oper_log` VALUES (49, '用户管理', 1, 'com.marisfrolg.system.controller.SysUserController.addSave()', 'POST', 1, 'admin', NULL, '/user/save', '192.168.12.104', '内网IP', '[\n	{\n		\"deptId\":116,\n		\"loginName\":\"44444\",\n		\"password\":\"44444\",\n		\"postIds\":[],\n		\"roleIds\":[],\n		\"userName\":\"3333\"\n	}\n]', 0, NULL, '2022-10-18 10:06:31');
INSERT INTO `sys_oper_log` VALUES (50, '用户管理', 1, 'com.marisfrolg.system.controller.SysUserController.addSave()', 'POST', 1, 'admin', NULL, '/user/save', '192.168.12.104', '内网IP', '[\n	{\n		\"deptId\":116,\n		\"loginName\":\"11111111\",\n		\"password\":\"11111111\",\n		\"postIds\":[],\n		\"roleIds\":[],\n		\"userName\":\"111\"\n	}\n]', 0, NULL, '2022-10-19 08:48:37');
INSERT INTO `sys_oper_log` VALUES (51, '用户管理', 1, 'com.marisfrolg.system.controller.SysUserController.addSave()', 'POST', 1, NULL, NULL, '/user/save', '127.0.0.1', '内网IP', '[\n	{\n		\"avatar\":\"https://api.marisfrolg-data.xyz/hr/UploadFile/png/201701091031423059.png\",\n		\"deptId\":100,\n		\"email\":\"aaa@qq.com\",\n		\"loginName\":\"aaa\",\n		\"password\":\"pwdPWD123!@#\",\n		\"phoneNumber\":\"13100001100\",\n		\"postIds\":[],\n		\"remark\":\"数字零售部门给外部人员使用\",\n		\"roleIds\":[],\n		\"sex\":\"0\",\n		\"userName\":\"小盆友\"\n	}\n]', 1, 'forbidden', '2022-10-19 09:07:06');
INSERT INTO `sys_oper_log` VALUES (52, '用户管理', 1, 'com.marisfrolg.system.controller.SysUserController.addSave()', 'POST', 1, NULL, NULL, '/user/save', '127.0.0.1', '内网IP', '[\n	{\n		\"avatar\":\"https://api.marisfrolg-data.xyz/hr/UploadFile/png/201701091031423059.png\",\n		\"deptId\":100,\n		\"email\":\"aaa@qq.com\",\n		\"loginName\":\"aaa\",\n		\"password\":\"pwdPWD123!@#\",\n		\"phoneNumber\":\"13100001100\",\n		\"postIds\":[],\n		\"remark\":\"数字零售部门给外部人员使用\",\n		\"roleIds\":[],\n		\"sex\":\"0\",\n		\"userName\":\"小盆友\"\n	}\n]', 1, 'forbidden', '2022-10-19 09:07:37');
INSERT INTO `sys_oper_log` VALUES (53, '用户管理', 1, 'com.marisfrolg.system.controller.SysUserController.addSave()', 'POST', 1, NULL, NULL, '/user/save', '127.0.0.1', '内网IP', '[\n	{\n		\"avatar\":\"https://api.marisfrolg-data.xyz/hr/UploadFile/png/201701091031423059.png\",\n		\"deptId\":100,\n		\"email\":\"aaa@qq.com\",\n		\"loginName\":\"aaa\",\n		\"password\":\"pwdPWD123!@#\",\n		\"phoneNumber\":\"13100001100\",\n		\"postIds\":[],\n		\"remark\":\"数字零售部门给外部人员使用\",\n		\"roleIds\":[],\n		\"sex\":\"0\",\n		\"userName\":\"小盆友\"\n	}\n]', 1, 'forbidden', '2022-10-19 09:07:49');
INSERT INTO `sys_oper_log` VALUES (54, '用户管理', 1, 'com.marisfrolg.system.controller.SysUserController.addSave()', 'POST', 1, NULL, NULL, '/user/save', '127.0.0.1', '内网IP', '[\n	{\n		\"avatar\":\"https://api.marisfrolg-data.xyz/hr/UploadFile/png/201701091031423059.png\",\n		\"deptId\":100,\n		\"email\":\"aaa@qq.com\",\n		\"loginName\":\"aaa\",\n		\"password\":\"pwdPWD123!@#\",\n		\"phoneNumber\":\"13100001100\",\n		\"postIds\":[],\n		\"remark\":\"数字零售部门给外部人员使用\",\n		\"roleIds\":[],\n		\"sex\":\"0\",\n		\"userName\":\"小盆友\"\n	}\n]', 1, 'forbidden', '2022-10-19 09:08:34');
INSERT INTO `sys_oper_log` VALUES (55, '用户管理', 1, 'com.marisfrolg.system.controller.SysUserController.addSave()', 'POST', 1, NULL, NULL, '/user/save', '127.0.0.1', '内网IP', '[\n	{\n		\"avatar\":\"https://api.marisfrolg-data.xyz/hr/UploadFile/png/201701091031423059.png\",\n		\"deptId\":100,\n		\"email\":\"aaa@qq.com\",\n		\"loginName\":\"aaa\",\n		\"password\":\"pwdPWD123!@#\",\n		\"phoneNumber\":\"13100001100\",\n		\"postIds\":[],\n		\"remark\":\"aa\",\n		\"roleIds\":[],\n		\"sex\":\"0\",\n		\"userName\":\"aa\"\n	}\n]', 0, NULL, '2022-10-19 09:09:26');
INSERT INTO `sys_oper_log` VALUES (56, '用户管理', 3, 'com.marisfrolg.system.controller.SysUserController.remove()', 'POST', 1, 'admin', NULL, '/user/remove', '192.168.12.104', '内网IP', '[\n	\"16\"\n]', 0, NULL, '2022-10-19 10:36:17');
INSERT INTO `sys_oper_log` VALUES (57, '用户管理', 3, 'com.marisfrolg.system.controller.SysUserController.remove()', 'POST', 1, 'admin', NULL, '/user/remove', '192.168.12.104', '内网IP', '[\n	\"15\"\n]', 0, NULL, '2022-10-19 10:36:21');
INSERT INTO `sys_oper_log` VALUES (58, '用户管理', 1, 'com.marisfrolg.system.controller.SysUserController.addSave()', 'POST', 1, 'admin', NULL, '/user/save', '192.168.12.104', '内网IP', '[\n	{\n		\"deptId\":116,\n		\"loginName\":\"5566\",\n		\"password\":\"5566\",\n		\"phoneNumber\":\"13632644556\",\n		\"postIds\":[],\n		\"roleIds\":[],\n		\"userName\":\"444\"\n	}\n]', 0, NULL, '2022-10-19 10:40:09');
INSERT INTO `sys_oper_log` VALUES (59, '用户管理', 3, 'com.marisfrolg.system.controller.SysUserController.remove()', 'POST', 1, 'admin', NULL, '/user/remove', '192.168.12.104', '内网IP', '[\n	\"18\"\n]', 0, NULL, '2022-10-19 10:40:18');

-- ----------------------------
-- Table structure for sys_oss
-- ----------------------------
DROP TABLE IF EXISTS `sys_oss`;
CREATE TABLE `sys_oss`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `file_name` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '' COMMENT '文件名',
  `file_suffix` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '' COMMENT '文件后缀名',
  `url` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'URL地址',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `create_by` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '' COMMENT '上传人',
  `service` tinyint NOT NULL DEFAULT 1 COMMENT '服务商',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 55 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '文件上传' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_oss
-- ----------------------------
INSERT INTO `sys_oss` VALUES (31, '12.jpeg', '.jpeg', 'http://img.zmrit.com/upload/20190812/07c9c9fa045d41249887059cc52079cf.jpeg', '2019-08-12 17:33:44', 'admin', 1);
INSERT INTO `sys_oss` VALUES (32, '9.jpeg', '.jpeg', 'http://img.zmrit.com/upload/20190812/1259bffa90f84cb1baead19596544101.jpeg', '2019-08-12 17:34:27', 'admin', 1);
INSERT INTO `sys_oss` VALUES (33, '10.jpeg', '.jpeg', 'http://img.zmrit.com/upload/20190812/296a5da21e464410a5185c668d406385.jpeg', '2019-08-12 17:34:40', 'admin', 1);
INSERT INTO `sys_oss` VALUES (34, '16.jpeg', '.jpeg', 'http://img.zmrit.com/upload/20190812/bbfe2aa81abb4ff59cedaaaa3c918a03.jpeg', '2019-08-12 17:45:56', 'admin', 1);
INSERT INTO `sys_oss` VALUES (35, '24.jpeg', '.jpeg', 'http://img.zmrit.com/upload/20190812/792f292f416c4183b2ebf60a983ee2ae.jpeg', '2019-08-12 17:48:29', 'admin', 1);
INSERT INTO `sys_oss` VALUES (36, '2.jpeg', '.jpeg', 'http://img.zmrit.com/upload/20190812/3d50ba7be5b7462abde7a860378e4576.jpeg', '2019-08-12 17:49:01', 'admin', 1);
INSERT INTO `sys_oss` VALUES (37, '2.jpeg', '.jpeg', 'http://img.zmrit.com/upload/20190812/813f2662842f49e0a67a684bba1138a3.jpeg', '2019-08-12 17:49:09', 'admin', 1);
INSERT INTO `sys_oss` VALUES (38, '11.jpeg', '.jpeg', 'http://img.zmrit.com/upload/20190812/b7eaf058f0214f35a82adb5c566a9ef5.jpeg', '2019-08-12 17:50:43', 'admin', 1);
INSERT INTO `sys_oss` VALUES (39, '12.jpeg', '.jpeg', 'http://img.zmrit.com/upload/20190812/cebe988c394044ceafb918f22de5eb4a.jpeg', '2019-08-12 17:50:54', 'admin', 1);
INSERT INTO `sys_oss` VALUES (40, '19.jpeg', '.jpeg', 'http://wind-oss.oss-cn-hangzhou.aliyuncs.com/wind/20190813/3584b54c9aff4925a4bf192e064dda63.jpeg', '2019-08-13 11:16:18', 'admin', 2);
INSERT INTO `sys_oss` VALUES (41, '20.jpeg', '.jpeg', 'http://wind-oss.oss-cn-hangzhou.aliyuncs.com/wind/20190813/0364f530f5e54fe290220ec4905fe43e.jpeg', '2019-08-13 11:16:35', 'admin', 2);
INSERT INTO `sys_oss` VALUES (42, '31.jpeg', '.jpeg', 'http://wind-oss.oss-cn-hangzhou.aliyuncs.com/wind/20190813/418a402aac6a48b9959e78daf55a3c10.jpeg', '2019-08-13 11:16:42', 'admin', 2);
INSERT INTO `sys_oss` VALUES (43, '20.jpeg', '.jpeg', 'https://wind-1252218071.cos.ap-shanghai.myqcloud.com/wind/20190813/dfa8fdacb4d2471bbb50a176e1865029.jpeg', '2019-08-13 11:31:31', 'admin', 3);
INSERT INTO `sys_oss` VALUES (44, 'ccccccccccccc', 'aa', 'https://www.ccc.com', '2019-08-13 11:37:38', 'admin', 2);

-- ----------------------------
-- Table structure for sys_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_post`;
CREATE TABLE `sys_post`  (
  `post_id` int NOT NULL AUTO_INCREMENT COMMENT '岗位ID',
  `post_code` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '岗位编码',
  `post_name` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '岗位名称',
  `post_sort` int NOT NULL COMMENT '显示顺序',
  `status` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`post_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '岗位信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_post
-- ----------------------------
INSERT INTO `sys_post` VALUES (1, 'CEO', '董事长', 1, '0', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '');
INSERT INTO `sys_post` VALUES (2, 'se', '项目经理', 2, '0', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '');
INSERT INTO `sys_post` VALUES (3, 'hr', '人力资源', 3, '0', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '');
INSERT INTO `sys_post` VALUES (4, 'user', '普通员工', 4, '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_post` VALUES (5, '1111', '测试岗位', 4, '0', '', '2022-09-26 13:54:55', '', NULL, NULL);
INSERT INTO `sys_post` VALUES (6, '22', '测试岗位2', 5, '0', '', '2022-09-26 13:55:18', '', NULL, NULL);
INSERT INTO `sys_post` VALUES (10, 'aad1231111111', '11111111111', 9, '1', 'admin', '2022-10-14 13:11:24', 'admin', '2022-10-14 13:15:45', NULL);

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `role_id` int NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `role_name` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '角色名称',
  `role_key` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '角色权限字符串',
  `role_sort` int NOT NULL COMMENT '显示顺序',
  `data_scope` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '1' COMMENT '数据范围（1：全部数据权限 2：自定数据权限）',
  `status` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '0' COMMENT '角色状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`role_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 25 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '角色信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES (1, '管理员', 'admin', 1, '1', '0', '0', 'admin', '2018-03-16 11:33:00', 'admin', '2022-10-12 11:33:50', '管理员');

-- ----------------------------
-- Table structure for sys_role_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_dept`;
CREATE TABLE `sys_role_dept`  (
  `role_id` int NOT NULL COMMENT '角色ID',
  `dept_id` int NOT NULL COMMENT '部门ID',
  PRIMARY KEY (`role_id`, `dept_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '角色和部门关联表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_role_dept
-- ----------------------------
INSERT INTO `sys_role_dept` VALUES (2, 100);
INSERT INTO `sys_role_dept` VALUES (2, 101);
INSERT INTO `sys_role_dept` VALUES (2, 102);
INSERT INTO `sys_role_dept` VALUES (2, 105);
INSERT INTO `sys_role_dept` VALUES (2, 108);
INSERT INTO `sys_role_dept` VALUES (2, 109);
INSERT INTO `sys_role_dept` VALUES (17, 100);
INSERT INTO `sys_role_dept` VALUES (17, 101);
INSERT INTO `sys_role_dept` VALUES (17, 103);
INSERT INTO `sys_role_dept` VALUES (17, 104);
INSERT INTO `sys_role_dept` VALUES (17, 105);
INSERT INTO `sys_role_dept` VALUES (17, 106);
INSERT INTO `sys_role_dept` VALUES (17, 107);
INSERT INTO `sys_role_dept` VALUES (17, 113);
INSERT INTO `sys_role_dept` VALUES (17, 114);
INSERT INTO `sys_role_dept` VALUES (17, 115);
INSERT INTO `sys_role_dept` VALUES (19, 113);
INSERT INTO `sys_role_dept` VALUES (19, 115);

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu`  (
  `role_id` int NOT NULL COMMENT '角色ID',
  `menu_id` int NOT NULL COMMENT '菜单ID',
  PRIMARY KEY (`role_id`, `menu_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '角色和菜单关联表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES (1, 1);
INSERT INTO `sys_role_menu` VALUES (1, 2);
INSERT INTO `sys_role_menu` VALUES (1, 3);
INSERT INTO `sys_role_menu` VALUES (1, 100);
INSERT INTO `sys_role_menu` VALUES (1, 101);
INSERT INTO `sys_role_menu` VALUES (1, 102);
INSERT INTO `sys_role_menu` VALUES (1, 103);
INSERT INTO `sys_role_menu` VALUES (1, 104);
INSERT INTO `sys_role_menu` VALUES (1, 105);
INSERT INTO `sys_role_menu` VALUES (1, 106);
INSERT INTO `sys_role_menu` VALUES (1, 107);
INSERT INTO `sys_role_menu` VALUES (1, 108);
INSERT INTO `sys_role_menu` VALUES (1, 109);
INSERT INTO `sys_role_menu` VALUES (1, 110);
INSERT INTO `sys_role_menu` VALUES (1, 111);
INSERT INTO `sys_role_menu` VALUES (1, 112);
INSERT INTO `sys_role_menu` VALUES (1, 114);
INSERT INTO `sys_role_menu` VALUES (1, 115);
INSERT INTO `sys_role_menu` VALUES (1, 200);
INSERT INTO `sys_role_menu` VALUES (1, 500);
INSERT INTO `sys_role_menu` VALUES (1, 501);
INSERT INTO `sys_role_menu` VALUES (1, 1000);
INSERT INTO `sys_role_menu` VALUES (1, 1001);
INSERT INTO `sys_role_menu` VALUES (1, 1002);
INSERT INTO `sys_role_menu` VALUES (1, 1003);
INSERT INTO `sys_role_menu` VALUES (1, 1004);
INSERT INTO `sys_role_menu` VALUES (1, 1005);
INSERT INTO `sys_role_menu` VALUES (1, 1006);
INSERT INTO `sys_role_menu` VALUES (1, 1007);
INSERT INTO `sys_role_menu` VALUES (1, 1008);
INSERT INTO `sys_role_menu` VALUES (1, 1009);
INSERT INTO `sys_role_menu` VALUES (1, 1010);
INSERT INTO `sys_role_menu` VALUES (1, 1011);
INSERT INTO `sys_role_menu` VALUES (1, 1012);
INSERT INTO `sys_role_menu` VALUES (1, 1013);
INSERT INTO `sys_role_menu` VALUES (1, 1014);
INSERT INTO `sys_role_menu` VALUES (1, 1015);
INSERT INTO `sys_role_menu` VALUES (1, 1016);
INSERT INTO `sys_role_menu` VALUES (1, 1017);
INSERT INTO `sys_role_menu` VALUES (1, 1018);
INSERT INTO `sys_role_menu` VALUES (1, 1019);
INSERT INTO `sys_role_menu` VALUES (1, 1020);
INSERT INTO `sys_role_menu` VALUES (1, 1021);
INSERT INTO `sys_role_menu` VALUES (1, 1022);
INSERT INTO `sys_role_menu` VALUES (1, 1023);
INSERT INTO `sys_role_menu` VALUES (1, 1024);
INSERT INTO `sys_role_menu` VALUES (1, 1025);
INSERT INTO `sys_role_menu` VALUES (1, 1026);
INSERT INTO `sys_role_menu` VALUES (1, 1027);
INSERT INTO `sys_role_menu` VALUES (1, 1028);
INSERT INTO `sys_role_menu` VALUES (1, 1029);
INSERT INTO `sys_role_menu` VALUES (1, 1030);
INSERT INTO `sys_role_menu` VALUES (1, 1031);
INSERT INTO `sys_role_menu` VALUES (1, 1032);
INSERT INTO `sys_role_menu` VALUES (1, 1033);
INSERT INTO `sys_role_menu` VALUES (1, 1034);
INSERT INTO `sys_role_menu` VALUES (1, 1035);
INSERT INTO `sys_role_menu` VALUES (1, 1036);
INSERT INTO `sys_role_menu` VALUES (1, 1037);
INSERT INTO `sys_role_menu` VALUES (1, 1038);
INSERT INTO `sys_role_menu` VALUES (1, 1039);
INSERT INTO `sys_role_menu` VALUES (1, 1040);
INSERT INTO `sys_role_menu` VALUES (1, 1041);
INSERT INTO `sys_role_menu` VALUES (1, 1042);
INSERT INTO `sys_role_menu` VALUES (1, 1043);
INSERT INTO `sys_role_menu` VALUES (1, 1044);
INSERT INTO `sys_role_menu` VALUES (1, 1045);
INSERT INTO `sys_role_menu` VALUES (1, 1046);
INSERT INTO `sys_role_menu` VALUES (1, 1047);
INSERT INTO `sys_role_menu` VALUES (1, 1048);
INSERT INTO `sys_role_menu` VALUES (1, 1049);
INSERT INTO `sys_role_menu` VALUES (1, 1050);
INSERT INTO `sys_role_menu` VALUES (1, 1051);
INSERT INTO `sys_role_menu` VALUES (1, 1052);
INSERT INTO `sys_role_menu` VALUES (1, 1053);
INSERT INTO `sys_role_menu` VALUES (1, 1054);
INSERT INTO `sys_role_menu` VALUES (1, 1055);
INSERT INTO `sys_role_menu` VALUES (1, 1056);
INSERT INTO `sys_role_menu` VALUES (1, 1057);
INSERT INTO `sys_role_menu` VALUES (1, 2000);
INSERT INTO `sys_role_menu` VALUES (1, 2001);
INSERT INTO `sys_role_menu` VALUES (1, 2002);
INSERT INTO `sys_role_menu` VALUES (1, 2003);
INSERT INTO `sys_role_menu` VALUES (1, 2004);
INSERT INTO `sys_role_menu` VALUES (1, 2006);
INSERT INTO `sys_role_menu` VALUES (1, 2007);
INSERT INTO `sys_role_menu` VALUES (1, 2008);
INSERT INTO `sys_role_menu` VALUES (1, 2009);
INSERT INTO `sys_role_menu` VALUES (1, 2010);
INSERT INTO `sys_role_menu` VALUES (1, 2011);
INSERT INTO `sys_role_menu` VALUES (1, 2012);
INSERT INTO `sys_role_menu` VALUES (1, 2013);
INSERT INTO `sys_role_menu` VALUES (1, 2014);
INSERT INTO `sys_role_menu` VALUES (1, 2015);
INSERT INTO `sys_role_menu` VALUES (1, 2016);
INSERT INTO `sys_role_menu` VALUES (1, 2017);
INSERT INTO `sys_role_menu` VALUES (1, 2018);
INSERT INTO `sys_role_menu` VALUES (1, 2019);
INSERT INTO `sys_role_menu` VALUES (1, 2020);
INSERT INTO `sys_role_menu` VALUES (1, 2021);
INSERT INTO `sys_role_menu` VALUES (1, 2022);
INSERT INTO `sys_role_menu` VALUES (1, 2023);
INSERT INTO `sys_role_menu` VALUES (1, 2024);
INSERT INTO `sys_role_menu` VALUES (2, 1);
INSERT INTO `sys_role_menu` VALUES (2, 2);
INSERT INTO `sys_role_menu` VALUES (2, 3);
INSERT INTO `sys_role_menu` VALUES (2, 100);
INSERT INTO `sys_role_menu` VALUES (2, 101);
INSERT INTO `sys_role_menu` VALUES (2, 102);
INSERT INTO `sys_role_menu` VALUES (2, 103);
INSERT INTO `sys_role_menu` VALUES (2, 104);
INSERT INTO `sys_role_menu` VALUES (2, 105);
INSERT INTO `sys_role_menu` VALUES (2, 106);
INSERT INTO `sys_role_menu` VALUES (2, 107);
INSERT INTO `sys_role_menu` VALUES (2, 108);
INSERT INTO `sys_role_menu` VALUES (2, 109);
INSERT INTO `sys_role_menu` VALUES (2, 110);
INSERT INTO `sys_role_menu` VALUES (2, 111);
INSERT INTO `sys_role_menu` VALUES (2, 112);
INSERT INTO `sys_role_menu` VALUES (2, 114);
INSERT INTO `sys_role_menu` VALUES (2, 115);
INSERT INTO `sys_role_menu` VALUES (2, 200);
INSERT INTO `sys_role_menu` VALUES (2, 500);
INSERT INTO `sys_role_menu` VALUES (2, 501);
INSERT INTO `sys_role_menu` VALUES (2, 1000);
INSERT INTO `sys_role_menu` VALUES (2, 1001);
INSERT INTO `sys_role_menu` VALUES (2, 1002);
INSERT INTO `sys_role_menu` VALUES (2, 1003);
INSERT INTO `sys_role_menu` VALUES (2, 1004);
INSERT INTO `sys_role_menu` VALUES (2, 1005);
INSERT INTO `sys_role_menu` VALUES (2, 1006);
INSERT INTO `sys_role_menu` VALUES (2, 1007);
INSERT INTO `sys_role_menu` VALUES (2, 1008);
INSERT INTO `sys_role_menu` VALUES (2, 1009);
INSERT INTO `sys_role_menu` VALUES (2, 1010);
INSERT INTO `sys_role_menu` VALUES (2, 1011);
INSERT INTO `sys_role_menu` VALUES (2, 1012);
INSERT INTO `sys_role_menu` VALUES (2, 1013);
INSERT INTO `sys_role_menu` VALUES (2, 1014);
INSERT INTO `sys_role_menu` VALUES (2, 1015);
INSERT INTO `sys_role_menu` VALUES (2, 1016);
INSERT INTO `sys_role_menu` VALUES (2, 1017);
INSERT INTO `sys_role_menu` VALUES (2, 1018);
INSERT INTO `sys_role_menu` VALUES (2, 1019);
INSERT INTO `sys_role_menu` VALUES (2, 1020);
INSERT INTO `sys_role_menu` VALUES (2, 1021);
INSERT INTO `sys_role_menu` VALUES (2, 1022);
INSERT INTO `sys_role_menu` VALUES (2, 1023);
INSERT INTO `sys_role_menu` VALUES (2, 1024);
INSERT INTO `sys_role_menu` VALUES (2, 1025);
INSERT INTO `sys_role_menu` VALUES (2, 1026);
INSERT INTO `sys_role_menu` VALUES (2, 1027);
INSERT INTO `sys_role_menu` VALUES (2, 1028);
INSERT INTO `sys_role_menu` VALUES (2, 1029);
INSERT INTO `sys_role_menu` VALUES (2, 1030);
INSERT INTO `sys_role_menu` VALUES (2, 1031);
INSERT INTO `sys_role_menu` VALUES (2, 1032);
INSERT INTO `sys_role_menu` VALUES (2, 1033);
INSERT INTO `sys_role_menu` VALUES (2, 1034);
INSERT INTO `sys_role_menu` VALUES (2, 1035);
INSERT INTO `sys_role_menu` VALUES (2, 1036);
INSERT INTO `sys_role_menu` VALUES (2, 1037);
INSERT INTO `sys_role_menu` VALUES (2, 1038);
INSERT INTO `sys_role_menu` VALUES (2, 1039);
INSERT INTO `sys_role_menu` VALUES (2, 1040);
INSERT INTO `sys_role_menu` VALUES (2, 1041);
INSERT INTO `sys_role_menu` VALUES (2, 1042);
INSERT INTO `sys_role_menu` VALUES (2, 1043);
INSERT INTO `sys_role_menu` VALUES (2, 1044);
INSERT INTO `sys_role_menu` VALUES (2, 1045);
INSERT INTO `sys_role_menu` VALUES (2, 1046);
INSERT INTO `sys_role_menu` VALUES (2, 1047);
INSERT INTO `sys_role_menu` VALUES (2, 1048);
INSERT INTO `sys_role_menu` VALUES (2, 1049);
INSERT INTO `sys_role_menu` VALUES (2, 1050);
INSERT INTO `sys_role_menu` VALUES (2, 1051);
INSERT INTO `sys_role_menu` VALUES (2, 1052);
INSERT INTO `sys_role_menu` VALUES (2, 1053);
INSERT INTO `sys_role_menu` VALUES (2, 1054);
INSERT INTO `sys_role_menu` VALUES (2, 1055);
INSERT INTO `sys_role_menu` VALUES (2, 1056);
INSERT INTO `sys_role_menu` VALUES (2, 1057);
INSERT INTO `sys_role_menu` VALUES (2, 2000);
INSERT INTO `sys_role_menu` VALUES (2, 2001);
INSERT INTO `sys_role_menu` VALUES (2, 2002);
INSERT INTO `sys_role_menu` VALUES (2, 2003);
INSERT INTO `sys_role_menu` VALUES (2, 2004);
INSERT INTO `sys_role_menu` VALUES (2, 2006);
INSERT INTO `sys_role_menu` VALUES (2, 2007);
INSERT INTO `sys_role_menu` VALUES (2, 2008);
INSERT INTO `sys_role_menu` VALUES (2, 2009);
INSERT INTO `sys_role_menu` VALUES (2, 2010);
INSERT INTO `sys_role_menu` VALUES (2, 2011);
INSERT INTO `sys_role_menu` VALUES (2, 2012);
INSERT INTO `sys_role_menu` VALUES (2, 2013);
INSERT INTO `sys_role_menu` VALUES (2, 2014);
INSERT INTO `sys_role_menu` VALUES (2, 2015);
INSERT INTO `sys_role_menu` VALUES (2, 2016);
INSERT INTO `sys_role_menu` VALUES (2, 2017);
INSERT INTO `sys_role_menu` VALUES (2, 2018);
INSERT INTO `sys_role_menu` VALUES (2, 2019);
INSERT INTO `sys_role_menu` VALUES (2, 2020);
INSERT INTO `sys_role_menu` VALUES (2, 2021);
INSERT INTO `sys_role_menu` VALUES (2, 2022);
INSERT INTO `sys_role_menu` VALUES (2, 2023);
INSERT INTO `sys_role_menu` VALUES (2, 2024);
INSERT INTO `sys_role_menu` VALUES (3, 3);
INSERT INTO `sys_role_menu` VALUES (3, 113);
INSERT INTO `sys_role_menu` VALUES (3, 114);
INSERT INTO `sys_role_menu` VALUES (3, 115);
INSERT INTO `sys_role_menu` VALUES (3, 1056);
INSERT INTO `sys_role_menu` VALUES (3, 1057);
INSERT INTO `sys_role_menu` VALUES (3, 2006);
INSERT INTO `sys_role_menu` VALUES (3, 2007);
INSERT INTO `sys_role_menu` VALUES (3, 2008);
INSERT INTO `sys_role_menu` VALUES (3, 2009);
INSERT INTO `sys_role_menu` VALUES (4, 113);
INSERT INTO `sys_role_menu` VALUES (5, 3);
INSERT INTO `sys_role_menu` VALUES (5, 113);
INSERT INTO `sys_role_menu` VALUES (5, 114);
INSERT INTO `sys_role_menu` VALUES (5, 115);
INSERT INTO `sys_role_menu` VALUES (5, 1056);
INSERT INTO `sys_role_menu` VALUES (5, 1057);
INSERT INTO `sys_role_menu` VALUES (5, 2006);
INSERT INTO `sys_role_menu` VALUES (5, 2007);
INSERT INTO `sys_role_menu` VALUES (5, 2008);
INSERT INTO `sys_role_menu` VALUES (5, 2009);
INSERT INTO `sys_role_menu` VALUES (13, 1);
INSERT INTO `sys_role_menu` VALUES (13, 2);
INSERT INTO `sys_role_menu` VALUES (13, 3);
INSERT INTO `sys_role_menu` VALUES (13, 100);
INSERT INTO `sys_role_menu` VALUES (13, 101);
INSERT INTO `sys_role_menu` VALUES (13, 102);
INSERT INTO `sys_role_menu` VALUES (13, 103);
INSERT INTO `sys_role_menu` VALUES (13, 104);
INSERT INTO `sys_role_menu` VALUES (13, 105);
INSERT INTO `sys_role_menu` VALUES (13, 106);
INSERT INTO `sys_role_menu` VALUES (13, 107);
INSERT INTO `sys_role_menu` VALUES (13, 108);
INSERT INTO `sys_role_menu` VALUES (13, 109);
INSERT INTO `sys_role_menu` VALUES (13, 110);
INSERT INTO `sys_role_menu` VALUES (13, 111);
INSERT INTO `sys_role_menu` VALUES (13, 112);
INSERT INTO `sys_role_menu` VALUES (13, 114);
INSERT INTO `sys_role_menu` VALUES (13, 115);
INSERT INTO `sys_role_menu` VALUES (13, 200);
INSERT INTO `sys_role_menu` VALUES (13, 500);
INSERT INTO `sys_role_menu` VALUES (13, 501);
INSERT INTO `sys_role_menu` VALUES (13, 1000);
INSERT INTO `sys_role_menu` VALUES (13, 1001);
INSERT INTO `sys_role_menu` VALUES (13, 1002);
INSERT INTO `sys_role_menu` VALUES (13, 1003);
INSERT INTO `sys_role_menu` VALUES (13, 1004);
INSERT INTO `sys_role_menu` VALUES (13, 1005);
INSERT INTO `sys_role_menu` VALUES (13, 1006);
INSERT INTO `sys_role_menu` VALUES (13, 1007);
INSERT INTO `sys_role_menu` VALUES (13, 1008);
INSERT INTO `sys_role_menu` VALUES (13, 1009);
INSERT INTO `sys_role_menu` VALUES (13, 1010);
INSERT INTO `sys_role_menu` VALUES (13, 1011);
INSERT INTO `sys_role_menu` VALUES (13, 1012);
INSERT INTO `sys_role_menu` VALUES (13, 1013);
INSERT INTO `sys_role_menu` VALUES (13, 1014);
INSERT INTO `sys_role_menu` VALUES (13, 1015);
INSERT INTO `sys_role_menu` VALUES (13, 1016);
INSERT INTO `sys_role_menu` VALUES (13, 1017);
INSERT INTO `sys_role_menu` VALUES (13, 1018);
INSERT INTO `sys_role_menu` VALUES (13, 1019);
INSERT INTO `sys_role_menu` VALUES (13, 1020);
INSERT INTO `sys_role_menu` VALUES (13, 1021);
INSERT INTO `sys_role_menu` VALUES (13, 1022);
INSERT INTO `sys_role_menu` VALUES (13, 1023);
INSERT INTO `sys_role_menu` VALUES (13, 1024);
INSERT INTO `sys_role_menu` VALUES (13, 1025);
INSERT INTO `sys_role_menu` VALUES (13, 1026);
INSERT INTO `sys_role_menu` VALUES (13, 1027);
INSERT INTO `sys_role_menu` VALUES (13, 1028);
INSERT INTO `sys_role_menu` VALUES (13, 1029);
INSERT INTO `sys_role_menu` VALUES (13, 1030);
INSERT INTO `sys_role_menu` VALUES (13, 1031);
INSERT INTO `sys_role_menu` VALUES (13, 1032);
INSERT INTO `sys_role_menu` VALUES (13, 1033);
INSERT INTO `sys_role_menu` VALUES (13, 1034);
INSERT INTO `sys_role_menu` VALUES (13, 1035);
INSERT INTO `sys_role_menu` VALUES (13, 1036);
INSERT INTO `sys_role_menu` VALUES (13, 1037);
INSERT INTO `sys_role_menu` VALUES (13, 1038);
INSERT INTO `sys_role_menu` VALUES (13, 1039);
INSERT INTO `sys_role_menu` VALUES (13, 1040);
INSERT INTO `sys_role_menu` VALUES (13, 1041);
INSERT INTO `sys_role_menu` VALUES (13, 1042);
INSERT INTO `sys_role_menu` VALUES (13, 1043);
INSERT INTO `sys_role_menu` VALUES (13, 1044);
INSERT INTO `sys_role_menu` VALUES (13, 1045);
INSERT INTO `sys_role_menu` VALUES (13, 1046);
INSERT INTO `sys_role_menu` VALUES (13, 1047);
INSERT INTO `sys_role_menu` VALUES (13, 1048);
INSERT INTO `sys_role_menu` VALUES (13, 1049);
INSERT INTO `sys_role_menu` VALUES (13, 1050);
INSERT INTO `sys_role_menu` VALUES (13, 1051);
INSERT INTO `sys_role_menu` VALUES (13, 1052);
INSERT INTO `sys_role_menu` VALUES (13, 1053);
INSERT INTO `sys_role_menu` VALUES (13, 1054);
INSERT INTO `sys_role_menu` VALUES (13, 1055);
INSERT INTO `sys_role_menu` VALUES (13, 1056);
INSERT INTO `sys_role_menu` VALUES (13, 1057);
INSERT INTO `sys_role_menu` VALUES (13, 2000);
INSERT INTO `sys_role_menu` VALUES (13, 2001);
INSERT INTO `sys_role_menu` VALUES (13, 2002);
INSERT INTO `sys_role_menu` VALUES (13, 2003);
INSERT INTO `sys_role_menu` VALUES (13, 2004);
INSERT INTO `sys_role_menu` VALUES (13, 2006);
INSERT INTO `sys_role_menu` VALUES (13, 2007);
INSERT INTO `sys_role_menu` VALUES (13, 2008);
INSERT INTO `sys_role_menu` VALUES (13, 2009);
INSERT INTO `sys_role_menu` VALUES (13, 2010);
INSERT INTO `sys_role_menu` VALUES (13, 2011);
INSERT INTO `sys_role_menu` VALUES (13, 2012);
INSERT INTO `sys_role_menu` VALUES (13, 2013);
INSERT INTO `sys_role_menu` VALUES (13, 2014);
INSERT INTO `sys_role_menu` VALUES (13, 2015);
INSERT INTO `sys_role_menu` VALUES (13, 2016);
INSERT INTO `sys_role_menu` VALUES (13, 2017);
INSERT INTO `sys_role_menu` VALUES (13, 2018);
INSERT INTO `sys_role_menu` VALUES (13, 2019);
INSERT INTO `sys_role_menu` VALUES (13, 2020);
INSERT INTO `sys_role_menu` VALUES (13, 2021);
INSERT INTO `sys_role_menu` VALUES (13, 2022);
INSERT INTO `sys_role_menu` VALUES (13, 2023);
INSERT INTO `sys_role_menu` VALUES (13, 2024);
INSERT INTO `sys_role_menu` VALUES (14, 1);
INSERT INTO `sys_role_menu` VALUES (14, 2);
INSERT INTO `sys_role_menu` VALUES (14, 3);
INSERT INTO `sys_role_menu` VALUES (14, 100);
INSERT INTO `sys_role_menu` VALUES (14, 101);
INSERT INTO `sys_role_menu` VALUES (14, 102);
INSERT INTO `sys_role_menu` VALUES (14, 103);
INSERT INTO `sys_role_menu` VALUES (14, 104);
INSERT INTO `sys_role_menu` VALUES (14, 105);
INSERT INTO `sys_role_menu` VALUES (14, 106);
INSERT INTO `sys_role_menu` VALUES (14, 107);
INSERT INTO `sys_role_menu` VALUES (14, 108);
INSERT INTO `sys_role_menu` VALUES (14, 109);
INSERT INTO `sys_role_menu` VALUES (14, 110);
INSERT INTO `sys_role_menu` VALUES (14, 111);
INSERT INTO `sys_role_menu` VALUES (14, 112);
INSERT INTO `sys_role_menu` VALUES (14, 114);
INSERT INTO `sys_role_menu` VALUES (14, 115);
INSERT INTO `sys_role_menu` VALUES (14, 200);
INSERT INTO `sys_role_menu` VALUES (14, 500);
INSERT INTO `sys_role_menu` VALUES (14, 501);
INSERT INTO `sys_role_menu` VALUES (14, 1000);
INSERT INTO `sys_role_menu` VALUES (14, 1001);
INSERT INTO `sys_role_menu` VALUES (14, 1002);
INSERT INTO `sys_role_menu` VALUES (14, 1003);
INSERT INTO `sys_role_menu` VALUES (14, 1004);
INSERT INTO `sys_role_menu` VALUES (14, 1005);
INSERT INTO `sys_role_menu` VALUES (14, 1006);
INSERT INTO `sys_role_menu` VALUES (14, 1007);
INSERT INTO `sys_role_menu` VALUES (14, 1008);
INSERT INTO `sys_role_menu` VALUES (14, 1009);
INSERT INTO `sys_role_menu` VALUES (14, 1010);
INSERT INTO `sys_role_menu` VALUES (14, 1011);
INSERT INTO `sys_role_menu` VALUES (14, 1012);
INSERT INTO `sys_role_menu` VALUES (14, 1013);
INSERT INTO `sys_role_menu` VALUES (14, 1014);
INSERT INTO `sys_role_menu` VALUES (14, 1015);
INSERT INTO `sys_role_menu` VALUES (14, 1016);
INSERT INTO `sys_role_menu` VALUES (14, 1017);
INSERT INTO `sys_role_menu` VALUES (14, 1018);
INSERT INTO `sys_role_menu` VALUES (14, 1019);
INSERT INTO `sys_role_menu` VALUES (14, 1020);
INSERT INTO `sys_role_menu` VALUES (14, 1021);
INSERT INTO `sys_role_menu` VALUES (14, 1022);
INSERT INTO `sys_role_menu` VALUES (14, 1023);
INSERT INTO `sys_role_menu` VALUES (14, 1024);
INSERT INTO `sys_role_menu` VALUES (14, 1025);
INSERT INTO `sys_role_menu` VALUES (14, 1026);
INSERT INTO `sys_role_menu` VALUES (14, 1027);
INSERT INTO `sys_role_menu` VALUES (14, 1028);
INSERT INTO `sys_role_menu` VALUES (14, 1029);
INSERT INTO `sys_role_menu` VALUES (14, 1030);
INSERT INTO `sys_role_menu` VALUES (14, 1031);
INSERT INTO `sys_role_menu` VALUES (14, 1032);
INSERT INTO `sys_role_menu` VALUES (14, 1033);
INSERT INTO `sys_role_menu` VALUES (14, 1034);
INSERT INTO `sys_role_menu` VALUES (14, 1035);
INSERT INTO `sys_role_menu` VALUES (14, 1036);
INSERT INTO `sys_role_menu` VALUES (14, 1037);
INSERT INTO `sys_role_menu` VALUES (14, 1038);
INSERT INTO `sys_role_menu` VALUES (14, 1039);
INSERT INTO `sys_role_menu` VALUES (14, 1040);
INSERT INTO `sys_role_menu` VALUES (14, 1041);
INSERT INTO `sys_role_menu` VALUES (14, 1042);
INSERT INTO `sys_role_menu` VALUES (14, 1043);
INSERT INTO `sys_role_menu` VALUES (14, 1044);
INSERT INTO `sys_role_menu` VALUES (14, 1045);
INSERT INTO `sys_role_menu` VALUES (14, 1046);
INSERT INTO `sys_role_menu` VALUES (14, 1047);
INSERT INTO `sys_role_menu` VALUES (14, 1048);
INSERT INTO `sys_role_menu` VALUES (14, 1049);
INSERT INTO `sys_role_menu` VALUES (14, 1050);
INSERT INTO `sys_role_menu` VALUES (14, 1051);
INSERT INTO `sys_role_menu` VALUES (14, 1052);
INSERT INTO `sys_role_menu` VALUES (14, 1053);
INSERT INTO `sys_role_menu` VALUES (14, 1054);
INSERT INTO `sys_role_menu` VALUES (14, 1055);
INSERT INTO `sys_role_menu` VALUES (14, 1056);
INSERT INTO `sys_role_menu` VALUES (14, 1057);
INSERT INTO `sys_role_menu` VALUES (14, 2000);
INSERT INTO `sys_role_menu` VALUES (14, 2001);
INSERT INTO `sys_role_menu` VALUES (14, 2002);
INSERT INTO `sys_role_menu` VALUES (14, 2003);
INSERT INTO `sys_role_menu` VALUES (14, 2004);
INSERT INTO `sys_role_menu` VALUES (14, 2006);
INSERT INTO `sys_role_menu` VALUES (14, 2007);
INSERT INTO `sys_role_menu` VALUES (14, 2008);
INSERT INTO `sys_role_menu` VALUES (14, 2009);
INSERT INTO `sys_role_menu` VALUES (14, 2010);
INSERT INTO `sys_role_menu` VALUES (14, 2011);
INSERT INTO `sys_role_menu` VALUES (14, 2012);
INSERT INTO `sys_role_menu` VALUES (14, 2013);
INSERT INTO `sys_role_menu` VALUES (14, 2014);
INSERT INTO `sys_role_menu` VALUES (14, 2015);
INSERT INTO `sys_role_menu` VALUES (14, 2016);
INSERT INTO `sys_role_menu` VALUES (14, 2017);
INSERT INTO `sys_role_menu` VALUES (14, 2018);
INSERT INTO `sys_role_menu` VALUES (14, 2019);
INSERT INTO `sys_role_menu` VALUES (14, 2020);
INSERT INTO `sys_role_menu` VALUES (14, 2021);
INSERT INTO `sys_role_menu` VALUES (14, 2022);
INSERT INTO `sys_role_menu` VALUES (14, 2023);
INSERT INTO `sys_role_menu` VALUES (14, 2024);
INSERT INTO `sys_role_menu` VALUES (15, 1);
INSERT INTO `sys_role_menu` VALUES (15, 2);
INSERT INTO `sys_role_menu` VALUES (15, 3);
INSERT INTO `sys_role_menu` VALUES (15, 100);
INSERT INTO `sys_role_menu` VALUES (15, 101);
INSERT INTO `sys_role_menu` VALUES (15, 102);
INSERT INTO `sys_role_menu` VALUES (15, 103);
INSERT INTO `sys_role_menu` VALUES (15, 104);
INSERT INTO `sys_role_menu` VALUES (15, 105);
INSERT INTO `sys_role_menu` VALUES (15, 106);
INSERT INTO `sys_role_menu` VALUES (15, 107);
INSERT INTO `sys_role_menu` VALUES (15, 108);
INSERT INTO `sys_role_menu` VALUES (15, 109);
INSERT INTO `sys_role_menu` VALUES (15, 110);
INSERT INTO `sys_role_menu` VALUES (15, 111);
INSERT INTO `sys_role_menu` VALUES (15, 112);
INSERT INTO `sys_role_menu` VALUES (15, 114);
INSERT INTO `sys_role_menu` VALUES (15, 115);
INSERT INTO `sys_role_menu` VALUES (15, 200);
INSERT INTO `sys_role_menu` VALUES (15, 500);
INSERT INTO `sys_role_menu` VALUES (15, 501);
INSERT INTO `sys_role_menu` VALUES (15, 1000);
INSERT INTO `sys_role_menu` VALUES (15, 1001);
INSERT INTO `sys_role_menu` VALUES (15, 1002);
INSERT INTO `sys_role_menu` VALUES (15, 1003);
INSERT INTO `sys_role_menu` VALUES (15, 1004);
INSERT INTO `sys_role_menu` VALUES (15, 1005);
INSERT INTO `sys_role_menu` VALUES (15, 1006);
INSERT INTO `sys_role_menu` VALUES (15, 1007);
INSERT INTO `sys_role_menu` VALUES (15, 1008);
INSERT INTO `sys_role_menu` VALUES (15, 1009);
INSERT INTO `sys_role_menu` VALUES (15, 1010);
INSERT INTO `sys_role_menu` VALUES (15, 1011);
INSERT INTO `sys_role_menu` VALUES (15, 1012);
INSERT INTO `sys_role_menu` VALUES (15, 1013);
INSERT INTO `sys_role_menu` VALUES (15, 1014);
INSERT INTO `sys_role_menu` VALUES (15, 1015);
INSERT INTO `sys_role_menu` VALUES (15, 1016);
INSERT INTO `sys_role_menu` VALUES (15, 1017);
INSERT INTO `sys_role_menu` VALUES (15, 1018);
INSERT INTO `sys_role_menu` VALUES (15, 1019);
INSERT INTO `sys_role_menu` VALUES (15, 1020);
INSERT INTO `sys_role_menu` VALUES (15, 1021);
INSERT INTO `sys_role_menu` VALUES (15, 1022);
INSERT INTO `sys_role_menu` VALUES (15, 1023);
INSERT INTO `sys_role_menu` VALUES (15, 1024);
INSERT INTO `sys_role_menu` VALUES (15, 1025);
INSERT INTO `sys_role_menu` VALUES (15, 1026);
INSERT INTO `sys_role_menu` VALUES (15, 1027);
INSERT INTO `sys_role_menu` VALUES (15, 1028);
INSERT INTO `sys_role_menu` VALUES (15, 1029);
INSERT INTO `sys_role_menu` VALUES (15, 1030);
INSERT INTO `sys_role_menu` VALUES (15, 1031);
INSERT INTO `sys_role_menu` VALUES (15, 1032);
INSERT INTO `sys_role_menu` VALUES (15, 1033);
INSERT INTO `sys_role_menu` VALUES (15, 1034);
INSERT INTO `sys_role_menu` VALUES (15, 1035);
INSERT INTO `sys_role_menu` VALUES (15, 1036);
INSERT INTO `sys_role_menu` VALUES (15, 1037);
INSERT INTO `sys_role_menu` VALUES (15, 1038);
INSERT INTO `sys_role_menu` VALUES (15, 1039);
INSERT INTO `sys_role_menu` VALUES (15, 1040);
INSERT INTO `sys_role_menu` VALUES (15, 1041);
INSERT INTO `sys_role_menu` VALUES (15, 1042);
INSERT INTO `sys_role_menu` VALUES (15, 1043);
INSERT INTO `sys_role_menu` VALUES (15, 1044);
INSERT INTO `sys_role_menu` VALUES (15, 1045);
INSERT INTO `sys_role_menu` VALUES (15, 1046);
INSERT INTO `sys_role_menu` VALUES (15, 1047);
INSERT INTO `sys_role_menu` VALUES (15, 1048);
INSERT INTO `sys_role_menu` VALUES (15, 1049);
INSERT INTO `sys_role_menu` VALUES (15, 1050);
INSERT INTO `sys_role_menu` VALUES (15, 1051);
INSERT INTO `sys_role_menu` VALUES (15, 1052);
INSERT INTO `sys_role_menu` VALUES (15, 1053);
INSERT INTO `sys_role_menu` VALUES (15, 1054);
INSERT INTO `sys_role_menu` VALUES (15, 1055);
INSERT INTO `sys_role_menu` VALUES (15, 1056);
INSERT INTO `sys_role_menu` VALUES (15, 1057);
INSERT INTO `sys_role_menu` VALUES (15, 2000);
INSERT INTO `sys_role_menu` VALUES (15, 2001);
INSERT INTO `sys_role_menu` VALUES (15, 2002);
INSERT INTO `sys_role_menu` VALUES (15, 2003);
INSERT INTO `sys_role_menu` VALUES (15, 2004);
INSERT INTO `sys_role_menu` VALUES (15, 2006);
INSERT INTO `sys_role_menu` VALUES (15, 2007);
INSERT INTO `sys_role_menu` VALUES (15, 2008);
INSERT INTO `sys_role_menu` VALUES (15, 2009);
INSERT INTO `sys_role_menu` VALUES (15, 2010);
INSERT INTO `sys_role_menu` VALUES (15, 2011);
INSERT INTO `sys_role_menu` VALUES (15, 2012);
INSERT INTO `sys_role_menu` VALUES (15, 2013);
INSERT INTO `sys_role_menu` VALUES (15, 2014);
INSERT INTO `sys_role_menu` VALUES (15, 2015);
INSERT INTO `sys_role_menu` VALUES (15, 2016);
INSERT INTO `sys_role_menu` VALUES (15, 2017);
INSERT INTO `sys_role_menu` VALUES (15, 2018);
INSERT INTO `sys_role_menu` VALUES (15, 2019);
INSERT INTO `sys_role_menu` VALUES (15, 2020);
INSERT INTO `sys_role_menu` VALUES (15, 2021);
INSERT INTO `sys_role_menu` VALUES (15, 2022);
INSERT INTO `sys_role_menu` VALUES (15, 2023);
INSERT INTO `sys_role_menu` VALUES (15, 2024);
INSERT INTO `sys_role_menu` VALUES (16, 1);
INSERT INTO `sys_role_menu` VALUES (16, 2);
INSERT INTO `sys_role_menu` VALUES (16, 3);
INSERT INTO `sys_role_menu` VALUES (16, 100);
INSERT INTO `sys_role_menu` VALUES (16, 101);
INSERT INTO `sys_role_menu` VALUES (16, 102);
INSERT INTO `sys_role_menu` VALUES (16, 103);
INSERT INTO `sys_role_menu` VALUES (16, 104);
INSERT INTO `sys_role_menu` VALUES (16, 105);
INSERT INTO `sys_role_menu` VALUES (16, 106);
INSERT INTO `sys_role_menu` VALUES (16, 107);
INSERT INTO `sys_role_menu` VALUES (16, 108);
INSERT INTO `sys_role_menu` VALUES (16, 109);
INSERT INTO `sys_role_menu` VALUES (16, 110);
INSERT INTO `sys_role_menu` VALUES (16, 114);
INSERT INTO `sys_role_menu` VALUES (16, 115);
INSERT INTO `sys_role_menu` VALUES (16, 200);
INSERT INTO `sys_role_menu` VALUES (16, 500);
INSERT INTO `sys_role_menu` VALUES (16, 501);
INSERT INTO `sys_role_menu` VALUES (16, 1000);
INSERT INTO `sys_role_menu` VALUES (16, 1001);
INSERT INTO `sys_role_menu` VALUES (16, 1002);
INSERT INTO `sys_role_menu` VALUES (16, 1003);
INSERT INTO `sys_role_menu` VALUES (16, 1004);
INSERT INTO `sys_role_menu` VALUES (16, 1005);
INSERT INTO `sys_role_menu` VALUES (16, 1006);
INSERT INTO `sys_role_menu` VALUES (16, 1007);
INSERT INTO `sys_role_menu` VALUES (16, 1008);
INSERT INTO `sys_role_menu` VALUES (16, 1009);
INSERT INTO `sys_role_menu` VALUES (16, 1010);
INSERT INTO `sys_role_menu` VALUES (16, 1011);
INSERT INTO `sys_role_menu` VALUES (16, 1012);
INSERT INTO `sys_role_menu` VALUES (16, 1013);
INSERT INTO `sys_role_menu` VALUES (16, 1014);
INSERT INTO `sys_role_menu` VALUES (16, 1015);
INSERT INTO `sys_role_menu` VALUES (16, 1016);
INSERT INTO `sys_role_menu` VALUES (16, 1017);
INSERT INTO `sys_role_menu` VALUES (16, 1018);
INSERT INTO `sys_role_menu` VALUES (16, 1019);
INSERT INTO `sys_role_menu` VALUES (16, 1020);
INSERT INTO `sys_role_menu` VALUES (16, 1021);
INSERT INTO `sys_role_menu` VALUES (16, 1022);
INSERT INTO `sys_role_menu` VALUES (16, 1023);
INSERT INTO `sys_role_menu` VALUES (16, 1024);
INSERT INTO `sys_role_menu` VALUES (16, 1025);
INSERT INTO `sys_role_menu` VALUES (16, 1026);
INSERT INTO `sys_role_menu` VALUES (16, 1027);
INSERT INTO `sys_role_menu` VALUES (16, 1028);
INSERT INTO `sys_role_menu` VALUES (16, 1029);
INSERT INTO `sys_role_menu` VALUES (16, 1030);
INSERT INTO `sys_role_menu` VALUES (16, 1031);
INSERT INTO `sys_role_menu` VALUES (16, 1032);
INSERT INTO `sys_role_menu` VALUES (16, 1033);
INSERT INTO `sys_role_menu` VALUES (16, 1034);
INSERT INTO `sys_role_menu` VALUES (16, 1035);
INSERT INTO `sys_role_menu` VALUES (16, 1036);
INSERT INTO `sys_role_menu` VALUES (16, 1037);
INSERT INTO `sys_role_menu` VALUES (16, 1038);
INSERT INTO `sys_role_menu` VALUES (16, 1039);
INSERT INTO `sys_role_menu` VALUES (16, 1040);
INSERT INTO `sys_role_menu` VALUES (16, 1041);
INSERT INTO `sys_role_menu` VALUES (16, 1042);
INSERT INTO `sys_role_menu` VALUES (16, 1043);
INSERT INTO `sys_role_menu` VALUES (16, 1044);
INSERT INTO `sys_role_menu` VALUES (16, 1045);
INSERT INTO `sys_role_menu` VALUES (16, 1046);
INSERT INTO `sys_role_menu` VALUES (16, 1047);
INSERT INTO `sys_role_menu` VALUES (16, 1048);
INSERT INTO `sys_role_menu` VALUES (16, 1049);
INSERT INTO `sys_role_menu` VALUES (16, 1050);
INSERT INTO `sys_role_menu` VALUES (16, 1051);
INSERT INTO `sys_role_menu` VALUES (16, 1052);
INSERT INTO `sys_role_menu` VALUES (16, 1053);
INSERT INTO `sys_role_menu` VALUES (16, 1054);
INSERT INTO `sys_role_menu` VALUES (16, 1055);
INSERT INTO `sys_role_menu` VALUES (16, 1056);
INSERT INTO `sys_role_menu` VALUES (16, 1057);
INSERT INTO `sys_role_menu` VALUES (16, 2000);
INSERT INTO `sys_role_menu` VALUES (16, 2001);
INSERT INTO `sys_role_menu` VALUES (16, 2002);
INSERT INTO `sys_role_menu` VALUES (16, 2003);
INSERT INTO `sys_role_menu` VALUES (16, 2004);
INSERT INTO `sys_role_menu` VALUES (16, 2006);
INSERT INTO `sys_role_menu` VALUES (16, 2007);
INSERT INTO `sys_role_menu` VALUES (16, 2008);
INSERT INTO `sys_role_menu` VALUES (16, 2009);
INSERT INTO `sys_role_menu` VALUES (16, 2010);
INSERT INTO `sys_role_menu` VALUES (16, 2011);
INSERT INTO `sys_role_menu` VALUES (16, 2012);
INSERT INTO `sys_role_menu` VALUES (16, 2013);
INSERT INTO `sys_role_menu` VALUES (16, 2014);
INSERT INTO `sys_role_menu` VALUES (16, 2015);
INSERT INTO `sys_role_menu` VALUES (16, 2016);
INSERT INTO `sys_role_menu` VALUES (16, 2017);
INSERT INTO `sys_role_menu` VALUES (16, 2018);
INSERT INTO `sys_role_menu` VALUES (16, 2019);
INSERT INTO `sys_role_menu` VALUES (16, 2020);
INSERT INTO `sys_role_menu` VALUES (16, 2021);
INSERT INTO `sys_role_menu` VALUES (16, 2022);
INSERT INTO `sys_role_menu` VALUES (16, 2023);
INSERT INTO `sys_role_menu` VALUES (16, 2024);
INSERT INTO `sys_role_menu` VALUES (17, 1);
INSERT INTO `sys_role_menu` VALUES (17, 100);
INSERT INTO `sys_role_menu` VALUES (17, 101);
INSERT INTO `sys_role_menu` VALUES (17, 102);
INSERT INTO `sys_role_menu` VALUES (17, 103);
INSERT INTO `sys_role_menu` VALUES (17, 104);
INSERT INTO `sys_role_menu` VALUES (17, 105);
INSERT INTO `sys_role_menu` VALUES (17, 106);
INSERT INTO `sys_role_menu` VALUES (17, 107);
INSERT INTO `sys_role_menu` VALUES (17, 108);
INSERT INTO `sys_role_menu` VALUES (17, 200);
INSERT INTO `sys_role_menu` VALUES (17, 1000);
INSERT INTO `sys_role_menu` VALUES (17, 1001);
INSERT INTO `sys_role_menu` VALUES (17, 1002);
INSERT INTO `sys_role_menu` VALUES (17, 1003);
INSERT INTO `sys_role_menu` VALUES (17, 1004);
INSERT INTO `sys_role_menu` VALUES (17, 1005);
INSERT INTO `sys_role_menu` VALUES (17, 1006);
INSERT INTO `sys_role_menu` VALUES (17, 1007);
INSERT INTO `sys_role_menu` VALUES (17, 1008);
INSERT INTO `sys_role_menu` VALUES (17, 1009);
INSERT INTO `sys_role_menu` VALUES (17, 1010);
INSERT INTO `sys_role_menu` VALUES (17, 1011);
INSERT INTO `sys_role_menu` VALUES (17, 1012);
INSERT INTO `sys_role_menu` VALUES (17, 1013);
INSERT INTO `sys_role_menu` VALUES (17, 1014);
INSERT INTO `sys_role_menu` VALUES (17, 1015);
INSERT INTO `sys_role_menu` VALUES (17, 1016);
INSERT INTO `sys_role_menu` VALUES (17, 1017);
INSERT INTO `sys_role_menu` VALUES (17, 1018);
INSERT INTO `sys_role_menu` VALUES (17, 1019);
INSERT INTO `sys_role_menu` VALUES (17, 1020);
INSERT INTO `sys_role_menu` VALUES (17, 1021);
INSERT INTO `sys_role_menu` VALUES (17, 1022);
INSERT INTO `sys_role_menu` VALUES (17, 1023);
INSERT INTO `sys_role_menu` VALUES (17, 1024);
INSERT INTO `sys_role_menu` VALUES (17, 1025);
INSERT INTO `sys_role_menu` VALUES (17, 1026);
INSERT INTO `sys_role_menu` VALUES (17, 1027);
INSERT INTO `sys_role_menu` VALUES (17, 1028);
INSERT INTO `sys_role_menu` VALUES (17, 1029);
INSERT INTO `sys_role_menu` VALUES (17, 1030);
INSERT INTO `sys_role_menu` VALUES (17, 1031);
INSERT INTO `sys_role_menu` VALUES (17, 1032);
INSERT INTO `sys_role_menu` VALUES (17, 1033);
INSERT INTO `sys_role_menu` VALUES (17, 1034);
INSERT INTO `sys_role_menu` VALUES (17, 1035);
INSERT INTO `sys_role_menu` VALUES (17, 1036);
INSERT INTO `sys_role_menu` VALUES (17, 1037);
INSERT INTO `sys_role_menu` VALUES (17, 1038);
INSERT INTO `sys_role_menu` VALUES (17, 2000);
INSERT INTO `sys_role_menu` VALUES (17, 2001);
INSERT INTO `sys_role_menu` VALUES (17, 2002);
INSERT INTO `sys_role_menu` VALUES (17, 2003);
INSERT INTO `sys_role_menu` VALUES (17, 2004);
INSERT INTO `sys_role_menu` VALUES (17, 2006);
INSERT INTO `sys_role_menu` VALUES (17, 2007);
INSERT INTO `sys_role_menu` VALUES (17, 2008);
INSERT INTO `sys_role_menu` VALUES (17, 2009);
INSERT INTO `sys_role_menu` VALUES (18, 1);
INSERT INTO `sys_role_menu` VALUES (18, 2);
INSERT INTO `sys_role_menu` VALUES (18, 3);
INSERT INTO `sys_role_menu` VALUES (18, 100);
INSERT INTO `sys_role_menu` VALUES (18, 101);
INSERT INTO `sys_role_menu` VALUES (18, 102);
INSERT INTO `sys_role_menu` VALUES (18, 103);
INSERT INTO `sys_role_menu` VALUES (18, 104);
INSERT INTO `sys_role_menu` VALUES (18, 105);
INSERT INTO `sys_role_menu` VALUES (18, 106);
INSERT INTO `sys_role_menu` VALUES (18, 107);
INSERT INTO `sys_role_menu` VALUES (18, 108);
INSERT INTO `sys_role_menu` VALUES (18, 109);
INSERT INTO `sys_role_menu` VALUES (18, 110);
INSERT INTO `sys_role_menu` VALUES (18, 114);
INSERT INTO `sys_role_menu` VALUES (18, 115);
INSERT INTO `sys_role_menu` VALUES (18, 200);
INSERT INTO `sys_role_menu` VALUES (18, 500);
INSERT INTO `sys_role_menu` VALUES (18, 501);
INSERT INTO `sys_role_menu` VALUES (18, 1000);
INSERT INTO `sys_role_menu` VALUES (18, 1001);
INSERT INTO `sys_role_menu` VALUES (18, 1002);
INSERT INTO `sys_role_menu` VALUES (18, 1003);
INSERT INTO `sys_role_menu` VALUES (18, 1004);
INSERT INTO `sys_role_menu` VALUES (18, 1005);
INSERT INTO `sys_role_menu` VALUES (18, 1006);
INSERT INTO `sys_role_menu` VALUES (18, 1007);
INSERT INTO `sys_role_menu` VALUES (18, 1008);
INSERT INTO `sys_role_menu` VALUES (18, 1009);
INSERT INTO `sys_role_menu` VALUES (18, 1010);
INSERT INTO `sys_role_menu` VALUES (18, 1011);
INSERT INTO `sys_role_menu` VALUES (18, 1012);
INSERT INTO `sys_role_menu` VALUES (18, 1013);
INSERT INTO `sys_role_menu` VALUES (18, 1014);
INSERT INTO `sys_role_menu` VALUES (18, 1015);
INSERT INTO `sys_role_menu` VALUES (18, 1016);
INSERT INTO `sys_role_menu` VALUES (18, 1017);
INSERT INTO `sys_role_menu` VALUES (18, 1018);
INSERT INTO `sys_role_menu` VALUES (18, 1019);
INSERT INTO `sys_role_menu` VALUES (18, 1020);
INSERT INTO `sys_role_menu` VALUES (18, 1021);
INSERT INTO `sys_role_menu` VALUES (18, 1022);
INSERT INTO `sys_role_menu` VALUES (18, 1023);
INSERT INTO `sys_role_menu` VALUES (18, 1024);
INSERT INTO `sys_role_menu` VALUES (18, 1025);
INSERT INTO `sys_role_menu` VALUES (18, 1026);
INSERT INTO `sys_role_menu` VALUES (18, 1027);
INSERT INTO `sys_role_menu` VALUES (18, 1028);
INSERT INTO `sys_role_menu` VALUES (18, 1029);
INSERT INTO `sys_role_menu` VALUES (18, 1030);
INSERT INTO `sys_role_menu` VALUES (18, 1031);
INSERT INTO `sys_role_menu` VALUES (18, 1032);
INSERT INTO `sys_role_menu` VALUES (18, 1033);
INSERT INTO `sys_role_menu` VALUES (18, 1034);
INSERT INTO `sys_role_menu` VALUES (18, 1035);
INSERT INTO `sys_role_menu` VALUES (18, 1036);
INSERT INTO `sys_role_menu` VALUES (18, 1037);
INSERT INTO `sys_role_menu` VALUES (18, 1038);
INSERT INTO `sys_role_menu` VALUES (18, 1039);
INSERT INTO `sys_role_menu` VALUES (18, 1040);
INSERT INTO `sys_role_menu` VALUES (18, 1041);
INSERT INTO `sys_role_menu` VALUES (18, 1042);
INSERT INTO `sys_role_menu` VALUES (18, 1043);
INSERT INTO `sys_role_menu` VALUES (18, 1044);
INSERT INTO `sys_role_menu` VALUES (18, 1045);
INSERT INTO `sys_role_menu` VALUES (18, 1046);
INSERT INTO `sys_role_menu` VALUES (18, 1047);
INSERT INTO `sys_role_menu` VALUES (18, 1048);
INSERT INTO `sys_role_menu` VALUES (18, 1049);
INSERT INTO `sys_role_menu` VALUES (18, 1050);
INSERT INTO `sys_role_menu` VALUES (18, 1051);
INSERT INTO `sys_role_menu` VALUES (18, 1052);
INSERT INTO `sys_role_menu` VALUES (18, 1053);
INSERT INTO `sys_role_menu` VALUES (18, 1054);
INSERT INTO `sys_role_menu` VALUES (18, 1055);
INSERT INTO `sys_role_menu` VALUES (18, 1056);
INSERT INTO `sys_role_menu` VALUES (18, 1057);
INSERT INTO `sys_role_menu` VALUES (18, 2000);
INSERT INTO `sys_role_menu` VALUES (18, 2001);
INSERT INTO `sys_role_menu` VALUES (18, 2002);
INSERT INTO `sys_role_menu` VALUES (18, 2003);
INSERT INTO `sys_role_menu` VALUES (18, 2004);
INSERT INTO `sys_role_menu` VALUES (18, 2006);
INSERT INTO `sys_role_menu` VALUES (18, 2007);
INSERT INTO `sys_role_menu` VALUES (18, 2008);
INSERT INTO `sys_role_menu` VALUES (18, 2009);
INSERT INTO `sys_role_menu` VALUES (18, 2010);
INSERT INTO `sys_role_menu` VALUES (18, 2011);
INSERT INTO `sys_role_menu` VALUES (18, 2012);
INSERT INTO `sys_role_menu` VALUES (18, 2013);
INSERT INTO `sys_role_menu` VALUES (18, 2014);
INSERT INTO `sys_role_menu` VALUES (18, 2015);
INSERT INTO `sys_role_menu` VALUES (18, 2016);
INSERT INTO `sys_role_menu` VALUES (18, 2017);
INSERT INTO `sys_role_menu` VALUES (18, 2018);
INSERT INTO `sys_role_menu` VALUES (18, 2019);
INSERT INTO `sys_role_menu` VALUES (18, 2020);
INSERT INTO `sys_role_menu` VALUES (18, 2021);
INSERT INTO `sys_role_menu` VALUES (18, 2022);
INSERT INTO `sys_role_menu` VALUES (18, 2023);
INSERT INTO `sys_role_menu` VALUES (18, 2024);
INSERT INTO `sys_role_menu` VALUES (19, 1);
INSERT INTO `sys_role_menu` VALUES (19, 100);
INSERT INTO `sys_role_menu` VALUES (23, 1);
INSERT INTO `sys_role_menu` VALUES (23, 2);
INSERT INTO `sys_role_menu` VALUES (23, 3);
INSERT INTO `sys_role_menu` VALUES (23, 100);
INSERT INTO `sys_role_menu` VALUES (23, 101);
INSERT INTO `sys_role_menu` VALUES (23, 102);
INSERT INTO `sys_role_menu` VALUES (23, 103);
INSERT INTO `sys_role_menu` VALUES (23, 104);
INSERT INTO `sys_role_menu` VALUES (23, 105);
INSERT INTO `sys_role_menu` VALUES (23, 106);
INSERT INTO `sys_role_menu` VALUES (23, 107);
INSERT INTO `sys_role_menu` VALUES (23, 108);
INSERT INTO `sys_role_menu` VALUES (23, 109);
INSERT INTO `sys_role_menu` VALUES (23, 110);
INSERT INTO `sys_role_menu` VALUES (23, 114);
INSERT INTO `sys_role_menu` VALUES (23, 115);
INSERT INTO `sys_role_menu` VALUES (23, 200);
INSERT INTO `sys_role_menu` VALUES (23, 500);
INSERT INTO `sys_role_menu` VALUES (23, 501);
INSERT INTO `sys_role_menu` VALUES (23, 1000);
INSERT INTO `sys_role_menu` VALUES (23, 1001);
INSERT INTO `sys_role_menu` VALUES (23, 1002);
INSERT INTO `sys_role_menu` VALUES (23, 1003);
INSERT INTO `sys_role_menu` VALUES (23, 1004);
INSERT INTO `sys_role_menu` VALUES (23, 1005);
INSERT INTO `sys_role_menu` VALUES (23, 1006);
INSERT INTO `sys_role_menu` VALUES (23, 1007);
INSERT INTO `sys_role_menu` VALUES (23, 1008);
INSERT INTO `sys_role_menu` VALUES (23, 1009);
INSERT INTO `sys_role_menu` VALUES (23, 1010);
INSERT INTO `sys_role_menu` VALUES (23, 1011);
INSERT INTO `sys_role_menu` VALUES (23, 1012);
INSERT INTO `sys_role_menu` VALUES (23, 1013);
INSERT INTO `sys_role_menu` VALUES (23, 1014);
INSERT INTO `sys_role_menu` VALUES (23, 1015);
INSERT INTO `sys_role_menu` VALUES (23, 1016);
INSERT INTO `sys_role_menu` VALUES (23, 1017);
INSERT INTO `sys_role_menu` VALUES (23, 1018);
INSERT INTO `sys_role_menu` VALUES (23, 1019);
INSERT INTO `sys_role_menu` VALUES (23, 1020);
INSERT INTO `sys_role_menu` VALUES (23, 1021);
INSERT INTO `sys_role_menu` VALUES (23, 1022);
INSERT INTO `sys_role_menu` VALUES (23, 1023);
INSERT INTO `sys_role_menu` VALUES (23, 1024);
INSERT INTO `sys_role_menu` VALUES (23, 1025);
INSERT INTO `sys_role_menu` VALUES (23, 1026);
INSERT INTO `sys_role_menu` VALUES (23, 1027);
INSERT INTO `sys_role_menu` VALUES (23, 1028);
INSERT INTO `sys_role_menu` VALUES (23, 1029);
INSERT INTO `sys_role_menu` VALUES (23, 1030);
INSERT INTO `sys_role_menu` VALUES (23, 1031);
INSERT INTO `sys_role_menu` VALUES (23, 1032);
INSERT INTO `sys_role_menu` VALUES (23, 1033);
INSERT INTO `sys_role_menu` VALUES (23, 1034);
INSERT INTO `sys_role_menu` VALUES (23, 1035);
INSERT INTO `sys_role_menu` VALUES (23, 1036);
INSERT INTO `sys_role_menu` VALUES (23, 1037);
INSERT INTO `sys_role_menu` VALUES (23, 1038);
INSERT INTO `sys_role_menu` VALUES (23, 1039);
INSERT INTO `sys_role_menu` VALUES (23, 1040);
INSERT INTO `sys_role_menu` VALUES (23, 1041);
INSERT INTO `sys_role_menu` VALUES (23, 1042);
INSERT INTO `sys_role_menu` VALUES (23, 1043);
INSERT INTO `sys_role_menu` VALUES (23, 1044);
INSERT INTO `sys_role_menu` VALUES (23, 1045);
INSERT INTO `sys_role_menu` VALUES (23, 1046);
INSERT INTO `sys_role_menu` VALUES (23, 1047);
INSERT INTO `sys_role_menu` VALUES (23, 1048);
INSERT INTO `sys_role_menu` VALUES (23, 1049);
INSERT INTO `sys_role_menu` VALUES (23, 1050);
INSERT INTO `sys_role_menu` VALUES (23, 1051);
INSERT INTO `sys_role_menu` VALUES (23, 1052);
INSERT INTO `sys_role_menu` VALUES (23, 1053);
INSERT INTO `sys_role_menu` VALUES (23, 1054);
INSERT INTO `sys_role_menu` VALUES (23, 1055);
INSERT INTO `sys_role_menu` VALUES (23, 1056);
INSERT INTO `sys_role_menu` VALUES (23, 1057);
INSERT INTO `sys_role_menu` VALUES (23, 2000);
INSERT INTO `sys_role_menu` VALUES (23, 2001);
INSERT INTO `sys_role_menu` VALUES (23, 2002);
INSERT INTO `sys_role_menu` VALUES (23, 2003);
INSERT INTO `sys_role_menu` VALUES (23, 2004);
INSERT INTO `sys_role_menu` VALUES (23, 2006);
INSERT INTO `sys_role_menu` VALUES (23, 2007);
INSERT INTO `sys_role_menu` VALUES (23, 2008);
INSERT INTO `sys_role_menu` VALUES (23, 2009);
INSERT INTO `sys_role_menu` VALUES (23, 2010);
INSERT INTO `sys_role_menu` VALUES (23, 2011);
INSERT INTO `sys_role_menu` VALUES (23, 2012);
INSERT INTO `sys_role_menu` VALUES (23, 2013);
INSERT INTO `sys_role_menu` VALUES (23, 2014);
INSERT INTO `sys_role_menu` VALUES (23, 2015);
INSERT INTO `sys_role_menu` VALUES (23, 2016);
INSERT INTO `sys_role_menu` VALUES (23, 2017);
INSERT INTO `sys_role_menu` VALUES (23, 2018);
INSERT INTO `sys_role_menu` VALUES (23, 2019);
INSERT INTO `sys_role_menu` VALUES (23, 2020);
INSERT INTO `sys_role_menu` VALUES (23, 2021);
INSERT INTO `sys_role_menu` VALUES (23, 2022);
INSERT INTO `sys_role_menu` VALUES (23, 2023);
INSERT INTO `sys_role_menu` VALUES (23, 2024);
INSERT INTO `sys_role_menu` VALUES (23, 2028);

-- ----------------------------
-- Table structure for sys_test
-- ----------------------------
DROP TABLE IF EXISTS `sys_test`;
CREATE TABLE `sys_test`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '' COMMENT '姓名',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '测试' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_test
-- ----------------------------

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `user_id` int NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `dept_id` int NULL DEFAULT NULL COMMENT '部门ID',
  `login_name` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '登录账号',
  `user_name` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '用户昵称',
  `user_type` varchar(2) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '00' COMMENT '用户类型（00系统用户）',
  `email` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '用户邮箱',
  `phonenumber` varchar(11) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '手机号码',
  `sex` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '0' COMMENT '用户性别（0男 1女 2未知）',
  `avatar` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '头像路径',
  `password` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '密码',
  `salt` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '盐加密',
  `status` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '0' COMMENT '帐号状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `login_ip` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '最后登陆IP',
  `login_date` datetime(0) NULL DEFAULT NULL COMMENT '最后登陆时间',
  `create_by` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`user_id`) USING BTREE,
  UNIQUE INDEX `login_name`(`login_name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 19 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '用户信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (1, 100, 'admin', '超级管理', '00', 'admin@qq.com', '13900012345', '0', '', '29c67a30398638269fe600f73a054934', '111111', '0', '0', '192.168.12.104', '2022-10-19 08:48:02', 'admin', '2018-03-16 11:33:00', 'admin', '2022-10-19 08:48:02', '-');

-- ----------------------------
-- Table structure for sys_user_online
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_online`;
CREATE TABLE `sys_user_online`  (
  `sessionId` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '' COMMENT '用户会话id',
  `login_name` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '登录账号',
  `dept_name` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '部门名称',
  `ipaddr` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '登录IP地址',
  `login_location` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '登录地点',
  `browser` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '操作系统',
  `status` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '在线状态on_line在线off_line离线',
  `start_timestamp` datetime(0) NULL DEFAULT NULL COMMENT 'session创建时间',
  `last_access_time` datetime(0) NULL DEFAULT NULL COMMENT 'session最后访问时间',
  `expire_time` int NULL DEFAULT 0 COMMENT '超时时间，单位为分钟',
  PRIMARY KEY (`sessionId`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '在线用户记录' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_user_online
-- ----------------------------
INSERT INTO `sys_user_online` VALUES ('83ed289b-c6dc-412d-837b-6ede3ba428df', 'admin', '研发部门', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', 'on_line', '2019-06-03 09:51:03', '2019-06-03 09:51:07', 1800000);

-- ----------------------------
-- Table structure for sys_user_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_post`;
CREATE TABLE `sys_user_post`  (
  `user_id` int NOT NULL COMMENT '用户ID',
  `post_id` int NOT NULL COMMENT '岗位ID',
  PRIMARY KEY (`user_id`, `post_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '用户与岗位关联表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_user_post
-- ----------------------------
INSERT INTO `sys_user_post` VALUES (2, 2);
INSERT INTO `sys_user_post` VALUES (5, 2);
INSERT INTO `sys_user_post` VALUES (12, 1);
INSERT INTO `sys_user_post` VALUES (14, 1);

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role`  (
  `user_id` int NOT NULL COMMENT '用户ID',
  `role_id` int NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`user_id`, `role_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '用户和角色关联表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES (1, 1);
INSERT INTO `sys_user_role` VALUES (1, 2);
INSERT INTO `sys_user_role` VALUES (1, 20);

-- ----------------------------
-- Table structure for teacher
-- ----------------------------
DROP TABLE IF EXISTS `teacher`;
CREATE TABLE `teacher`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of teacher
-- ----------------------------

-- ----------------------------
-- Table structure for test_order
-- ----------------------------
DROP TABLE IF EXISTS `test_order`;
CREATE TABLE `test_order`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `orderno` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `amount` decimal(10, 0) NULL DEFAULT NULL,
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of test_order
-- ----------------------------
INSERT INTO `test_order` VALUES (1, 'Test123456', 1000, 'Test');
INSERT INTO `test_order` VALUES (2, 'Test98777', 2000, 'User1232');
INSERT INTO `test_order` VALUES (3, 'dddd', 110, '55555555');
INSERT INTO `test_order` VALUES (4, '23eeeeeeeeee', 55, 'ooouuyyyt');

SET FOREIGN_KEY_CHECKS = 1;
