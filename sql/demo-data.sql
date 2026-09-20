-- ========================================================
-- Jiejie Admin 演示 Demo 高质量数据集
-- 生成时间: 2026-09-20 17:06:47
-- 说明: 包含组织架构、岗位、角色、演示用户、业务学生表、
--       系统公告、即时通讯、登录与操作审计日志、Banner等。
-- 所有演示用户初始密码统一为: 123456
-- ========================================================

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- 1. 清理测试与脏数据
-- ----------------------------
DELETE FROM `sys_dept` WHERE `id` >= 5;
DELETE FROM `sys_post` WHERE `id` >= 5;
DELETE FROM `sys_role` WHERE `id` >= 3;
DELETE FROM `sys_notice` WHERE `id` >= 1;
DELETE FROM `sys_user_notice` WHERE `id` >= 1;
DELETE FROM `student` WHERE `id` >= 1;
DELETE FROM `coder_banner` WHERE `id` >= 1;
DELETE FROM `sys_login_log` WHERE `id` >= 1;
DELETE FROM `sys_oper_log` WHERE `id` >= 1;
DELETE FROM `sys_job_log` WHERE `id` >= 1;
DELETE FROM `sys_chat_group` WHERE `id` >= 1;
DELETE FROM `sys_chat_group_member` WHERE `id` >= 1;
DELETE FROM `sys_chat_group_message` WHERE `id` >= 1;
DELETE FROM `sys_chat_message` WHERE `id` >= 1;
DELETE FROM `sys_user` WHERE `id` >= 2;

-- ----------------------------
-- 2. 组织架构 (sys_dept)
-- ----------------------------
UPDATE `sys_dept` SET `dept_name`='集团总部', `leader`='陈建国', `phone`='010-88886666', `email`='corp@jiejie.com' WHERE `id`=1;
UPDATE `sys_dept` SET `dept_name`='研发中心', `leader`='张三', `phone`='010-88886601', `email`='dev@jiejie.com' WHERE `id`=2;
UPDATE `sys_dept` SET `dept_name`='产品运营部', `leader`='李四', `phone`='010-88886602', `email`='pm@jiejie.com' WHERE `id`=3;
UPDATE `sys_dept` SET `dept_name`='市场营销部', `leader`='王五', `phone`='010-88886603', `email`='market@jiejie.com' WHERE `id`=4;
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
-- 3. 岗位体系 (sys_post)
-- ----------------------------
INSERT INTO `sys_post` VALUES (5, 2, 'fe_lead', '前端架构师', 5, 1, '前端技术架构与核心规范设计', '2026-01-29 22:42:08', '2026-01-29 22:42:08', 1, 1, 0);
INSERT INTO `sys_post` VALUES (7, 2, 'mobile_dev', '移动端开发工程师', 7, 1, 'UniApp 及跨端小程序开发', '2026-01-29 22:42:08', '2026-01-29 22:42:08', 1, 1, 0);
INSERT INTO `sys_post` VALUES (8, 2, 'qa_lead', '测试主管', 8, 1, '系统质量把控与自动化测试体系', '2026-01-29 22:42:08', '2026-01-29 22:42:08', 1, 1, 0);
INSERT INTO `sys_post` VALUES (9, 3, 'ops_lead', '运营总监', 9, 1, '负责用户增长与产品运营策略', '2026-01-29 22:42:08', '2026-01-29 22:42:08', 1, 1, 0);
INSERT INTO `sys_post` VALUES (10, 4, 'market_mgr', '市场营销经理', 10, 1, '大区商务开拓与渠道合作', '2026-01-29 22:42:08', '2026-01-29 22:42:08', 1, 1, 0);
INSERT INTO `sys_post` VALUES (11, 18, 'hr_lead', '人力资源主管', 11, 1, '组织人才招聘与企业文化建设', '2026-01-29 22:42:08', '2026-01-29 22:42:08', 1, 1, 0);
INSERT INTO `sys_post` VALUES (12, 19, 'finance_lead', '财务主管', 12, 1, '企业财务核算与税务预算管理', '2026-01-29 22:42:08', '2026-01-29 22:42:08', 1, 1, 0);

-- ----------------------------
-- 4. 角色体系 (sys_role)
-- ----------------------------
INSERT INTO `sys_role` VALUES (3, '研发主管', 'dev_manager', 3, 1, '负责技术研发团队管理，拥有系统监控、工具与业务权限', '2026-01-29 22:42:08', '2026-01-29 22:42:08', 1, 1, 0, 4);
INSERT INTO `sys_role` VALUES (4, '运营主管', 'ops_manager', 4, 1, '负责业务运营、消息发布、用户互动与数据查看', '2026-01-29 22:42:08', '2026-01-29 22:42:08', 1, 1, 0, 4);
INSERT INTO `sys_role` VALUES (5, '财务主管', 'finance_lead', 5, 1, '企业财务审计、报表查看与基础业务权限', '2026-01-29 22:42:08', '2026-01-29 22:42:08', 1, 1, 0, 3);
INSERT INTO `sys_role` VALUES (6, '演示访客', 'demo_guest', 6, 1, '游客演示账号，仅具备常用模块只读查看权限', '2026-01-29 22:42:08', '2026-01-29 22:42:08', 1, 1, 0, 5);

-- ----------------------------
-- 4.1 角色菜单关联 (sys_role_menu)
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
-- 5. 演示用户 (sys_user)
-- ----------------------------
UPDATE `sys_user` SET `avatar`='https://api.dicebear.com/7.x/avataaars/svg?seed=admin', `remark`='超级管理员，系统最高权限拥有者' WHERE `id`=1;
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
-- 5.1 用户角色关联 (sys_user_role)
-- ----------------------------
DELETE FROM `sys_user_role` WHERE `user_id` >= 2;
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

-- ----------------------------
-- 5.2 用户岗位关联 (sys_user_post)
-- ----------------------------
DELETE FROM `sys_user_post` WHERE `user_id` >= 1;
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
-- 6. 系统通知公告 (sys_notice)
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
-- 6.1 用户通知关联 (sys_user_notice)
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
-- 7. 业务管理示例：学生管理 (student)
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
-- 8. 首页/移动端轮播图 (coder_banner)
-- ----------------------------
INSERT INTO `coder_banner` VALUES (1, 'Spring Boot 3 + Vue 3 企业级现代化后台', '基于最新技术栈构建，响应极速、架构清晰、开箱即用', 'https://images.unsplash.com/photo-1517694712202-14dd9538aa97?w=1200&auto=format&fit=crop&q=80', '', '核心架构', '立即查看', 1, 1, 1, '2026-01-01 10:00:00', '2026-01-01 10:00:00');
INSERT INTO `coder_banner` VALUES (2, '全新移动端 UniApp 小程序协同上线', '支持多端编译，工作流即时审批、通知消息秒级到达', 'https://images.unsplash.com/photo-1526374965328-7f61d4dc18c5?w=1200&auto=format&fit=crop&q=80', '', '移动端', '体验小程序', 2, 1, 1, '2026-01-02 10:00:00', '2026-01-02 10:00:00');
INSERT INTO `coder_banner` VALUES (3, 'Warm-Flow 敏捷流程引擎与低代码表单', '可视化图形设计器，拖拽式流程编排，满足企业复杂流转', 'https://images.unsplash.com/photo-1551288049-bebda4e38f71?w=1200&auto=format&fit=crop&q=80', '', '工作流', '进入设计器', 3, 1, 1, '2026-01-03 10:00:00', '2026-01-03 10:00:00');
INSERT INTO `coder_banner` VALUES (4, '企业级全链路安全防护与性能审计', '集成 Sa-Token 权限体系、防刷限流、RSA接口加密传输', 'https://images.unsplash.com/photo-1563986768609-322da13575f3?w=1200&auto=format&fit=crop&q=80', '', '安全合规', '了解更多', 4, 1, 1, '2026-01-04 10:00:00', '2026-01-04 10:00:00');

-- ----------------------------
-- 9. 即时通讯群组与聊天消息
-- ----------------------------
INSERT INTO `sys_chat_group` VALUES (1, '技术架构研讨群', 'https://api.dicebear.com/7.x/identicon/svg?seed=tech_group', 2, '专注于 Spring Boot 3、Vue 3 架构演进与技术攻关', 200, 1, '2026-02-01 10:00:00', '2026-02-01 10:00:00');
INSERT INTO `sys_chat_group` VALUES (2, 'Jiejie Admin 全员协同大群', 'https://api.dicebear.com/7.x/identicon/svg?seed=all_group', 1, '公司内部日常协同、全员公告与跨部门交流群', 500, 1, '2026-01-29 09:00:00', '2026-01-29 09:00:00');
INSERT INTO `sys_chat_group` VALUES (3, '产品与UI体验优化组', 'https://api.dicebear.com/7.x/identicon/svg?seed=product_group', 3, '聚焦前端交互打磨、组件库定制与用户反馈收集', 100, 1, '2026-02-10 14:00:00', '2026-02-10 14:00:00');

-- 群成员绑定
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

-- 群聊天记录
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

-- 私聊消息
INSERT INTO `sys_chat_message` VALUES (1, 2, '张三', 'https://api.dicebear.com/7.x/avataaars/svg?seed=zhangsan', 1, 'admin，下午有空对一下代码生成器的多数据源配置吗？', 1, 1, '2026-08-28 14:00:00');
INSERT INTO `sys_chat_message` VALUES (2, 1, '超级管理员', 'https://api.dicebear.com/7.x/avataaars/svg?seed=admin', 2, '随时可以，我在二楼会议室，直接过来就行。', 1, 1, '2026-08-28 14:02:15');
INSERT INTO `sys_chat_message` VALUES (3, 8, '林晓峰', 'https://api.dicebear.com/7.x/avataaars/svg?seed=lin_xf', 1, '管理员好，前端工程新增了 xterm.js 终端模拟器组件，已经合并进 dev 分支。', 1, 1, '2026-08-28 15:30:00');
INSERT INTO `sys_chat_message` VALUES (4, 1, '超级管理员', 'https://api.dicebear.com/7.x/avataaars/svg?seed=admin', 8, '收到了，看到效果非常流畅，点赞！👍', 1, 1, '2026-08-28 15:35:00');
INSERT INTO `sys_chat_message` VALUES (5, 3, '李四', 'https://api.dicebear.com/7.x/avataaars/svg?seed=lisi', 4, '王五，上个月的商城活动转化数据统计表导出来了吗？', 1, 1, '2026-08-29 10:10:00');
INSERT INTO `sys_chat_message` VALUES (6, 4, '王五', 'https://api.dicebear.com/7.x/avataaars/svg?seed=wangwu', 3, '已经整理成 Excel 上传到文件管理中心了，你可以在文件列表直接下载预览。', 1, 1, '2026-08-29 10:12:40');
INSERT INTO `sys_chat_message` VALUES (7, 5, '赵六', 'https://api.dicebear.com/7.x/avataaars/svg?seed=zhaoliu', 1, '领导，8月份的云资源账单（阿里云OSS + 短信套餐）已经核对完毕，请在系统内审批。', 1, 1, '2026-08-29 11:20:00');
INSERT INTO `sys_chat_message` VALUES (8, 1, '超级管理员', 'https://api.dicebear.com/7.x/avataaars/svg?seed=admin', 5, '好的，已在流程管理-我的待办中审批通过。', 1, 1, '2026-08-29 11:25:30');

-- ----------------------------
-- 10. 登录审计日志 (sys_login_log)
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
-- 11. 操作审计日志 (sys_oper_log)
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
-- 12. 定时任务日志 (sys_job_log)
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

SET FOREIGN_KEY_CHECKS = 1;

-- ========================================================
-- 演示数据导入完毕
-- ========================================================