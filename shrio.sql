/*
 Navicat Premium Data Transfer

 Source Server         : 本地
 Source Server Type    : MySQL
 Source Server Version : 50626
 Source Host           : localhost:3306
 Source Schema         : jdf

 Target Server Type    : MySQL
 Target Server Version : 50626
 File Encoding         : 65001

 Date: 30/07/2018 21:58:59
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for permission
-- ----------------------------
DROP TABLE IF EXISTS `permission`;
CREATE TABLE `permission`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '菜单名称',
  `pid` int(11) NULL DEFAULT NULL COMMENT '父菜单id',
  `zindex` int(2) NULL DEFAULT NULL COMMENT '菜单排序',
  `istype` int(1) NULL DEFAULT NULL COMMENT '权限分类（0 菜单；1 功能）',
  `descpt` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述',
  `code` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '菜单编号',
  `icon` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '菜单图标名称',
  `page` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '菜单url',
  `insert_time` datetime(0) NULL DEFAULT NULL COMMENT '添加时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of permission
-- ----------------------------
INSERT INTO `permission` VALUES (1, '系统管理', 0, 100, 0, '系统管理', 'system', '', '/', '2017-12-20 16:22:43', '2018-01-09 19:26:36');
INSERT INTO `permission` VALUES (2, '用户管理', 1, 1100, 0, '用户管理', 'usermanage', '', '/user/userList', '2017-12-20 16:27:03', '2018-01-09 19:26:30');
INSERT INTO `permission` VALUES (3, '角色管理', 1, 1200, 0, '角色管理', 'rolemanage', '', '/auth/roleManage', '2017-12-20 16:27:03', '2018-01-09 19:26:42');
INSERT INTO `permission` VALUES (4, '权限管理', 1, 1300, 0, '权限管理', 'permmanage', NULL, '/auth/permList', '2017-12-30 19:17:32', '2018-01-09 19:26:48');
INSERT INTO `permission` VALUES (5, '商品管理', 0, 300, 0, '商品管理', 'shops', NULL, '/', '2017-12-30 19:17:50', '2018-01-09 19:20:11');
INSERT INTO `permission` VALUES (6, '渠道管理', 0, 200, 0, '渠道管理', 'channel', NULL, '/', '2018-01-01 11:07:17', '2018-01-09 19:05:42');
INSERT INTO `permission` VALUES (8, '订单管理', 0, 400, 0, '订单管理', 'orders', NULL, '/', '2018-01-09 09:26:53', '2018-01-09 19:20:40');
INSERT INTO `permission` VALUES (10, '渠道信息列表', 6, 2200, 0, '渠道信息列表', 'channelPage', NULL, '/channel/channelListPage', '2018-01-09 19:07:05', '2018-01-09 19:31:13');
INSERT INTO `permission` VALUES (11, '渠道会员列表', 6, 2300, 0, '渠道会员列表', 'channelUsers', NULL, '/channel/channelUserListPage', '2018-01-09 19:07:52', '2018-01-18 14:08:08');
INSERT INTO `permission` VALUES (13, '商品列表', 5, 3100, 0, '商品列表', 'shopPage', NULL, '/shop/shopPage', '2018-01-09 19:33:53', '2018-04-22 21:18:11');
INSERT INTO `permission` VALUES (14, '商品订单列表', 8, 4100, 0, '商品订单列表', 'orderPage', NULL, '/order/orderPage', '2018-01-09 19:34:33', '2018-04-22 21:17:58');

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role`  (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '角色名称',
  `descpt` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '角色描述',
  `code` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '角色编号',
  `insert_uid` int(11) NULL DEFAULT NULL COMMENT '操作用户id',
  `insert_time` datetime(0) NULL DEFAULT NULL COMMENT '添加数据时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES (1, '超级管理', '超级管理员', 'superman', NULL, '2018-01-09 19:28:53', '2018-01-09 19:34:56');
INSERT INTO `role` VALUES (2, '高级管理员', '高级管理员', 'highmanage', NULL, '2018-01-17 13:53:23', '2018-01-18 13:39:29');
INSERT INTO `role` VALUES (3, '经理', '经理', 'bdmanage', NULL, '2018-01-18 13:41:47', '2018-04-22 21:15:38');
INSERT INTO `role` VALUES (4, '质检员', '质检员', 'checkmanage', NULL, '2018-01-18 14:03:00', '2018-04-22 21:15:59');
INSERT INTO `role` VALUES (5, '客维员', '客维员', 'guestmanage', NULL, '2018-01-18 14:06:48', '2018-04-22 21:16:07');

-- ----------------------------
-- Table structure for role_permission
-- ----------------------------
DROP TABLE IF EXISTS `role_permission`;
CREATE TABLE `role_permission`  (
  `permit_id` int(5) NOT NULL AUTO_INCREMENT,
  `role_id` int(5) NOT NULL,
  PRIMARY KEY (`permit_id`, `role_id`) USING BTREE,
  INDEX `perimitid`(`permit_id`) USING BTREE,
  INDEX `roleid`(`role_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of role_permission
-- ----------------------------
INSERT INTO `role_permission` VALUES (1, 1);
INSERT INTO `role_permission` VALUES (1, 2);
INSERT INTO `role_permission` VALUES (2, 1);
INSERT INTO `role_permission` VALUES (2, 2);
INSERT INTO `role_permission` VALUES (3, 1);
INSERT INTO `role_permission` VALUES (3, 2);
INSERT INTO `role_permission` VALUES (4, 1);
INSERT INTO `role_permission` VALUES (5, 1);
INSERT INTO `role_permission` VALUES (5, 2);
INSERT INTO `role_permission` VALUES (5, 3);
INSERT INTO `role_permission` VALUES (5, 5);
INSERT INTO `role_permission` VALUES (6, 1);
INSERT INTO `role_permission` VALUES (6, 2);
INSERT INTO `role_permission` VALUES (6, 3);
INSERT INTO `role_permission` VALUES (6, 4);
INSERT INTO `role_permission` VALUES (6, 5);
INSERT INTO `role_permission` VALUES (7, 1);
INSERT INTO `role_permission` VALUES (8, 1);
INSERT INTO `role_permission` VALUES (8, 2);
INSERT INTO `role_permission` VALUES (8, 3);
INSERT INTO `role_permission` VALUES (8, 5);
INSERT INTO `role_permission` VALUES (10, 1);
INSERT INTO `role_permission` VALUES (10, 2);
INSERT INTO `role_permission` VALUES (10, 3);
INSERT INTO `role_permission` VALUES (10, 4);
INSERT INTO `role_permission` VALUES (11, 1);
INSERT INTO `role_permission` VALUES (11, 2);
INSERT INTO `role_permission` VALUES (11, 3);
INSERT INTO `role_permission` VALUES (11, 5);
INSERT INTO `role_permission` VALUES (12, 1);
INSERT INTO `role_permission` VALUES (12, 2);
INSERT INTO `role_permission` VALUES (12, 3);
INSERT INTO `role_permission` VALUES (13, 1);
INSERT INTO `role_permission` VALUES (13, 2);
INSERT INTO `role_permission` VALUES (13, 3);
INSERT INTO `role_permission` VALUES (13, 5);
INSERT INTO `role_permission` VALUES (14, 1);
INSERT INTO `role_permission` VALUES (14, 2);
INSERT INTO `role_permission` VALUES (14, 3);
INSERT INTO `role_permission` VALUES (14, 5);

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '用户名',
  `mobile` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '手机号',
  `email` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '邮箱',
  `password` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '密码',
  `insert_uid` int(11) NULL DEFAULT NULL COMMENT '添加该用户的用户id',
  `insert_time` datetime(0) NULL DEFAULT NULL COMMENT '注册时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  `is_del` tinyint(1) NULL DEFAULT 0 COMMENT '是否删除（0：正常；1：已删）',
  `is_job` tinyint(1) NULL DEFAULT 0 COMMENT '是否在职（0：正常；1，离职）',
  `mcode` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '短信验证码',
  `send_time` datetime(0) NULL DEFAULT NULL COMMENT '短信发送时间',
  `version` int(10) NULL DEFAULT 0 COMMENT '更新版本',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `name`(`username`) USING BTREE,
  INDEX `id`(`id`) USING BTREE,
  INDEX `mobile`(`mobile`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 28 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, 'jidongfang', '17600570699', 'aaa', 'c33367701511b4f6020ec61ded352059', NULL, '2017-12-29 17:27:23', '2018-01-09 13:34:33', 0, 0, '181907', '2018-01-17 13:42:45', 0);
INSERT INTO `user` VALUES (3, 'jidf', '17600570698', 'a11', 'c33367701511b4f6020ec61ded352059', 1, '2018-01-01 15:17:19', '2018-07-30 20:35:22', 0, 0, NULL, NULL, 2);
INSERT INTO `user` VALUES (5, 'wy23', '11155552233', 'a', 'c33367701511b4f6020ec61ded352059', 1, '2018-01-02 13:41:29', '2018-07-30 20:35:32', 0, 0, NULL, NULL, 4);

-- ----------------------------
-- Table structure for user_role
-- ----------------------------
DROP TABLE IF EXISTS `user_role`;
CREATE TABLE `user_role`  (
  `user_id` int(11) NOT NULL,
  `role_id` int(5) NOT NULL,
  PRIMARY KEY (`user_id`, `role_id`) USING BTREE,
  INDEX `userid`(`user_id`) USING BTREE,
  INDEX `roleid`(`role_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of user_role
-- ----------------------------
INSERT INTO `user_role` VALUES (1, 1);
INSERT INTO `user_role` VALUES (3, 5);
INSERT INTO `user_role` VALUES (5, 1);
INSERT INTO `user_role` VALUES (12, 5);
INSERT INTO `user_role` VALUES (19, 3);
INSERT INTO `user_role` VALUES (20, 2);
INSERT INTO `user_role` VALUES (21, 4);
INSERT INTO `user_role` VALUES (22, 5);
INSERT INTO `user_role` VALUES (23, 3);
INSERT INTO `user_role` VALUES (24, 5);
INSERT INTO `user_role` VALUES (25, 2);
INSERT INTO `user_role` VALUES (26, 5);
INSERT INTO `user_role` VALUES (27, 5);

SET FOREIGN_KEY_CHECKS = 1;
