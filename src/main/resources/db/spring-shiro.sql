/*
 Navicat Premium Data Transfer

 Source Server         : blog
 Source Server Type    : MySQL
 Source Server Version : 50716
 Source Host           : localhost:3306
 Source Schema         : spring-shiro

 Target Server Type    : MySQL
 Target Server Version : 50716
 File Encoding         : 65001

 Date: 22/03/2019 17:41:22
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for sys_dict
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict`;
CREATE TABLE `sys_dict`  (
  `id` bigint(64) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '标签名',
  `value` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '数据值',
  `type` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '类型',
  `description` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '描述',
  `sort` decimal(10, 0) NULL DEFAULT NULL COMMENT '排序（升序）',
  `parent_id` bigint(64) NULL DEFAULT 0 COMMENT '父级编号',
  `remarks` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '备注信息',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '0' COMMENT '删除标记',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `sys_dict_value`(`value`) USING BTREE,
  INDEX `sys_dict_label`(`name`) USING BTREE,
  INDEX `sys_dict_del_flag`(`status`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 124 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '字典表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dict
-- ----------------------------
INSERT INTO `sys_dict` VALUES (123, 'Integer', 'Integer', 'gen_java_type', 'Java类型', 1, 0, '', '1', NULL, NULL);

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) NULL DEFAULT 0 COMMENT '父菜单ID，一级菜单为0',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '菜单名称',
  `url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '菜单URL',
  `perms` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '授权(多个用逗号分隔，如：user:list,user:create)',
  `type` tinyint(255) NULL DEFAULT 0 COMMENT '类型   0：目录   1：菜单   2：按钮',
  `icon` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '菜单图标',
  `order_num` int(11) NULL DEFAULT NULL COMMENT '排序值',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 31 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES (1, 0, '系统管理', '', '', 0, 'fa fa-tasks', 1, '2018-12-03 17:43:47');
INSERT INTO `sys_menu` VALUES (2, 1, '系统菜单', '/sys/menu', 'sys:menu:menu', 1, 'fa fa-th-list', 2, '2018-12-03 17:44:31');
INSERT INTO `sys_menu` VALUES (3, 1, '用户管理', '/sys/user', 'sys:user:user', 1, 'fa fa-user', 3, '2018-12-03 17:45:09');
INSERT INTO `sys_menu` VALUES (4, 1, '角色管理', '/sys/role', 'sys:role:role', 1, 'fa fa-paw', 4, '2018-12-03 17:45:46');
INSERT INTO `sys_menu` VALUES (5, 2, '新增', NULL, 'sys:menu:add', 2, NULL, 0, '2018-12-03 17:50:28');
INSERT INTO `sys_menu` VALUES (6, 2, '编辑', NULL, 'sys:menu:edit', 2, NULL, 0, '2018-12-03 17:50:27');
INSERT INTO `sys_menu` VALUES (7, 2, '删除', '', 'sys:menu:remove', 2, NULL, 0, '2018-12-03 17:50:29');
INSERT INTO `sys_menu` VALUES (8, 3, '新增', '', 'sys:user:add', 2, '', 0, '2018-12-03 17:49:08');
INSERT INTO `sys_menu` VALUES (9, 3, '编辑', '', 'sys:user:edit', 2, '', 0, '2018-12-03 17:49:11');
INSERT INTO `sys_menu` VALUES (10, 3, '删除', '', 'sys:user:remove', 2, '', 0, '2018-12-03 17:49:13');
INSERT INTO `sys_menu` VALUES (11, 4, '新增', NULL, 'sys:role:add', 2, NULL, 0, '2018-12-03 17:50:22');
INSERT INTO `sys_menu` VALUES (12, 4, '编辑', NULL, 'sys:role:edit', 2, NULL, 0, '2018-12-03 17:50:24');
INSERT INTO `sys_menu` VALUES (13, 4, '删除', NULL, 'sys:role:remove', 2, NULL, 0, '2018-12-03 17:50:25');
INSERT INTO `sys_menu` VALUES (14, 0, '系统工具', '', '', 0, 'fa fa-cog', 10, NULL);
INSERT INTO `sys_menu` VALUES (15, 14, '代码生成', '/sys/generator', '', 1, 'fa fa-code', 2, NULL);
INSERT INTO `sys_menu` VALUES (17, 14, '数据字典', '/sys/dict', '', 1, 'fa fa-bars', 1, NULL);
INSERT INTO `sys_menu` VALUES (23, 17, '新增', '', 'sys:dict:add', 2, '', NULL, NULL);
INSERT INTO `sys_menu` VALUES (24, 17, '删除', '', 'sys:dict:remove', 2, '', NULL, NULL);
INSERT INTO `sys_menu` VALUES (25, 14, '任务计划', '/sys/job', '', 1, 'fa fa-calendar-o', 3, NULL);
INSERT INTO `sys_menu` VALUES (26, 0, '外联业务', '', '', 0, 'fa fa-briefcase', 2, NULL);
INSERT INTO `sys_menu` VALUES (27, 26, '二维码管理', '/system/carInfo', 'sys:carInfo:carInfo', 1, 'fa fa-file-photo-o', 1, NULL);
INSERT INTO `sys_menu` VALUES (28, 27, '新增', '', 'sys:carInfo:add', 2, '', NULL, NULL);
INSERT INTO `sys_menu` VALUES (29, 27, '删除', '', 'sys:carInfo:remove', 2, '', NULL, NULL);
INSERT INTO `sys_menu` VALUES (30, 27, '编辑', '', 'sys:carInfo:edit', 2, '', NULL, NULL);

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '角色名称',
  `sign` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '角色标识',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES (1, '超级管理员', 'admin', '拥有最高权限', '2018-12-03 17:42:09');

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_id` int(11) NULL DEFAULT NULL,
  `menu_id` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 301 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES (199, 2, 25);
INSERT INTO `sys_role_menu` VALUES (200, 2, 15);
INSERT INTO `sys_role_menu` VALUES (201, 2, 17);
INSERT INTO `sys_role_menu` VALUES (202, 2, 24);
INSERT INTO `sys_role_menu` VALUES (203, 2, 23);
INSERT INTO `sys_role_menu` VALUES (204, 2, 14);
INSERT INTO `sys_role_menu` VALUES (205, 2, 5);
INSERT INTO `sys_role_menu` VALUES (206, 2, -1);
INSERT INTO `sys_role_menu` VALUES (207, 2, 1);
INSERT INTO `sys_role_menu` VALUES (208, 2, 2);
INSERT INTO `sys_role_menu` VALUES (276, 1, -1);
INSERT INTO `sys_role_menu` VALUES (277, 1, 30);
INSERT INTO `sys_role_menu` VALUES (278, 1, 29);
INSERT INTO `sys_role_menu` VALUES (279, 1, 28);
INSERT INTO `sys_role_menu` VALUES (280, 1, 27);
INSERT INTO `sys_role_menu` VALUES (281, 1, 24);
INSERT INTO `sys_role_menu` VALUES (282, 1, 23);
INSERT INTO `sys_role_menu` VALUES (283, 1, 25);
INSERT INTO `sys_role_menu` VALUES (284, 1, 17);
INSERT INTO `sys_role_menu` VALUES (285, 1, 15);
INSERT INTO `sys_role_menu` VALUES (286, 1, 13);
INSERT INTO `sys_role_menu` VALUES (287, 1, 12);
INSERT INTO `sys_role_menu` VALUES (288, 1, 11);
INSERT INTO `sys_role_menu` VALUES (289, 1, 10);
INSERT INTO `sys_role_menu` VALUES (290, 1, 9);
INSERT INTO `sys_role_menu` VALUES (291, 1, 8);
INSERT INTO `sys_role_menu` VALUES (292, 1, 7);
INSERT INTO `sys_role_menu` VALUES (293, 1, 6);
INSERT INTO `sys_role_menu` VALUES (294, 1, 5);
INSERT INTO `sys_role_menu` VALUES (295, 1, 4);
INSERT INTO `sys_role_menu` VALUES (296, 1, 3);
INSERT INTO `sys_role_menu` VALUES (297, 1, 2);
INSERT INTO `sys_role_menu` VALUES (298, 1, 26);
INSERT INTO `sys_role_menu` VALUES (299, 1, 14);
INSERT INTO `sys_role_menu` VALUES (300, 1, 1);

-- ----------------------------
-- Table structure for sys_task
-- ----------------------------
DROP TABLE IF EXISTS `sys_task`;
CREATE TABLE `sys_task`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `cron_expression` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'cron表达式',
  `method_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '任务调用的方法名',
  `is_concurrent` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '任务是否有状态',
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '任务描述',
  `bean_class` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '任务执行时调用哪个类的方法 包名+类名',
  `job_status` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '任务状态',
  `job_group` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '任务分组',
  `spring_bean` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `job_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '任务名',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_task
-- ----------------------------
INSERT INTO `sys_task` VALUES (1, '0/10 * * * * ?', 'run1', '1', '111', 'com.yaa.task.WelcomeJob', '0', 'group1', NULL, 'welcomJob', '2019-01-03 17:12:31', '2019-01-03 17:12:28');

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户名',
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '账号',
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '密码',
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `status` tinyint(1) NULL DEFAULT 1 COMMENT '可用 1 不可用0',
  `salt` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '随机字符串作为salt因子',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (1, '张三', 'zhangsan', '982d3b4564f2cf1f3c27c3dcafe5e705', 'zhangsan@qq.com', 1, '238618edccb4395e7a2bcd852ad06b95', '2018-12-03 17:52:09');

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NULL DEFAULT NULL,
  `role_id` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 20 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES (5, 1, 1);
INSERT INTO `sys_user_role` VALUES (6, NULL, 2);
INSERT INTO `sys_user_role` VALUES (7, NULL, 2);
INSERT INTO `sys_user_role` VALUES (10, NULL, 2);

-- ----------------------------
-- Table structure for wk_car_info
-- ----------------------------
DROP TABLE IF EXISTS `wk_car_info`;
CREATE TABLE `wk_car_info`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `navicert` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '车辆准运证号',
  `approval_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `number` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `owned` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `project_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `project_address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `accommodation` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `accommodation_address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `permit` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wk_car_info
-- ----------------------------
INSERT INTO `wk_car_info` VALUES (1, 'TZ201809111020', '', '京AFH329', '北京鑫驰通达货物运输有限公司', '北京地铁7号线东延工程土建施工04合同段', '北京市', '通州区漷县建筑垃圾消纳场(延期2016126)(延期2017119)(延期2018116)(延期2019121)', '工地北门-九德路-万盛南街-张采路-103国道-漷县消纳场', '2018-09-11至2019-06-30');

SET FOREIGN_KEY_CHECKS = 1;