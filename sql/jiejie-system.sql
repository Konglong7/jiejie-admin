/*
 Navicat Premium Dump SQL

 Source Server         : 47.108.187.25
 Source Server Type    : MySQL
 Source Server Version : 80044 (8.0.44)
 Source Host           : 47.108.187.25:3306
 Source Schema         : jiejie-system

 Target Server Type    : MySQL
 Target Server Version : 80044 (8.0.44)
 File Encoding         : 65001

 Date: 27/08/2026 13:59:55
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for coder_banner
-- ----------------------------
DROP TABLE IF EXISTS `coder_banner`;
CREATE TABLE `coder_banner`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `title` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `description` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `image` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `link` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `tag` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `btn_text` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `sort` int NULL DEFAULT 0,
  `status` tinyint NULL DEFAULT 1,
  `position` tinyint NULL DEFAULT 1,
  `create_time` datetime NULL DEFAULT NULL,
  `update_time` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of coder_banner
-- ----------------------------
INSERT INTO `coder_banner` VALUES (1, 'Spring Boot 3 + Vue 3 企业级现代化后台', '基于最新技术栈构建，响应极速、架构清晰、开箱即用', 'https://images.unsplash.com/photo-1517694712202-14dd9538aa97?w=1200&auto=format&fit=crop&q=80', '', '核心架构', '立即查看', 1, 1, 1, '2026-01-01 10:00:00', '2026-01-01 10:00:00');
INSERT INTO `coder_banner` VALUES (2, '全新移动端 UniApp 小程序协同上线', '支持多端编译，工作流即时审批、通知消息秒级到达', 'https://images.unsplash.com/photo-1526374965328-7f61d4dc18c5?w=1200&auto=format&fit=crop&q=80', '', '移动端', '体验小程序', 2, 1, 1, '2026-01-02 10:00:00', '2026-01-02 10:00:00');
INSERT INTO `coder_banner` VALUES (3, 'Warm-Flow 敏捷流程引擎与低代码表单', '可视化图形设计器，拖拽式流程编排，满足企业复杂流转', 'https://images.unsplash.com/photo-1551288049-bebda4e38f71?w=1200&auto=format&fit=crop&q=80', '', '工作流', '进入设计器', 3, 1, 1, '2026-01-03 10:00:00', '2026-01-03 10:00:00');
INSERT INTO `coder_banner` VALUES (4, '企业级全链路安全防护与性能审计', '集成 Sa-Token 权限体系、防刷限流、RSA接口加密传输', 'https://images.unsplash.com/photo-1563986768609-322da13575f3?w=1200&auto=format&fit=crop&q=80', '', '安全合规', '了解更多', 4, 1, 1, '2026-01-04 10:00:00', '2026-01-04 10:00:00');

-- ----------------------------
-- Table structure for flow_definition
-- ----------------------------
DROP TABLE IF EXISTS `flow_definition`;
CREATE TABLE `flow_definition`  (
  `id` bigint NOT NULL COMMENT '主键id',
  `flow_code` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '流程编码',
  `flow_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '流程名称',
  `model_value` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'CLASSICS' COMMENT '设计器模型',
  `category` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '流程类别',
  `version` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '流程版本',
  `is_publish` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否发布',
  `form_custom` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT 'N' COMMENT '审批表单是否自定义',
  `form_path` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '审批表单路径',
  `activity_status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '流程激活状态',
  `listener_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '监听器类型',
  `listener_path` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '监听器路径',
  `ext` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '扩展字段',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建人',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新人',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '删除标志',
  `tenant_id` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '租户id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '流程定义表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of flow_definition
-- ----------------------------
INSERT INTO `flow_definition` VALUES (2092836513250222081, 'test', '测试', 'CLASSICS', NULL, '1', 1, 'N', NULL, 1, '', '', NULL, '2026-08-27 12:48:02', '', '2026-08-27 12:59:15', '1', '1', NULL);
INSERT INTO `flow_definition` VALUES (2092839468166766594, 'test', '测试', 'CLASSICS', NULL, '2', 0, 'N', NULL, 1, '', '', NULL, '2026-08-27 12:59:48', '1', '2026-08-27 12:59:48', '1', '1', NULL);

-- ----------------------------
-- Table structure for flow_his_task
-- ----------------------------
DROP TABLE IF EXISTS `flow_his_task`;
CREATE TABLE `flow_his_task`  (
  `id` bigint NOT NULL COMMENT '主键id',
  `definition_id` bigint NOT NULL COMMENT '流程定义id',
  `instance_id` bigint NOT NULL COMMENT '流程实例id',
  `task_id` bigint NOT NULL COMMENT '任务id',
  `node_code` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '开始节点编码',
  `node_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '开始节点名称',
  `node_type` tinyint(1) NULL DEFAULT NULL COMMENT '开始节点类型',
  `target_node_code` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '目标节点编码',
  `target_node_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '结束节点名称',
  `approver` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '审批人',
  `cooperate_type` tinyint(1) NOT NULL DEFAULT 0 COMMENT '协作方式',
  `collaborator` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '协作人',
  `skip_type` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '流转类型',
  `flow_status` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '流程状态',
  `form_custom` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT 'N' COMMENT '审批表单是否自定义',
  `form_path` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '审批表单路径',
  `message` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '审批意见',
  `variable` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '任务变量',
  `ext` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '业务详情',
  `create_time` datetime NULL DEFAULT NULL COMMENT '任务开始时间',
  `update_time` datetime NULL DEFAULT NULL COMMENT '审批完成时间',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '删除标志',
  `tenant_id` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '租户id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '历史任务记录表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of flow_his_task
-- ----------------------------

-- ----------------------------
-- Table structure for flow_instance
-- ----------------------------
DROP TABLE IF EXISTS `flow_instance`;
CREATE TABLE `flow_instance`  (
  `id` bigint NOT NULL COMMENT '主键id',
  `definition_id` bigint NOT NULL COMMENT '流程定义id',
  `business_id` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '业务id',
  `node_type` tinyint(1) NOT NULL COMMENT '节点类型',
  `node_code` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '流程节点编码',
  `node_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '流程节点名称',
  `variable` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '任务变量',
  `flow_status` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '流程状态',
  `activity_status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '流程激活状态',
  `def_json` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '流程定义json',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建人',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新人',
  `ext` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '扩展字段',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '删除标志',
  `tenant_id` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '租户id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '流程实例表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of flow_instance
-- ----------------------------

-- ----------------------------
-- Table structure for flow_node
-- ----------------------------
DROP TABLE IF EXISTS `flow_node`;
CREATE TABLE `flow_node`  (
  `id` bigint NOT NULL COMMENT '主键id',
  `node_type` tinyint(1) NOT NULL COMMENT '节点类型',
  `definition_id` bigint NOT NULL COMMENT '流程定义id',
  `node_code` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '流程节点编码',
  `node_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '流程节点名称',
  `permission_flag` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '权限标识',
  `node_ratio` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '流程签署比例值',
  `coordinate` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '坐标',
  `any_node_skip` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '任意结点跳转',
  `listener_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '监听器类型',
  `listener_path` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '监听器路径',
  `form_custom` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT 'N' COMMENT '审批表单是否自定义',
  `form_path` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '审批表单路径',
  `version` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '版本',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建人',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新人',
  `ext` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '节点扩展属性',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '删除标志',
  `tenant_id` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '租户id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '流程节点表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of flow_node
-- ----------------------------
INSERT INTO `flow_node` VALUES (2092836513438965762, 0, 2092836513250222081, 'start', '开始', NULL, '0', '260,200|260,200', NULL, NULL, NULL, 'N', NULL, '1', '2026-08-27 12:48:02', '', '2026-08-27 12:48:02', '', '[]', '1', NULL);
INSERT INTO `flow_node` VALUES (2092836513438965763, 1, 2092836513250222081, 'submit', '中间节点', NULL, '0', '420,200|420,200', NULL, NULL, NULL, 'N', NULL, '1', '2026-08-27 12:48:02', '', '2026-08-27 12:48:02', '', '[]', '1', NULL);
INSERT INTO `flow_node` VALUES (2092836513438965764, 2, 2092836513250222081, 'end', '结束', NULL, '0', '597,200|597,200', NULL, NULL, NULL, 'N', NULL, '1', '2026-08-27 12:48:02', '', '2026-08-27 12:48:02', '', '[]', '1', NULL);
INSERT INTO `flow_node` VALUES (2092839468166766595, 0, 2092839468166766594, 'start', '开始', NULL, '0', '260,200|260,200', NULL, NULL, NULL, 'N', NULL, '2', '2026-08-27 12:59:47', '1', '2026-08-27 12:59:47', '1', '[]', '1', NULL);
INSERT INTO `flow_node` VALUES (2092839468326150146, 1, 2092839468166766594, 'submit', '中间节点', NULL, '0', '420,200|420,200', NULL, NULL, NULL, 'N', NULL, '2', '2026-08-27 12:59:47', '1', '2026-08-27 12:59:47', '1', '[]', '1', NULL);
INSERT INTO `flow_node` VALUES (2092839468523282434, 2, 2092839468166766594, 'end', '结束', NULL, '0', '597,200|597,200', NULL, NULL, NULL, 'N', NULL, '2', '2026-08-27 12:59:47', '1', '2026-08-27 12:59:47', '1', '[]', '1', NULL);

-- ----------------------------
-- Table structure for flow_skip
-- ----------------------------
DROP TABLE IF EXISTS `flow_skip`;
CREATE TABLE `flow_skip`  (
  `id` bigint NOT NULL COMMENT '主键id',
  `definition_id` bigint NOT NULL COMMENT '流程定义id',
  `now_node_code` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '当前流程节点的编码',
  `now_node_type` tinyint(1) NULL DEFAULT NULL COMMENT '当前节点类型',
  `next_node_code` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '下一个流程节点的编码',
  `next_node_type` tinyint(1) NULL DEFAULT NULL COMMENT '下一个节点类型',
  `skip_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '跳转名称',
  `skip_type` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '跳转类型',
  `skip_condition` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '跳转条件',
  `coordinate` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '坐标',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建人',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新人',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '删除标志',
  `tenant_id` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '租户id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '节点跳转关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of flow_skip
-- ----------------------------
INSERT INTO `flow_skip` VALUES (2092836513761927169, 2092836513250222081, 'start', 0, 'submit', NULL, NULL, 'PASS', NULL, '280,200;370,200', '2026-08-27 12:48:03', '', '2026-08-27 12:48:03', '', '1', NULL);
INSERT INTO `flow_skip` VALUES (2092836513761927170, 2092836513250222081, 'submit', 1, 'end', NULL, NULL, 'PASS', NULL, '470,200;577,200', '2026-08-27 12:48:03', '', '2026-08-27 12:48:03', '', '1', NULL);
INSERT INTO `flow_skip` VALUES (2092839469991288834, 2092839468166766594, 'start', 0, 'submit', NULL, NULL, 'PASS', NULL, '280,200;370,200', '2026-08-27 12:59:47', '1', '2026-08-27 12:59:47', '1', '1', NULL);
INSERT INTO `flow_skip` VALUES (2092839470184226817, 2092839468166766594, 'submit', 1, 'end', NULL, NULL, 'PASS', NULL, '470,200;577,200', '2026-08-27 12:59:47', '1', '2026-08-27 12:59:47', '1', '1', NULL);

-- ----------------------------
-- Table structure for flow_task
-- ----------------------------
DROP TABLE IF EXISTS `flow_task`;
CREATE TABLE `flow_task`  (
  `id` bigint NOT NULL COMMENT '主键id',
  `definition_id` bigint NOT NULL COMMENT '流程定义id',
  `instance_id` bigint NOT NULL COMMENT '流程实例id',
  `node_code` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '节点编码',
  `node_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '节点名称',
  `node_type` tinyint(1) NOT NULL COMMENT '节点类型',
  `flow_status` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '流程状态',
  `form_custom` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT 'N' COMMENT '审批表单是否自定义',
  `form_path` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '审批表单路径',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建人',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新人',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '删除标志',
  `tenant_id` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '租户id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '待办任务表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of flow_task
-- ----------------------------

-- ----------------------------
-- Table structure for flow_user
-- ----------------------------
DROP TABLE IF EXISTS `flow_user`;
CREATE TABLE `flow_user`  (
  `id` bigint NOT NULL COMMENT '主键id',
  `type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '人员类型',
  `processed_by` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '权限人',
  `associated` bigint NOT NULL COMMENT '任务表id',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `create_by` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '创建人',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新人',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '删除标志',
  `tenant_id` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '租户id',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `user_processed_type`(`processed_by` ASC, `type` ASC) USING BTREE,
  INDEX `user_associated`(`associated` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '流程用户表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of flow_user
-- ----------------------------

-- ----------------------------
-- Table structure for gen_table
-- ----------------------------
DROP TABLE IF EXISTS `gen_table`;
CREATE TABLE `gen_table`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '表名称',
  `table_comment` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '表描述',
  `class_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '实体类名称',
  `package_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '生成包路径',
  `module_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '生成模块名',
  `business_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '生成业务名',
  `function_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '生成功能名',
  `author` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '生成功能作者',
  `gen_type` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT 'crud' COMMENT '生成类型（crud单表 tree树表）',
  `gen_path` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '/' COMMENT '生成路径',
  `front_type` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT 'naive-ui' COMMENT '前端模板类型',
  `form_layout` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT 'vertical' COMMENT '表单布局（vertical-从上到下 grid-一行两列）',
  `parent_menu_id` bigint NULL DEFAULT NULL COMMENT '上级菜单ID',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '代码生成业务表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of gen_table
-- ----------------------------
INSERT INTO `gen_table` VALUES (4, 'student', '学生表', 'Student', 'com.jiejie.system', 'system', 'student', '学生表', 'Jiejie', 'crud', '/', 'naive-ui', 'grid', NULL, NULL, '2026-02-09 12:44:26', '2026-02-09 12:44:26');

-- ----------------------------
-- Table structure for gen_table_column
-- ----------------------------
DROP TABLE IF EXISTS `gen_table_column`;
CREATE TABLE `gen_table_column`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_id` bigint NULL DEFAULT NULL COMMENT '归属表编号',
  `column_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '列名称',
  `column_comment` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '列描述',
  `column_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '列类型',
  `java_type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT 'Java类型',
  `java_field` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT 'Java字段名',
  `is_pk` tinyint NULL DEFAULT 0 COMMENT '是否主键（1是）',
  `is_increment` tinyint NULL DEFAULT 0 COMMENT '是否自增（1是）',
  `is_required` tinyint NULL DEFAULT 0 COMMENT '是否必填（1是）',
  `is_insert` tinyint NULL DEFAULT 0 COMMENT '是否为插入字段（1是）',
  `is_edit` tinyint NULL DEFAULT 0 COMMENT '是否编辑字段（1是）',
  `is_list` tinyint NULL DEFAULT 0 COMMENT '是否列表字段（1是）',
  `is_query` tinyint NULL DEFAULT 0 COMMENT '是否查询字段（1是）',
  `query_type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT 'EQ' COMMENT '查询方式',
  `html_type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '显示类型',
  `dict_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '字典类型',
  `sort` int NULL DEFAULT 0 COMMENT '排序',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_table_id`(`table_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 47 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '代码生成字段表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of gen_table_column
-- ----------------------------
INSERT INTO `gen_table_column` VALUES (34, 4, 'id', 'id', 'bigint', 'Long', 'id', 1, 1, 1, 0, 0, 1, 1, 'EQ', 'input', '', 1);
INSERT INTO `gen_table_column` VALUES (35, 4, 'student_no', '学号', 'varchar(50)', 'String', 'studentNo', 0, 0, 1, 1, 1, 1, 0, 'EQ', 'input', '', 2);
INSERT INTO `gen_table_column` VALUES (36, 4, 'name', '姓名', 'varchar(50)', 'String', 'name', 0, 0, 1, 1, 1, 1, 1, 'EQ', 'input', '', 3);
INSERT INTO `gen_table_column` VALUES (37, 4, 'gender', '性别', 'tinyint', 'Integer', 'gender', 0, 0, 0, 1, 1, 1, 0, 'EQ', 'select', 'gender', 4);
INSERT INTO `gen_table_column` VALUES (38, 4, 'birthday', '出生日期', 'date', 'LocalDate', 'birthday', 0, 0, 0, 1, 1, 1, 0, 'EQ', 'datetime', '', 5);
INSERT INTO `gen_table_column` VALUES (39, 4, 'phone', '手机号', 'varchar(20)', 'String', 'phone', 0, 0, 0, 1, 1, 1, 0, 'EQ', 'input', '', 6);
INSERT INTO `gen_table_column` VALUES (40, 4, 'email', '邮箱', 'varchar(100)', 'String', 'email', 0, 0, 0, 1, 1, 1, 0, 'EQ', 'input', '', 7);
INSERT INTO `gen_table_column` VALUES (41, 4, 'address', '地址', 'varchar(200)', 'String', 'address', 0, 0, 0, 1, 1, 1, 0, 'EQ', 'imageUpload', '', 8);
INSERT INTO `gen_table_column` VALUES (42, 4, 'class_id', '班级ID', 'bigint', 'Long', 'classId', 0, 0, 0, 1, 1, 1, 0, 'EQ', 'input', '', 9);
INSERT INTO `gen_table_column` VALUES (43, 4, 'status', '状态', 'tinyint', 'Integer', 'status', 0, 0, 0, 1, 1, 1, 1, 'EQ', 'select', 'sys_status', 10);
INSERT INTO `gen_table_column` VALUES (44, 4, 'deleted', 'deleted', 'tinyint', 'Integer', 'deleted', 0, 0, 0, 0, 0, 0, 0, 'EQ', 'input', '', 11);
INSERT INTO `gen_table_column` VALUES (45, 4, 'create_time', '创建时间', 'datetime', 'LocalDateTime', 'createTime', 0, 0, 0, 0, 0, 0, 0, 'EQ', 'datetime', '', 12);
INSERT INTO `gen_table_column` VALUES (46, 4, 'update_time', '更新时间', 'datetime', 'LocalDateTime', 'updateTime', 0, 0, 0, 0, 0, 0, 0, 'EQ', 'datetime', '', 13);

-- ----------------------------
-- Table structure for qrtz_blob_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_blob_triggers`;
CREATE TABLE `qrtz_blob_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `blob_data` blob NULL COMMENT '存放持久化Trigger对象',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_blob_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = 'Blob类型的触发器表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_blob_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_calendars
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_calendars`;
CREATE TABLE `qrtz_calendars`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `calendar_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '日历名称',
  `calendar` blob NOT NULL COMMENT '存放持久化calendar对象',
  PRIMARY KEY (`sched_name`, `calendar_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '日历信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_calendars
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_cron_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_cron_triggers`;
CREATE TABLE `qrtz_cron_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `cron_expression` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'cron表达式',
  `time_zone_id` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '时区',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_cron_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = 'Cron类型的触发器表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_cron_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_fired_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_fired_triggers`;
CREATE TABLE `qrtz_fired_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `entry_id` varchar(95) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度器实例id',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `instance_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度器实例名',
  `fired_time` bigint NOT NULL COMMENT '触发的时间',
  `sched_time` bigint NOT NULL COMMENT '定时器制定的时间',
  `priority` int NOT NULL COMMENT '优先级',
  `state` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '状态',
  `job_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '任务名称',
  `job_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '任务组名',
  `is_nonconcurrent` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否并发',
  `requests_recovery` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否接受恢复执行',
  PRIMARY KEY (`sched_name`, `entry_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '已触发的触发器表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_fired_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_job_details
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_job_details`;
CREATE TABLE `qrtz_job_details`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `job_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '任务名称',
  `job_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '任务组名',
  `description` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '相关介绍',
  `job_class_name` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '执行任务类名称',
  `is_durable` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '是否持久化',
  `is_nonconcurrent` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '是否并发',
  `is_update_data` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '是否更新数据',
  `requests_recovery` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '是否接受恢复执行',
  `job_data` blob NULL COMMENT '存放持久化job对象',
  PRIMARY KEY (`sched_name`, `job_name`, `job_group`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '任务详细信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_job_details
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_locks
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_locks`;
CREATE TABLE `qrtz_locks`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `lock_name` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '悲观锁名称',
  PRIMARY KEY (`sched_name`, `lock_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '存储的悲观锁信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_locks
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_paused_trigger_grps
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_paused_trigger_grps`;
CREATE TABLE `qrtz_paused_trigger_grps`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  PRIMARY KEY (`sched_name`, `trigger_group`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '暂停的触发器表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_paused_trigger_grps
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_scheduler_state
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_scheduler_state`;
CREATE TABLE `qrtz_scheduler_state`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `instance_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '实例名称',
  `last_checkin_time` bigint NOT NULL COMMENT '上次检查时间',
  `checkin_interval` bigint NOT NULL COMMENT '检查间隔时间',
  PRIMARY KEY (`sched_name`, `instance_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '调度器状态表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_scheduler_state
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_simple_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simple_triggers`;
CREATE TABLE `qrtz_simple_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `repeat_count` bigint NOT NULL COMMENT '重复的次数统计',
  `repeat_interval` bigint NOT NULL COMMENT '重复的间隔时间',
  `times_triggered` bigint NOT NULL COMMENT '已经触发的次数',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_simple_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '简单触发器的信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_simple_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_simprop_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simprop_triggers`;
CREATE TABLE `qrtz_simprop_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `str_prop_1` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'String类型的trigger的第一个参数',
  `str_prop_2` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'String类型的trigger的第二个参数',
  `str_prop_3` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'String类型的trigger的第三个参数',
  `int_prop_1` int NULL DEFAULT NULL COMMENT 'int类型的trigger的第一个参数',
  `int_prop_2` int NULL DEFAULT NULL COMMENT 'int类型的trigger的第二个参数',
  `long_prop_1` bigint NULL DEFAULT NULL COMMENT 'long类型的trigger的第一个参数',
  `long_prop_2` bigint NULL DEFAULT NULL COMMENT 'long类型的trigger的第二个参数',
  `dec_prop_1` decimal(13, 4) NULL DEFAULT NULL COMMENT 'decimal类型的trigger的第一个参数',
  `dec_prop_2` decimal(13, 4) NULL DEFAULT NULL COMMENT 'decimal类型的trigger的第二个参数',
  `bool_prop_1` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'Boolean类型的trigger的第一个参数',
  `bool_prop_2` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'Boolean类型的trigger的第二个参数',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_simprop_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '同步机制的行锁表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_simprop_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_triggers`;
CREATE TABLE `qrtz_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '触发器的名字',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '触发器所属组的名字',
  `job_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_job_details表job_name的外键',
  `job_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_job_details表job_group的外键',
  `description` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '相关介绍',
  `next_fire_time` bigint NULL DEFAULT NULL COMMENT '上一次触发时间（毫秒）',
  `prev_fire_time` bigint NULL DEFAULT NULL COMMENT '下一次触发时间（默认为-1表示不触发）',
  `priority` int NULL DEFAULT NULL COMMENT '优先级',
  `trigger_state` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '触发器状态',
  `trigger_type` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '触发器的类型',
  `start_time` bigint NOT NULL COMMENT '开始时间',
  `end_time` bigint NULL DEFAULT NULL COMMENT '结束时间',
  `calendar_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '日程表名称',
  `misfire_instr` smallint NULL DEFAULT NULL COMMENT '补偿执行的策略',
  `job_data` blob NULL COMMENT '存放持久化job对象',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  INDEX `sched_name`(`sched_name` ASC, `job_name` ASC, `job_group` ASC) USING BTREE,
  CONSTRAINT `qrtz_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `job_name`, `job_group`) REFERENCES `qrtz_job_details` (`sched_name`, `job_name`, `job_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '触发器详细信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for student
-- ----------------------------
DROP TABLE IF EXISTS `student`;
CREATE TABLE `student`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `student_no` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '学号',
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '姓名',
  `gender` tinyint NULL DEFAULT NULL COMMENT '性别 1男 2女',
  `birthday` date NULL DEFAULT NULL COMMENT '出生日期',
  `phone` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '手机号',
  `email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '邮箱',
  `address` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '地址',
  `class_id` bigint NULL DEFAULT NULL COMMENT '班级ID',
  `status` tinyint NULL DEFAULT 1 COMMENT '状态',
  `deleted` tinyint NULL DEFAULT 0,
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '学生表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of student
-- ----------------------------
INSERT INTO `student` VALUES (1, '20240101', '苏雨桐', 2, '2003-05-12', '13911223344', 'suyutong@edu.cn', '北京市海淀区中关村南大街5号', 1, 1, 0, '2026-03-01 09:00:00', '2026-03-01 09:00:00');
INSERT INTO `student` VALUES (2, '20240102', '陆子涵', 1, '2002-11-23', '13911223345', 'luzihan@edu.cn', '上海市徐汇区漕宝路120号', 1, 1, 0, '2026-03-01 09:00:00', '2026-03-01 09:00:00');
INSERT INTO `student` VALUES (3, '20240103', '姜楚楚', 2, '2003-08-19', '13911223346', 'jiangcc@edu.cn', '广东省广州市天河区天河路88号', 1, 1, 0, '2026-03-01 09:00:00', '2026-03-01 09:00:00');
INSERT INTO `student` VALUES (4, '20240104', '顾晨曦', 1, '2002-09-05', '13911223347', 'guchenxi@edu.cn', '浙江省杭州市西湖区文三路250号', 1, 1, 0, '2026-03-01 09:00:00', '2026-03-01 09:00:00');
INSERT INTO `student` VALUES (5, '20240105', '白雅琳', 2, '2003-03-30', '13911223348', 'baiyalin@edu.cn', '江苏省南京市玄武区北京东路1号', 1, 1, 0, '2026-03-01 09:00:00', '2026-03-01 09:00:00');
INSERT INTO `student` VALUES (6, '20240106', '沈逸飞', 1, '2002-12-14', '13911223349', 'shenyifei@edu.cn', '四川省成都市武侯区一环路南一段24号', 2, 1, 0, '2026-03-01 09:00:00', '2026-03-01 09:00:00');
INSERT INTO `student` VALUES (7, '20240107', '薛梦琪', 2, '2003-07-08', '13911223350', 'xuemq@edu.cn', '湖北省武汉市洪山区珞瑜路1037号', 2, 1, 0, '2026-03-01 09:00:00', '2026-03-01 09:00:00');
INSERT INTO `student` VALUES (8, '20240108', '崔皓轩', 1, '2002-04-17', '13911223351', 'cuihx@edu.cn', '陕西省西安市雁塔区太白南路2号', 2, 1, 0, '2026-03-01 09:00:00', '2026-03-01 09:00:00');
INSERT INTO `student` VALUES (9, '20240109', '秦思远', 1, '2003-01-22', '13911223352', 'qinsy@edu.cn', '山东省济南市历下区经十路17923号', 2, 1, 0, '2026-03-01 09:00:00', '2026-03-01 09:00:00');
INSERT INTO `student` VALUES (10, '20240110', '唐语嫣', 2, '2003-06-15', '13911223353', 'tangyy@edu.cn', '福建省厦门市思明区思明南路422号', 2, 1, 0, '2026-03-01 09:00:00', '2026-03-01 09:00:00');
INSERT INTO `student` VALUES (11, '20240111', '潘铭轩', 1, '2002-10-10', '13911223354', 'panmx@edu.cn', '安徽省合肥市蜀山区金寨路96号', 3, 1, 0, '2026-03-01 09:00:00', '2026-03-01 09:00:00');
INSERT INTO `student` VALUES (12, '20240112', '董佳怡', 2, '2003-02-18', '13911223355', 'dongjy@edu.cn', '重庆市沙坪坝区沙正街174号', 3, 1, 0, '2026-03-01 09:00:00', '2026-03-01 09:00:00');
INSERT INTO `student` VALUES (13, '20240113', '杜明浩', 1, '2002-06-27', '13911223356', 'dumh@edu.cn', '湖南省长沙市岳麓区麓山南路932号', 3, 1, 0, '2026-03-01 09:00:00', '2026-03-01 09:00:00');
INSERT INTO `student` VALUES (14, '20240114', '韩欣怡', 2, '2003-09-03', '13911223357', 'hanxy@edu.cn', '河南省郑州市中原区科学大道100号', 3, 1, 0, '2026-03-01 09:00:00', '2026-03-01 09:00:00');
INSERT INTO `student` VALUES (15, '20240115', '叶子恒', 1, '2002-08-11', '13911223358', 'yezh@edu.cn', '辽宁省沈阳市和平区文化路3号', 3, 1, 0, '2026-03-01 09:00:00', '2026-03-01 09:00:00');
INSERT INTO `student` VALUES (16, '20240116', '夏若溪', 2, '2003-12-01', '13911223359', 'xiarx@edu.cn', '黑龙江省哈尔滨市南岗区西大直街92号', 4, 1, 0, '2026-03-01 09:00:00', '2026-03-01 09:00:00');
INSERT INTO `student` VALUES (17, '20240117', '方俊杰', 1, '2002-03-25', '13911223360', 'fangjj@edu.cn', '吉林省长春市朝阳区前进大街2699号', 4, 1, 0, '2026-03-01 09:00:00', '2026-03-01 09:00:00');
INSERT INTO `student` VALUES (18, '20240118', '任美涵', 2, '2003-10-14', '13911223361', 'renmh@edu.cn', '江西省南昌市红谷滩区学府大道999号', 4, 1, 0, '2026-03-01 09:00:00', '2026-03-01 09:00:00');
INSERT INTO `student` VALUES (19, '20240119', '邵天宇', 1, '2002-05-09', '13911223362', 'shaoty@edu.cn', '云南省昆明市呈贡区大学城东外环南路', 4, 1, 0, '2026-03-01 09:00:00', '2026-03-01 09:00:00');
INSERT INTO `student` VALUES (20, '20240120', '钟晓萱', 2, '2003-04-06', '13911223363', 'zhongxx@edu.cn', '贵州省贵阳市花溪区花溪大道南段', 4, 1, 0, '2026-03-01 09:00:00', '2026-03-01 09:00:00');
INSERT INTO `student` VALUES (21, '20240121', '范文博', 1, '2002-07-21', '13911223364', 'fanwb@edu.cn', '天津市南开区卫津路94号', 1, 1, 0, '2026-03-01 09:00:00', '2026-03-01 09:00:00');
INSERT INTO `student` VALUES (22, '20240122', '姚诗涵', 2, '2003-11-16', '13911223365', 'yaosh@edu.cn', '河北省石家庄市裕华区裕华东路70号', 1, 1, 0, '2026-03-01 09:00:00', '2026-03-01 09:00:00');
INSERT INTO `student` VALUES (23, '20240123', '钱泽宇', 1, '2002-01-19', '13911223366', 'qianzy@edu.cn', '山西省太原市迎泽区坞城路92号', 2, 1, 0, '2026-03-01 09:00:00', '2026-03-01 09:00:00');
INSERT INTO `student` VALUES (24, '20240124', '戴若晴', 2, '2003-08-28', '13911223367', 'dairq@edu.cn', '内蒙古自治区呼和浩特市赛罕区大学西路235号', 2, 1, 0, '2026-03-01 09:00:00', '2026-03-01 09:00:00');
INSERT INTO `student` VALUES (25, '20240125', '石凯文', 1, '2002-02-15', '13911223368', 'shikw@edu.cn', '广西壮族自治区南宁市大学东路100号', 3, 1, 0, '2026-03-01 09:00:00', '2026-03-01 09:00:00');
INSERT INTO `student` VALUES (26, '20240126', '孟紫薇', 2, '2003-05-24', '13911223369', 'mengzw@edu.cn', '海南省海口市美兰区人民大道58号', 3, 1, 0, '2026-03-01 09:00:00', '2026-03-01 09:00:00');
INSERT INTO `student` VALUES (27, '20240127', '邱浩宇', 1, '2002-12-30', '13911223370', 'qiuhy@edu.cn', '甘肃省兰州市城关区天水南路222号', 4, 0, 0, '2026-03-01 09:00:00', '2026-03-01 09:00:00');
INSERT INTO `student` VALUES (28, '20240128', '谭雨霏', 2, '2003-07-13', '13911223371', 'tanyf@edu.cn', '青海省西宁市城北区宁大路251号', 4, 1, 0, '2026-03-01 09:00:00', '2026-03-01 09:00:00');
INSERT INTO `student` VALUES (29, '20240129', '金振华', 1, '2001-09-18', '13911223372', 'jinzh@edu.cn', '宁夏回族自治区银川市西夏区贺兰山西路489号', 1, 2, 0, '2026-03-01 09:00:00', '2026-03-01 09:00:00');
INSERT INTO `student` VALUES (30, '20240130', '廖思琪', 2, '2003-03-11', '13911223373', 'liaosq@edu.cn', '新疆维吾尔自治区乌鲁木齐市沙依巴克区胜利路666号', 2, 1, 0, '2026-03-01 09:00:00', '2026-03-01 09:00:00');

-- ----------------------------
-- Table structure for sys_api_access_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_api_access_log`;
CREATE TABLE `sys_api_access_log`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `start_time` datetime NULL DEFAULT NULL COMMENT '请求开始时间',
  `end_time` datetime NULL DEFAULT NULL COMMENT '请求结束时间',
  `api_path` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'API路径',
  `method` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'HTTP方法',
  `status_code` int NULL DEFAULT NULL COMMENT 'HTTP状态码',
  `success` tinyint NULL DEFAULT 1 COMMENT '是否成功(0否 1是)',
  `cost_time` bigint NULL DEFAULT NULL COMMENT '耗时(毫秒)',
  `ip` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '客户端IP',
  `user_id` bigint NULL DEFAULT NULL COMMENT '用户ID(未登录为空)',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_start_time`(`start_time` ASC) USING BTREE,
  INDEX `idx_api_path`(`api_path`(100) ASC) USING BTREE,
  INDEX `idx_user_id`(`user_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 264729 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = 'API访问统计日志' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_api_access_log
-- ----------------------------

-- ----------------------------
-- Table structure for sys_chat_group
-- ----------------------------
DROP TABLE IF EXISTS `sys_chat_group`;
CREATE TABLE `sys_chat_group`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '群ID',
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '群名称',
  `avatar` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '群头像',
  `owner_id` bigint NOT NULL COMMENT '群主ID',
  `announcement` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '群公告',
  `max_members` int NULL DEFAULT 200 COMMENT '最大成员数',
  `status` tinyint NULL DEFAULT 1 COMMENT '状态：0-解散 1-正常',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_owner_id`(`owner_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 20 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '群聊表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_chat_group
-- ----------------------------
INSERT INTO `sys_chat_group` VALUES (1, '技术架构研讨群', 'https://api.dicebear.com/7.x/identicon/svg?seed=tech_group', 2, '专注于 Spring Boot 3、Vue 3 架构演进与技术攻关', 200, 1, '2026-02-01 10:00:00', '2026-02-01 10:00:00');
INSERT INTO `sys_chat_group` VALUES (2, 'Jiejie Admin 全员协同大群', 'https://api.dicebear.com/7.x/identicon/svg?seed=all_group', 1, '公司内部日常协同、全员公告与跨部门交流群', 500, 1, '2026-01-29 09:00:00', '2026-01-29 09:00:00');
INSERT INTO `sys_chat_group` VALUES (3, '产品与UI体验优化组', 'https://api.dicebear.com/7.x/identicon/svg?seed=product_group', 3, '聚焦前端交互打磨、组件库定制与用户反馈收集', 100, 1, '2026-02-10 14:00:00', '2026-02-10 14:00:00');

-- ----------------------------
-- Table structure for sys_chat_group_member
-- ----------------------------
DROP TABLE IF EXISTS `sys_chat_group_member`;
CREATE TABLE `sys_chat_group_member`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `group_id` bigint NOT NULL COMMENT '群ID',
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `nickname` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '群内昵称',
  `role` tinyint NULL DEFAULT 0 COMMENT '角色：0-普通成员 1-管理员 2-群主',
  `muted` tinyint NULL DEFAULT 0 COMMENT '是否禁言：0-否 1-是',
  `join_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '加入时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_group_user`(`group_id` ASC, `user_id` ASC) USING BTREE,
  INDEX `idx_user_id`(`user_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 72 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '群成员表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_chat_group_member
-- ----------------------------
INSERT INTO `sys_chat_group_member` VALUES (1, 1, 2, '张三(总监)', 2, 0, '2026-02-10 10:00:00');
INSERT INTO `sys_chat_group_member` VALUES (2, 1, 8, '林晓峰(前端)', 1, 0, '2026-02-10 10:00:00');
INSERT INTO `sys_chat_group_member` VALUES (3, 1, 9, '周文博(后端)', 0, 0, '2026-02-10 10:00:00');
INSERT INTO `sys_chat_group_member` VALUES (4, 1, 11, '刘子墨(移动)', 0, 0, '2026-02-10 10:00:00');
INSERT INTO `sys_chat_group_member` VALUES (5, 1, 12, '吴天朗(测试)', 0, 0, '2026-02-10 10:00:00');
INSERT INTO `sys_chat_group_member` VALUES (6, 1, 1, '超级管理员', 0, 0, '2026-02-10 10:00:00');
INSERT INTO `sys_chat_group_member` VALUES (7, 2, 1, '超级管理员', 2, 0, '2026-02-10 10:00:00');
INSERT INTO `sys_chat_group_member` VALUES (8, 2, 7, '陈建国', 1, 0, '2026-02-10 10:00:00');
INSERT INTO `sys_chat_group_member` VALUES (9, 2, 2, '张三', 0, 0, '2026-02-10 10:00:00');
INSERT INTO `sys_chat_group_member` VALUES (10, 2, 3, '李四', 0, 0, '2026-02-10 10:00:00');
INSERT INTO `sys_chat_group_member` VALUES (11, 2, 4, '王五', 0, 0, '2026-02-10 10:00:00');
INSERT INTO `sys_chat_group_member` VALUES (12, 2, 5, '赵六', 0, 0, '2026-02-10 10:00:00');
INSERT INTO `sys_chat_group_member` VALUES (13, 2, 6, '孙七', 0, 0, '2026-02-10 10:00:00');
INSERT INTO `sys_chat_group_member` VALUES (14, 3, 3, '李四(产品)', 2, 0, '2026-02-10 10:00:00');
INSERT INTO `sys_chat_group_member` VALUES (15, 3, 10, '黄馨予(UI)', 1, 0, '2026-02-10 10:00:00');
INSERT INTO `sys_chat_group_member` VALUES (16, 3, 8, '林晓峰(前端)', 0, 0, '2026-02-10 10:00:00');
INSERT INTO `sys_chat_group_member` VALUES (17, 3, 19, '宋子坤(前端)', 0, 0, '2026-02-10 10:00:00');
INSERT INTO `sys_chat_group_member` VALUES (18, 3, 20, '韩雨濛(运营)', 0, 0, '2026-02-10 10:00:00');

-- ----------------------------
-- Table structure for sys_chat_group_message
-- ----------------------------
DROP TABLE IF EXISTS `sys_chat_group_message`;
CREATE TABLE `sys_chat_group_message`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '消息ID',
  `group_id` bigint NOT NULL COMMENT '群ID',
  `sender_id` bigint NOT NULL COMMENT '发送者ID',
  `sender_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '发送者名称',
  `sender_avatar` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '发送者头像',
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '消息内容',
  `msg_type` tinyint NULL DEFAULT 1 COMMENT '消息类型：1-文本 2-图片 3-文件 4-系统消息',
  `send_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '发送时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_group_id`(`group_id` ASC) USING BTREE,
  INDEX `idx_send_time`(`send_time` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 262 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '群消息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_chat_group_message
-- ----------------------------
INSERT INTO `sys_chat_group_message` VALUES (1, 1, 2, '张三', 'https://api.dicebear.com/7.x/avataaars/svg?seed=zhangsan', '大家早上好！今天开始推进 Spring Boot 3.2 的响应式流式传输支持。', 1, '2026-08-25 09:15:00');
INSERT INTO `sys_chat_group_message` VALUES (2, 1, 8, '林晓峰', 'https://api.dicebear.com/7.x/avataaars/svg?seed=lin_xf', '前端 Naive UI 2.37 组件库已兼容完毕，主题定制方案运行正常。', 1, '2026-08-25 09:18:30');
INSERT INTO `sys_chat_group_message` VALUES (3, 1, 9, '周文博', 'https://api.dicebear.com/7.x/avataaars/svg?seed=zhou_wb', '后端 Redis 7 分布式锁与 Sa-Token 路由拦截器已通过单元测试。', 1, '2026-08-25 09:20:15');
INSERT INTO `sys_chat_group_message` VALUES (4, 1, 11, '刘子墨', 'https://api.dicebear.com/7.x/avataaars/svg?seed=liu_zm', 'UniApp 微信小程序端真机调试完成，WebSocket 重连机制表现稳定！', 1, '2026-08-25 09:25:00');
INSERT INTO `sys_chat_group_message` VALUES (5, 1, 12, '吴天朗', 'https://api.dicebear.com/7.x/avataaars/svg?seed=wu_tl', '自动化回归脚本已挂载流水线，预计下午产出压测报告。', 1, '2026-08-25 09:30:00');
INSERT INTO `sys_chat_group_message` VALUES (6, 1, 1, '超级管理员', 'https://api.dicebear.com/7.x/avataaars/svg?seed=admin', '辛苦大家！大家务必注意接口安全规范，敏感字段做好脱敏。', 1, '2026-08-25 09:35:10');
INSERT INTO `sys_chat_group_message` VALUES (7, 2, 7, '陈建国', 'https://api.dicebear.com/7.x/avataaars/svg?seed=chen_jg', '欢迎各位新加入 Jiejie Admin 大家庭的同仁！祝大家工作顺心！🎉', 1, '2026-08-26 10:00:00');
INSERT INTO `sys_chat_group_message` VALUES (8, 2, 6, '孙七', 'https://api.dicebear.com/7.x/avataaars/svg?seed=sunqi', '请各位同事关注公告栏的体检预约与放假安排通知。', 1, '2026-08-26 10:05:00');
INSERT INTO `sys_chat_group_message` VALUES (9, 2, 3, '李四', 'https://api.dicebear.com/7.x/avataaars/svg?seed=lisi', '收到，各部门员工若有流程审批疑问可随时找我。', 1, '2026-08-26 10:08:20');
INSERT INTO `sys_chat_group_message` VALUES (10, 3, 3, '李四', 'https://api.dicebear.com/7.x/avataaars/svg?seed=lisi', '馨予，新版仪表盘的暗黑模式（Dark Mode）配色出好了吗？', 1, '2026-08-27 14:10:00');
INSERT INTO `sys_chat_group_message` VALUES (11, 3, 10, '黄馨予', 'https://api.dicebear.com/7.x/avataaars/svg?seed=huang_xy', '已经完成了！对比度严格按照 WCAG 2.1 AA 级标准调优，效果非常棒。', 1, '2026-08-27 14:15:20');
INSERT INTO `sys_chat_group_message` VALUES (12, 3, 8, '林晓峰', 'https://api.dicebear.com/7.x/avataaars/svg?seed=lin_xf', '收到设计稿，我和子坤今天把 CSS 变量规范注入进基础主题。', 1, '2026-08-27 14:20:00');

-- ----------------------------
-- Table structure for sys_chat_message
-- ----------------------------
DROP TABLE IF EXISTS `sys_chat_message`;
CREATE TABLE `sys_chat_message`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '消息ID',
  `sender_id` bigint NOT NULL COMMENT '发送者ID',
  `sender_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '发送者名称',
  `sender_avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '发送者头像',
  `receiver_id` bigint NOT NULL COMMENT '接收者ID(0表示群发)',
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '消息内容',
  `msg_type` tinyint NULL DEFAULT 1 COMMENT '消息类型(1文本 2图片 3文件)',
  `is_read` tinyint NULL DEFAULT 0 COMMENT '是否已读(0未读 1已读)',
  `send_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '发送时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_sender_id`(`sender_id` ASC) USING BTREE,
  INDEX `idx_receiver_id`(`receiver_id` ASC) USING BTREE,
  INDEX `idx_send_time`(`send_time` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 945 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '聊天消息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_chat_message
-- ----------------------------
INSERT INTO `sys_chat_message` VALUES (1, 2, '张三', 'https://api.dicebear.com/7.x/avataaars/svg?seed=zhangsan', 1, 'admin，下午有空对一下代码生成器的多数据源配置吗？', 1, 1, '2026-08-28 14:00:00');
INSERT INTO `sys_chat_message` VALUES (2, 1, '超级管理员', 'https://api.dicebear.com/7.x/avataaars/svg?seed=admin', 2, '随时可以，我在二楼会议室，直接过来就行。', 1, 1, '2026-08-28 14:02:15');
INSERT INTO `sys_chat_message` VALUES (3, 8, '林晓峰', 'https://api.dicebear.com/7.x/avataaars/svg?seed=lin_xf', 1, '管理员好，前端工程新增了 xterm.js 终端模拟器组件，已经合并进 dev 分支。', 1, 1, '2026-08-28 15:30:00');
INSERT INTO `sys_chat_message` VALUES (4, 1, '超级管理员', 'https://api.dicebear.com/7.x/avataaars/svg?seed=admin', 8, '收到了，看到效果非常流畅，点赞！👍', 1, 1, '2026-08-28 15:35:00');
INSERT INTO `sys_chat_message` VALUES (5, 3, '李四', 'https://api.dicebear.com/7.x/avataaars/svg?seed=lisi', 4, '王五，上个月的商城活动转化数据统计表导出来了吗？', 1, 1, '2026-08-29 10:10:00');
INSERT INTO `sys_chat_message` VALUES (6, 4, '王五', 'https://api.dicebear.com/7.x/avataaars/svg?seed=wangwu', 3, '已经整理成 Excel 上传到文件管理中心了，你可以在文件列表直接下载预览。', 1, 1, '2026-08-29 10:12:40');
INSERT INTO `sys_chat_message` VALUES (7, 5, '赵六', 'https://api.dicebear.com/7.x/avataaars/svg?seed=zhaoliu', 1, '领导，8月份的云资源账单（阿里云OSS + 短信套餐）已经核对完毕，请在系统内审批。', 1, 1, '2026-08-29 11:20:00');
INSERT INTO `sys_chat_message` VALUES (8, 1, '超级管理员', 'https://api.dicebear.com/7.x/avataaars/svg?seed=admin', 5, '好的，已在流程管理-我的待办中审批通过。', 1, 1, '2026-08-29 11:25:30');

-- ----------------------------
-- Table structure for sys_config_group
-- ----------------------------
DROP TABLE IF EXISTS `sys_config_group`;
CREATE TABLE `sys_config_group`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `group_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '分组编码',
  `group_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '分组名称',
  `group_icon` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '分组图标',
  `config_value` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '配置值(JSON格式)',
  `sort` int NULL DEFAULT 0 COMMENT '排序',
  `status` tinyint NULL DEFAULT 1 COMMENT '状态(0-禁用 1-启用)',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_group_code`(`group_code` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '系统配置分组表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_config_group
-- ----------------------------
INSERT INTO `sys_config_group` VALUES (1, 'system', '系统配置', NULL, '{\"siteName\":\"Jiejie-Admin\",\"siteDescription\":\"现代化企业级管理系统\",\"siteLogo\":\"\",\"copyright\":\"版权所有 © Jiejie Admin 2026\",\"icp\":\"\",\"watermarkEnabled\":true,\"watermarkType\":\"username\",\"watermarkCustomText\":\"\",\"watermarkOpacity\":0.05}', 1, 1, NULL, '2026-01-31 14:38:29', '2026-01-31 14:38:29');
INSERT INTO `sys_config_group` VALUES (2, 'register', '注册配置', NULL, '{\"enabled\":true,\"verifyEmail\":false,\"verifyPhone\":false,\"defaultRole\":\"user\",\"needAudit\":true}', 2, 1, NULL, '2026-01-31 14:38:29', '2026-01-31 14:38:29');
INSERT INTO `sys_config_group` VALUES (3, 'login', '登录配置', NULL, '{\"captchaEnabled\":true,\"captchaType\":\"image\",\"maxRetryCount\":5,\"lockTime\":30,\"rememberMe\":true,\"singleLogin\":false}', 3, 1, NULL, '2026-01-31 14:38:29', '2026-01-31 15:38:39');
INSERT INTO `sys_config_group` VALUES (4, 'password', '密码配置', NULL, '{\"minLength\":6,\"maxLength\":20,\"requireUppercase\":false,\"requireLowercase\":false,\"requireNumber\":false,\"requireSpecial\":false,\"expireDays\":0}', 4, 1, NULL, '2026-01-31 14:38:29', '2026-01-31 14:38:29');
INSERT INTO `sys_config_group` VALUES (5, 'email', '邮件配置', NULL, '{\"host\":\"smtp.example.com\",\"port\":465,\"username\":\"\",\"password\":\"\",\"fromName\":\"Jiejie管理系统\",\"ssl\":true,\"enabled\":false}', 5, 1, NULL, '2026-01-31 14:38:29', '2026-01-31 22:13:14');
INSERT INTO `sys_config_group` VALUES (6, 'emailTemplate', '邮件模板', NULL, '{\"verifyCode\":\"您的验证码是：{code}，有效期{expire}分钟。\",\"resetPassword\":\"您正在重置密码，验证码：{code}，有效期{expire}分钟。\",\"welcome\":\"欢迎注册{siteName}，您的账号已创建成功。\"}', 6, 1, NULL, '2026-01-31 14:38:29', '2026-01-31 14:38:29');
INSERT INTO `sys_config_group` VALUES (7, 'sms', '短信配置', NULL, '{\"provider\":\"console\",\"accessKeyId\":\"\",\"accessKeySecret\":\"\",\"signName\":\"\",\"tencentAppId\":\"\",\"templateVerifyCode\":\"\",\"templateResetPassword\":\"\",\"templateNotice\":\"\",\"enabled\":false}', 7, 1, NULL, '2026-01-31 14:38:29', '2026-02-13 13:52:21');
INSERT INTO `sys_config_group` VALUES (9, 'storage', '文件配置', NULL, '{\"provider\":\"local\",\"domain\":\"\",\"localPath\":\"./uploads\",\"maxSize\":100,\"allowTypes\":\"jpg,jpeg,png,gif,webp,bmp,ico,svg,pdf,doc,docx,xls,xlsx,ppt,pptx,txt,md,csv,xml,json,yaml,yml,html,htm,css,js,ts,vue,java,py,go,sql,sh,bat,mp4,avi,mov,wmv,flv,mkv,webm,mp3,wav,ogg,flac,aac,zip,rar,7z,tar,gz,apk,exe,dmg\",\"minioEndpoint\":\"\",\"minioAccessKey\":\"\",\"minioSecretKey\":\"\",\"minioBucket\":\"\",\"aliyunEndpoint\":\"\",\"aliyunAccessKey\":\"\",\"aliyunSecretKey\":\"\",\"aliyunBucket\":\"\",\"tencentSecretId\":\"\",\"tencentSecretKey\":\"\",\"tencentBucket\":\"\",\"tencentRegion\":\"\",\"rustfsEndpoint\":\"\",\"rustfsAccessKey\":\"\",\"rustfsSecretKey\":\"\",\"rustfsBucket\":\"\"}', 9, 1, NULL, '2026-01-31 14:38:29', '2026-02-02 17:02:01');
INSERT INTO `sys_config_group` VALUES (10, 'push', '推送配置', NULL, '{\"dingtalk\":{\"signName\":\"\",\"tokenId\":\"\"},\"feishu\":{\"signName\":\"\",\"tokenId\":\"\"},\"wechat_work\":{\"signName\":\"\",\"tokenId\":\"\"}}', 10, 1, NULL, '2026-01-31 14:38:29', '2026-02-13 13:53:13');
INSERT INTO `sys_config_group` VALUES (11, 'thirdParty', '第三方配置', NULL, '{\"wechat\":{\"enabled\":false,\"appId\":\"\",\"appSecret\":\"\"},\"alipay\":{\"enabled\":false,\"appId\":\"\",\"privateKey\":\"\",\"publicKey\":\"\"},\"github\":{\"enabled\":false,\"clientId\":\"\",\"clientSecret\":\"\"}}', 11, 1, NULL, '2026-01-31 14:38:29', '2026-01-31 14:38:29');
INSERT INTO `sys_config_group` VALUES (12, 'payment', '支付配置', NULL, '{\"wechatPay\":{\"enabled\":false,\"mchId\":\"\",\"appId\":\"\",\"apiKey\":\"\",\"apiV3Key\":\"\",\"privateKey\":\"\",\"certSerialNo\":\"\",\"notifyUrl\":\"\"},\"alipay\":{\"enabled\":false,\"appId\":\"\",\"privateKey\":\"\",\"publicKey\":\"\",\"signType\":\"RSA2\",\"charset\":\"UTF-8\",\"gatewayUrl\":\"https://openapi.alipay.com/gateway.do\",\"notifyUrl\":\"\",\"returnUrl\":\"\"}}', 12, 1, NULL, '2026-01-31 14:38:29', '2026-01-31 16:13:21');
INSERT INTO `sys_config_group` VALUES (13, 'security', '安全配置', NULL, '{\"encryptEnabled\":true,\"encryptScope\":\"global\",\"encryptPublicKey\":\"MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAxwcKZj5Wdozt6+8i9H2WW2eNaNUvI9iyU7Ot2P5XW9MSfTqRTCbv/aVEUOm60SHm7OXFAbuwUeuo6Pu2P7qPffXiqCXBdC1joo7VywNlapnmkwXP6jhuP+oHM31BvG2uInv40LHocUIRbMhREavnw+By7kT3Cq2SmgLBGsRkoIrpAuMBe47n8DjRGq2cvFde/EoChO0uO0AxlTUpfNXatUDGH0NtCEJeECoMBkg4nI0JAPnZETkimurbryPFoAVk5ld/GJg5WruQ1piicy9YgbOhjWnmb6gJ1RUU9xypNeHI/jLQCdjBn4NGQFtD73v36/WFnv4MgFAZV6iKr5kSdQIDAQAB\",\"encryptPrivateKey\":\"MIIEvAIBADANBgkqhkiG9w0BAQEFAASCBKYwggSiAgEAAoIBAQDHBwpmPlZ2jO3r7yL0fZZbZ41o1S8j2LJTs63Y/ldb0xJ9OpFMJu/9pURQ6brRIebs5cUBu7BR66jo+7Y/uo999eKoJcF0LWOijtXLA2VqmeaTBc/qOG4/6gczfUG8ba4ie/jQsehxQhFsyFERq+fD4HLuRPcKrZKaAsEaxGSgiukC4wF7jufwONEarZy8V178SgKE7S47QDGVNSl81dq1QMYfQ20IQl4QKgwGSDicjQkA+dkROSKa6tuvI8WgBWTmV38YmDlau5DWmKJzL1iBs6GNaeZvqAnVFRT3HKk14cj+MtAJ2MGfg0ZAW0Pve/fr9YWe/gyAUBlXqIqvmRJ1AgMBAAECggEAIOYACRCK2EPJXDOGMqXDwc4nKMn8Zc9/AqjztqesJwiHyN1ygQT6rJGx7jIEaGdTNZtxaiztI01x+TkKUhRzfZ20XpkHFj4edxNnMYyZKfrQi0LtsEitqLD1icRNpmj23MpjQZP22SnTmYivJd2ljNJADTSnJUO1tPF5nAQUohipaHm9ikipKzT+Qa605nj1TvG1NF1a0y/IElBGb5FFyQGISgUoiPh8/aZXeO5pS6YMJTTQul/9Q7f9fwJFrzPl3qqc3kDxYjagJcPtV5VmX/nSrMpeLnaTvRIg78ocwNF+XYJ5L1Sr9wxYEADykw4P8E0ijGYynSeZlo0u+Q7U7QKBgQDZaG5ITWYmt+4KQrR0r1HHGFWJPtFVKcwjC+EIm9I1S+gTOjZ/6SG45upDqlHtmCOMf1drRFhSehdD6UHUFL4xN/fAxkP3F+iKU/KfJy6yclCuhW+k0Efi6W4mKR9ZkhINJvVibsNdA0vXQa603bbr7hfHVeJl1xI761htsnEFuwKBgQDqW1s5f67gXowzjmK6a40Z+/DIoHBTd267zOIEknhUg6oaMtW1v/yPjwWrf6wJmpUFO3Mq3xTDd/k1iXBOke2vHmZG2AplNVScreRx20lRBmzuGe+9sSDozTfFJO25oPhH86wmIAmqMB5nu1L1TJjbKRAU+hcdC+v22NWMQ48tjwKBgALF9kIt2pO73Ol8mFi0s9JaWRz7FCiF8/iuehxmAHR1l2xHXdKb4rY9G9fpIEprmmh8Z10S7h1/OTTAkPpnmVV/ZUWsQcmxIGJDV+D32vyjwKu5QAdWMNSQLbuG4sN9vYU1bgPnbc6N8DW6vMPJ4D96Ngtw6QZri+v/wI0FrbNpAoGAcpvuxvXMXemfAu+VFLnYLWbqYBMmG4uC2dDej4HZ2urw2xMVNGcJamN1UGOFjMTOL9rc/ZBPJTCc7TOjeqke5c8mEWtB2jD0ihL4bz3gYwGTb/W7Krde8rq5lW3z3B3+jaF7BMISN+qEVBJmBZRKBJPWS4vqlcfow7VS6d94O70CgYBTLo2LdYZV9rn7FGmgC9/fuJOgWEfeqmunNx8SsYUjaXSyy+Vb+dlgH/YRfypb37rxxsNwWQKggZww6gSO1/TkFoV73W035XBKbMB3XLEFHp2v75qYBYEHvVpW1YEl2QGlUzOUWXrP5G/3v8O0/+5yJwjKcmkWDjPGIIKj8GPZsQ==\",\"xssFilter\":true,\"sqlInject\":true,\"disableDevtool\":false,\"tokenName\":\"Authorization\",\"tokenTimeout\":3600,\"tokenActiveTimeout\":86400,\"tokenIsConcurrent\":true,\"tokenIsShare\":true,\"tokenStyle\":\"uuid\",\"tokenIsLog\":false,\"tokenIsReadBody\":false,\"tokenIsReadCookie\":false,\"tokenIsReadHeader\":true,\"tokenIsPrint\":true,\"tokenIsWriteHeader\":false}', 13, 1, NULL, '2026-01-31 14:38:29', '2026-02-07 16:04:06');
INSERT INTO `sys_config_group` VALUES (15, 'wechatMiniProgram', '小程序配置', NULL, '{\"enabled\":false,\"appId\":\"\",\"appSecret\":\"\"}', 14, 1, '微信小程序登录配置', '2026-02-03 10:48:41', '2026-02-03 10:48:41');
INSERT INTO `sys_config_group` VALUES (16, 'wechatMp', '公众号配置', NULL, '{\"enabled\":false,\"appId\":\"\",\"appSecret\":\"\",\"token\":\"\",\"aesKey\":\"\",\"callbackUrl\":\"\",\"oauthRedirectUrl\":\"\",\"menuConfig\":\"\"}', 15, 1, '微信公众号配置', '2026-02-03 10:48:41', '2026-02-03 10:48:41');

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `parent_id` bigint NULL DEFAULT 0 COMMENT '父部门ID',
  `ancestors` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '祖级列表',
  `dept_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '部门名称',
  `sort` int NULL DEFAULT 0 COMMENT '显示顺序',
  `leader` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '负责人',
  `phone` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '联系电话',
  `email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '邮箱',
  `status` tinyint NULL DEFAULT 1 COMMENT '状态(0-停用 1-正常)',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `create_by` bigint NULL DEFAULT NULL COMMENT '创建人',
  `update_by` bigint NULL DEFAULT NULL COMMENT '更新人',
  `deleted` tinyint NULL DEFAULT 0 COMMENT '删除标识(0-未删除 1-已删除)',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '部门表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO `sys_dept` VALUES (1, 0, '0', '集团总部', -2, '陈建国', '010-88886666', 'corp@jiejie.com', 1, '2026-01-29 22:42:08', '2026-01-29 22:42:08', NULL, 1, 0);
INSERT INTO `sys_dept` VALUES (2, 1, '0,1', '研发中心', 0, '张三', '010-88886601', 'dev@jiejie.com', 1, '2026-01-29 22:42:08', '2026-01-29 22:42:08', NULL, 1, 0);
INSERT INTO `sys_dept` VALUES (3, 1, '0,1', '产品运营部', 1, '李四', '010-88886602', 'pm@jiejie.com', 1, '2026-01-29 22:42:08', '2026-01-29 22:42:08', NULL, 1, 0);
INSERT INTO `sys_dept` VALUES (4, 1, '0,1', '市场营销部', 2, '王五', '010-88886603', 'market@jiejie.com', 1, '2026-01-29 22:42:08', '2026-01-29 22:42:08', NULL, 1, 0);
INSERT INTO `sys_dept` VALUES (10, 2, '0,1,2', '前端研发部', 1, '林晓峰', '010-88886611', 'fe@jiejie.com', 1, '2026-01-29 22:42:08', '2026-01-29 22:42:08', 1, 1, 0);
INSERT INTO `sys_dept` VALUES (11, 2, '0,1,2', '后端研发部', 2, '周文博', '010-88886612', 'backend@jiejie.com', 1, '2026-01-29 22:42:08', '2026-01-29 22:42:08', 1, 1, 0);
INSERT INTO `sys_dept` VALUES (12, 2, '0,1,2', '移动端研发部', 3, '刘子墨', '010-88886613', 'mobile@jiejie.com', 1, '2026-01-29 22:42:08', '2026-01-29 22:42:08', 1, 1, 0);
INSERT INTO `sys_dept` VALUES (13, 2, '0,1,2', '测试质量部', 4, '吴天朗', '010-88886614', 'qa@jiejie.com', 1, '2026-01-29 22:42:08', '2026-01-29 22:42:08', 1, 1, 0);
INSERT INTO `sys_dept` VALUES (14, 3, '0,1,3', '产品策划组', 1, '黄馨予', '010-88886621', 'plan@jiejie.com', 1, '2026-01-29 22:42:08', '2026-01-29 22:42:08', 1, 1, 0);
INSERT INTO `sys_dept` VALUES (15, 3, '0,1,3', '用户运营组', 2, '韩雨濛', '010-88886622', 'ops@jiejie.com', 1, '2026-01-29 22:42:08', '2026-01-29 22:42:08', 1, 1, 0);
INSERT INTO `sys_dept` VALUES (16, 4, '0,1,4', '华东大区', 1, '徐海明', '021-66668888', 'east@jiejie.com', 1, '2026-01-29 22:42:08', '2026-01-29 22:42:08', 1, 1, 0);
INSERT INTO `sys_dept` VALUES (17, 4, '0,1,4', '华南大区', 2, '孙立新', '020-88886666', 'south@jiejie.com', 1, '2026-01-29 22:42:08', '2026-01-29 22:42:08', 1, 1, 0);
INSERT INTO `sys_dept` VALUES (18, 1, '0,1', '人力行政部', 5, '孙七', '010-88886650', 'hr@jiejie.com', 1, '2026-01-29 22:42:08', '2026-01-29 22:42:08', 1, 1, 0);
INSERT INTO `sys_dept` VALUES (19, 1, '0,1', '财务管理部', 6, '赵六', '010-88886660', 'finance@jiejie.com', 1, '2026-01-29 22:42:08', '2026-01-29 22:42:08', 1, 1, 0);

-- ----------------------------
-- Table structure for sys_dict_data
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_data`;
CREATE TABLE `sys_dict_data`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `sort` int NULL DEFAULT 0 COMMENT '字典排序',
  `dict_label` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '字典标签',
  `dict_value` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '字典键值',
  `dict_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '字典类型',
  `css_class` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '样式属性',
  `list_class` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '表格回显样式',
  `is_default` tinyint NULL DEFAULT 0 COMMENT '是否默认(0-否 1-是)',
  `status` tinyint NULL DEFAULT 1 COMMENT '状态(0-停用 1-正常)',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `create_by` bigint NULL DEFAULT NULL COMMENT '创建人',
  `update_by` bigint NULL DEFAULT NULL COMMENT '更新人',
  `deleted` tinyint NULL DEFAULT 0 COMMENT '删除标识(0-未删除 1-已删除)',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '字典数据表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_dict_data
-- ----------------------------
INSERT INTO `sys_dict_data` VALUES (1, 1, '男', '1', 'sys_user_sex', NULL, 'default', 0, 1, NULL, '2026-01-29 22:42:08', '2026-01-29 22:42:08', NULL, NULL, 0);
INSERT INTO `sys_dict_data` VALUES (2, 2, '女', '2', 'sys_user_sex', NULL, 'default', 0, 1, NULL, '2026-01-29 22:42:08', '2026-01-29 22:42:08', NULL, NULL, 0);
INSERT INTO `sys_dict_data` VALUES (3, 3, '未知', '0', 'sys_user_sex', NULL, 'default', 0, 1, NULL, '2026-01-29 22:42:08', '2026-01-29 22:42:08', NULL, NULL, 0);
INSERT INTO `sys_dict_data` VALUES (4, 1, '正常', '1', 'sys_status', NULL, 'success', 0, 1, NULL, '2026-01-29 22:42:08', '2026-01-29 22:42:08', NULL, NULL, 0);
INSERT INTO `sys_dict_data` VALUES (5, 2, '停用', '0', 'sys_status', NULL, 'error', 0, 1, NULL, '2026-01-29 22:42:08', '2026-01-29 22:42:08', NULL, NULL, 0);
INSERT INTO `sys_dict_data` VALUES (6, 1, '是', '1', 'sys_yes_no', NULL, 'success', 0, 1, NULL, '2026-01-29 22:42:08', '2026-01-29 22:42:08', NULL, NULL, 0);
INSERT INTO `sys_dict_data` VALUES (7, 2, '否', '0', 'sys_yes_no', NULL, 'error', 0, 1, NULL, '2026-01-29 22:42:08', '2026-01-29 22:42:08', NULL, NULL, 0);
INSERT INTO `sys_dict_data` VALUES (8, 0, 'sex', '1', 'sex', NULL, 'default', 0, 1, '', '2026-01-29 23:21:38', '2026-01-29 23:21:38', 1, 1, 0);
INSERT INTO `sys_dict_data` VALUES (9, 0, '女', '0', 'sex', NULL, 'default', 0, 1, '', '2026-01-29 23:21:58', '2026-01-29 23:21:58', 1, 1, 0);
INSERT INTO `sys_dict_data` VALUES (10, 0, '男', '1', 'gender', NULL, 'default', 0, 1, '', '2026-03-01 11:18:33', '2026-03-01 11:18:33', 1, 1, 0);
INSERT INTO `sys_dict_data` VALUES (11, 0, '女', '2', 'gender', NULL, 'default', 0, 1, '', '2026-03-01 11:18:39', '2026-03-01 11:18:39', 1, 1, 0);

-- ----------------------------
-- Table structure for sys_dict_type
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_type`;
CREATE TABLE `sys_dict_type`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `dict_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '字典名称',
  `dict_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '字典类型',
  `status` tinyint NULL DEFAULT 1 COMMENT '状态(0-停用 1-正常)',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `create_by` bigint NULL DEFAULT NULL COMMENT '创建人',
  `update_by` bigint NULL DEFAULT NULL COMMENT '更新人',
  `deleted` tinyint NULL DEFAULT 0 COMMENT '删除标识(0-未删除 1-已删除)',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_dict_type`(`dict_type` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '字典类型表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_dict_type
-- ----------------------------
INSERT INTO `sys_dict_type` VALUES (1, '用户性别', 'sys_user_sex', 1, '用户性别列表', '2026-01-29 22:42:08', '2026-03-01 11:18:09', NULL, 1, 1);
INSERT INTO `sys_dict_type` VALUES (2, '系统状态', 'sys_status', 1, '系统通用状态', '2026-01-29 22:42:08', '2026-01-29 22:42:08', NULL, NULL, 0);
INSERT INTO `sys_dict_type` VALUES (3, '是否', 'sys_yes_no', 1, '是否选项', '2026-01-29 22:42:08', '2026-01-29 22:42:08', NULL, NULL, 0);
INSERT INTO `sys_dict_type` VALUES (4, '性别', 'sex', 1, '', '2026-01-29 23:21:29', '2026-02-07 15:33:54', 1, 1, 1);
INSERT INTO `sys_dict_type` VALUES (5, '111', '222', 1, '', '2026-02-07 19:42:53', '2026-02-07 23:26:19', 1, 1, 1);
INSERT INTO `sys_dict_type` VALUES (6, '222', '333', 1, '', '2026-02-07 19:43:46', '2026-02-07 23:26:17', 1, 1, 1);
INSERT INTO `sys_dict_type` VALUES (7, '用户性别', 'gender', 1, '', '2026-01-29 22:42:08', '2026-01-29 22:42:08', 1, 1, 0);

-- ----------------------------
-- Table structure for sys_file
-- ----------------------------
DROP TABLE IF EXISTS `sys_file`;
CREATE TABLE `sys_file`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '文件ID',
  `original_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '原始文件名',
  `file_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '存储文件名',
  `file_path` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '文件路径',
  `url` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '文件访问URL',
  `file_size` bigint NULL DEFAULT 0 COMMENT '文件大小（字节）',
  `file_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '文件类型（MIME类型）',
  `file_suffix` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '文件后缀',
  `storage_type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '存储类型',
  `bucket_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '存储桶名称',
  `group_id` bigint NULL DEFAULT NULL COMMENT '分组ID',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '备注',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_file_path`(`file_path`(191) ASC) USING BTREE,
  INDEX `idx_storage_type`(`storage_type` ASC) USING BTREE,
  INDEX `idx_create_time`(`create_time` ASC) USING BTREE,
  INDEX `idx_group_id`(`group_id` ASC) USING BTREE,
  INDEX `idx_file_type`(`file_type` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 83 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '文件记录表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_file
-- ----------------------------
INSERT INTO `sys_file` VALUES (10, 'FPj0uHDhtvlIgwhfEk0-Lu-bp4Duopj5_GorB8Sxbqe4pKUR4-7HxwbA7VFa8fTK.jpg', '97c4a311e92b409db8eeaa919c2014e6.jpg', '2026/02/02/97c4a311e92b409db8eeaa919c2014e6.jpg', '/api/files/2026/02/02/97c4a311e92b409db8eeaa919c2014e6.jpg', 823196, 'image/jpeg', '.jpg', 'local', '', 1, '', '1', '2026-02-02 16:54:05');
INSERT INTO `sys_file` VALUES (45, 'img_v3_02ui_f0990cef-9f0d-4c6e-bba2-005ed10e088g.jpg', 'e321bfaf05754cb98700459c53fed98a.jpg', '2026/02/09/e321bfaf05754cb98700459c53fed98a.jpg', '/api/files/2026/02/09/e321bfaf05754cb98700459c53fed98a.jpg', 101083, 'image/jpeg', '.jpg', 'local', '', 1, '', '1', '2026-02-09 16:52:03');
INSERT INTO `sys_file` VALUES (48, 'img_v3_02t8_80c939c9-3e79-4c59-b10c-1716a88818ag.jpg', 'be55af87595046cdb2834cc611a81f30.jpg', '2026/02/09/be55af87595046cdb2834cc611a81f30.jpg', '/api/files/2026/02/09/be55af87595046cdb2834cc611a81f30.jpg', 108824, 'image/jpeg', '.jpg', 'local', '', 1, '', '1', '2026-02-09 16:54:07');
INSERT INTO `sys_file` VALUES (74, 'FPj0uHDhtvlIgwhfEk0-Lu-bp4Duopj5_GorB8Sxbqe4pKUR4-7HxwbA7VFa8fTK.jpg', '09f3e8016cf94b3ab30bb9457d6a1e9a.jpg', '2026/02/24/09f3e8016cf94b3ab30bb9457d6a1e9a.jpg', '/api/files/2026/02/24/09f3e8016cf94b3ab30bb9457d6a1e9a.jpg', 823196, 'image/jpeg', '.jpg', 'local', '', NULL, '', '1', '2026-02-24 14:18:04');
INSERT INTO `sys_file` VALUES (75, 'caa41ac5c974e4fa96b1df176aeba849.png', 'cea0ee440cbd4b22a9385e58c8f0993c.png', '2026/02/24/cea0ee440cbd4b22a9385e58c8f0993c.png', '/api/files/2026/02/24/cea0ee440cbd4b22a9385e58c8f0993c.png', 16286, 'image/png', '.png', 'local', '', NULL, '', '1', '2026-02-24 14:18:21');
INSERT INTO `sys_file` VALUES (76, 'FPj0uHDhtvlIgwhfEk0-Lu-bp4Duopj5_GorB8Sxbqe4pKUR4-7HxwbA7VFa8fTK.jpg', '4b7ec7ab82f64706a2fe36d913d303ac.jpg', '2026/02/24/4b7ec7ab82f64706a2fe36d913d303ac.jpg', '/api/files/2026/02/24/4b7ec7ab82f64706a2fe36d913d303ac.jpg', 823196, 'image/jpeg', '.jpg', 'local', '', NULL, '', '1', '2026-02-24 21:52:41');
INSERT INTO `sys_file` VALUES (79, 'default-avatar.jpg', '2a43fbbb30774548a73df204819fdf43.jpg', '2026/02/25/2a43fbbb30774548a73df204819fdf43.jpg', '/api/files/2026/02/25/2a43fbbb30774548a73df204819fdf43.jpg', 22859, 'image/jpeg', '.jpg', 'local', '', NULL, '', '1', '2026-02-25 16:32:19');
INSERT INTO `sys_file` VALUES (80, 'default-avatar.jpg', '455f90b28929422db2b6beac0174be00.jpg', 'images/2026/03/01/455f90b28929422db2b6beac0174be00.jpg', '/api/files/images/2026/03/01/455f90b28929422db2b6beac0174be00.jpg', 22859, 'image/jpeg', '.jpg', 'local', '', NULL, '', '1', '2026-03-01 11:29:29');
INSERT INTO `sys_file` VALUES (81, 'default-avatar.jpg', '25d29e831ee3432ebd87a59c7b53fade.jpg', 'images/2026/03/01/25d29e831ee3432ebd87a59c7b53fade.jpg', '/api/files/images/2026/03/01/25d29e831ee3432ebd87a59c7b53fade.jpg', 22859, 'image/jpeg', '.jpg', 'local', '', NULL, '', '1', '2026-03-01 12:08:27');
INSERT INTO `sys_file` VALUES (82, 'default-avatar.jpg', '0f6511a67ffb431abf18fa218066d992.jpg', 'images/2026/03/01/0f6511a67ffb431abf18fa218066d992.jpg', '/api/files/images/2026/03/01/0f6511a67ffb431abf18fa218066d992.jpg', 22859, 'image/jpeg', '.jpg', 'local', '', NULL, '', '1', '2026-03-01 12:16:11');

-- ----------------------------
-- Table structure for sys_file_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_file_config`;
CREATE TABLE `sys_file_config`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '配置ID',
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '配置名称',
  `storage_type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '存储类型(local/minio/aliyun)',
  `master` tinyint NULL DEFAULT 0 COMMENT '是否为主配置(0否 1是)',
  `domain` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '访问域名',
  `base_path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '基础路径(本地存储)',
  `bucket_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '存储桶名称',
  `access_key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '访问密钥',
  `secret_key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '秘密密钥',
  `endpoint` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '端点地址',
  `region` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '地域',
  `status` tinyint NULL DEFAULT 1 COMMENT '状态(0禁用 1启用)',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  `create_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '创建者',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '更新者',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_storage_type`(`storage_type` ASC) USING BTREE,
  INDEX `idx_master`(`master` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '文件存储配置表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_file_config
-- ----------------------------
INSERT INTO `sys_file_config` VALUES (1, '本地存储', 'local', 1, 'http://localhost:8080', 'D:/uploads', NULL, NULL, NULL, NULL, NULL, 1, '默认本地存储配置', NULL, '2026-01-30 23:35:08', NULL, '2026-01-30 23:35:08');

-- ----------------------------
-- Table structure for sys_file_group
-- ----------------------------
DROP TABLE IF EXISTS `sys_file_group`;
CREATE TABLE `sys_file_group`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '分组ID',
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '分组名称',
  `sort` int NULL DEFAULT 0 COMMENT '排序',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '创建者',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '文件分组表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_file_group
-- ----------------------------
INSERT INTO `sys_file_group` VALUES (1, '测试分组', 0, NULL, '2026-02-02 16:50:50', NULL);

-- ----------------------------
-- Table structure for sys_job
-- ----------------------------
DROP TABLE IF EXISTS `sys_job`;
CREATE TABLE `sys_job`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `job_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '任务名称',
  `job_group` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT 'DEFAULT' COMMENT '任务组名',
  `invoke_target` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调用目标字符串',
  `cron_expression` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'cron执行表达式',
  `misfire_policy` tinyint NULL DEFAULT 3 COMMENT '计划执行错误策略(1-立即执行 2-执行一次 3-放弃执行)',
  `concurrent` tinyint NULL DEFAULT 1 COMMENT '是否并发执行(0-允许 1-禁止)',
  `status` tinyint NULL DEFAULT 0 COMMENT '状态(0-暂停 1-正常)',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `create_by` bigint NULL DEFAULT NULL COMMENT '创建人',
  `update_by` bigint NULL DEFAULT NULL COMMENT '更新人',
  `deleted` tinyint NULL DEFAULT 0 COMMENT '删除标识(0-未删除 1-已删除)',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '定时任务表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_job
-- ----------------------------
INSERT INTO `sys_job` VALUES (1, '系统默认（无参）', 'DEFAULT', 'sampleTask.noParams', '0/10 * * * * ?', 3, 1, 0, '无参数的示例任务', '2026-01-29 22:42:08', '2026-01-29 22:42:08', NULL, NULL, 0);
INSERT INTO `sys_job` VALUES (2, '系统默认（有参）', 'DEFAULT', 'sampleTask.withParams(\'hello\')', '0/15 * * * * ?', 3, 1, 0, '有参数的示例任务', '2026-01-29 22:42:08', '2026-01-29 22:42:08', NULL, NULL, 0);
INSERT INTO `sys_job` VALUES (3, '测试任务', 'DEFAULT', 'sampleTask.noParams', '0/5 * * * * ?', 3, 1, 0, '111', '2026-01-29 22:59:47', '2026-01-29 22:59:47', 1, 1, 0);

-- ----------------------------
-- Table structure for sys_job_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_job_log`;
CREATE TABLE `sys_job_log`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `job_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '任务名称',
  `job_group` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '任务组名',
  `invoke_target` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '调用目标字符串',
  `job_message` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '日志信息',
  `status` tinyint NULL DEFAULT 0 COMMENT '执行状态(0-正常 1-失败)',
  `exception_info` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '异常信息',
  `start_time` datetime NULL DEFAULT NULL COMMENT '开始时间',
  `stop_time` datetime NULL DEFAULT NULL COMMENT '停止时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 32 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '定时任务日志表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_job_log
-- ----------------------------
INSERT INTO `sys_job_log` VALUES (1, '系统默认（有参）', 'DEFAULT', 'sampleTask.withParams(\'hello\')', '任务执行成功，参数: hello', 0, NULL, '2026-08-01 08:30:00', '2026-08-01 08:30:00');
INSERT INTO `sys_job_log` VALUES (2, '系统默认（有参）', 'DEFAULT', 'sampleTask.withParams(\'hello\')', '任务执行成功，参数: hello', 0, NULL, '2026-08-01 09:10:00', '2026-08-01 09:10:00');
INSERT INTO `sys_job_log` VALUES (3, '测试任务', 'DEFAULT', 'sampleTask.noParams', '测试调度完成', 0, NULL, '2026-08-01 09:50:00', '2026-08-01 09:50:00');
INSERT INTO `sys_job_log` VALUES (4, '测试任务', 'DEFAULT', 'sampleTask.noParams', '测试调度完成', 0, NULL, '2026-08-01 10:30:00', '2026-08-01 10:30:00');
INSERT INTO `sys_job_log` VALUES (5, '系统默认（有参）', 'DEFAULT', 'sampleTask.withParams(\'hello\')', '任务执行成功，参数: hello', 0, NULL, '2026-08-01 11:10:00', '2026-08-01 11:10:00');
INSERT INTO `sys_job_log` VALUES (6, '系统默认（有参）', 'DEFAULT', 'sampleTask.withParams(\'hello\')', '任务执行成功，参数: hello', 0, NULL, '2026-08-01 11:50:00', '2026-08-01 11:50:00');
INSERT INTO `sys_job_log` VALUES (7, '系统默认（无参）', 'DEFAULT', 'sampleTask.noParams', '任务执行成功', 0, NULL, '2026-08-01 12:30:00', '2026-08-01 12:30:00');
INSERT INTO `sys_job_log` VALUES (8, '系统默认（无参）', 'DEFAULT', 'sampleTask.noParams', '任务执行成功', 0, NULL, '2026-08-01 13:10:00', '2026-08-01 13:10:00');
INSERT INTO `sys_job_log` VALUES (9, '系统默认（有参）', 'DEFAULT', 'sampleTask.withParams(\'hello\')', '任务执行成功，参数: hello', 0, NULL, '2026-08-01 13:50:00', '2026-08-01 13:50:00');
INSERT INTO `sys_job_log` VALUES (10, '测试任务', 'DEFAULT', 'sampleTask.noParams', '测试调度完成', 0, NULL, '2026-08-01 14:30:00', '2026-08-01 14:30:00');
INSERT INTO `sys_job_log` VALUES (11, '系统默认（无参）', 'DEFAULT', 'sampleTask.noParams', '任务执行成功', 0, NULL, '2026-08-01 15:10:00', '2026-08-01 15:10:00');
INSERT INTO `sys_job_log` VALUES (12, '系统默认（无参）', 'DEFAULT', 'sampleTask.noParams', '任务执行成功', 0, NULL, '2026-08-01 15:50:00', '2026-08-01 15:50:00');
INSERT INTO `sys_job_log` VALUES (13, '测试任务', 'DEFAULT', 'sampleTask.noParams', '测试调度完成', 0, NULL, '2026-08-01 16:30:00', '2026-08-01 16:30:00');
INSERT INTO `sys_job_log` VALUES (14, '测试任务', 'DEFAULT', 'sampleTask.noParams', '测试调度完成', 0, NULL, '2026-08-01 17:10:00', '2026-08-01 17:10:00');
INSERT INTO `sys_job_log` VALUES (15, '系统默认（无参）', 'DEFAULT', 'sampleTask.noParams', '任务执行成功', 0, NULL, '2026-08-01 17:50:00', '2026-08-01 17:50:00');
INSERT INTO `sys_job_log` VALUES (16, '系统默认（有参）', 'DEFAULT', 'sampleTask.withParams(\'hello\')', '任务执行成功，参数: hello', 0, NULL, '2026-08-01 18:30:00', '2026-08-01 18:30:00');
INSERT INTO `sys_job_log` VALUES (17, '系统默认（无参）', 'DEFAULT', 'sampleTask.noParams', '任务执行成功', 0, NULL, '2026-08-01 19:10:00', '2026-08-01 19:10:00');
INSERT INTO `sys_job_log` VALUES (18, '系统默认（有参）', 'DEFAULT', 'sampleTask.withParams(\'hello\')', '任务执行成功，参数: hello', 0, NULL, '2026-08-01 19:50:00', '2026-08-01 19:50:00');
INSERT INTO `sys_job_log` VALUES (19, '系统默认（无参）', 'DEFAULT', 'sampleTask.noParams', '任务执行成功', 0, NULL, '2026-08-01 20:30:00', '2026-08-01 20:30:00');
INSERT INTO `sys_job_log` VALUES (20, '系统默认（有参）', 'DEFAULT', 'sampleTask.withParams(\'hello\')', '任务执行成功，参数: hello', 0, NULL, '2026-08-01 21:10:00', '2026-08-01 21:10:00');
INSERT INTO `sys_job_log` VALUES (21, '系统默认（无参）', 'DEFAULT', 'sampleTask.noParams', '任务执行成功', 0, NULL, '2026-08-01 21:50:00', '2026-08-01 21:50:00');
INSERT INTO `sys_job_log` VALUES (22, '系统默认（有参）', 'DEFAULT', 'sampleTask.withParams(\'hello\')', '任务执行成功，参数: hello', 0, NULL, '2026-08-01 22:30:00', '2026-08-01 22:30:00');
INSERT INTO `sys_job_log` VALUES (23, '系统默认（无参）', 'DEFAULT', 'sampleTask.noParams', '任务执行成功', 0, NULL, '2026-08-01 23:10:00', '2026-08-01 23:10:00');
INSERT INTO `sys_job_log` VALUES (24, '系统默认（无参）', 'DEFAULT', 'sampleTask.noParams', '任务执行成功', 0, NULL, '2026-08-01 23:50:00', '2026-08-01 23:50:00');
INSERT INTO `sys_job_log` VALUES (25, '测试任务', 'DEFAULT', 'sampleTask.noParams', '测试调度完成', 0, NULL, '2026-08-02 00:30:00', '2026-08-02 00:30:00');
INSERT INTO `sys_job_log` VALUES (26, '系统默认（有参）', 'DEFAULT', 'sampleTask.withParams(\'hello\')', '任务执行成功，参数: hello', 0, NULL, '2026-08-02 01:10:00', '2026-08-02 01:10:00');
INSERT INTO `sys_job_log` VALUES (27, '测试任务', 'DEFAULT', 'sampleTask.noParams', '测试调度完成', 0, NULL, '2026-08-02 01:50:00', '2026-08-02 01:50:00');
INSERT INTO `sys_job_log` VALUES (28, '系统默认（有参）', 'DEFAULT', 'sampleTask.withParams(\'hello\')', '任务执行成功，参数: hello', 0, NULL, '2026-08-02 02:30:00', '2026-08-02 02:30:00');
INSERT INTO `sys_job_log` VALUES (29, '系统默认（无参）', 'DEFAULT', 'sampleTask.noParams', '任务执行成功', 0, NULL, '2026-08-02 03:10:00', '2026-08-02 03:10:00');
INSERT INTO `sys_job_log` VALUES (30, '系统默认（有参）', 'DEFAULT', 'sampleTask.withParams(\'hello\')', '任务执行成功，参数: hello', 0, NULL, '2026-08-02 03:50:00', '2026-08-02 03:50:00');
INSERT INTO `sys_job_log` VALUES (31, '系统默认（无参）', 'DEFAULT', 'sampleTask.noParams', '任务执行成功', 0, NULL, '2026-08-02 04:30:00', '2026-08-02 04:30:00');
INSERT INTO `sys_job_log` VALUES (32, '系统默认（无参）', 'DEFAULT', 'sampleTask.noParams', '任务执行成功', 0, NULL, '2026-08-02 05:10:00', '2026-08-02 05:10:00');
INSERT INTO `sys_job_log` VALUES (33, '系统默认（无参）', 'DEFAULT', 'sampleTask.noParams', '任务执行成功', 0, NULL, '2026-08-02 05:50:00', '2026-08-02 05:50:00');
INSERT INTO `sys_job_log` VALUES (34, '系统默认（无参）', 'DEFAULT', 'sampleTask.noParams', '任务执行成功', 0, NULL, '2026-08-02 06:30:00', '2026-08-02 06:30:00');
INSERT INTO `sys_job_log` VALUES (35, '测试任务', 'DEFAULT', 'sampleTask.noParams', '测试调度完成', 0, NULL, '2026-08-02 07:10:00', '2026-08-02 07:10:00');

-- ----------------------------
-- Table structure for sys_login_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_login_log`;
CREATE TABLE `sys_login_log`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `username` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '用户账号',
  `ipaddr` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '登录IP地址',
  `login_location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '登录地点',
  `browser` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '浏览器类型',
  `os` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '操作系统',
  `status` tinyint NULL DEFAULT 0 COMMENT '登录状态(0-成功 1-失败)',
  `msg` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '提示消息',
  `login_time` datetime NULL DEFAULT NULL COMMENT '登录时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8390 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '登录日志表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_login_log
-- ----------------------------
INSERT INTO `sys_login_log` VALUES (1, 'sunqi', '138.163.169.143', '中国 上海市 浦东新区', 'Firefox 123.0', 'Ubuntu 22.04', 0, '登录成功', '2026-08-01 19:49:49');
INSERT INTO `sys_login_log` VALUES (2, 'zhou_wb', '140.10.167.21', '中国 湖北省 武汉市', 'Chrome 122.0.0.0', 'macOS Sonoma', 0, '登录成功', '2026-08-01 15:00:52');
INSERT INTO `sys_login_log` VALUES (3, 'zhou_wb', '136.111.74.90', '中国 江苏省 南京市', 'Safari 17.3', 'macOS Ventura', 0, '登录成功', '2026-08-02 16:40:04');
INSERT INTO `sys_login_log` VALUES (4, 'sunqi', '181.147.84.74', '中国 上海市 浦东新区', 'Firefox 123.0', 'Windows 10', 0, '登录成功', '2026-08-02 19:45:36');
INSERT INTO `sys_login_log` VALUES (5, 'zhaoliu', '218.191.104.94', '中国 北京市 海淀区', 'Firefox 123.0', 'macOS Ventura', 0, '登录成功', '2026-08-02 17:35:31');
INSERT INTO `sys_login_log` VALUES (6, 'zhangsan', '174.163.234.126', '中国 四川省 成都市', 'Firefox 123.0', 'Ubuntu 22.04', 0, '登录成功', '2026-08-02 14:36:59');
INSERT INTO `sys_login_log` VALUES (7, 'chen_jg', '183.67.206.34', '中国 北京市 海淀区', 'Chrome 122.0.0.0', 'Ubuntu 22.04', 0, '登录成功', '2026-08-03 09:45:39');
INSERT INTO `sys_login_log` VALUES (8, 'lin_xf', '128.133.236.59', '中国 湖北省 武汉市', 'Chrome 122.0.0.0', 'macOS Ventura', 0, '登录成功', '2026-08-03 19:59:34');
INSERT INTO `sys_login_log` VALUES (9, 'zhaoliu', '195.88.150.205', '中国 四川省 成都市', 'Firefox 123.0', 'macOS Ventura', 0, '登录成功', '2026-08-03 12:53:17');
INSERT INTO `sys_login_log` VALUES (10, 'admin', '193.162.127.206', '中国 广东省 广州市', 'Firefox 123.0', 'macOS Sonoma', 0, '登录成功', '2026-08-04 12:44:31');
INSERT INTO `sys_login_log` VALUES (11, 'zhou_wb', '213.121.152.170', '中国 湖北省 武汉市', 'Chrome 122.0.0.0', 'macOS Sonoma', 0, '登录成功', '2026-08-04 20:06:28');
INSERT INTO `sys_login_log` VALUES (12, 'chen_jg', '167.56.118.216', '中国 浙江省 杭州市', 'Firefox 123.0', 'Windows 11', 0, '登录成功', '2026-08-05 15:23:06');
INSERT INTO `sys_login_log` VALUES (13, 'wangwu', '128.125.244.4', '中国 四川省 成都市', 'Chrome 122.0.0.0', 'Windows 11', 0, '登录成功', '2026-08-05 16:59:53');
INSERT INTO `sys_login_log` VALUES (14, 'zhangsan', '141.40.168.12', '中国 广东省 深圳市', 'Safari 17.3', 'macOS Sonoma', 0, '登录成功', '2026-08-05 13:42:37');
INSERT INTO `sys_login_log` VALUES (15, 'zhou_wb', '179.67.131.151', '中国 广东省 广州市', 'Edge 122.0.2365.92', 'Ubuntu 22.04', 0, '登录成功', '2026-08-05 16:18:05');
INSERT INTO `sys_login_log` VALUES (16, 'lisi', '210.160.88.130', '中国 广东省 广州市', 'Firefox 123.0', 'macOS Ventura', 0, '登录成功', '2026-08-06 16:51:12');
INSERT INTO `sys_login_log` VALUES (17, 'lin_xf', '123.109.237.19', '中国 北京市 海淀区', 'Chrome 122.0.0.0', 'macOS Sonoma', 0, '登录成功', '2026-08-06 20:01:01');
INSERT INTO `sys_login_log` VALUES (18, 'chen_jg', '151.184.87.116', '中国 湖北省 武汉市', 'Safari 17.3', 'Windows 11', 0, '登录成功', '2026-08-06 15:36:39');
INSERT INTO `sys_login_log` VALUES (19, 'lisi', '165.169.96.118', '中国 广东省 深圳市', 'Edge 122.0.2365.92', 'Windows 11', 0, '登录成功', '2026-08-07 08:12:41');
INSERT INTO `sys_login_log` VALUES (20, 'lisi', '192.149.248.215', '中国 北京市 海淀区', 'Chrome 122.0.0.0', 'macOS Ventura', 0, '登录成功', '2026-08-07 18:12:30');
INSERT INTO `sys_login_log` VALUES (21, 'admin', '192.145.65.202', '中国 广东省 广州市', 'Edge 122.0.2365.92', 'Windows 10', 0, '登录成功', '2026-08-08 10:24:17');
INSERT INTO `sys_login_log` VALUES (22, 'lin_xf', '120.108.88.48', '中国 四川省 成都市', 'Safari 17.3', 'Windows 10', 0, '登录成功', '2026-08-08 15:49:52');
INSERT INTO `sys_login_log` VALUES (23, 'lin_xf', '169.55.93.133', '中国 浙江省 杭州市', 'Firefox 123.0', 'macOS Ventura', 0, '登录成功', '2026-08-08 20:33:50');
INSERT INTO `sys_login_log` VALUES (24, 'zhaoliu', '218.64.69.2', '中国 上海市 浦东新区', 'Chrome 122.0.0.0', 'macOS Ventura', 0, '登录成功', '2026-08-08 14:34:50');
INSERT INTO `sys_login_log` VALUES (25, 'lisi', '155.50.100.144', '中国 北京市 海淀区', 'Edge 122.0.2365.92', 'Windows 11', 0, '登录成功', '2026-08-09 12:35:48');
INSERT INTO `sys_login_log` VALUES (26, 'wangwu', '182.78.181.143', '中国 浙江省 杭州市', 'Edge 122.0.2365.92', 'Windows 11', 0, '登录成功', '2026-08-09 09:27:10');
INSERT INTO `sys_login_log` VALUES (27, 'zhangsan', '207.101.194.206', '中国 北京市 海淀区', 'Edge 122.0.2365.92', 'Windows 11', 0, '登录成功', '2026-08-09 12:37:53');
INSERT INTO `sys_login_log` VALUES (28, 'zhangsan', '150.51.76.66', '中国 浙江省 杭州市', 'Chrome 122.0.0.0', 'Windows 11', 0, '登录成功', '2026-08-09 20:16:26');
INSERT INTO `sys_login_log` VALUES (29, 'admin', '140.15.89.32', '中国 上海市 浦东新区', 'Chrome 122.0.0.0', 'Ubuntu 22.04', 0, '登录成功', '2026-08-10 13:20:49');
INSERT INTO `sys_login_log` VALUES (30, 'zhou_wb', '161.90.165.56', '中国 北京市 海淀区', 'Firefox 123.0', 'macOS Ventura', 0, '登录成功', '2026-08-10 09:43:23');
INSERT INTO `sys_login_log` VALUES (31, 'zhaoliu', '147.101.24.189', '中国 四川省 成都市', 'Firefox 123.0', 'Windows 11', 0, '登录成功', '2026-08-11 13:18:46');
INSERT INTO `sys_login_log` VALUES (32, 'zhangsan', '208.116.91.150', '中国 浙江省 杭州市', 'Chrome 122.0.0.0', 'Ubuntu 22.04', 0, '登录成功', '2026-08-11 11:35:03');
INSERT INTO `sys_login_log` VALUES (33, 'zhangsan', '189.41.40.10', '中国 广东省 广州市', 'Edge 122.0.2365.92', 'Ubuntu 22.04', 0, '登录成功', '2026-08-11 18:41:19');
INSERT INTO `sys_login_log` VALUES (34, 'admin', '184.42.101.107', '中国 四川省 成都市', 'Firefox 123.0', 'macOS Ventura', 0, '登录成功', '2026-08-11 14:42:14');
INSERT INTO `sys_login_log` VALUES (35, 'lisi', '194.193.249.139', '中国 北京市 海淀区', 'Firefox 123.0', 'macOS Sonoma', 0, '登录成功', '2026-08-12 11:01:01');
INSERT INTO `sys_login_log` VALUES (36, 'zhaoliu', '163.77.90.36', '中国 湖北省 武汉市', 'Chrome 122.0.0.0', 'Windows 10', 0, '登录成功', '2026-08-12 18:55:52');
INSERT INTO `sys_login_log` VALUES (37, 'zhaoliu', '191.143.203.191', '中国 江苏省 南京市', 'Safari 17.3', 'Windows 11', 0, '登录成功', '2026-08-13 08:40:15');
INSERT INTO `sys_login_log` VALUES (38, 'zhou_wb', '138.183.140.221', '中国 北京市 海淀区', 'Edge 122.0.2365.92', 'macOS Ventura', 0, '登录成功', '2026-08-13 13:50:14');
INSERT INTO `sys_login_log` VALUES (39, 'chen_jg', '153.61.105.92', '中国 浙江省 杭州市', 'Firefox 123.0', 'macOS Ventura', 0, '登录成功', '2026-08-13 15:57:50');
INSERT INTO `sys_login_log` VALUES (40, 'zhaoliu', '130.170.115.40', '中国 广东省 深圳市', 'Firefox 123.0', 'Windows 11', 0, '登录成功', '2026-08-13 16:44:26');
INSERT INTO `sys_login_log` VALUES (41, 'lisi', '148.105.149.188', '中国 上海市 浦东新区', 'Safari 17.3', 'Windows 10', 0, '登录成功', '2026-08-14 09:57:01');
INSERT INTO `sys_login_log` VALUES (42, 'chen_jg', '218.188.159.79', '中国 广东省 深圳市', 'Chrome 122.0.0.0', 'macOS Ventura', 0, '登录成功', '2026-08-14 16:51:41');
INSERT INTO `sys_login_log` VALUES (43, 'lisi', '120.46.197.100', '中国 上海市 浦东新区', 'Safari 17.3', 'Ubuntu 22.04', 0, '登录成功', '2026-08-15 08:47:37');
INSERT INTO `sys_login_log` VALUES (44, 'wangwu', '147.85.148.74', '中国 广东省 广州市', 'Safari 17.3', 'Windows 10', 0, '登录成功', '2026-08-15 11:47:40');
INSERT INTO `sys_login_log` VALUES (45, 'admin', '164.101.217.198', '中国 湖北省 武汉市', 'Edge 122.0.2365.92', 'Ubuntu 22.04', 1, '验证码错误', '2026-08-15 10:10:01');
INSERT INTO `sys_login_log` VALUES (46, 'zhangsan', '217.105.26.95', '中国 北京市 海淀区', 'Safari 17.3', 'Windows 10', 0, '登录成功', '2026-08-15 17:39:15');
INSERT INTO `sys_login_log` VALUES (47, 'zhangsan', '172.37.233.215', '中国 江苏省 南京市', 'Chrome 122.0.0.0', 'macOS Ventura', 0, '登录成功', '2026-08-16 12:41:07');
INSERT INTO `sys_login_log` VALUES (48, 'sunqi', '173.40.152.133', '中国 湖北省 武汉市', 'Edge 122.0.2365.92', 'macOS Sonoma', 0, '登录成功', '2026-08-16 15:58:37');
INSERT INTO `sys_login_log` VALUES (49, 'zhangsan', '209.32.216.127', '中国 上海市 浦东新区', 'Safari 17.3', 'macOS Sonoma', 0, '登录成功', '2026-08-17 11:10:20');
INSERT INTO `sys_login_log` VALUES (50, 'lin_xf', '151.195.178.220', '中国 江苏省 南京市', 'Firefox 123.0', 'macOS Ventura', 0, '登录成功', '2026-08-17 11:51:29');
INSERT INTO `sys_login_log` VALUES (51, 'wangwu', '207.99.114.213', '中国 江苏省 南京市', 'Firefox 123.0', 'Windows 10', 0, '登录成功', '2026-08-17 19:36:42');
INSERT INTO `sys_login_log` VALUES (52, 'lisi', '144.94.223.31', '中国 四川省 成都市', 'Safari 17.3', 'macOS Sonoma', 0, '登录成功', '2026-08-18 15:16:09');
INSERT INTO `sys_login_log` VALUES (53, 'chen_jg', '139.94.46.144', '中国 浙江省 杭州市', 'Chrome 122.0.0.0', 'macOS Sonoma', 0, '登录成功', '2026-08-18 15:40:25');
INSERT INTO `sys_login_log` VALUES (54, 'lin_xf', '180.193.94.173', '中国 北京市 海淀区', 'Firefox 123.0', 'macOS Sonoma', 0, '登录成功', '2026-08-18 20:59:31');
INSERT INTO `sys_login_log` VALUES (55, 'chen_jg', '164.100.175.85', '中国 广东省 深圳市', 'Chrome 122.0.0.0', 'macOS Ventura', 0, '登录成功', '2026-08-18 08:17:35');
INSERT INTO `sys_login_log` VALUES (56, 'zhaoliu', '152.158.174.157', '中国 广东省 广州市', 'Firefox 123.0', 'macOS Ventura', 0, '登录成功', '2026-08-19 15:21:00');
INSERT INTO `sys_login_log` VALUES (57, 'admin', '191.40.179.219', '中国 广东省 深圳市', 'Safari 17.3', 'macOS Sonoma', 1, '验证码错误', '2026-08-19 15:32:17');
INSERT INTO `sys_login_log` VALUES (58, 'sunqi', '181.187.58.138', '中国 上海市 浦东新区', 'Chrome 122.0.0.0', 'Windows 11', 0, '登录成功', '2026-08-19 11:29:13');
INSERT INTO `sys_login_log` VALUES (59, 'lisi', '120.155.116.183', '中国 浙江省 杭州市', 'Edge 122.0.2365.92', 'Windows 11', 1, '密码错误', '2026-08-19 08:11:35');
INSERT INTO `sys_login_log` VALUES (60, 'chen_jg', '170.178.179.88', '中国 广东省 深圳市', 'Safari 17.3', 'macOS Sonoma', 0, '登录成功', '2026-08-20 15:16:31');
INSERT INTO `sys_login_log` VALUES (61, 'sunqi', '114.174.135.35', '中国 浙江省 杭州市', 'Chrome 122.0.0.0', 'macOS Ventura', 0, '登录成功', '2026-08-20 12:53:48');
INSERT INTO `sys_login_log` VALUES (62, 'zhou_wb', '157.80.141.216', '中国 广东省 深圳市', 'Firefox 123.0', 'macOS Sonoma', 0, '登录成功', '2026-08-20 08:52:26');
INSERT INTO `sys_login_log` VALUES (63, 'zhangsan', '171.167.33.219', '中国 浙江省 杭州市', 'Safari 17.3', 'macOS Ventura', 0, '登录成功', '2026-08-20 13:23:11');
INSERT INTO `sys_login_log` VALUES (64, 'chen_jg', '207.75.233.136', '中国 广东省 广州市', 'Firefox 123.0', 'Windows 11', 0, '登录成功', '2026-08-21 11:01:29');
INSERT INTO `sys_login_log` VALUES (65, 'wangwu', '164.140.229.135', '中国 广东省 深圳市', 'Edge 122.0.2365.92', 'Ubuntu 22.04', 0, '登录成功', '2026-08-21 12:49:55');
INSERT INTO `sys_login_log` VALUES (66, 'zhou_wb', '181.183.225.220', '中国 广东省 广州市', 'Safari 17.3', 'macOS Sonoma', 0, '登录成功', '2026-08-22 14:34:39');
INSERT INTO `sys_login_log` VALUES (67, 'chen_jg', '129.165.151.181', '中国 广东省 深圳市', 'Edge 122.0.2365.92', 'Windows 10', 0, '登录成功', '2026-08-22 20:42:36');
INSERT INTO `sys_login_log` VALUES (68, 'admin', '145.86.250.210', '中国 北京市 海淀区', 'Edge 122.0.2365.92', 'Windows 10', 0, '登录成功', '2026-08-22 16:44:22');
INSERT INTO `sys_login_log` VALUES (69, 'lisi', '131.57.187.14', '中国 湖北省 武汉市', 'Edge 122.0.2365.92', 'Windows 10', 0, '登录成功', '2026-08-22 17:31:58');
INSERT INTO `sys_login_log` VALUES (70, 'admin', '138.141.103.228', '中国 浙江省 杭州市', 'Chrome 122.0.0.0', 'macOS Ventura', 0, '登录成功', '2026-08-23 14:09:57');
INSERT INTO `sys_login_log` VALUES (71, 'sunqi', '201.140.20.121', '中国 广东省 广州市', 'Chrome 122.0.0.0', 'Windows 11', 0, '登录成功', '2026-08-23 17:54:45');
INSERT INTO `sys_login_log` VALUES (72, 'zhaoliu', '206.17.51.129', '中国 江苏省 南京市', 'Edge 122.0.2365.92', 'Windows 11', 0, '登录成功', '2026-08-23 14:12:53');
INSERT INTO `sys_login_log` VALUES (73, 'lisi', '138.179.136.55', '中国 广东省 深圳市', 'Safari 17.3', 'Windows 10', 0, '登录成功', '2026-08-23 14:46:27');
INSERT INTO `sys_login_log` VALUES (74, 'sunqi', '149.171.199.113', '中国 广东省 深圳市', 'Firefox 123.0', 'Windows 11', 0, '登录成功', '2026-08-24 11:47:12');
INSERT INTO `sys_login_log` VALUES (75, 'zhangsan', '155.192.183.160', '中国 上海市 浦东新区', 'Edge 122.0.2365.92', 'Windows 11', 0, '登录成功', '2026-08-24 18:27:12');
INSERT INTO `sys_login_log` VALUES (76, 'lin_xf', '180.47.175.230', '中国 北京市 海淀区', 'Safari 17.3', 'macOS Sonoma', 0, '登录成功', '2026-08-24 14:00:30');
INSERT INTO `sys_login_log` VALUES (77, 'zhou_wb', '217.100.134.253', '中国 浙江省 杭州市', 'Edge 122.0.2365.92', 'Windows 11', 0, '登录成功', '2026-08-25 16:14:22');
INSERT INTO `sys_login_log` VALUES (78, 'zhou_wb', '187.172.161.13', '中国 四川省 成都市', 'Safari 17.3', 'macOS Sonoma', 0, '登录成功', '2026-08-25 09:29:29');
INSERT INTO `sys_login_log` VALUES (79, 'sunqi', '214.80.85.10', '中国 上海市 浦东新区', 'Chrome 122.0.0.0', 'Ubuntu 22.04', 1, '密码错误', '2026-08-25 15:36:06');
INSERT INTO `sys_login_log` VALUES (80, 'lin_xf', '188.132.148.6', '中国 湖北省 武汉市', 'Edge 122.0.2365.92', 'macOS Sonoma', 0, '登录成功', '2026-08-25 09:25:05');
INSERT INTO `sys_login_log` VALUES (81, 'chen_jg', '112.21.201.249', '中国 浙江省 杭州市', 'Chrome 122.0.0.0', 'Ubuntu 22.04', 0, '登录成功', '2026-08-26 19:54:57');
INSERT INTO `sys_login_log` VALUES (82, 'sunqi', '149.130.71.83', '中国 广东省 广州市', 'Firefox 123.0', 'Windows 10', 0, '登录成功', '2026-08-26 16:55:54');
INSERT INTO `sys_login_log` VALUES (83, 'lin_xf', '172.73.162.48', '中国 北京市 海淀区', 'Firefox 123.0', 'Windows 10', 0, '登录成功', '2026-08-27 17:30:37');
INSERT INTO `sys_login_log` VALUES (84, 'lin_xf', '177.14.137.243', '中国 湖北省 武汉市', 'Edge 122.0.2365.92', 'macOS Ventura', 0, '登录成功', '2026-08-27 16:29:50');
INSERT INTO `sys_login_log` VALUES (85, 'lisi', '140.143.90.69', '中国 浙江省 杭州市', 'Firefox 123.0', 'Ubuntu 22.04', 1, '密码错误', '2026-08-27 16:10:33');
INSERT INTO `sys_login_log` VALUES (86, 'sunqi', '185.29.151.44', '中国 广东省 深圳市', 'Firefox 123.0', 'macOS Ventura', 0, '登录成功', '2026-08-28 20:06:51');
INSERT INTO `sys_login_log` VALUES (87, 'lin_xf', '110.72.60.14', '中国 四川省 成都市', 'Safari 17.3', 'Windows 10', 0, '登录成功', '2026-08-28 13:05:16');
INSERT INTO `sys_login_log` VALUES (88, 'admin', '200.171.215.183', '中国 广东省 深圳市', 'Chrome 122.0.0.0', 'macOS Ventura', 0, '登录成功', '2026-08-29 08:22:56');
INSERT INTO `sys_login_log` VALUES (89, 'zhou_wb', '219.58.176.167', '中国 北京市 海淀区', 'Firefox 123.0', 'Windows 11', 0, '登录成功', '2026-08-29 10:41:04');
INSERT INTO `sys_login_log` VALUES (90, 'wangwu', '146.168.175.12', '中国 北京市 海淀区', 'Firefox 123.0', 'macOS Sonoma', 0, '登录成功', '2026-08-30 19:46:34');
INSERT INTO `sys_login_log` VALUES (91, 'lisi', '173.23.148.91', '中国 广东省 深圳市', 'Edge 122.0.2365.92', 'Ubuntu 22.04', 0, '登录成功', '2026-08-30 09:15:02');
INSERT INTO `sys_login_log` VALUES (92, 'admin', '159.152.32.113', '中国 四川省 成都市', 'Edge 122.0.2365.92', 'Windows 10', 0, '登录成功', '2026-08-30 16:12:32');

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `parent_id` bigint NULL DEFAULT 0 COMMENT '父级ID',
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '菜单名称',
  `type` tinyint NOT NULL COMMENT '菜单类型(1-目录 2-菜单 3-按钮)',
  `path` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '路由地址',
  `component` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '组件路径',
  `permission` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '权限标识',
  `icon` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '图标',
  `sort` int NULL DEFAULT 0 COMMENT '排序',
  `visible` tinyint NULL DEFAULT 1 COMMENT '是否可见(0-隐藏 1-显示)',
  `status` tinyint NULL DEFAULT 1 COMMENT '状态(0-禁用 1-启用)',
  `is_frame` tinyint NULL DEFAULT 0 COMMENT '是否外链(0-否 1-是)',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `create_by` bigint NULL DEFAULT NULL COMMENT '创建人',
  `update_by` bigint NULL DEFAULT NULL COMMENT '更新人',
  `deleted` tinyint NULL DEFAULT 0 COMMENT '删除标识(0-未删除 1-已删除)',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 333 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '菜单表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES (1, 0, '系统管理', 1, '/system', NULL, NULL, 'SettingsOutline', 1, 1, 1, 0, '2026-01-29 22:42:08', '2026-01-29 22:42:08', NULL, NULL, 0);
INSERT INTO `sys_menu` VALUES (2, 1, '用户管理', 2, '/system/user', '/system/user/index', 'sys:user:list', 'PersonOutline', 1, 1, 1, 0, '2026-01-29 22:42:08', '2026-01-29 22:42:08', NULL, NULL, 0);
INSERT INTO `sys_menu` VALUES (3, 2, '新增用户', 3, NULL, NULL, 'sys:user:add', NULL, 1, 1, 1, 0, '2026-01-29 22:42:08', '2026-01-29 22:42:08', NULL, NULL, 0);
INSERT INTO `sys_menu` VALUES (4, 2, '编辑用户', 3, NULL, NULL, 'sys:user:edit', NULL, 2, 1, 1, 0, '2026-01-29 22:42:08', '2026-01-29 22:42:08', NULL, NULL, 0);
INSERT INTO `sys_menu` VALUES (5, 2, '删除用户', 3, NULL, NULL, 'sys:user:delete', NULL, 3, 1, 1, 0, '2026-01-29 22:42:08', '2026-01-29 22:42:08', NULL, NULL, 0);
INSERT INTO `sys_menu` VALUES (6, 1, '角色管理', 2, '/system/role', '/system/role/index', 'sys:role:list', 'PeopleOutline', 2, 1, 1, 0, '2026-01-29 22:42:08', '2026-01-29 22:42:08', NULL, NULL, 0);
INSERT INTO `sys_menu` VALUES (7, 6, '新增角色', 3, NULL, NULL, 'sys:role:add', NULL, 1, 1, 1, 0, '2026-01-29 22:42:08', '2026-01-29 22:42:08', NULL, NULL, 0);
INSERT INTO `sys_menu` VALUES (8, 6, '编辑角色', 3, NULL, NULL, 'sys:role:edit', NULL, 2, 1, 1, 0, '2026-01-29 22:42:08', '2026-01-29 22:42:08', NULL, NULL, 0);
INSERT INTO `sys_menu` VALUES (9, 6, '删除角色', 3, NULL, NULL, 'sys:role:delete', NULL, 3, 1, 1, 0, '2026-01-29 22:42:08', '2026-01-29 22:42:08', NULL, NULL, 0);
INSERT INTO `sys_menu` VALUES (10, 1, '菜单管理', 2, '/system/menu', '/system/menu/index', 'sys:menu:list', 'MenuOutline', 3, 1, 1, 0, '2026-01-29 22:42:08', '2026-01-29 22:42:08', NULL, NULL, 0);
INSERT INTO `sys_menu` VALUES (11, 10, '新增菜单', 3, NULL, NULL, 'sys:menu:add', NULL, 1, 1, 1, 0, '2026-01-29 22:42:08', '2026-01-29 22:42:08', NULL, NULL, 0);
INSERT INTO `sys_menu` VALUES (12, 10, '编辑菜单', 3, NULL, NULL, 'sys:menu:edit', NULL, 2, 1, 1, 0, '2026-01-29 22:42:08', '2026-01-29 22:42:08', NULL, NULL, 0);
INSERT INTO `sys_menu` VALUES (13, 10, '删除菜单', 3, NULL, NULL, 'sys:menu:delete', NULL, 3, 1, 1, 0, '2026-01-29 22:42:08', '2026-01-29 22:42:08', NULL, NULL, 0);
INSERT INTO `sys_menu` VALUES (14, 1, '字典管理', 2, '/system/dict', '/system/dict/index', 'sys:dict:list', 'BookOutline', 4, 1, 1, 0, '2026-01-29 22:42:08', '2026-01-29 22:42:08', NULL, NULL, 0);
INSERT INTO `sys_menu` VALUES (15, 14, '新增字典', 3, NULL, NULL, 'sys:dict:add', NULL, 1, 1, 1, 0, '2026-01-29 22:42:08', '2026-01-29 22:42:08', NULL, NULL, 0);
INSERT INTO `sys_menu` VALUES (16, 14, '编辑字典', 3, NULL, NULL, 'sys:dict:edit', NULL, 2, 1, 1, 0, '2026-01-29 22:42:08', '2026-01-29 22:42:08', NULL, NULL, 0);
INSERT INTO `sys_menu` VALUES (17, 14, '删除字典', 3, NULL, NULL, 'sys:dict:delete', NULL, 3, 1, 1, 0, '2026-01-29 22:42:08', '2026-01-29 22:42:08', NULL, NULL, 0);
INSERT INTO `sys_menu` VALUES (18, 1, '系统配置', 2, '/system/config', '/system/config/index', 'sys:config:list', 'SettingsSharp', 5, 1, 1, 0, '2026-01-29 22:42:08', '2026-01-29 22:42:08', NULL, NULL, 0);
INSERT INTO `sys_menu` VALUES (19, 18, '新增配置', 3, NULL, NULL, 'sys:config:add', NULL, 1, 1, 1, 0, '2026-01-29 22:42:08', '2026-01-29 22:42:08', NULL, NULL, 0);
INSERT INTO `sys_menu` VALUES (20, 18, '编辑配置', 3, NULL, NULL, 'sys:config:edit', NULL, 2, 1, 1, 0, '2026-01-29 22:42:08', '2026-01-29 22:42:08', NULL, NULL, 0);
INSERT INTO `sys_menu` VALUES (21, 18, '删除配置', 3, NULL, NULL, 'sys:config:delete', NULL, 3, 1, 1, 0, '2026-01-29 22:42:08', '2026-01-29 22:42:08', NULL, NULL, 0);
INSERT INTO `sys_menu` VALUES (22, 0, '组织管理', 1, '/org', NULL, NULL, 'BusinessOutline', 2, 1, 1, 0, '2026-01-29 22:42:08', '2026-01-29 22:42:08', NULL, NULL, 0);
INSERT INTO `sys_menu` VALUES (23, 22, '部门管理', 2, '/org/dept', '/org/dept/index', 'sys:dept:list', 'GitNetworkOutline', 1, 1, 1, 0, '2026-01-29 22:42:08', '2026-01-29 22:42:08', NULL, NULL, 0);
INSERT INTO `sys_menu` VALUES (24, 23, '新增部门', 3, NULL, NULL, 'sys:dept:add', NULL, 1, 1, 1, 0, '2026-01-29 22:42:08', '2026-01-29 22:42:08', NULL, NULL, 0);
INSERT INTO `sys_menu` VALUES (25, 23, '编辑部门', 3, NULL, NULL, 'sys:dept:edit', NULL, 2, 1, 1, 0, '2026-01-29 22:42:08', '2026-01-29 22:42:08', NULL, NULL, 0);
INSERT INTO `sys_menu` VALUES (26, 23, '删除部门', 3, NULL, NULL, 'sys:dept:delete', NULL, 3, 1, 1, 0, '2026-01-29 22:42:08', '2026-01-29 22:42:08', NULL, NULL, 0);
INSERT INTO `sys_menu` VALUES (27, 22, '岗位管理', 2, '/org/post', '/org/post/index', 'sys:post:list', 'IdCardOutline', 2, 1, 1, 0, '2026-01-29 22:42:08', '2026-01-29 22:42:08', NULL, NULL, 0);
INSERT INTO `sys_menu` VALUES (28, 27, '新增岗位', 3, NULL, NULL, 'sys:post:add', NULL, 1, 1, 1, 0, '2026-01-29 22:42:08', '2026-01-29 22:42:08', NULL, NULL, 0);
INSERT INTO `sys_menu` VALUES (29, 27, '编辑岗位', 3, NULL, NULL, 'sys:post:edit', NULL, 2, 1, 1, 0, '2026-01-29 22:42:08', '2026-01-29 22:42:08', NULL, NULL, 0);
INSERT INTO `sys_menu` VALUES (30, 27, '删除岗位', 3, NULL, NULL, 'sys:post:delete', NULL, 3, 1, 1, 0, '2026-01-29 22:42:08', '2026-01-29 22:42:08', NULL, NULL, 0);
INSERT INTO `sys_menu` VALUES (31, 0, '系统日志', 1, '/log', NULL, NULL, 'DocumentTextOutline', 3, 1, 1, 0, '2026-01-29 22:42:08', '2026-01-29 22:42:08', NULL, NULL, 0);
INSERT INTO `sys_menu` VALUES (32, 31, '操作日志', 2, '/log/operlog', '/log/operlog/index', 'monitor:operlog:list', 'ListOutline', 1, 1, 1, 0, '2026-01-29 22:42:08', '2026-01-29 22:42:08', NULL, NULL, 0);
INSERT INTO `sys_menu` VALUES (33, 32, '删除日志', 3, NULL, NULL, 'monitor:operlog:delete', NULL, 1, 1, 1, 0, '2026-01-29 22:42:08', '2026-01-29 22:42:08', NULL, NULL, 0);
INSERT INTO `sys_menu` VALUES (34, 31, '登录日志', 2, '/log/loginlog', '/log/loginlog/index', 'monitor:loginlog:list', 'LogInOutline', 2, 1, 1, 0, '2026-01-29 22:42:08', '2026-01-29 22:42:08', NULL, NULL, 0);
INSERT INTO `sys_menu` VALUES (35, 34, '删除日志', 3, NULL, NULL, 'monitor:loginlog:delete', NULL, 1, 1, 1, 0, '2026-01-29 22:42:08', '2026-01-29 22:42:08', NULL, NULL, 0);
INSERT INTO `sys_menu` VALUES (36, 0, '系统监控', 1, '/monitor', NULL, NULL, 'PulseOutline', 4, 1, 1, 0, '2026-01-29 22:42:08', '2026-01-29 22:42:08', NULL, NULL, 0);
INSERT INTO `sys_menu` VALUES (37, 36, '在线用户', 2, '/monitor/online', '/monitor/online/index', 'monitor:online:list', 'PeopleCircleOutline', 1, 1, 1, 0, '2026-01-29 22:42:08', '2026-01-29 22:42:08', NULL, NULL, 0);
INSERT INTO `sys_menu` VALUES (38, 37, '强退用户', 3, NULL, NULL, 'monitor:online:forceLogout', NULL, 1, 1, 1, 0, '2026-01-29 22:42:08', '2026-01-29 22:42:08', NULL, NULL, 0);
INSERT INTO `sys_menu` VALUES (39, 36, '定时任务', 2, '/monitor/job', '/monitor/job/index', 'monitor:job:list', 'TimerOutline', 2, 1, 1, 0, '2026-01-29 22:42:08', '2026-01-29 22:42:08', NULL, NULL, 0);
INSERT INTO `sys_menu` VALUES (40, 39, '新增任务', 3, NULL, NULL, 'monitor:job:add', NULL, 1, 1, 1, 0, '2026-01-29 22:42:08', '2026-01-29 22:42:08', NULL, NULL, 0);
INSERT INTO `sys_menu` VALUES (41, 39, '编辑任务', 3, NULL, NULL, 'monitor:job:edit', NULL, 2, 1, 1, 0, '2026-01-29 22:42:08', '2026-01-29 22:42:08', NULL, NULL, 0);
INSERT INTO `sys_menu` VALUES (42, 39, '删除任务', 3, NULL, NULL, 'monitor:job:delete', NULL, 3, 1, 1, 0, '2026-01-29 22:42:08', '2026-01-29 22:42:08', NULL, NULL, 0);
INSERT INTO `sys_menu` VALUES (43, 36, '缓存监控', 2, '/monitor/cache', '/monitor/cache/index', 'monitor:cache:list', 'ServerOutline', 3, 1, 1, 0, '2026-01-29 22:42:08', '2026-01-29 22:42:08', NULL, NULL, 0);
INSERT INTO `sys_menu` VALUES (44, 43, '删除缓存', 3, NULL, NULL, 'monitor:cache:delete', NULL, 1, 1, 1, 0, '2026-01-29 22:42:08', '2026-01-29 22:42:08', NULL, NULL, 0);
INSERT INTO `sys_menu` VALUES (45, 36, '服务监控', 2, '/monitor/server', '/monitor/server/index', 'monitor:server:list', 'DesktopOutline', 4, 1, 1, 0, '2026-01-29 22:42:08', '2026-01-29 22:42:08', NULL, NULL, 0);
INSERT INTO `sys_menu` VALUES (126, 0, '文件管理', 1, '/file', NULL, NULL, 'FolderOpenOutline', 5, 1, 1, 0, '2026-01-30 23:40:01', '2026-01-30 23:40:01', NULL, NULL, 0);
INSERT INTO `sys_menu` VALUES (127, 126, '文件列表', 2, '/system/file', '/system/file/index', 'sys:file:list', 'DocumentOutline', 1, 1, 1, 0, '2026-01-30 23:40:01', '2026-01-30 23:40:01', NULL, NULL, 0);
INSERT INTO `sys_menu` VALUES (128, 127, '上传文件', 3, NULL, NULL, 'sys:file:upload', NULL, 1, 1, 1, 0, '2026-01-30 23:40:01', '2026-01-30 23:40:01', NULL, NULL, 0);
INSERT INTO `sys_menu` VALUES (129, 127, '删除文件', 3, NULL, NULL, 'sys:file:delete', NULL, 2, 1, 1, 0, '2026-01-30 23:40:01', '2026-01-30 23:40:01', NULL, NULL, 0);
INSERT INTO `sys_menu` VALUES (130, 126, '文件配置', 2, '/system/file-config', '/system/file-config/index', 'sys:fileConfig:list', 'CloudOutline', 2, 1, 1, 0, '2026-01-30 23:40:01', '2026-01-31 14:43:52', NULL, 1, 1);
INSERT INTO `sys_menu` VALUES (131, 130, '新增配置', 3, NULL, NULL, 'sys:fileConfig:add', NULL, 1, 1, 1, 0, '2026-01-30 23:40:01', '2026-01-31 14:43:45', NULL, 1, 1);
INSERT INTO `sys_menu` VALUES (132, 130, '编辑配置', 3, NULL, NULL, 'sys:fileConfig:edit', NULL, 2, 1, 1, 0, '2026-01-30 23:40:01', '2026-01-31 14:43:47', NULL, 1, 1);
INSERT INTO `sys_menu` VALUES (133, 130, '删除配置', 3, NULL, NULL, 'sys:fileConfig:delete', NULL, 3, 1, 1, 0, '2026-01-30 23:40:01', '2026-01-31 14:43:50', NULL, 1, 1);
INSERT INTO `sys_menu` VALUES (134, 0, '消息中心', 1, '/message', NULL, NULL, 'NotificationsOutline', 6, 1, 1, 0, '2026-01-30 23:53:55', '2026-01-30 23:53:55', NULL, NULL, 0);
INSERT INTO `sys_menu` VALUES (135, 134, '系统通知', 2, '/message/notice', '/message/notice/index', 'sys:notice:list', 'NotificationsOutline', 1, 1, 1, 0, '2026-01-30 23:53:55', '2026-01-30 23:53:55', NULL, NULL, 0);
INSERT INTO `sys_menu` VALUES (136, 135, '新增通知', 3, NULL, NULL, 'sys:notice:add', NULL, 1, 1, 1, 0, '2026-01-30 23:53:55', '2026-01-30 23:53:55', NULL, NULL, 0);
INSERT INTO `sys_menu` VALUES (137, 135, '编辑通知', 3, NULL, NULL, 'sys:notice:edit', NULL, 2, 1, 1, 0, '2026-01-30 23:53:55', '2026-01-30 23:53:55', NULL, NULL, 0);
INSERT INTO `sys_menu` VALUES (138, 135, '删除通知', 3, NULL, NULL, 'sys:notice:delete', NULL, 3, 1, 1, 0, '2026-01-30 23:53:55', '2026-01-30 23:53:55', NULL, NULL, 0);
INSERT INTO `sys_menu` VALUES (139, 134, '即时聊天', 2, '/message/chat', '/message/chat/index', 'sys:chat:list', 'ChatbubbleOutline', 2, 1, 1, 0, '2026-01-30 23:53:55', '2026-01-30 23:53:55', NULL, NULL, 0);
INSERT INTO `sys_menu` VALUES (140, 0, '测试菜单', 1, '/test', '', '', 'StarOutline', 7, 0, 0, 0, '2026-01-31 20:17:37', '2026-01-31 20:17:37', 1, 1, 0);
INSERT INTO `sys_menu` VALUES (141, 140, '测试菜单', 2, '/test/test', '/test/test/index', '', 'SearchOutline', 0, 1, 1, 0, '2026-01-31 20:23:37', '2026-01-31 20:23:37', 1, 1, 0);
INSERT INTO `sys_menu` VALUES (142, 2, '用户列表', 3, '', '', 'sys:user:list', '', 0, 1, 1, 0, '2026-01-31 20:51:50', '2026-01-31 20:51:50', 4, 4, 0);
INSERT INTO `sys_menu` VALUES (143, 6, '角色列表', 3, '', '', 'sys:role:list', '', 0, 1, 1, 0, '2026-01-31 20:52:13', '2026-01-31 20:52:13', 4, 4, 0);
INSERT INTO `sys_menu` VALUES (144, 10, '菜单列表', 3, '', '', 'sys:menu:list', '', 0, 1, 1, 0, '2026-01-31 20:52:32', '2026-01-31 20:52:32', 4, 4, 0);
INSERT INTO `sys_menu` VALUES (145, 14, '字典列表', 3, '', '', 'sys:dict:list', '', 0, 1, 1, 0, '2026-01-31 20:52:52', '2026-01-31 20:52:52', 4, 4, 0);
INSERT INTO `sys_menu` VALUES (146, 23, '部门列表', 3, '', '', 'sys:dept:list', '', 0, 1, 1, 0, '2026-01-31 20:54:26', '2026-01-31 20:54:26', 4, 4, 0);
INSERT INTO `sys_menu` VALUES (147, 27, '岗位列表', 3, '', '', 'sys:post:list', '', 0, 1, 1, 0, '2026-01-31 20:54:45', '2026-01-31 20:54:45', 4, 4, 0);
INSERT INTO `sys_menu` VALUES (148, 32, '查询日志', 3, '', '', 'monitor:operlog:list', '', 0, 1, 1, 0, '2026-01-31 20:55:14', '2026-01-31 20:55:14', 4, 4, 0);
INSERT INTO `sys_menu` VALUES (149, 34, '日志列表', 3, '', '', 'monitor:loginlog:list', '', 0, 1, 1, 0, '2026-01-31 20:55:32', '2026-01-31 20:55:32', 4, 4, 0);
INSERT INTO `sys_menu` VALUES (150, 37, '在线用户列表', 3, '', '', 'monitor:online:list', '', 0, 1, 1, 0, '2026-01-31 20:56:04', '2026-01-31 20:56:04', 4, 4, 0);
INSERT INTO `sys_menu` VALUES (151, 39, '任务列表', 3, '', '', 'monitor:job:list', '', 0, 1, 1, 0, '2026-01-31 20:56:20', '2026-01-31 20:56:20', 4, 4, 0);
INSERT INTO `sys_menu` VALUES (152, 127, '文件列表', 3, '', '', 'sys:file:list', '', 0, 1, 1, 0, '2026-01-31 20:57:18', '2026-01-31 20:57:18', 1, 1, 0);
INSERT INTO `sys_menu` VALUES (153, 135, '系统通知', 3, '', '', 'sys:notice:list', '', 0, 1, 1, 0, '2026-01-31 20:57:55', '2026-01-31 20:57:55', 1, 1, 0);
INSERT INTO `sys_menu` VALUES (154, 36, '服务器管理', 2, '/monitor/server-manager', '/monitor/server-manager/index', NULL, 'ServerOutline', 5, 1, 1, 0, '2026-01-31 23:37:21', '2026-01-31 23:37:21', NULL, 1, 0);
INSERT INTO `sys_menu` VALUES (155, 154, '服务器列表', 3, NULL, NULL, 'monitor:server:list', NULL, 1, 1, 1, 0, '2026-01-31 23:37:21', '2026-01-31 23:37:21', NULL, NULL, 0);
INSERT INTO `sys_menu` VALUES (156, 154, '服务器详情', 3, NULL, NULL, 'monitor:server:query', NULL, 2, 1, 1, 0, '2026-01-31 23:37:21', '2026-01-31 23:37:21', NULL, NULL, 0);
INSERT INTO `sys_menu` VALUES (157, 154, '新增服务器', 3, NULL, NULL, 'monitor:server:add', NULL, 3, 1, 1, 0, '2026-01-31 23:37:21', '2026-01-31 23:37:21', NULL, NULL, 0);
INSERT INTO `sys_menu` VALUES (158, 154, '编辑服务器', 3, NULL, NULL, 'monitor:server:edit', NULL, 4, 1, 1, 0, '2026-01-31 23:37:21', '2026-01-31 23:37:21', NULL, NULL, 0);
INSERT INTO `sys_menu` VALUES (159, 154, '删除服务器', 3, NULL, NULL, 'monitor:server:remove', NULL, 5, 1, 1, 0, '2026-01-31 23:37:21', '2026-01-31 23:37:21', NULL, NULL, 0);
INSERT INTO `sys_menu` VALUES (160, 154, '测试连接', 3, NULL, NULL, 'monitor:server:test', NULL, 6, 1, 1, 0, '2026-01-31 23:37:21', '2026-01-31 23:37:21', NULL, NULL, 0);
INSERT INTO `sys_menu` VALUES (161, 0, '开发工具', 1, '', '', '', 'HammerOutline', 99, 1, 1, 0, '2026-02-02 19:50:38', '2026-02-02 19:52:36', NULL, NULL, 0);
INSERT INTO `sys_menu` VALUES (162, 161, '代码生成', 2, '/tool/gen', '/tool/gen/index', '', 'CodeSlashOutline', 1, 1, 1, 0, '2026-02-02 19:50:38', '2026-02-02 19:53:12', NULL, NULL, 0);
INSERT INTO `sys_menu` VALUES (163, 162, '查询', 3, '', '', 'tool:gen:list', '', 1, 1, 1, 0, '2026-02-02 19:50:38', '2026-02-02 19:52:40', NULL, NULL, 0);
INSERT INTO `sys_menu` VALUES (164, 162, '详情', 3, '', '', 'tool:gen:query', '', 2, 1, 1, 0, '2026-02-02 19:50:38', '2026-02-02 19:52:40', NULL, NULL, 0);
INSERT INTO `sys_menu` VALUES (165, 162, '导入', 3, '', '', 'tool:gen:import', '', 3, 1, 1, 0, '2026-02-02 19:50:38', '2026-02-02 19:52:40', NULL, NULL, 0);
INSERT INTO `sys_menu` VALUES (166, 162, '编辑', 3, '', '', 'tool:gen:edit', '', 4, 1, 1, 0, '2026-02-02 19:50:38', '2026-02-02 19:52:40', NULL, NULL, 0);
INSERT INTO `sys_menu` VALUES (167, 162, '删除', 3, '', '', 'tool:gen:remove', '', 5, 1, 1, 0, '2026-02-02 19:50:38', '2026-02-02 19:52:40', NULL, NULL, 0);
INSERT INTO `sys_menu` VALUES (168, 162, '预览', 3, '', '', 'tool:gen:preview', '', 6, 1, 1, 0, '2026-02-02 19:50:38', '2026-02-02 19:52:40', NULL, NULL, 0);
INSERT INTO `sys_menu` VALUES (169, 162, '生成代码', 3, '', '', 'tool:gen:code', '', 7, 1, 1, 0, '2026-02-02 19:50:38', '2026-02-02 19:52:40', NULL, NULL, 0);
INSERT INTO `sys_menu` VALUES (170, 1, '客户表', 2, '/system/customer', '/system/customer/index', '', 'ListOutline', 1, 0, 0, 0, '2026-02-02 19:57:54', '2026-02-02 19:57:54', NULL, 1, 0);
INSERT INTO `sys_menu` VALUES (171, 170, '客户表查询', 3, '', '', 'system:customer:list', '', 1, 1, 1, 0, '2026-02-02 19:57:54', '2026-02-02 19:57:54', NULL, NULL, 0);
INSERT INTO `sys_menu` VALUES (172, 170, '客户表详情', 3, '', '', 'system:customer:query', '', 2, 1, 1, 0, '2026-02-02 19:57:54', '2026-02-02 19:57:54', NULL, NULL, 0);
INSERT INTO `sys_menu` VALUES (173, 170, '客户表新增', 3, '', '', 'system:customer:add', '', 3, 1, 1, 0, '2026-02-02 19:57:54', '2026-02-02 19:57:54', NULL, NULL, 0);
INSERT INTO `sys_menu` VALUES (174, 170, '客户表修改', 3, '', '', 'system:customer:edit', '', 4, 1, 1, 0, '2026-02-02 19:57:54', '2026-02-02 19:57:54', NULL, NULL, 0);
INSERT INTO `sys_menu` VALUES (175, 170, '客户表删除', 3, '', '', 'system:customer:remove', '', 5, 1, 1, 0, '2026-02-02 19:57:54', '2026-02-02 19:57:54', NULL, NULL, 0);
INSERT INTO `sys_menu` VALUES (200, 0, '流程管理', 1, '/workflow', NULL, NULL, 'GitNetworkOutline', 3, 1, 1, 0, '2026-08-27 12:03:11', '2026-08-27 12:16:30', NULL, NULL, 0);
INSERT INTO `sys_menu` VALUES (201, 200, '流程定义', 2, '/workflow/definition', 'workflow/definition/index', 'workflow:definition:list', 'DocumentTextOutline', 1, 1, 1, 0, '2026-08-27 12:03:11', '2026-08-27 12:16:30', NULL, NULL, 0);
INSERT INTO `sys_menu` VALUES (202, 200, '流程设计', 2, '/workflow/designer', 'workflow/designer/index', 'workflow:definition:design', 'CreateOutline', 2, 0, 1, 0, '2026-08-27 12:03:11', '2026-08-27 12:16:30', NULL, NULL, 0);
INSERT INTO `sys_menu` VALUES (203, 200, '我的待办', 2, '/workflow/task/todo', 'workflow/task/todo', 'workflow:task:list', 'CheckboxOutline', 3, 1, 1, 0, '2026-08-27 12:03:11', '2026-08-27 12:16:30', NULL, NULL, 0);
INSERT INTO `sys_menu` VALUES (204, 200, '我的已办', 2, '/workflow/task/done', 'workflow/task/done', 'workflow:task:list', 'CheckmarkDoneOutline', 4, 1, 1, 0, '2026-08-27 12:03:11', '2026-08-27 12:16:30', NULL, NULL, 0);
INSERT INTO `sys_menu` VALUES (205, 200, '流程监控', 2, '/workflow/monitor', 'workflow/monitor/index', 'workflow:instance:list', 'AnalyticsOutline', 5, 1, 1, 0, '2026-08-27 12:03:11', '2026-08-27 12:16:30', NULL, NULL, 0);
INSERT INTO `sys_menu` VALUES (206, 201, '查询', 3, NULL, NULL, 'workflow:definition:query', NULL, 1, 1, 1, 0, '2026-08-27 12:03:11', '2026-08-27 12:16:30', NULL, NULL, 0);
INSERT INTO `sys_menu` VALUES (207, 201, '新增', 3, NULL, NULL, 'workflow:definition:add', NULL, 2, 1, 1, 0, '2026-08-27 12:03:11', '2026-08-27 12:16:30', NULL, NULL, 0);
INSERT INTO `sys_menu` VALUES (208, 201, '编辑', 3, NULL, NULL, 'workflow:definition:edit', NULL, 3, 1, 1, 0, '2026-08-27 12:03:11', '2026-08-27 12:16:30', NULL, NULL, 0);
INSERT INTO `sys_menu` VALUES (209, 201, '删除', 3, NULL, NULL, 'workflow:definition:remove', NULL, 4, 1, 1, 0, '2026-08-27 12:03:11', '2026-08-27 12:16:30', NULL, NULL, 0);
INSERT INTO `sys_menu` VALUES (210, 201, '发布', 3, NULL, NULL, 'workflow:definition:publish', NULL, 5, 1, 1, 0, '2026-08-27 12:03:11', '2026-08-27 12:16:30', NULL, NULL, 0);
INSERT INTO `sys_menu` VALUES (211, 201, '设计', 3, NULL, NULL, 'workflow:definition:design', NULL, 6, 1, 1, 0, '2026-08-27 12:03:11', '2026-08-27 12:16:30', NULL, NULL, 0);
INSERT INTO `sys_menu` VALUES (212, 203, '审批', 3, NULL, NULL, 'workflow:task:approve', NULL, 1, 1, 1, 0, '2026-08-27 12:03:11', '2026-08-27 12:16:30', NULL, NULL, 0);
INSERT INTO `sys_menu` VALUES (213, 205, '发起', 3, NULL, NULL, 'workflow:instance:start', NULL, 1, 1, 1, 0, '2026-08-27 12:03:11', '2026-08-27 12:16:30', NULL, NULL, 0);
INSERT INTO `sys_menu` VALUES (214, 205, '终止', 3, NULL, NULL, 'workflow:instance:terminate', NULL, 2, 1, 1, 0, '2026-08-27 12:03:11', '2026-08-27 12:16:30', NULL, NULL, 0);
INSERT INTO `sys_menu` VALUES (272, 161, '学生管理', 2, 'system/student', 'system/student/index', 'system:student:list', 'ListOutline', 1, 1, 1, 0, '2026-02-03 08:58:09', '2026-02-09 12:55:57', 1, 1, 1);
INSERT INTO `sys_menu` VALUES (273, 272, '学生管理查询', 3, NULL, NULL, 'system:student:list', NULL, 1, 1, 1, 0, '2026-02-03 08:58:09', '2026-02-09 12:55:57', 1, 1, 1);
INSERT INTO `sys_menu` VALUES (274, 272, '学生管理详情', 3, NULL, NULL, 'system:student:query', NULL, 2, 1, 1, 0, '2026-02-03 08:58:09', '2026-02-09 12:55:57', 1, 1, 1);
INSERT INTO `sys_menu` VALUES (275, 272, '学生管理新增', 3, NULL, NULL, 'system:student:add', NULL, 3, 1, 1, 0, '2026-02-03 08:58:09', '2026-02-09 12:55:57', 1, 1, 1);
INSERT INTO `sys_menu` VALUES (276, 272, '学生管理修改', 3, NULL, NULL, 'system:student:edit', NULL, 4, 1, 1, 0, '2026-02-03 08:58:09', '2026-02-09 12:55:57', 1, 1, 1);
INSERT INTO `sys_menu` VALUES (277, 272, '学生管理删除', 3, NULL, NULL, 'system:student:remove', NULL, 5, 1, 1, 0, '2026-02-03 08:58:09', '2026-02-09 12:55:57', 1, 1, 1);
INSERT INTO `sys_menu` VALUES (280, 2, '用户导入', 3, '', '', 'sys:user:import', '', 0, 1, 1, 0, '2026-02-25 15:56:46', '2026-02-25 15:56:46', 1, 1, 0);
INSERT INTO `sys_menu` VALUES (281, 2, '用户导出', 3, '', '', 'sys:user:export', '', 0, 1, 1, 0, '2026-02-25 15:57:01', '2026-02-25 15:57:01', 1, 1, 0);
INSERT INTO `sys_menu` VALUES (282, 36, 'SQL监控', 2, '/monitor/druid', '/monitor/druid/index', 'monitor:druid:list', 'PieChartOutline', 4, 1, 1, 0, '2026-02-28 22:30:41', '2026-02-28 22:30:41', NULL, 1, 0);
INSERT INTO `sys_menu` VALUES (283, 36, 'API访问统计', 2, '/monitor/api-access', '/monitor/api-access/index', 'monitor:apiAccess:list', 'StatsChartOutline', 7, 1, 1, 0, '2026-02-28 22:56:30', '2026-02-28 22:56:30', NULL, NULL, 0);
INSERT INTO `sys_menu` VALUES (284, 283, '访问统计列表', 3, '', '', 'monitor:apiAccess:list', '', 0, 1, 1, 0, '2026-02-28 22:58:30', '2026-02-28 22:58:30', 1, 1, 0);
INSERT INTO `sys_menu` VALUES (285, 161, '学生表', 2, 'system/student', 'system/student/index', 'system:student:list', 'ListOutline', 1, 1, 1, 0, '2026-03-01 11:14:06', '2026-03-01 11:16:47', 1, 1, 1);
INSERT INTO `sys_menu` VALUES (286, 285, '学生表查询', 3, NULL, NULL, 'system:student:list', NULL, 1, 1, 1, 0, '2026-03-01 11:14:06', '2026-03-01 11:16:47', 1, 1, 1);
INSERT INTO `sys_menu` VALUES (287, 285, '学生表详情', 3, NULL, NULL, 'system:student:query', NULL, 2, 1, 1, 0, '2026-03-01 11:14:06', '2026-03-01 11:16:47', 1, 1, 1);
INSERT INTO `sys_menu` VALUES (288, 285, '学生表新增', 3, NULL, NULL, 'system:student:add', NULL, 3, 1, 1, 0, '2026-03-01 11:14:06', '2026-03-01 11:16:47', 1, 1, 1);
INSERT INTO `sys_menu` VALUES (289, 285, '学生表修改', 3, NULL, NULL, 'system:student:edit', NULL, 4, 1, 1, 0, '2026-03-01 11:14:06', '2026-03-01 11:16:47', 1, 1, 1);
INSERT INTO `sys_menu` VALUES (290, 285, '学生表删除', 3, NULL, NULL, 'system:student:remove', NULL, 5, 1, 1, 0, '2026-03-01 11:14:06', '2026-03-01 11:16:47', 1, 1, 1);
INSERT INTO `sys_menu` VALUES (291, 161, '学生表', 2, 'system/student', 'system/student/index', 'system:student:list', 'ListOutline', 1, 1, 1, 0, '2026-03-01 11:24:24', '2026-03-01 11:27:48', 1, 1, 1);
INSERT INTO `sys_menu` VALUES (292, 291, '学生表查询', 3, NULL, NULL, 'system:student:list', NULL, 1, 1, 1, 0, '2026-03-01 11:24:24', '2026-03-01 11:27:48', 1, 1, 1);
INSERT INTO `sys_menu` VALUES (293, 291, '学生表详情', 3, NULL, NULL, 'system:student:query', NULL, 2, 1, 1, 0, '2026-03-01 11:24:24', '2026-03-01 11:27:48', 1, 1, 1);
INSERT INTO `sys_menu` VALUES (294, 291, '学生表新增', 3, NULL, NULL, 'system:student:add', NULL, 3, 1, 1, 0, '2026-03-01 11:24:24', '2026-03-01 11:27:48', 1, 1, 1);
INSERT INTO `sys_menu` VALUES (295, 291, '学生表修改', 3, NULL, NULL, 'system:student:edit', NULL, 4, 1, 1, 0, '2026-03-01 11:24:24', '2026-03-01 11:27:48', 1, 1, 1);
INSERT INTO `sys_menu` VALUES (296, 291, '学生表删除', 3, NULL, NULL, 'system:student:remove', NULL, 5, 1, 1, 0, '2026-03-01 11:24:24', '2026-03-01 11:27:48', 1, 1, 1);
INSERT INTO `sys_menu` VALUES (297, 161, '学生表', 2, 'system/student', 'system/student/index', 'system:student:list', 'ListOutline', 1, 1, 1, 0, '2026-03-01 11:27:57', '2026-03-01 11:46:03', 1, 1, 1);
INSERT INTO `sys_menu` VALUES (298, 297, '学生表查询', 3, NULL, NULL, 'system:student:list', NULL, 1, 1, 1, 0, '2026-03-01 11:27:57', '2026-03-01 11:46:03', 1, 1, 1);
INSERT INTO `sys_menu` VALUES (299, 297, '学生表详情', 3, NULL, NULL, 'system:student:query', NULL, 2, 1, 1, 0, '2026-03-01 11:27:57', '2026-03-01 11:46:03', 1, 1, 1);
INSERT INTO `sys_menu` VALUES (300, 297, '学生表新增', 3, NULL, NULL, 'system:student:add', NULL, 3, 1, 1, 0, '2026-03-01 11:27:57', '2026-03-01 11:46:03', 1, 1, 1);
INSERT INTO `sys_menu` VALUES (301, 297, '学生表修改', 3, NULL, NULL, 'system:student:edit', NULL, 4, 1, 1, 0, '2026-03-01 11:27:57', '2026-03-01 11:46:03', 1, 1, 1);
INSERT INTO `sys_menu` VALUES (302, 297, '学生表删除', 3, NULL, NULL, 'system:student:remove', NULL, 5, 1, 1, 0, '2026-03-01 11:27:57', '2026-03-01 11:46:03', 1, 1, 1);
INSERT INTO `sys_menu` VALUES (303, 161, '学生表', 2, 'system/student', 'system/student/index', 'system:student:list', 'ListOutline', 1, 1, 1, 0, '2026-03-01 12:04:47', '2026-03-01 12:06:19', 1, 1, 1);
INSERT INTO `sys_menu` VALUES (304, 303, '学生表查询', 3, NULL, NULL, 'system:student:list', NULL, 1, 1, 1, 0, '2026-03-01 12:04:47', '2026-03-01 12:06:19', 1, 1, 1);
INSERT INTO `sys_menu` VALUES (305, 303, '学生表详情', 3, NULL, NULL, 'system:student:query', NULL, 2, 1, 1, 0, '2026-03-01 12:04:47', '2026-03-01 12:06:19', 1, 1, 1);
INSERT INTO `sys_menu` VALUES (306, 303, '学生表新增', 3, NULL, NULL, 'system:student:add', NULL, 3, 1, 1, 0, '2026-03-01 12:04:47', '2026-03-01 12:06:19', 1, 1, 1);
INSERT INTO `sys_menu` VALUES (307, 303, '学生表修改', 3, NULL, NULL, 'system:student:edit', NULL, 4, 1, 1, 0, '2026-03-01 12:04:47', '2026-03-01 12:06:19', 1, 1, 1);
INSERT INTO `sys_menu` VALUES (308, 303, '学生表删除', 3, NULL, NULL, 'system:student:remove', NULL, 5, 1, 1, 0, '2026-03-01 12:04:47', '2026-03-01 12:06:19', 1, 1, 1);
INSERT INTO `sys_menu` VALUES (309, 161, '学生表', 2, 'system/student', 'system/student/index', 'system:student:list', 'ListOutline', 1, 1, 1, 0, '2026-03-01 12:07:02', '2026-03-01 12:09:32', 1, 1, 1);
INSERT INTO `sys_menu` VALUES (310, 309, '学生表查询', 3, NULL, NULL, 'system:student:list', NULL, 1, 1, 1, 0, '2026-03-01 12:07:02', '2026-03-01 12:09:32', 1, 1, 1);
INSERT INTO `sys_menu` VALUES (311, 309, '学生表详情', 3, NULL, NULL, 'system:student:query', NULL, 2, 1, 1, 0, '2026-03-01 12:07:02', '2026-03-01 12:09:32', 1, 1, 1);
INSERT INTO `sys_menu` VALUES (312, 309, '学生表新增', 3, NULL, NULL, 'system:student:add', NULL, 3, 1, 1, 0, '2026-03-01 12:07:02', '2026-03-01 12:09:32', 1, 1, 1);
INSERT INTO `sys_menu` VALUES (313, 309, '学生表修改', 3, NULL, NULL, 'system:student:edit', NULL, 4, 1, 1, 0, '2026-03-01 12:07:02', '2026-03-01 12:09:32', 1, 1, 1);
INSERT INTO `sys_menu` VALUES (314, 309, '学生表删除', 3, NULL, NULL, 'system:student:remove', NULL, 5, 1, 1, 0, '2026-03-01 12:07:02', '2026-03-01 12:09:32', 1, 1, 1);
INSERT INTO `sys_menu` VALUES (315, 161, '学生表', 2, 'system/student', 'system/student/index', 'system:student:list', 'ListOutline', 1, 1, 1, 0, '2026-03-01 12:09:45', '2026-03-01 12:14:37', 1, 1, 1);
INSERT INTO `sys_menu` VALUES (316, 315, '学生表查询', 3, NULL, NULL, 'system:student:list', NULL, 1, 1, 1, 0, '2026-03-01 12:09:45', '2026-03-01 12:14:37', 1, 1, 1);
INSERT INTO `sys_menu` VALUES (317, 315, '学生表详情', 3, NULL, NULL, 'system:student:query', NULL, 2, 1, 1, 0, '2026-03-01 12:09:45', '2026-03-01 12:14:37', 1, 1, 1);
INSERT INTO `sys_menu` VALUES (318, 315, '学生表新增', 3, NULL, NULL, 'system:student:add', NULL, 3, 1, 1, 0, '2026-03-01 12:09:45', '2026-03-01 12:14:37', 1, 1, 1);
INSERT INTO `sys_menu` VALUES (319, 315, '学生表修改', 3, NULL, NULL, 'system:student:edit', NULL, 4, 1, 1, 0, '2026-03-01 12:09:45', '2026-03-01 12:14:37', 1, 1, 1);
INSERT INTO `sys_menu` VALUES (320, 315, '学生表删除', 3, NULL, NULL, 'system:student:remove', NULL, 5, 1, 1, 0, '2026-03-01 12:09:45', '2026-03-01 12:14:37', 1, 1, 1);
INSERT INTO `sys_menu` VALUES (321, 161, '学生表', 2, 'system/student', 'system/student/index', 'system:student:list', 'ListOutline', 1, 1, 1, 0, '2026-03-01 12:15:15', '2026-03-01 12:20:10', 1, 1, 1);
INSERT INTO `sys_menu` VALUES (322, 321, '学生表查询', 3, NULL, NULL, 'system:student:list', NULL, 1, 1, 1, 0, '2026-03-01 12:15:15', '2026-03-01 12:20:10', 1, 1, 1);
INSERT INTO `sys_menu` VALUES (323, 321, '学生表详情', 3, NULL, NULL, 'system:student:query', NULL, 2, 1, 1, 0, '2026-03-01 12:15:15', '2026-03-01 12:20:10', 1, 1, 1);
INSERT INTO `sys_menu` VALUES (324, 321, '学生表新增', 3, NULL, NULL, 'system:student:add', NULL, 3, 1, 1, 0, '2026-03-01 12:15:15', '2026-03-01 12:20:10', 1, 1, 1);
INSERT INTO `sys_menu` VALUES (325, 321, '学生表修改', 3, NULL, NULL, 'system:student:edit', NULL, 4, 1, 1, 0, '2026-03-01 12:15:15', '2026-03-01 12:20:10', 1, 1, 1);
INSERT INTO `sys_menu` VALUES (326, 321, '学生表删除', 3, NULL, NULL, 'system:student:remove', NULL, 5, 1, 1, 0, '2026-03-01 12:15:15', '2026-03-01 12:20:10', 1, 1, 1);
INSERT INTO `sys_menu` VALUES (327, 161, '学生表', 2, 'system/student', 'system/student/index', 'system:student:list', 'ListOutline', 1, 1, 1, 0, '2026-03-01 12:20:17', '2026-03-01 12:20:17', 1, 1, 0);
INSERT INTO `sys_menu` VALUES (328, 327, '学生表查询', 3, NULL, NULL, 'system:student:list', NULL, 1, 1, 1, 0, '2026-03-01 12:20:17', '2026-03-01 12:20:17', 1, 1, 0);
INSERT INTO `sys_menu` VALUES (329, 327, '学生表详情', 3, NULL, NULL, 'system:student:query', NULL, 2, 1, 1, 0, '2026-03-01 12:20:17', '2026-03-01 12:20:17', 1, 1, 0);
INSERT INTO `sys_menu` VALUES (330, 327, '学生表新增', 3, NULL, NULL, 'system:student:add', NULL, 3, 1, 1, 0, '2026-03-01 12:20:17', '2026-03-01 12:20:17', 1, 1, 0);
INSERT INTO `sys_menu` VALUES (331, 327, '学生表修改', 3, NULL, NULL, 'system:student:edit', NULL, 4, 1, 1, 0, '2026-03-01 12:20:17', '2026-03-01 12:20:17', 1, 1, 0);
INSERT INTO `sys_menu` VALUES (332, 327, '学生表删除', 3, NULL, NULL, 'system:student:remove', NULL, 5, 1, 1, 0, '2026-03-01 12:20:17', '2026-03-01 12:20:17', 1, 1, 0);

-- ----------------------------
-- Table structure for sys_notice
-- ----------------------------
DROP TABLE IF EXISTS `sys_notice`;
CREATE TABLE `sys_notice`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '通知ID',
  `title` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '通知标题',
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '通知内容',
  `notice_type` tinyint NULL DEFAULT 1 COMMENT '通知类型(1通知 2公告)',
  `channels` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '[\"station\"]' COMMENT '推送渠道(JSON): station站内信,email邮件,sms短信,webhook飞书/钉钉/企业微信',
  `target_type` tinyint NULL DEFAULT 3 COMMENT '推送对象类型(1指定用户 2按部门 3全部)',
  `target_ids` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '推送对象ID(JSON): 用户ID或部门ID数组',
  `status` tinyint NULL DEFAULT 0 COMMENT '状态(0草稿 1发布)',
  `create_by` bigint NULL DEFAULT NULL COMMENT '创建者ID',
  `create_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '创建者名称',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `deleted` tinyint NULL DEFAULT 0 COMMENT '删除标识',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_notice_type`(`notice_type` ASC) USING BTREE,
  INDEX `idx_status`(`status` ASC) USING BTREE,
  INDEX `idx_create_time`(`create_time` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 18 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '系统通知表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_notice
-- ----------------------------
INSERT INTO `sys_notice` VALUES (1, '🚀 Jiejie Admin 系统全新升级至 Spring Boot 3.2 + Vue 3.4', '尊敬的各位同事：

Jiejie Admin 基础框架已平滑升级至 **Spring Boot 3.2.2** 与 **Vue 3.4.15**，性能全面提升 30% 以上。新增特性包括：
- 基于 Sa-Token 的细粒度权限控制与多端认证
- Warm-Flow 敏捷流程引擎集成
- WebSocket 实时通讯与全双工消息推送
- 代码生成器支持单表/树表自动化模板导出

请各研发组同学及时拉取最新代码并检查本地依赖。', 1, '["station","email"]', 3, NULL, 1, 1, '超级管理员', '2026-08-01 09:30:00', '2026-08-01 09:30:00', 0);
INSERT INTO `sys_notice` VALUES (2, '📢 关于 2026 年国庆节及中秋节放假调休安排的通知', '公司各部门、分支机构：

根据国家法定节假日规定及公司实际生产经营情况，现将 2026 年国庆节及中秋节放假安排通知如下：

1. 放假时间：10月1日（星期四）至10月8日（星期四）放假调休，共8天。
2. 调休补班：9月27日（星期日）、10月10日（星期六）正常上班。
3. 请各部门在节前组织安全检查，关好门窗、切断非必要办公电源。
4. 运维及值班人员请保持手机24小时通讯畅通。

祝全体员工度过一个平安、愉快的假期！', 2, '["station","webhook"]', 3, NULL, 1, 6, '孙七', '2026-09-15 10:00:00', '2026-09-15 10:00:00', 0);
INSERT INTO `sys_notice` VALUES (3, '🔒 研发中心信息安全与数据保密管理规范（2026版）', '全体技术与运维人员：

为进一步保障公司核心资产与用户数据安全，特重申信息安全保密管理制度：
- 严禁将包含生产数据库账密、API密钥、阿里云AccessKey的代码提交至公共开源仓库。
- 生产环境敏感数据（手机号、身份证、金额）展示必须进行严格脱敏（掩码处理）。
- 离岗前务必锁定电脑屏幕（Win + L），定期更换登录密码。
- 违反安全红线者将按公司规章严肃问责并记入诚信档案。', 1, '["station","email","webhook"]', 2, '[2]', 1, 2, '张三', '2026-08-10 14:20:00', '2026-08-10 14:20:00', 0);
INSERT INTO `sys_notice` VALUES (4, '📱 Jiejie Admin 移动端 UniApp 小程序内测邀请', '各位产品与技术伙伴：

经过移动端开发组的全力攻坚，Jiejie Admin 移动端 UniApp 小程序内测版本现已正式发布！
主要体验功能包括：
1. 移动端即时审批与待办事项处理
2. 消息通知实时接收与未读角标
3. 组织通讯录一键检索与私聊
4. 个人中心与快捷数据统计

欢迎大家积极体验并反馈 UI/交互建议！', 2, '["station"]', 3, NULL, 1, 11, '刘子墨', '2026-08-20 16:45:00', '2026-08-20 16:45:00', 0);
INSERT INTO `sys_notice` VALUES (5, '💡 2026 第三季度技术分享会：《企业级高可用 Redis 架构与实战》', '各位技术同仁：

本周五下午 15:30 将在第一会议室举办第三季度技术分享沙龙。
- 主题：《企业级高可用 Redis 架构、大Key治理与缓存穿透/击穿/雪崩解决方案》
- 分享人：高级后端架构师 周文博
- 形式：线下交流 + 线上直播（飞书投屏）
期待大家的踊跃参与和探讨交流！', 1, '["station"]', 2, '[2]', 1, 9, '周文博', '2026-08-25 11:00:00', '2026-08-25 11:00:00', 0);
INSERT INTO `sys_notice` VALUES (6, '📊 2026年半年度业务运营总结与表彰通报', '全体同仁：

2026年上半年，在全体员工的共同努力下，公司营业收入同比增长 42%，新客留存率创下历史新高！
为表彰先进，特对华东大区营销团队、移动端研发团队及用户运营组予以全员通报嘉奖，并颁发半年度卓越团队奖金。
希望受表彰的团队再接再厉，在下半年继续保持昂扬斗志，共创辉煌！', 2, '["station","email"]', 3, NULL, 1, 7, '陈建国', '2026-07-15 09:00:00', '2026-07-15 09:00:00', 0);
INSERT INTO `sys_notice` VALUES (7, '⚙️ 本周日凌晨 02:00-04:00 核心数据库例行维护通知', '尊敬的系统用户：

为了保障系统的稳定运行与数据读写性能，运维团队计划于本周日（8月30日）凌晨 02:00 至 04:00 进行 MySQL 主从集群例行索引优化与硬件升级。
维护期间系统后台可能出现短暂的秒级闪断，请各部门提前保存工作数据。对由此带来的不便敬请谅解。', 1, '["station","webhook"]', 3, NULL, 1, 1, '超级管理员', '2026-08-28 17:30:00', '2026-08-28 17:30:00', 0);
INSERT INTO `sys_notice` VALUES (8, '📝 关于开展 2026 年度员工健康体检的通知', '各位员工：

公司秉承“以人为本，关爱健康”的理念，将于 9 月份统一开展 2026 年度员工全身体检活动。本次体检合作机构为爱康国宾与美年大健康，员工可通过专属预约小程序自由选择体检套餐与就近分院。
预约截止时间：9月20日 18:00。
健康工作，快乐生活！', 2, '["station"]', 3, NULL, 1, 6, '孙七', '2026-09-01 10:15:00', '2026-09-01 10:15:00', 0);

-- ----------------------------
-- Table structure for sys_notice_send_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_notice_send_log`;
CREATE TABLE `sys_notice_send_log`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `notice_id` bigint NOT NULL COMMENT '通知ID',
  `channel` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '推送渠道: station站内信,email邮件,dingtalk钉钉,feishu飞书,wechat_work企业微信',
  `status` tinyint NOT NULL DEFAULT 1 COMMENT '状态: 1成功 2失败',
  `target_count` int NULL DEFAULT 0 COMMENT '推送目标数量',
  `success_count` int NULL DEFAULT 0 COMMENT '成功数量(邮件/站内信)',
  `error_msg` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '失败原因',
  `send_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '推送时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_notice_id`(`notice_id` ASC) USING BTREE,
  INDEX `idx_send_time`(`send_time` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 19 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '通知推送记录表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_notice_send_log
-- ----------------------------

-- ----------------------------
-- Table structure for sys_oper_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_oper_log`;
CREATE TABLE `sys_oper_log`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '模块标题',
  `business_type` int NULL DEFAULT 0 COMMENT '业务类型(0-其它 1-新增 2-修改 3-删除)',
  `method` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '方法名称',
  `request_method` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '请求方式',
  `oper_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '操作人员',
  `oper_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '请求URL',
  `oper_ip` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '主机地址',
  `oper_param` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '请求参数',
  `json_result` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '返回参数',
  `status` int NULL DEFAULT 0 COMMENT '操作状态(0-正常 1-异常)',
  `error_msg` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '错误消息',
  `oper_time` datetime NULL DEFAULT NULL COMMENT '操作时间',
  `cost_time` bigint NULL DEFAULT 0 COMMENT '消耗时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 782 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '操作日志表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_oper_log
-- ----------------------------
INSERT INTO `sys_oper_log` VALUES (1, '通知公告', 1, 'com.jiejie.system.controller.SysNoticeController.add()', 'POST', 'lisi', '/system/notice', '192.177.53.120', '{"title":"系统例行维护通知","status":1}', '{"code":200,"msg":"操作成功"}', 0, NULL, '2026-08-01 09:22:04', 65);
INSERT INTO `sys_oper_log` VALUES (2, '定时任务', 2, 'com.jiejie.job.controller.SysJobController.changeStatus()', 'PUT', 'zhangsan', '/monitor/job/changeStatus', '182.142.209.63', '{"jobId":1,"status":0}', '{"code":200,"msg":"操作成功"}', 0, NULL, '2026-08-01 11:43:51', 260);
INSERT INTO `sys_oper_log` VALUES (3, '岗位管理', 1, 'com.jiejie.system.controller.SysPostController.add()', 'POST', 'zhangsan', '/system/post', '173.150.39.36', '{"postCode":"ai_eng","postName":"AI算法工程师"}', '{"code":200,"msg":"操作成功"}', 0, NULL, '2026-08-01 15:05:44', 18);
INSERT INTO `sys_oper_log` VALUES (4, '系统配置', 2, 'com.jiejie.system.controller.SysConfigController.updateByKey()', 'PUT', 'lin_xf', '/system/config/updateByKey', '195.155.96.132', '{"configKey":"sys.account.captchaEnabled","configValue":"true"}', '{"code":200,"msg":"操作成功"}', 0, NULL, '2026-08-02 10:47:43', 200);
INSERT INTO `sys_oper_log` VALUES (5, '代码生成', 2, 'com.jiejie.gen.controller.GenController.importTable()', 'POST', 'admin', '/tool/gen/importTable', '193.74.70.30', '{"tables":["student","sys_notice"]}', '{"code":200,"msg":"操作成功"}', 0, NULL, '2026-08-02 12:19:38', 211);
INSERT INTO `sys_oper_log` VALUES (6, '系统配置', 2, 'com.jiejie.system.controller.SysConfigController.updateByKey()', 'PUT', 'zhou_wb', '/system/config/updateByKey', '197.155.55.79', '{"configKey":"sys.account.captchaEnabled","configValue":"true"}', '{"code":200,"msg":"操作成功"}', 0, NULL, '2026-08-02 09:01:21', 290);
INSERT INTO `sys_oper_log` VALUES (7, '定时任务', 2, 'com.jiejie.job.controller.SysJobController.changeStatus()', 'PUT', 'lin_xf', '/monitor/job/changeStatus', '185.34.72.171', '{"jobId":1,"status":0}', '{"code":200,"msg":"操作成功"}', 0, NULL, '2026-08-03 11:38:32', 259);
INSERT INTO `sys_oper_log` VALUES (8, '系统配置', 2, 'com.jiejie.system.controller.SysConfigController.updateByKey()', 'PUT', 'lin_xf', '/system/config/updateByKey', '124.27.42.2', '{"configKey":"sys.account.captchaEnabled","configValue":"true"}', '{"code":200,"msg":"操作成功"}', 0, NULL, '2026-08-03 17:19:09', 331);
INSERT INTO `sys_oper_log` VALUES (9, '部门管理', 2, 'com.jiejie.system.controller.SysDeptController.edit()', 'PUT', 'admin', '/system/dept', '166.165.85.243', '{"id":2,"deptName":"研发中心"}', '{"code":200,"msg":"操作成功"}', 0, NULL, '2026-08-04 15:40:40', 95);
INSERT INTO `sys_oper_log` VALUES (10, '用户管理', 1, 'com.jiejie.system.controller.SysUserController.add()', 'POST', 'lin_xf', '/system/user', '185.41.34.59', '{"username":"demo_user","nickname":"测试用户","deptId":2}', '{"code":200,"msg":"操作成功"}', 0, NULL, '2026-08-04 16:51:04', 184);
INSERT INTO `sys_oper_log` VALUES (11, '通知公告', 1, 'com.jiejie.system.controller.SysNoticeController.add()', 'POST', 'lisi', '/system/notice', '166.123.196.241', '{"title":"系统例行维护通知","status":1}', '{"code":200,"msg":"操作成功"}', 0, NULL, '2026-08-04 13:28:47', 170);
INSERT INTO `sys_oper_log` VALUES (12, '学生管理', 1, 'com.jiejie.biz.controller.StudentController.add()', 'POST', 'lisi', '/student', '220.90.219.44', '{"studentNo":"20240131","name":"陈思博","gender":1}', '{"code":200,"msg":"操作成功"}', 0, NULL, '2026-08-05 18:35:01', 70);
INSERT INTO `sys_oper_log` VALUES (13, '菜单管理', 1, 'com.jiejie.system.controller.SysMenuController.add()', 'POST', 'zhangsan', '/system/menu', '199.85.192.251', '{"menuName":"数据大屏","path":"/screen"}', '{"code":200,"msg":"操作成功"}', 0, NULL, '2026-08-05 12:55:44', 224);
INSERT INTO `sys_oper_log` VALUES (14, '系统配置', 2, 'com.jiejie.system.controller.SysConfigController.updateByKey()', 'PUT', 'lisi', '/system/config/updateByKey', '131.35.68.99', '{"configKey":"sys.account.captchaEnabled","configValue":"true"}', '{"code":200,"msg":"操作成功"}', 0, NULL, '2026-08-05 18:21:41', 83);
INSERT INTO `sys_oper_log` VALUES (15, '菜单管理', 1, 'com.jiejie.system.controller.SysMenuController.add()', 'POST', 'zhou_wb', '/system/menu', '180.87.243.139', '{"menuName":"数据大屏","path":"/screen"}', '{"code":200,"msg":"操作成功"}', 0, NULL, '2026-08-06 15:44:16', 293);
INSERT INTO `sys_oper_log` VALUES (16, '岗位管理', 1, 'com.jiejie.system.controller.SysPostController.add()', 'POST', 'lin_xf', '/system/post', '141.54.140.78', '{"postCode":"ai_eng","postName":"AI算法工程师"}', '{"code":200,"msg":"操作成功"}', 0, NULL, '2026-08-06 18:52:12', 37);
INSERT INTO `sys_oper_log` VALUES (17, '部门管理', 2, 'com.jiejie.system.controller.SysDeptController.edit()', 'PUT', 'zhangsan', '/system/dept', '218.120.181.149', '{"id":2,"deptName":"研发中心"}', '{"code":200,"msg":"操作成功"}', 0, NULL, '2026-08-06 16:24:40', 82);
INSERT INTO `sys_oper_log` VALUES (18, '系统配置', 2, 'com.jiejie.system.controller.SysConfigController.updateByKey()', 'PUT', 'admin', '/system/config/updateByKey', '188.88.198.10', '{"configKey":"sys.account.captchaEnabled","configValue":"true"}', '{"code":200,"msg":"操作成功"}', 0, NULL, '2026-08-07 17:21:35', 323);
INSERT INTO `sys_oper_log` VALUES (19, '部门管理', 2, 'com.jiejie.system.controller.SysDeptController.edit()', 'PUT', 'lin_xf', '/system/dept', '138.186.171.226', '{"id":2,"deptName":"研发中心"}', '{"code":200,"msg":"操作成功"}', 0, NULL, '2026-08-07 17:18:51', 291);
INSERT INTO `sys_oper_log` VALUES (20, '系统配置', 2, 'com.jiejie.system.controller.SysConfigController.updateByKey()', 'PUT', 'zhou_wb', '/system/config/updateByKey', '174.99.222.254', '{"configKey":"sys.account.captchaEnabled","configValue":"true"}', '{"code":200,"msg":"操作成功"}', 0, NULL, '2026-08-07 15:33:14', 197);
INSERT INTO `sys_oper_log` VALUES (21, '通知公告', 1, 'com.jiejie.system.controller.SysNoticeController.add()', 'POST', 'zhou_wb', '/system/notice', '164.109.169.229', '{"title":"系统例行维护通知","status":1}', '{"code":200,"msg":"操作成功"}', 0, NULL, '2026-08-08 12:35:37', 204);
INSERT INTO `sys_oper_log` VALUES (22, '通知公告', 1, 'com.jiejie.system.controller.SysNoticeController.add()', 'POST', 'lisi', '/system/notice', '220.200.231.224', '{"title":"系统例行维护通知","status":1}', '{"code":200,"msg":"操作成功"}', 0, NULL, '2026-08-08 10:15:13', 32);
INSERT INTO `sys_oper_log` VALUES (23, '学生管理', 1, 'com.jiejie.biz.controller.StudentController.add()', 'POST', 'zhou_wb', '/student', '160.131.218.41', '{"studentNo":"20240131","name":"陈思博","gender":1}', '{"code":200,"msg":"操作成功"}', 0, NULL, '2026-08-09 17:12:23', 240);
INSERT INTO `sys_oper_log` VALUES (24, '用户管理', 1, 'com.jiejie.system.controller.SysUserController.add()', 'POST', 'zhou_wb', '/system/user', '120.35.39.56', '{"username":"demo_user","nickname":"测试用户","deptId":2}', '{"code":200,"msg":"操作成功"}', 0, NULL, '2026-08-09 10:29:38', 221);
INSERT INTO `sys_oper_log` VALUES (25, '系统配置', 2, 'com.jiejie.system.controller.SysConfigController.updateByKey()', 'PUT', 'zhou_wb', '/system/config/updateByKey', '190.35.116.61', '{"configKey":"sys.account.captchaEnabled","configValue":"true"}', '{"code":200,"msg":"操作成功"}', 0, NULL, '2026-08-10 13:57:00', 182);
INSERT INTO `sys_oper_log` VALUES (26, '用户管理', 2, 'com.jiejie.system.controller.SysUserController.edit()', 'PUT', 'admin', '/system/user', '207.97.178.39', '{"id":3,"nickname":"李四(产品总监)"}', '{"code":200,"msg":"操作成功"}', 0, NULL, '2026-08-10 19:26:06', 253);
INSERT INTO `sys_oper_log` VALUES (27, '系统配置', 2, 'com.jiejie.system.controller.SysConfigController.updateByKey()', 'PUT', 'admin', '/system/config/updateByKey', '215.58.233.205', '{"configKey":"sys.account.captchaEnabled","configValue":"true"}', '{"code":200,"msg":"操作成功"}', 0, NULL, '2026-08-10 16:21:38', 301);
INSERT INTO `sys_oper_log` VALUES (28, '用户管理', 2, 'com.jiejie.system.controller.SysUserController.edit()', 'PUT', 'admin', '/system/user', '154.70.48.114', '{"id":3,"nickname":"李四(产品总监)"}', '{"code":200,"msg":"操作成功"}', 0, NULL, '2026-08-11 10:58:35', 256);
INSERT INTO `sys_oper_log` VALUES (29, '文件管理', 1, 'com.jiejie.file.controller.SysFileController.upload()', 'POST', 'lin_xf', '/system/file/upload', '206.43.33.6', '{"fileName":"2026Q3产品规划.pdf","fileSize":2458210}', '{"code":200,"msg":"上传成功"}', 0, NULL, '2026-08-11 16:27:56', 369);
INSERT INTO `sys_oper_log` VALUES (30, '学生管理', 1, 'com.jiejie.biz.controller.StudentController.add()', 'POST', 'lin_xf', '/student', '117.124.131.90', '{"studentNo":"20240131","name":"陈思博","gender":1}', '{"code":200,"msg":"操作成功"}', 0, NULL, '2026-08-12 09:26:11', 68);
INSERT INTO `sys_oper_log` VALUES (31, '通知公告', 1, 'com.jiejie.system.controller.SysNoticeController.add()', 'POST', 'admin', '/system/notice', '142.192.149.135', '{"title":"系统例行维护通知","status":1}', '{"code":200,"msg":"操作成功"}', 0, NULL, '2026-08-12 15:06:22', 145);
INSERT INTO `sys_oper_log` VALUES (32, '用户管理', 1, 'com.jiejie.system.controller.SysUserController.add()', 'POST', 'zhangsan', '/system/user', '187.165.212.79', '{"username":"demo_user","nickname":"测试用户","deptId":2}', '{"code":200,"msg":"操作成功"}', 0, NULL, '2026-08-13 15:50:06', 150);
INSERT INTO `sys_oper_log` VALUES (33, '定时任务', 2, 'com.jiejie.job.controller.SysJobController.changeStatus()', 'PUT', 'zhangsan', '/monitor/job/changeStatus', '156.29.115.225', '{"jobId":1,"status":0}', '{"code":200,"msg":"操作成功"}', 0, NULL, '2026-08-13 10:36:49', 342);
INSERT INTO `sys_oper_log` VALUES (34, '岗位管理', 1, 'com.jiejie.system.controller.SysPostController.add()', 'POST', 'lin_xf', '/system/post', '219.167.231.149', '{"postCode":"ai_eng","postName":"AI算法工程师"}', '{"code":200,"msg":"操作成功"}', 0, NULL, '2026-08-14 12:47:52', 177);
INSERT INTO `sys_oper_log` VALUES (35, '代码生成', 2, 'com.jiejie.gen.controller.GenController.importTable()', 'POST', 'zhou_wb', '/tool/gen/importTable', '133.145.117.65', '{"tables":["student","sys_notice"]}', '{"code":200,"msg":"操作成功"}', 0, NULL, '2026-08-14 17:39:16', 35);
INSERT INTO `sys_oper_log` VALUES (36, '学生管理', 2, 'com.jiejie.biz.controller.StudentController.edit()', 'PUT', 'lin_xf', '/student', '147.115.199.219', '{"id":5,"status":1}', '{"code":200,"msg":"操作成功"}', 0, NULL, '2026-08-14 12:45:59', 151);
INSERT INTO `sys_oper_log` VALUES (37, '角色管理', 2, 'com.jiejie.system.controller.SysRoleController.updateRole()', 'PUT', 'lisi', '/system/role', '214.142.89.244', '{"id":3,"name":"研发主管","dataScope":4}', '{"code":200,"msg":"操作成功"}', 0, NULL, '2026-08-15 13:07:55', 153);
INSERT INTO `sys_oper_log` VALUES (38, '代码生成', 2, 'com.jiejie.gen.controller.GenController.importTable()', 'POST', 'zhangsan', '/tool/gen/importTable', '110.60.163.153', '{"tables":["student","sys_notice"]}', '{"code":200,"msg":"操作成功"}', 0, NULL, '2026-08-15 14:46:58', 190);
INSERT INTO `sys_oper_log` VALUES (39, '系统配置', 2, 'com.jiejie.system.controller.SysConfigController.updateByKey()', 'PUT', 'admin', '/system/config/updateByKey', '194.96.113.166', '{"configKey":"sys.account.captchaEnabled","configValue":"true"}', '{"code":200,"msg":"操作成功"}', 0, NULL, '2026-08-15 18:29:38', 235);
INSERT INTO `sys_oper_log` VALUES (40, '系统配置', 2, 'com.jiejie.system.controller.SysConfigController.updateByKey()', 'PUT', 'admin', '/system/config/updateByKey', '157.120.203.175', '{"configKey":"sys.account.captchaEnabled","configValue":"true"}', '{"code":200,"msg":"操作成功"}', 0, NULL, '2026-08-16 18:20:36', 249);
INSERT INTO `sys_oper_log` VALUES (41, '通知公告', 1, 'com.jiejie.system.controller.SysNoticeController.add()', 'POST', 'lisi', '/system/notice', '111.101.108.189', '{"title":"系统例行维护通知","status":1}', '{"code":200,"msg":"操作成功"}', 0, NULL, '2026-08-16 13:50:30', 197);
INSERT INTO `sys_oper_log` VALUES (42, '用户管理', 1, 'com.jiejie.system.controller.SysUserController.add()', 'POST', 'lisi', '/system/user', '162.129.21.155', '{"username":"demo_user","nickname":"测试用户","deptId":2}', '{"code":200,"msg":"操作成功"}', 0, NULL, '2026-08-16 13:34:34', 29);
INSERT INTO `sys_oper_log` VALUES (43, '用户管理', 2, 'com.jiejie.system.controller.SysUserController.edit()', 'PUT', 'lisi', '/system/user', '165.76.108.77', '{"id":3,"nickname":"李四(产品总监)"}', '{"code":200,"msg":"操作成功"}', 0, NULL, '2026-08-17 09:13:13', 149);
INSERT INTO `sys_oper_log` VALUES (44, '用户管理', 1, 'com.jiejie.system.controller.SysUserController.add()', 'POST', 'admin', '/system/user', '139.55.22.182', '{"username":"demo_user","nickname":"测试用户","deptId":2}', '{"code":200,"msg":"操作成功"}', 0, NULL, '2026-08-17 18:34:29', 205);
INSERT INTO `sys_oper_log` VALUES (45, '系统配置', 2, 'com.jiejie.system.controller.SysConfigController.updateByKey()', 'PUT', 'zhou_wb', '/system/config/updateByKey', '178.142.172.159', '{"configKey":"sys.account.captchaEnabled","configValue":"true"}', '{"code":200,"msg":"操作成功"}', 0, NULL, '2026-08-18 13:08:06', 45);
INSERT INTO `sys_oper_log` VALUES (46, '通知公告', 1, 'com.jiejie.system.controller.SysNoticeController.add()', 'POST', 'zhangsan', '/system/notice', '124.187.27.233', '{"title":"系统例行维护通知","status":1}', '{"code":200,"msg":"操作成功"}', 0, NULL, '2026-08-18 10:37:55', 71);
INSERT INTO `sys_oper_log` VALUES (47, '用户管理', 1, 'com.jiejie.system.controller.SysUserController.add()', 'POST', 'zhangsan', '/system/user', '166.153.198.7', '{"username":"demo_user","nickname":"测试用户","deptId":2}', '{"code":200,"msg":"操作成功"}', 0, NULL, '2026-08-19 15:59:23', 164);
INSERT INTO `sys_oper_log` VALUES (48, '学生管理', 2, 'com.jiejie.biz.controller.StudentController.edit()', 'PUT', 'lin_xf', '/student', '134.23.116.80', '{"id":5,"status":1}', '{"code":200,"msg":"操作成功"}', 0, NULL, '2026-08-19 13:40:59', 94);
INSERT INTO `sys_oper_log` VALUES (49, '学生管理', 2, 'com.jiejie.biz.controller.StudentController.edit()', 'PUT', 'zhangsan', '/student', '187.111.193.13', '{"id":5,"status":1}', '{"code":200,"msg":"操作成功"}', 0, NULL, '2026-08-19 16:36:26', 53);
INSERT INTO `sys_oper_log` VALUES (50, '学生管理', 1, 'com.jiejie.biz.controller.StudentController.add()', 'POST', 'zhangsan', '/student', '210.10.83.200', '{"studentNo":"20240131","name":"陈思博","gender":1}', '{"code":200,"msg":"操作成功"}', 0, NULL, '2026-08-20 11:27:12', 66);
INSERT INTO `sys_oper_log` VALUES (51, '部门管理', 2, 'com.jiejie.system.controller.SysDeptController.edit()', 'PUT', 'lin_xf', '/system/dept', '177.169.48.53', '{"id":2,"deptName":"研发中心"}', '{"code":200,"msg":"操作成功"}', 0, NULL, '2026-08-20 11:48:51', 182);
INSERT INTO `sys_oper_log` VALUES (52, '定时任务', 2, 'com.jiejie.job.controller.SysJobController.changeStatus()', 'PUT', 'lisi', '/monitor/job/changeStatus', '113.36.59.120', '{"jobId":1,"status":0}', '{"code":200,"msg":"操作成功"}', 0, NULL, '2026-08-20 10:23:25', 215);
INSERT INTO `sys_oper_log` VALUES (53, '用户管理', 1, 'com.jiejie.system.controller.SysUserController.add()', 'POST', 'lisi', '/system/user', '183.181.33.71', '{"username":"demo_user","nickname":"测试用户","deptId":2}', '{"code":200,"msg":"操作成功"}', 0, NULL, '2026-08-21 12:12:21', 300);
INSERT INTO `sys_oper_log` VALUES (54, '部门管理', 2, 'com.jiejie.system.controller.SysDeptController.edit()', 'PUT', 'admin', '/system/dept', '148.147.153.29', '{"id":2,"deptName":"研发中心"}', '{"code":200,"msg":"操作成功"}', 0, NULL, '2026-08-21 10:44:14', 296);
INSERT INTO `sys_oper_log` VALUES (55, '学生管理', 2, 'com.jiejie.biz.controller.StudentController.edit()', 'PUT', 'lisi', '/student', '210.45.53.39', '{"id":5,"status":1}', '{"code":200,"msg":"操作成功"}', 0, NULL, '2026-08-22 17:16:43', 117);
INSERT INTO `sys_oper_log` VALUES (56, '用户管理', 2, 'com.jiejie.system.controller.SysUserController.edit()', 'PUT', 'lin_xf', '/system/user', '142.160.175.121', '{"id":3,"nickname":"李四(产品总监)"}', '{"code":200,"msg":"操作成功"}', 0, NULL, '2026-08-22 12:12:48', 203);
INSERT INTO `sys_oper_log` VALUES (57, '角色管理', 2, 'com.jiejie.system.controller.SysRoleController.updateRole()', 'PUT', 'lisi', '/system/role', '170.26.242.164', '{"id":3,"name":"研发主管","dataScope":4}', '{"code":200,"msg":"操作成功"}', 0, NULL, '2026-08-22 11:39:18', 322);
INSERT INTO `sys_oper_log` VALUES (58, '学生管理', 2, 'com.jiejie.biz.controller.StudentController.edit()', 'PUT', 'lisi', '/student', '218.67.194.71', '{"id":5,"status":1}', '{"code":200,"msg":"操作成功"}', 0, NULL, '2026-08-23 19:58:02', 260);
INSERT INTO `sys_oper_log` VALUES (59, '部门管理', 2, 'com.jiejie.system.controller.SysDeptController.edit()', 'PUT', 'zhangsan', '/system/dept', '144.126.110.228', '{"id":2,"deptName":"研发中心"}', '{"code":200,"msg":"操作成功"}', 0, NULL, '2026-08-23 12:19:07', 70);
INSERT INTO `sys_oper_log` VALUES (60, '系统配置', 2, 'com.jiejie.system.controller.SysConfigController.updateByKey()', 'PUT', 'lin_xf', '/system/config/updateByKey', '119.132.90.73', '{"configKey":"sys.account.captchaEnabled","configValue":"true"}', '{"code":200,"msg":"操作成功"}', 0, NULL, '2026-08-24 11:44:58', 170);
INSERT INTO `sys_oper_log` VALUES (61, '用户管理', 1, 'com.jiejie.system.controller.SysUserController.add()', 'POST', 'admin', '/system/user', '147.121.33.225', '{"username":"demo_user","nickname":"测试用户","deptId":2}', '{"code":200,"msg":"操作成功"}', 0, NULL, '2026-08-24 19:12:59', 121);
INSERT INTO `sys_oper_log` VALUES (62, '学生管理', 2, 'com.jiejie.biz.controller.StudentController.edit()', 'PUT', 'admin', '/student', '113.90.61.8', '{"id":5,"status":1}', '{"code":200,"msg":"操作成功"}', 0, NULL, '2026-08-24 14:06:16', 338);
INSERT INTO `sys_oper_log` VALUES (63, '学生管理', 2, 'com.jiejie.biz.controller.StudentController.edit()', 'PUT', 'lin_xf', '/student', '197.95.148.191', '{"id":5,"status":1}', '{"code":200,"msg":"操作成功"}', 0, NULL, '2026-08-25 12:02:22', 333);
INSERT INTO `sys_oper_log` VALUES (64, '系统配置', 2, 'com.jiejie.system.controller.SysConfigController.updateByKey()', 'PUT', 'zhou_wb', '/system/config/updateByKey', '201.136.249.176', '{"configKey":"sys.account.captchaEnabled","configValue":"true"}', '{"code":200,"msg":"操作成功"}', 0, NULL, '2026-08-25 15:03:40', 268);
INSERT INTO `sys_oper_log` VALUES (65, '系统配置', 2, 'com.jiejie.system.controller.SysConfigController.updateByKey()', 'PUT', 'lisi', '/system/config/updateByKey', '156.61.148.241', '{"configKey":"sys.account.captchaEnabled","configValue":"true"}', '{"code":200,"msg":"操作成功"}', 0, NULL, '2026-08-25 17:40:33', 148);
INSERT INTO `sys_oper_log` VALUES (66, '文件管理', 1, 'com.jiejie.file.controller.SysFileController.upload()', 'POST', 'lin_xf', '/system/file/upload', '178.30.172.166', '{"fileName":"2026Q3产品规划.pdf","fileSize":2458210}', '{"code":200,"msg":"上传成功"}', 0, NULL, '2026-08-26 15:29:59', 28);
INSERT INTO `sys_oper_log` VALUES (67, '系统配置', 2, 'com.jiejie.system.controller.SysConfigController.updateByKey()', 'PUT', 'admin', '/system/config/updateByKey', '192.163.20.121', '{"configKey":"sys.account.captchaEnabled","configValue":"true"}', '{"code":200,"msg":"操作成功"}', 0, NULL, '2026-08-26 19:30:25', 92);
INSERT INTO `sys_oper_log` VALUES (68, '用户管理', 2, 'com.jiejie.system.controller.SysUserController.edit()', 'PUT', 'lisi', '/system/user', '125.77.40.63', '{"id":3,"nickname":"李四(产品总监)"}', '{"code":200,"msg":"操作成功"}', 0, NULL, '2026-08-26 12:41:13', 234);
INSERT INTO `sys_oper_log` VALUES (69, '菜单管理', 1, 'com.jiejie.system.controller.SysMenuController.add()', 'POST', 'lin_xf', '/system/menu', '197.12.41.10', '{"menuName":"数据大屏","path":"/screen"}', '{"code":200,"msg":"操作成功"}', 0, NULL, '2026-08-27 16:22:11', 288);
INSERT INTO `sys_oper_log` VALUES (70, '通知公告', 1, 'com.jiejie.system.controller.SysNoticeController.add()', 'POST', 'zhangsan', '/system/notice', '214.60.189.155', '{"title":"系统例行维护通知","status":1}', '{"code":200,"msg":"操作成功"}', 0, NULL, '2026-08-27 11:19:48', 172);
INSERT INTO `sys_oper_log` VALUES (71, '通知公告', 1, 'com.jiejie.system.controller.SysNoticeController.add()', 'POST', 'lisi', '/system/notice', '164.121.152.111', '{"title":"系统例行维护通知","status":1}', '{"code":200,"msg":"操作成功"}', 0, NULL, '2026-08-27 10:25:24', 120);
INSERT INTO `sys_oper_log` VALUES (72, '菜单管理', 1, 'com.jiejie.system.controller.SysMenuController.add()', 'POST', 'zhou_wb', '/system/menu', '179.199.162.147', '{"menuName":"数据大屏","path":"/screen"}', '{"code":200,"msg":"操作成功"}', 0, NULL, '2026-08-28 16:16:49', 378);
INSERT INTO `sys_oper_log` VALUES (73, '岗位管理', 1, 'com.jiejie.system.controller.SysPostController.add()', 'POST', 'zhangsan', '/system/post', '203.199.228.201', '{"postCode":"ai_eng","postName":"AI算法工程师"}', '{"code":200,"msg":"操作成功"}', 0, NULL, '2026-08-28 17:05:54', 187);
INSERT INTO `sys_oper_log` VALUES (74, '菜单管理', 1, 'com.jiejie.system.controller.SysMenuController.add()', 'POST', 'lisi', '/system/menu', '133.30.127.46', '{"menuName":"数据大屏","path":"/screen"}', '{"code":200,"msg":"操作成功"}', 0, NULL, '2026-08-28 12:59:19', 130);
INSERT INTO `sys_oper_log` VALUES (75, '学生管理', 1, 'com.jiejie.biz.controller.StudentController.add()', 'POST', 'lin_xf', '/student', '115.80.228.247', '{"studentNo":"20240131","name":"陈思博","gender":1}', '{"code":200,"msg":"操作成功"}', 0, NULL, '2026-08-29 10:40:02', 166);
INSERT INTO `sys_oper_log` VALUES (76, '部门管理', 2, 'com.jiejie.system.controller.SysDeptController.edit()', 'PUT', 'lin_xf', '/system/dept', '153.188.217.18', '{"id":2,"deptName":"研发中心"}', '{"code":200,"msg":"操作成功"}', 0, NULL, '2026-08-29 17:32:27', 216);
INSERT INTO `sys_oper_log` VALUES (77, '定时任务', 2, 'com.jiejie.job.controller.SysJobController.changeStatus()', 'PUT', 'lisi', '/monitor/job/changeStatus', '163.33.40.179', '{"jobId":1,"status":0}', '{"code":200,"msg":"操作成功"}', 0, NULL, '2026-08-29 13:07:45', 369);
INSERT INTO `sys_oper_log` VALUES (78, '学生管理', 2, 'com.jiejie.biz.controller.StudentController.edit()', 'PUT', 'zhangsan', '/student', '141.93.217.148', '{"id":5,"status":1}', '{"code":200,"msg":"操作成功"}', 0, NULL, '2026-08-30 12:16:39', 180);
INSERT INTO `sys_oper_log` VALUES (79, '系统配置', 2, 'com.jiejie.system.controller.SysConfigController.updateByKey()', 'PUT', 'lisi', '/system/config/updateByKey', '111.183.82.234', '{"configKey":"sys.account.captchaEnabled","configValue":"true"}', '{"code":200,"msg":"操作成功"}', 0, NULL, '2026-08-30 18:59:17', 105);

-- ----------------------------
-- Table structure for sys_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_post`;
CREATE TABLE `sys_post`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `parent_id` bigint NULL DEFAULT 0 COMMENT '父岗位ID',
  `post_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '岗位编码',
  `post_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '岗位名称',
  `sort` int NULL DEFAULT 0 COMMENT '显示顺序',
  `status` tinyint NULL DEFAULT 1 COMMENT '状态(0-停用 1-正常)',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `create_by` bigint NULL DEFAULT NULL COMMENT '创建人',
  `update_by` bigint NULL DEFAULT NULL COMMENT '更新人',
  `deleted` tinyint NULL DEFAULT 0 COMMENT '删除标识(0-未删除 1-已删除)',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_post_code`(`post_code` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '岗位表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_post
-- ----------------------------
INSERT INTO `sys_post` VALUES (1, 0, 'ceo', '董事长', 1, 1, '公司董事长', '2026-01-29 22:42:08', '2026-01-29 22:42:08', NULL, NULL, 0);
INSERT INTO `sys_post` VALUES (2, 6, 'cto', '技术总监', 2, 1, '技术总监', '2026-01-29 22:42:08', '2026-01-29 22:42:08', NULL, 1, 0);
INSERT INTO `sys_post` VALUES (3, 2, 'pm', '产品总监', 3, 1, '产品总监', '2026-01-29 22:42:08', '2026-01-29 22:42:08', NULL, 1, 0);
INSERT INTO `sys_post` VALUES (4, 6, 'dev', '开发工程师', 4, 1, '高级开发工程师', '2026-01-29 22:42:08', '2026-01-29 22:42:08', NULL, 1, 0);
INSERT INTO `sys_post` VALUES (6, 1, 'manager', '总经理', 2, 1, '总经理', '2026-01-29 22:42:08', '2026-01-29 22:42:08', 1, 1, 0);
INSERT INTO `sys_post` VALUES (5, 2, 'fe_lead', '前端架构师', 5, 1, '前端技术架构与核心规范设计', '2026-01-29 22:42:08', '2026-01-29 22:42:08', 1, 1, 0);
INSERT INTO `sys_post` VALUES (7, 2, 'mobile_dev', '移动端开发工程师', 7, 1, 'UniApp 及跨端小程序开发', '2026-01-29 22:42:08', '2026-01-29 22:42:08', 1, 1, 0);
INSERT INTO `sys_post` VALUES (8, 2, 'qa_lead', '测试主管', 8, 1, '系统质量把控与自动化测试体系', '2026-01-29 22:42:08', '2026-01-29 22:42:08', 1, 1, 0);
INSERT INTO `sys_post` VALUES (9, 3, 'ops_lead', '运营总监', 9, 1, '负责用户增长与产品运营策略', '2026-01-29 22:42:08', '2026-01-29 22:42:08', 1, 1, 0);
INSERT INTO `sys_post` VALUES (10, 4, 'market_mgr', '市场营销经理', 10, 1, '大区商务开拓与渠道合作', '2026-01-29 22:42:08', '2026-01-29 22:42:08', 1, 1, 0);
INSERT INTO `sys_post` VALUES (11, 18, 'hr_lead', '人力资源主管', 11, 1, '组织人才招聘与企业文化建设', '2026-01-29 22:42:08', '2026-01-29 22:42:08', 1, 1, 0);
INSERT INTO `sys_post` VALUES (12, 19, 'finance_lead', '财务主管', 12, 1, '企业财务核算与税务预算管理', '2026-01-29 22:42:08', '2026-01-29 22:42:08', 1, 1, 0);

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '角色名称',
  `code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '角色编码',
  `sort` int NULL DEFAULT 0 COMMENT '排序',
  `status` tinyint NULL DEFAULT 1 COMMENT '状态(0-禁用 1-启用)',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `create_by` bigint NULL DEFAULT NULL COMMENT '创建人',
  `update_by` bigint NULL DEFAULT NULL COMMENT '更新人',
  `deleted` tinyint NULL DEFAULT 0 COMMENT '删除标识(0-未删除 1-已删除)',
  `data_scope` tinyint NOT NULL DEFAULT 1 COMMENT '数据范围(1全部 2自定义 3本部门 4本部门及以下 5仅本人)',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_code`(`code` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '角色表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES (1, '超级管理员', 'admin', 1, 1, '拥有所有权限', '2026-01-29 22:42:08', '2026-01-29 22:42:08', NULL, 1, 0, 1);
INSERT INTO `sys_role` VALUES (2, '普通用户', 'user', 2, 1, '普通用户角色', '2026-01-29 22:42:08', '2026-01-29 22:42:08', NULL, 1, 0, 5);
INSERT INTO `sys_role` VALUES (3, '研发主管', 'dev_manager', 3, 1, '负责技术研发团队管理，拥有系统监控、工具与业务权限', '2026-01-29 22:42:08', '2026-01-29 22:42:08', 1, 1, 0, 4);
INSERT INTO `sys_role` VALUES (4, '运营主管', 'ops_manager', 4, 1, '负责业务运营、消息发布、用户互动与数据查看', '2026-01-29 22:42:08', '2026-01-29 22:42:08', 1, 1, 0, 4);
INSERT INTO `sys_role` VALUES (5, '财务主管', 'finance_lead', 5, 1, '企业财务审计、报表查看与基础业务权限', '2026-01-29 22:42:08', '2026-01-29 22:42:08', 1, 1, 0, 3);
INSERT INTO `sys_role` VALUES (6, '演示访客', 'demo_guest', 6, 1, '游客演示账号，仅具备常用模块只读查看权限', '2026-01-29 22:42:08', '2026-01-29 22:42:08', 1, 1, 0, 5);

-- ----------------------------
-- Table structure for sys_role_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_dept`;
CREATE TABLE `sys_role_dept`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `role_id` bigint NOT NULL,
  `dept_id` bigint NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_role_dept`(`role_id` ASC, `dept_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '角色-部门 数据权限关联' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_role_dept
-- ----------------------------

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `role_id` bigint NOT NULL COMMENT '角色ID',
  `menu_id` bigint NOT NULL COMMENT '菜单ID',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_role_id`(`role_id` ASC) USING BTREE,
  INDEX `idx_menu_id`(`menu_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8859 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '角色菜单关联表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------


DELETE FROM `sys_role_menu` WHERE `role_id` IN (2, 3, 4, 5, 6);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 1);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 2);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 6);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 10);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 14);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 18);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 22);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 23);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 27);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 126);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 127);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 134);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 135);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 136);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 137);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 138);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 139);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 142);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 146);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 147);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 152);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 153);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 161);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 281);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 327);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 328);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 329);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (3, 1);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (3, 2);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (3, 3);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (3, 4);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (3, 5);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (3, 6);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (3, 7);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (3, 8);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (3, 9);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (3, 10);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (3, 11);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (3, 12);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (3, 13);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (3, 14);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (3, 15);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (3, 16);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (3, 17);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (3, 18);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (3, 19);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (3, 20);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (3, 21);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (3, 22);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (3, 23);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (3, 24);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (3, 25);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (3, 26);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (3, 27);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (3, 28);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (3, 29);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (3, 30);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (3, 31);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (3, 32);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (3, 33);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (3, 34);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (3, 35);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (3, 36);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (3, 37);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (3, 38);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (3, 39);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (3, 40);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (3, 41);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (3, 42);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (3, 43);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (3, 44);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (3, 45);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (3, 126);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (3, 127);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (3, 128);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (3, 129);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (3, 134);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (3, 135);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (3, 136);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (3, 137);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (3, 138);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (3, 139);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (3, 142);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (3, 143);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (3, 144);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (3, 145);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (3, 146);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (3, 147);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (3, 148);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (3, 149);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (3, 150);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (3, 151);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (3, 152);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (3, 153);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (3, 154);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (3, 155);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (3, 156);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (3, 157);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (3, 158);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (3, 159);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (3, 160);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (3, 161);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (3, 162);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (3, 163);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (3, 164);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (3, 165);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (3, 166);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (3, 167);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (3, 168);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (3, 169);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (3, 200);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (3, 201);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (3, 202);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (3, 203);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (3, 204);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (3, 205);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (3, 206);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (3, 207);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (3, 208);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (3, 209);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (3, 210);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (3, 211);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (3, 212);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (3, 213);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (3, 214);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (3, 272);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (3, 280);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (3, 281);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (3, 282);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (3, 283);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (3, 284);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (3, 327);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (3, 328);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (3, 329);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (3, 330);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (3, 331);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (3, 332);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (4, 1);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (4, 2);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (4, 6);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (4, 10);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (4, 14);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (4, 18);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (4, 22);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (4, 23);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (4, 27);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (4, 126);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (4, 127);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (4, 128);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (4, 129);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (4, 134);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (4, 135);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (4, 136);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (4, 137);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (4, 138);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (4, 139);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (4, 142);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (4, 143);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (4, 146);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (4, 147);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (4, 152);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (4, 153);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (4, 161);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (4, 162);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (4, 163);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (4, 164);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (4, 165);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (4, 166);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (4, 167);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (4, 168);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (4, 169);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (4, 281);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (4, 327);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (4, 328);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (4, 329);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (4, 330);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (4, 331);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (4, 332);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (5, 1);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (5, 2);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (5, 6);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (5, 10);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (5, 14);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (5, 18);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (5, 22);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (5, 23);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (5, 27);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (5, 126);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (5, 127);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (5, 128);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (5, 129);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (5, 134);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (5, 135);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (5, 136);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (5, 137);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (5, 138);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (5, 139);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (5, 142);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (5, 146);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (5, 147);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (5, 152);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (5, 153);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (5, 161);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (5, 281);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (5, 327);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (5, 328);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (5, 329);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (6, 1);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (6, 2);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (6, 6);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (6, 10);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (6, 14);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (6, 18);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (6, 22);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (6, 23);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (6, 27);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (6, 31);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (6, 32);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (6, 34);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (6, 36);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (6, 37);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (6, 39);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (6, 43);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (6, 45);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (6, 126);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (6, 127);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (6, 134);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (6, 135);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (6, 139);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (6, 141);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (6, 142);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (6, 143);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (6, 144);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (6, 145);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (6, 146);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (6, 147);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (6, 148);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (6, 149);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (6, 150);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (6, 151);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (6, 152);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (6, 153);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (6, 154);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (6, 155);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (6, 156);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (6, 161);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (6, 162);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (6, 163);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (6, 164);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (6, 168);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (6, 200);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (6, 201);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (6, 202);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (6, 203);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (6, 204);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (6, 205);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (6, 206);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (6, 281);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (6, 282);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (6, 283);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (6, 284);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (6, 327);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (6, 328);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (6, 329);

-- ----------------------------
-- Table structure for sys_server
-- ----------------------------
DROP TABLE IF EXISTS `sys_server`;
CREATE TABLE `sys_server`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '服务器名称',
  `host` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '服务器地址',
  `port` int NOT NULL DEFAULT 22 COMMENT 'SSH端口',
  `username` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户名',
  `auth_type` tinyint NOT NULL DEFAULT 1 COMMENT '认证方式：1-密码 2-密钥',
  `password` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '密码（加密存储）',
  `private_key` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '私钥内容',
  `passphrase` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '私钥密码（加密存储）',
  `description` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '描述',
  `status` tinyint NOT NULL DEFAULT 1 COMMENT '状态：0-禁用 1-启用',
  `sort` int NOT NULL DEFAULT 0 COMMENT '排序',
  `last_connect_time` datetime NULL DEFAULT NULL COMMENT '最后连接时间',
  `create_by` bigint NULL DEFAULT NULL COMMENT '创建者',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_by` bigint NULL DEFAULT NULL COMMENT '更新者',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `deleted` tinyint NOT NULL DEFAULT 0 COMMENT '是否删除：0-否 1-是',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_status`(`status` ASC) USING BTREE,
  INDEX `idx_deleted`(`deleted` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '服务器管理表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_server
-- ----------------------------
INSERT INTO `sys_server` VALUES (1, '测试服务器', '47.108.187.25', 22, 'root', 1, '111', '', '', '', 1, 0, '2026-02-07 09:52:27', 1, '2026-01-31 23:46:31', 1, '2026-02-07 09:52:27', 0);

-- ----------------------------
-- Table structure for sys_sms_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_sms_log`;
CREATE TABLE `sys_sms_log`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `phone` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '手机号',
  `content` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '短信内容/验证码',
  `sms_type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT 'verify_code' COMMENT '短信类型：verify_code-验证码 notice-通知 marketing-营销',
  `template_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '模板ID',
  `template_params` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '模板参数（JSON格式）',
  `provider` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '服务商：aliyun-阿里云 tencent-腾讯云 console-控制台',
  `status` tinyint NULL DEFAULT 0 COMMENT '发送状态：0-发送中 1-成功 2-失败',
  `result_msg` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '发送结果消息',
  `biz_id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '服务商返回的消息ID',
  `send_time` datetime NULL DEFAULT NULL COMMENT '发送时间',
  `user_id` bigint NULL DEFAULT NULL COMMENT '用户ID',
  `biz_type` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '业务类型：login-登录 register-注册 reset_password-重置密码 bind_phone-绑定手机',
  `ip` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'IP地址',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_phone`(`phone` ASC) USING BTREE,
  INDEX `idx_user_id`(`user_id` ASC) USING BTREE,
  INDEX `idx_send_time`(`send_time` ASC) USING BTREE,
  INDEX `idx_status`(`status` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '短信发送记录表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_sms_log
-- ----------------------------
INSERT INTO `sys_sms_log` VALUES (1, '18483678377', '473578', 'verify_code', NULL, NULL, 'aliyun', 1, 'OK', '140425370962994532^0', '2026-02-13 14:09:54', NULL, 'login', NULL, '2026-02-13 14:09:54');
INSERT INTO `sys_sms_log` VALUES (2, '18483678377', '358716', 'verify_code', NULL, NULL, 'aliyun', 2, '该账号下找不到对应签名', NULL, '2026-02-13 15:51:43', NULL, 'login', '127.0.0.1', '2026-02-13 15:51:43');

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `dept_id` bigint NULL DEFAULT NULL COMMENT '部门id',
  `username` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户名',
  `password` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '密码',
  `nickname` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '昵称',
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '头像',
  `email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '邮箱',
  `phone` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '手机号',
  `gender` tinyint NULL DEFAULT 0 COMMENT '性别(0-未知 1-男 2-女)',
  `status` tinyint NULL DEFAULT 1 COMMENT '状态(0-禁用 1-启用)',
  `is_quit` tinyint NULL DEFAULT 0 COMMENT '是否离职(0-否 1-是)',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `create_by` bigint NULL DEFAULT NULL COMMENT '创建人',
  `update_by` bigint NULL DEFAULT NULL COMMENT '更新人',
  `user_type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT 'admin' COMMENT '用户类型(admin-后台管理员 pc-PC前台用户 app-App/小程序用户)',
  `open_id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '微信openId(微信扫码登录时使用)',
  `deleted` tinyint NULL DEFAULT 0 COMMENT '删除标识(0-未删除 1-已删除)',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_username`(`username` ASC) USING BTREE,
  INDEX `idx_open_id`(`open_id` ASC) USING BTREE,
  INDEX `idx_user_type`(`user_type` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 430 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (1, 1, 'admin', '$2a$10$tcuxr41aeMeZIbsKi8mIkOd/RWQulvxS25yrFDz3ZFhAMJ3sVjdzW', '超级管理员', 'https://api.dicebear.com/7.x/avataaars/svg?seed=admin', 'admin@jiejie.com', '18888888888', 1, 1, 0, '超级管理员，系统最高权限拥有者', '2026-01-29 22:42:08', '2026-02-24 22:02:00', NULL, 1, 'admin', NULL, 0);
INSERT INTO `sys_user` VALUES (2, 2, 'zhangsan', '$2a$10$tcuxr41aeMeZIbsKi8mIkOd/RWQulvxS25yrFDz3ZFhAMJ3sVjdzW', '张三', 'https://api.dicebear.com/7.x/avataaars/svg?seed=zhangsan', 'zhangsan@jiejie.com', '13800138001', 1, 1, 0, '技术总监，负责研发技术架构与团队管理', '2026-01-29 22:42:08', '2026-02-24 22:02:00', 1, 1, 'admin', NULL, 0);
INSERT INTO `sys_user` VALUES (3, 3, 'lisi', '$2a$10$tcuxr41aeMeZIbsKi8mIkOd/RWQulvxS25yrFDz3ZFhAMJ3sVjdzW', '李四', 'https://api.dicebear.com/7.x/avataaars/svg?seed=lisi', 'lisi@jiejie.com', '13800138002', 1, 1, 0, '产品总监，负责公司全线产品规划', '2026-01-29 22:42:08', '2026-02-24 22:02:00', 1, 1, 'admin', NULL, 0);
INSERT INTO `sys_user` VALUES (4, 15, 'wangwu', '$2a$10$tcuxr41aeMeZIbsKi8mIkOd/RWQulvxS25yrFDz3ZFhAMJ3sVjdzW', '王五', 'https://api.dicebear.com/7.x/avataaars/svg?seed=wangwu', 'wangwu@jiejie.com', '13800138003', 1, 1, 0, '运营主管，擅长用户增长与活动运营', '2026-01-29 22:42:08', '2026-02-24 22:02:00', 1, 1, 'admin', NULL, 0);
INSERT INTO `sys_user` VALUES (5, 19, 'zhaoliu', '$2a$10$tcuxr41aeMeZIbsKi8mIkOd/RWQulvxS25yrFDz3ZFhAMJ3sVjdzW', '赵六', 'https://api.dicebear.com/7.x/avataaars/svg?seed=zhaoliu', 'zhaoliu@jiejie.com', '13800138004', 2, 1, 0, '财务主管，负责企业资金与财务审计', '2026-01-29 22:42:08', '2026-02-24 22:02:00', 1, 1, 'admin', NULL, 0);
INSERT INTO `sys_user` VALUES (6, 18, 'sunqi', '$2a$10$tcuxr41aeMeZIbsKi8mIkOd/RWQulvxS25yrFDz3ZFhAMJ3sVjdzW', '孙七', 'https://api.dicebear.com/7.x/avataaars/svg?seed=sunqi', 'sunqi@jiejie.com', '13800138005', 2, 1, 0, '人力行政主管，负责招聘与企业文化', '2026-01-29 22:42:08', '2026-02-24 22:02:00', 1, 1, 'admin', NULL, 0);
INSERT INTO `sys_user` VALUES (7, 1, 'chen_jg', '$2a$10$tcuxr41aeMeZIbsKi8mIkOd/RWQulvxS25yrFDz3ZFhAMJ3sVjdzW', '陈建国', 'https://api.dicebear.com/7.x/avataaars/svg?seed=chen_jg', 'chenjg@jiejie.com', '13800138006', 1, 1, 0, '董事长兼创始人', '2026-01-29 22:42:08', '2026-02-24 22:02:00', 1, 1, 'admin', NULL, 0);
INSERT INTO `sys_user` VALUES (8, 10, 'lin_xf', '$2a$10$tcuxr41aeMeZIbsKi8mIkOd/RWQulvxS25yrFDz3ZFhAMJ3sVjdzW', '林晓峰', 'https://api.dicebear.com/7.x/avataaars/svg?seed=lin_xf', 'linxf@jiejie.com', '13800138007', 1, 1, 0, '前端架构师，Vue3 / TypeScript 专家', '2026-01-29 22:42:08', '2026-02-24 22:02:00', 1, 1, 'admin', NULL, 0);
INSERT INTO `sys_user` VALUES (9, 11, 'zhou_wb', '$2a$10$tcuxr41aeMeZIbsKi8mIkOd/RWQulvxS25yrFDz3ZFhAMJ3sVjdzW', '周文博', 'https://api.dicebear.com/7.x/avataaars/svg?seed=zhou_wb', 'zhouwb@jiejie.com', '13800138008', 1, 1, 0, '高级Java工程师，微服务与高并发架构', '2026-01-29 22:42:08', '2026-02-24 22:02:00', 1, 1, 'admin', NULL, 0);
INSERT INTO `sys_user` VALUES (10, 14, 'huang_xy', '$2a$10$tcuxr41aeMeZIbsKi8mIkOd/RWQulvxS25yrFDz3ZFhAMJ3sVjdzW', '黄馨予', 'https://api.dicebear.com/7.x/avataaars/svg?seed=huang_xy', 'huangxy@jiejie.com', '13800138009', 2, 1, 0, 'UI/UX 主设计师，负责设计规范与交互', '2026-01-29 22:42:08', '2026-02-24 22:02:00', 1, 1, 'admin', NULL, 0);
INSERT INTO `sys_user` VALUES (11, 12, 'liu_zm', '$2a$10$tcuxr41aeMeZIbsKi8mIkOd/RWQulvxS25yrFDz3ZFhAMJ3sVjdzW', '刘子墨', 'https://api.dicebear.com/7.x/avataaars/svg?seed=liu_zm', 'liuzm@jiejie.com', '13800138010', 1, 1, 0, '移动端开发组长，负责 UniApp 多端发布', '2026-01-29 22:42:08', '2026-02-24 22:02:00', 1, 1, 'admin', NULL, 0);
INSERT INTO `sys_user` VALUES (12, 13, 'wu_tl', '$2a$10$tcuxr41aeMeZIbsKi8mIkOd/RWQulvxS25yrFDz3ZFhAMJ3sVjdzW', '吴天朗', 'https://api.dicebear.com/7.x/avataaars/svg?seed=wu_tl', 'wutl@jiejie.com', '13800138011', 1, 1, 0, '测试主管，负责持续集成与性能压测', '2026-01-29 22:42:08', '2026-02-24 22:02:00', 1, 1, 'admin', NULL, 0);
INSERT INTO `sys_user` VALUES (13, 13, 'zheng_yx', '$2a$10$tcuxr41aeMeZIbsKi8mIkOd/RWQulvxS25yrFDz3ZFhAMJ3sVjdzW', '郑雨萱', 'https://api.dicebear.com/7.x/avataaars/svg?seed=zheng_yx', 'zhengyx@jiejie.com', '13800138012', 2, 1, 0, 'QA测试工程师，自动化测试脚本维护', '2026-01-29 22:42:08', '2026-02-24 22:02:00', 1, 1, 'admin', NULL, 0);
INSERT INTO `sys_user` VALUES (14, 16, 'xu_hm', '$2a$10$tcuxr41aeMeZIbsKi8mIkOd/RWQulvxS25yrFDz3ZFhAMJ3sVjdzW', '徐海明', 'https://api.dicebear.com/7.x/avataaars/svg?seed=xu_hm', 'xuhm@jiejie.com', '13800138013', 1, 1, 0, '华东大区营销总监', '2026-01-29 22:42:08', '2026-02-24 22:02:00', 1, 1, 'admin', NULL, 0);
INSERT INTO `sys_user` VALUES (15, 17, 'sun_lx', '$2a$10$tcuxr41aeMeZIbsKi8mIkOd/RWQulvxS25yrFDz3ZFhAMJ3sVjdzW', '孙立新', 'https://api.dicebear.com/7.x/avataaars/svg?seed=sun_lx', 'sunlx@jiejie.com', '13800138014', 1, 1, 0, '华南大区市场经理', '2026-01-29 22:42:08', '2026-02-24 22:02:00', 1, 1, 'admin', NULL, 0);
INSERT INTO `sys_user` VALUES (16, 18, 'he_jj', '$2a$10$tcuxr41aeMeZIbsKi8mIkOd/RWQulvxS25yrFDz3ZFhAMJ3sVjdzW', '何佳佳', 'https://api.dicebear.com/7.x/avataaars/svg?seed=he_jj', 'hejj@jiejie.com', '13800138015', 2, 1, 0, '薪酬绩效专员', '2026-01-29 22:42:08', '2026-02-24 22:02:00', 1, 1, 'admin', NULL, 0);
INSERT INTO `sys_user` VALUES (17, 19, 'deng_cy', '$2a$10$tcuxr41aeMeZIbsKi8mIkOd/RWQulvxS25yrFDz3ZFhAMJ3sVjdzW', '邓晨宇', 'https://api.dicebear.com/7.x/avataaars/svg?seed=deng_cy', 'dengcy@jiejie.com', '13800138016', 1, 1, 0, '财务总账会计', '2026-01-29 22:42:08', '2026-02-24 22:02:00', 1, 1, 'admin', NULL, 0);
INSERT INTO `sys_user` VALUES (18, 11, 'xie_ry', '$2a$10$tcuxr41aeMeZIbsKi8mIkOd/RWQulvxS25yrFDz3ZFhAMJ3sVjdzW', '谢若云', 'https://api.dicebear.com/7.x/avataaars/svg?seed=xie_ry', 'xiery@jiejie.com', '13800138017', 2, 1, 0, 'Java开发工程师，负责业务接口与报表', '2026-01-29 22:42:08', '2026-02-24 22:02:00', 1, 1, 'admin', NULL, 0);
INSERT INTO `sys_user` VALUES (19, 10, 'song_zk', '$2a$10$tcuxr41aeMeZIbsKi8mIkOd/RWQulvxS25yrFDz3ZFhAMJ3sVjdzW', '宋子坤', 'https://api.dicebear.com/7.x/avataaars/svg?seed=song_zk', 'songzk@jiejie.com', '13800138018', 1, 1, 0, '前端开发工程师，负责页面重构与组件封装', '2026-01-29 22:42:08', '2026-02-24 22:02:00', 1, 1, 'admin', NULL, 0);
INSERT INTO `sys_user` VALUES (20, 15, 'han_ym', '$2a$10$tcuxr41aeMeZIbsKi8mIkOd/RWQulvxS25yrFDz3ZFhAMJ3sVjdzW', '韩雨濛', 'https://api.dicebear.com/7.x/avataaars/svg?seed=han_ym', 'hanym@jiejie.com', '13800138019', 2, 1, 0, '社区运营专员，负责新媒体内容分发', '2026-01-29 22:42:08', '2026-02-24 22:02:00', 1, 1, 'admin', NULL, 0);
INSERT INTO `sys_user` VALUES (21, 11, 'tang_bx', '$2a$10$tcuxr41aeMeZIbsKi8mIkOd/RWQulvxS25yrFDz3ZFhAMJ3sVjdzW', '唐博轩', 'https://api.dicebear.com/7.x/avataaars/svg?seed=tang_bx', 'tangbx@jiejie.com', '13800138020', 1, 0, 0, '实习后端（演示账号禁用状态）', '2026-01-29 22:42:08', '2026-02-24 22:02:00', 1, 1, 'admin', NULL, 0);
INSERT INTO `sys_user` VALUES (22, 2, 'guo_yh', '$2a$10$tcuxr41aeMeZIbsKi8mIkOd/RWQulvxS25yrFDz3ZFhAMJ3sVjdzW', '郭宇航', 'https://api.dicebear.com/7.x/avataaars/svg?seed=guo_yh', 'guoyh@jiejie.com', '13800138021', 1, 1, 1, '离职员工（演示离职人员筛选）', '2026-01-29 22:42:08', '2026-02-24 22:02:00', 1, 1, 'admin', NULL, 0);

-- ----------------------------
-- Table structure for sys_user_blacklist
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_blacklist`;
CREATE TABLE `sys_user_blacklist`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `blocked_user_id` bigint NOT NULL COMMENT '被拉黑的用户ID',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '拉黑时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_user_blocked`(`user_id` ASC, `blocked_user_id` ASC) USING BTREE,
  INDEX `idx_user_id`(`user_id` ASC) USING BTREE,
  INDEX `idx_blocked_user_id`(`blocked_user_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户黑名单表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_user_blacklist
-- ----------------------------

-- ----------------------------
-- Table structure for sys_user_notice
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_notice`;
CREATE TABLE `sys_user_notice`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `notice_id` bigint NOT NULL COMMENT '通知ID',
  `is_read` tinyint NULL DEFAULT 0 COMMENT '是否已读(0未读 1已读)',
  `read_time` datetime NULL DEFAULT NULL COMMENT '阅读时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_user_notice`(`user_id` ASC, `notice_id` ASC) USING BTREE,
  INDEX `idx_user_id`(`user_id` ASC) USING BTREE,
  INDEX `idx_notice_id`(`notice_id` ASC) USING BTREE,
  INDEX `idx_is_read`(`is_read` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 37 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户通知关联表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_user_notice
-- ----------------------------
INSERT INTO `sys_user_notice` VALUES (1, 1, 1, 1, '2026-09-02 10:00:00');
INSERT INTO `sys_user_notice` VALUES (2, 1, 2, 0, NULL);
INSERT INTO `sys_user_notice` VALUES (3, 1, 3, 1, '2026-09-02 10:00:00');
INSERT INTO `sys_user_notice` VALUES (4, 1, 4, 1, '2026-09-02 10:00:00');
INSERT INTO `sys_user_notice` VALUES (5, 1, 5, 0, NULL);
INSERT INTO `sys_user_notice` VALUES (6, 1, 6, 1, '2026-09-02 10:00:00');
INSERT INTO `sys_user_notice` VALUES (7, 1, 7, 1, '2026-09-02 10:00:00');
INSERT INTO `sys_user_notice` VALUES (8, 1, 8, 0, NULL);
INSERT INTO `sys_user_notice` VALUES (9, 2, 1, 0, NULL);
INSERT INTO `sys_user_notice` VALUES (10, 2, 2, 1, '2026-09-02 10:00:00');
INSERT INTO `sys_user_notice` VALUES (11, 2, 3, 1, '2026-09-02 10:00:00');
INSERT INTO `sys_user_notice` VALUES (12, 2, 4, 0, NULL);
INSERT INTO `sys_user_notice` VALUES (13, 2, 5, 1, '2026-09-02 10:00:00');
INSERT INTO `sys_user_notice` VALUES (14, 2, 6, 1, '2026-09-02 10:00:00');
INSERT INTO `sys_user_notice` VALUES (15, 2, 7, 0, NULL);
INSERT INTO `sys_user_notice` VALUES (16, 2, 8, 1, '2026-09-02 10:00:00');
INSERT INTO `sys_user_notice` VALUES (17, 3, 1, 1, '2026-09-02 10:00:00');
INSERT INTO `sys_user_notice` VALUES (18, 3, 2, 1, '2026-09-02 10:00:00');
INSERT INTO `sys_user_notice` VALUES (19, 3, 3, 0, NULL);
INSERT INTO `sys_user_notice` VALUES (20, 3, 4, 1, '2026-09-02 10:00:00');
INSERT INTO `sys_user_notice` VALUES (21, 3, 5, 1, '2026-09-02 10:00:00');
INSERT INTO `sys_user_notice` VALUES (22, 3, 6, 0, NULL);
INSERT INTO `sys_user_notice` VALUES (23, 3, 7, 1, '2026-09-02 10:00:00');
INSERT INTO `sys_user_notice` VALUES (24, 3, 8, 1, '2026-09-02 10:00:00');
INSERT INTO `sys_user_notice` VALUES (25, 4, 1, 1, '2026-09-02 10:00:00');
INSERT INTO `sys_user_notice` VALUES (26, 4, 2, 0, NULL);
INSERT INTO `sys_user_notice` VALUES (27, 4, 3, 1, '2026-09-02 10:00:00');
INSERT INTO `sys_user_notice` VALUES (28, 4, 4, 1, '2026-09-02 10:00:00');
INSERT INTO `sys_user_notice` VALUES (29, 4, 5, 0, NULL);
INSERT INTO `sys_user_notice` VALUES (30, 4, 6, 1, '2026-09-02 10:00:00');
INSERT INTO `sys_user_notice` VALUES (31, 4, 7, 1, '2026-09-02 10:00:00');
INSERT INTO `sys_user_notice` VALUES (32, 4, 8, 0, NULL);
INSERT INTO `sys_user_notice` VALUES (33, 5, 1, 0, NULL);
INSERT INTO `sys_user_notice` VALUES (34, 5, 2, 1, '2026-09-02 10:00:00');
INSERT INTO `sys_user_notice` VALUES (35, 5, 3, 1, '2026-09-02 10:00:00');
INSERT INTO `sys_user_notice` VALUES (36, 5, 4, 0, NULL);
INSERT INTO `sys_user_notice` VALUES (37, 5, 5, 1, '2026-09-02 10:00:00');
INSERT INTO `sys_user_notice` VALUES (38, 5, 6, 1, '2026-09-02 10:00:00');
INSERT INTO `sys_user_notice` VALUES (39, 5, 7, 0, NULL);
INSERT INTO `sys_user_notice` VALUES (40, 5, 8, 1, '2026-09-02 10:00:00');
INSERT INTO `sys_user_notice` VALUES (41, 6, 1, 1, '2026-09-02 10:00:00');
INSERT INTO `sys_user_notice` VALUES (42, 6, 2, 1, '2026-09-02 10:00:00');
INSERT INTO `sys_user_notice` VALUES (43, 6, 3, 0, NULL);
INSERT INTO `sys_user_notice` VALUES (44, 6, 4, 1, '2026-09-02 10:00:00');
INSERT INTO `sys_user_notice` VALUES (45, 6, 5, 1, '2026-09-02 10:00:00');
INSERT INTO `sys_user_notice` VALUES (46, 6, 6, 0, NULL);
INSERT INTO `sys_user_notice` VALUES (47, 6, 7, 1, '2026-09-02 10:00:00');
INSERT INTO `sys_user_notice` VALUES (48, 6, 8, 1, '2026-09-02 10:00:00');
INSERT INTO `sys_user_notice` VALUES (49, 7, 1, 1, '2026-09-02 10:00:00');
INSERT INTO `sys_user_notice` VALUES (50, 7, 2, 0, NULL);
INSERT INTO `sys_user_notice` VALUES (51, 7, 3, 1, '2026-09-02 10:00:00');
INSERT INTO `sys_user_notice` VALUES (52, 7, 4, 1, '2026-09-02 10:00:00');
INSERT INTO `sys_user_notice` VALUES (53, 7, 5, 0, NULL);
INSERT INTO `sys_user_notice` VALUES (54, 7, 6, 1, '2026-09-02 10:00:00');
INSERT INTO `sys_user_notice` VALUES (55, 7, 7, 1, '2026-09-02 10:00:00');
INSERT INTO `sys_user_notice` VALUES (56, 7, 8, 0, NULL);
INSERT INTO `sys_user_notice` VALUES (57, 8, 1, 0, NULL);
INSERT INTO `sys_user_notice` VALUES (58, 8, 2, 1, '2026-09-02 10:00:00');
INSERT INTO `sys_user_notice` VALUES (59, 8, 3, 1, '2026-09-02 10:00:00');
INSERT INTO `sys_user_notice` VALUES (60, 8, 4, 0, NULL);
INSERT INTO `sys_user_notice` VALUES (61, 8, 5, 1, '2026-09-02 10:00:00');
INSERT INTO `sys_user_notice` VALUES (62, 8, 6, 1, '2026-09-02 10:00:00');
INSERT INTO `sys_user_notice` VALUES (63, 8, 7, 0, NULL);
INSERT INTO `sys_user_notice` VALUES (64, 8, 8, 1, '2026-09-02 10:00:00');
INSERT INTO `sys_user_notice` VALUES (65, 9, 1, 1, '2026-09-02 10:00:00');
INSERT INTO `sys_user_notice` VALUES (66, 9, 2, 1, '2026-09-02 10:00:00');
INSERT INTO `sys_user_notice` VALUES (67, 9, 3, 0, NULL);
INSERT INTO `sys_user_notice` VALUES (68, 9, 4, 1, '2026-09-02 10:00:00');
INSERT INTO `sys_user_notice` VALUES (69, 9, 5, 1, '2026-09-02 10:00:00');
INSERT INTO `sys_user_notice` VALUES (70, 9, 6, 0, NULL);
INSERT INTO `sys_user_notice` VALUES (71, 9, 7, 1, '2026-09-02 10:00:00');
INSERT INTO `sys_user_notice` VALUES (72, 9, 8, 1, '2026-09-02 10:00:00');

-- ----------------------------
-- Table structure for sys_user_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_post`;
CREATE TABLE `sys_user_post`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `post_id` bigint NOT NULL COMMENT '岗位ID',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_user_id`(`user_id` ASC) USING BTREE,
  INDEX `idx_post_id`(`post_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户岗位关联表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_user_post
-- ----------------------------
INSERT INTO `sys_user_post` (`user_id`, `post_id`) VALUES (1, 1);
INSERT INTO `sys_user_post` (`user_id`, `post_id`) VALUES (2, 2);
INSERT INTO `sys_user_post` (`user_id`, `post_id`) VALUES (3, 3);
INSERT INTO `sys_user_post` (`user_id`, `post_id`) VALUES (4, 9);
INSERT INTO `sys_user_post` (`user_id`, `post_id`) VALUES (5, 12);
INSERT INTO `sys_user_post` (`user_id`, `post_id`) VALUES (6, 11);
INSERT INTO `sys_user_post` (`user_id`, `post_id`) VALUES (7, 1);
INSERT INTO `sys_user_post` (`user_id`, `post_id`) VALUES (8, 5);
INSERT INTO `sys_user_post` (`user_id`, `post_id`) VALUES (9, 4);
INSERT INTO `sys_user_post` (`user_id`, `post_id`) VALUES (10, 3);
INSERT INTO `sys_user_post` (`user_id`, `post_id`) VALUES (11, 7);
INSERT INTO `sys_user_post` (`user_id`, `post_id`) VALUES (12, 8);
INSERT INTO `sys_user_post` (`user_id`, `post_id`) VALUES (13, 8);
INSERT INTO `sys_user_post` (`user_id`, `post_id`) VALUES (14, 10);
INSERT INTO `sys_user_post` (`user_id`, `post_id`) VALUES (15, 10);
INSERT INTO `sys_user_post` (`user_id`, `post_id`) VALUES (16, 11);
INSERT INTO `sys_user_post` (`user_id`, `post_id`) VALUES (17, 12);
INSERT INTO `sys_user_post` (`user_id`, `post_id`) VALUES (18, 4);
INSERT INTO `sys_user_post` (`user_id`, `post_id`) VALUES (19, 5);
INSERT INTO `sys_user_post` (`user_id`, `post_id`) VALUES (20, 9);
INSERT INTO `sys_user_post` (`user_id`, `post_id`) VALUES (21, 4);
INSERT INTO `sys_user_post` (`user_id`, `post_id`) VALUES (22, 4);

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `role_id` bigint NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_user_id`(`user_id` ASC) USING BTREE,
  INDEX `idx_role_id`(`role_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 440 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户角色关联表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES (1, 1, 1);
INSERT INTO `sys_user_role` (`user_id`, `role_id`) VALUES (2, 3);
INSERT INTO `sys_user_role` (`user_id`, `role_id`) VALUES (3, 4);
INSERT INTO `sys_user_role` (`user_id`, `role_id`) VALUES (4, 4);
INSERT INTO `sys_user_role` (`user_id`, `role_id`) VALUES (5, 5);
INSERT INTO `sys_user_role` (`user_id`, `role_id`) VALUES (6, 2);
INSERT INTO `sys_user_role` (`user_id`, `role_id`) VALUES (7, 1);
INSERT INTO `sys_user_role` (`user_id`, `role_id`) VALUES (8, 3);
INSERT INTO `sys_user_role` (`user_id`, `role_id`) VALUES (9, 2);
INSERT INTO `sys_user_role` (`user_id`, `role_id`) VALUES (10, 2);
INSERT INTO `sys_user_role` (`user_id`, `role_id`) VALUES (11, 2);
INSERT INTO `sys_user_role` (`user_id`, `role_id`) VALUES (12, 2);
INSERT INTO `sys_user_role` (`user_id`, `role_id`) VALUES (13, 2);
INSERT INTO `sys_user_role` (`user_id`, `role_id`) VALUES (14, 2);
INSERT INTO `sys_user_role` (`user_id`, `role_id`) VALUES (15, 2);
INSERT INTO `sys_user_role` (`user_id`, `role_id`) VALUES (16, 2);
INSERT INTO `sys_user_role` (`user_id`, `role_id`) VALUES (17, 5);
INSERT INTO `sys_user_role` (`user_id`, `role_id`) VALUES (18, 2);
INSERT INTO `sys_user_role` (`user_id`, `role_id`) VALUES (19, 2);
INSERT INTO `sys_user_role` (`user_id`, `role_id`) VALUES (20, 4);
INSERT INTO `sys_user_role` (`user_id`, `role_id`) VALUES (21, 2);
INSERT INTO `sys_user_role` (`user_id`, `role_id`) VALUES (22, 6);

SET FOREIGN_KEY_CHECKS = 1;
