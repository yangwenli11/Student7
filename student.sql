/*
 Navicat Premium Data Transfer

 Source Server         : local
 Source Server Type    : MySQL
 Source Server Version : 50736
 Source Host           : localhost:3306
 Source Schema         : student

 Target Server Type    : MySQL
 Target Server Version : 50736
 File Encoding         : 65001

 Date: 05/06/2023 23:48:06
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for cla2sub
-- ----------------------------
DROP TABLE IF EXISTS `cla2sub`;
CREATE TABLE `cla2sub`  (
  `cla2sub_id` int(11) NOT NULL AUTO_INCREMENT,
  `cla_id` int(11) NULL DEFAULT NULL,
  `sub_id` int(11) NULL DEFAULT NULL,
  `tec_id` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`cla2sub_id`) USING BTREE,
  UNIQUE INDEX `uni_cla_sub`(`cla_id`, `sub_id`) USING BTREE,
  INDEX `fk_cla2sub_sub`(`sub_id`) USING BTREE,
  INDEX `fk_cla2sub_cla`(`cla_id`) USING BTREE,
  INDEX `tec_id`(`tec_id`) USING BTREE,
  CONSTRAINT `cla2sub_ibfk_1` FOREIGN KEY (`tec_id`) REFERENCES `teacher` (`tec_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_cla2sub_cla` FOREIGN KEY (`cla_id`) REFERENCES `classes` (`cla_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_cla2sub_sub` FOREIGN KEY (`sub_id`) REFERENCES `subject` (`sub_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 18 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cla2sub
-- ----------------------------
INSERT INTO `cla2sub` VALUES (1, 1, 1, 1);
INSERT INTO `cla2sub` VALUES (2, 1, 2, 2);
INSERT INTO `cla2sub` VALUES (3, 2, 1, 1);
INSERT INTO `cla2sub` VALUES (4, 2, 3, 2);
INSERT INTO `cla2sub` VALUES (5, 2, 4, 2);
INSERT INTO `cla2sub` VALUES (7, 3, 2, 3);
INSERT INTO `cla2sub` VALUES (8, 4, 4, 3);
INSERT INTO `cla2sub` VALUES (9, 4, 5, 4);
INSERT INTO `cla2sub` VALUES (12, 5, 4, 4);
INSERT INTO `cla2sub` VALUES (13, 7, 1, 1);
INSERT INTO `cla2sub` VALUES (14, 7, 4, 7);
INSERT INTO `cla2sub` VALUES (15, 7, 5, 7);
INSERT INTO `cla2sub` VALUES (16, 5, 3, 7);
INSERT INTO `cla2sub` VALUES (17, 5, 5, 7);

-- ----------------------------
-- Table structure for classes
-- ----------------------------
DROP TABLE IF EXISTS `classes`;
CREATE TABLE `classes`  (
  `cla_id` int(11) NOT NULL AUTO_INCREMENT,
  `cla_name` varchar(22) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `maj_id` int(11) NULL DEFAULT NULL,
  `cla_tec` varchar(22) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`cla_id`) USING BTREE,
  UNIQUE INDEX `uni_name`(`cla_name`) USING BTREE,
  INDEX `fk_cla_maj`(`maj_id`) USING BTREE,
  CONSTRAINT `fk_cla_maj` FOREIGN KEY (`maj_id`) REFERENCES `major` (`maj_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of classes
-- ----------------------------
INSERT INTO `classes` VALUES (1, '12网编1班', 1, '李红');
INSERT INTO `classes` VALUES (2, '12ERP1班', 2, '陈鑫');
INSERT INTO `classes` VALUES (3, '12UI1班', 3, '王伟');
INSERT INTO `classes` VALUES (4, '12智能楼宇1班', 4, '钟宁涛');
INSERT INTO `classes` VALUES (5, '12网络1班', 5, '陶月敏');
INSERT INTO `classes` VALUES (7, '12游软1班', 6, '刘海');

-- ----------------------------
-- Table structure for major
-- ----------------------------
DROP TABLE IF EXISTS `major`;
CREATE TABLE `major`  (
  `maj_id` int(11) NOT NULL AUTO_INCREMENT,
  `maj_name` varchar(22) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `maj_prin` varchar(22) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `maj_link` varchar(22) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `maj_phone` varchar(22) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`maj_id`) USING BTREE,
  UNIQUE INDEX `uni_name`(`maj_name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of major
-- ----------------------------
INSERT INTO `major` VALUES (1, '软件', '李红', '李红', '123456');
INSERT INTO `major` VALUES (2, '信管', '刘海', '刘海', '1234567');
INSERT INTO `major` VALUES (3, '游美', '钱五', '钱五', '1234567');
INSERT INTO `major` VALUES (4, '蓝盾', '陶月敏', '陶月敏', '1234567');
INSERT INTO `major` VALUES (5, '网络', '陈鑫', '陈鑫', '1234567');
INSERT INTO `major` VALUES (6, '游软', '王伟', '王伟', '1234567');

-- ----------------------------
-- Table structure for operator
-- ----------------------------
DROP TABLE IF EXISTS `operator`;
CREATE TABLE `operator`  (
  `ope_id` int(11) NOT NULL AUTO_INCREMENT,
  `ope_name` varchar(22) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ope_pwd` varchar(22) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `rol_id` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`ope_id`) USING BTREE,
  UNIQUE INDEX `uni_name`(`ope_name`) USING BTREE,
  INDEX `fk_ope_rol`(`rol_id`) USING BTREE,
  CONSTRAINT `fk_ope_rol` FOREIGN KEY (`rol_id`) REFERENCES `role` (`rol_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 41 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of operator
-- ----------------------------
INSERT INTO `operator` VALUES (1, 'admin', 'admin', 1);
INSERT INTO `operator` VALUES (2, 'tec1', 'tec1', 2);
INSERT INTO `operator` VALUES (3, 'tec2', 'tec2', 2);
INSERT INTO `operator` VALUES (4, 'tec3', 'tec3', 2);
INSERT INTO `operator` VALUES (5, 'tec4', 'tec4', 2);
INSERT INTO `operator` VALUES (6, 'tec5', 'tec5', 2);
INSERT INTO `operator` VALUES (7, 'tec6', 'tec6', 2);
INSERT INTO `operator` VALUES (8, 'stu01', 'stu01', 3);
INSERT INTO `operator` VALUES (9, 'stu02', 'stu02', 3);
INSERT INTO `operator` VALUES (10, 'stu03', 'stu03', 3);
INSERT INTO `operator` VALUES (11, 'stu04', 'stu04', 3);
INSERT INTO `operator` VALUES (12, 'stu05', 'stu05', 3);
INSERT INTO `operator` VALUES (13, 'stu06', 'stu06', 3);
INSERT INTO `operator` VALUES (14, 'stu07', 'stu07', 3);
INSERT INTO `operator` VALUES (36, 'stu08', 'stu08', 3);
INSERT INTO `operator` VALUES (37, 'tec7', 'tec7', 2);
INSERT INTO `operator` VALUES (38, 'stu09', 'stu09', 3);
INSERT INTO `operator` VALUES (39, 'stu10', 'stu10', 3);
INSERT INTO `operator` VALUES (40, '田静', '田静', 2);

-- ----------------------------
-- Table structure for privilege
-- ----------------------------
DROP TABLE IF EXISTS `privilege`;
CREATE TABLE `privilege`  (
  `pri_id` int(11) NOT NULL AUTO_INCREMENT,
  `pri_name` varchar(22) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `pri_url` varchar(55) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `menu_name` varchar(22) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `rol_id` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`pri_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 34 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of privilege
-- ----------------------------
INSERT INTO `privilege` VALUES (1, '我的资料', '/Student/InfoStudentServlet', '学生管理', 3);
INSERT INTO `privilege` VALUES (2, '查询成绩', '/Student/pages/search_score.jsp', '成绩管理', 3);
INSERT INTO `privilege` VALUES (3, '查询课程', '/Student/pages/search_subject.jsp', '课程管理', 3);
INSERT INTO `privilege` VALUES (4, '同班同学', '/Student/SearchClassmatesServlet', '班级管理', 3);
INSERT INTO `privilege` VALUES (5, '我的资料', '/Student/InfoTeacherServlet', '教师管理', 2);
INSERT INTO `privilege` VALUES (6, '查找学生', '/Student/pages/search_student.jsp', '学生管理', 2);
INSERT INTO `privilege` VALUES (7, '学生成绩', '/Student/pages/search_score.jsp', '成绩管理', 2);
INSERT INTO `privilege` VALUES (8, '我的班级', '/Student/SearchTeacherClassServlet', '班级管理', 2);
INSERT INTO `privilege` VALUES (9, '我的课程', '/Student/pages/search_subject.jsp', '课程管理', 2);
INSERT INTO `privilege` VALUES (10, '添加学生', '/Student/PlanAddStudentServlet', '学生管理', 1);
INSERT INTO `privilege` VALUES (11, '查询学生', '/Student/pages/search_student.jsp', '学生管理', 1);
INSERT INTO `privilege` VALUES (12, '添加班级', '/Student/PlanAddClassesServlet', '班级管理', 1);
INSERT INTO `privilege` VALUES (13, '查询班级', '/Student/pages/search_classes.jsp', '班级管理', 1);
INSERT INTO `privilege` VALUES (14, '添加班级课程', '/Student/PlanAddCla2SubSevlet', '班级管理', 1);
INSERT INTO `privilege` VALUES (15, '查询班级课程', '/Student/pages/search_classes_subject.jsp', '班级管理', 1);
INSERT INTO `privilege` VALUES (16, '添加教师', '/Student/pages/add_teacher.jsp', '教师管理', 1);
INSERT INTO `privilege` VALUES (17, '查询教师', '/Student/pages/search_teacher.jsp', '教师管理', 1);
INSERT INTO `privilege` VALUES (18, '查询成绩', '/Student/pages/search_score.jsp', '成绩管理', 1);
INSERT INTO `privilege` VALUES (19, '添加课程', '/Student/pages/add_subject.jsp', '课程管理', 1);
INSERT INTO `privilege` VALUES (20, '查询课程', '/Student/pages/search_subject.jsp', '课程管理', 1);
INSERT INTO `privilege` VALUES (21, '添加专业', '/Student/pages/add_major.jsp', '专业管理', 1);
INSERT INTO `privilege` VALUES (22, '查询专业', '/Student/pages/search_major.jsp', '专业管理', 1);
INSERT INTO `privilege` VALUES (23, '班级课程表', '/Student/pages/export_classes_subject.jsp', '班级管理', 1);
INSERT INTO `privilege` VALUES (24, '班级课程表', '/Student/pages/export_classes_subject.jsp', '班级管理', 2);
INSERT INTO `privilege` VALUES (25, '班级课程表', '/Student/pages/export_classes_subject.jsp', '班级管理', 3);
INSERT INTO `privilege` VALUES (26, '导出班级成绩', '/Student/ReportScoreServlet', '班级管理', 2);
INSERT INTO `privilege` VALUES (27, '各科平均分', '/Student/pages/search_avg_score.jsp', '成绩管理', 3);
INSERT INTO `privilege` VALUES (28, '分数段统计', '/Student/pages/search_score_count.jsp', '成绩管理', 2);
INSERT INTO `privilege` VALUES (29, '添加教评', '/Student/PlanAddTeacherEvaluateServlet', '学生管理', 3);
INSERT INTO `privilege` VALUES (30, '查询教评', '/Student/pages/search_teacher_evaluate.jsp', '学生管理', 2);
INSERT INTO `privilege` VALUES (31, '查询排名', '/Student/pages/search_score_rank.jsp', '成绩管理', 3);
INSERT INTO `privilege` VALUES (32, '学生请假列表', '/Student/pages/search_vacation.jsp', '学生管理', 2);
INSERT INTO `privilege` VALUES (33, '学生请假', '/Student/PlanAddVacationServlet', '学生管理', 3);

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role`  (
  `rol_id` int(11) NOT NULL AUTO_INCREMENT,
  `rol_name` varchar(22) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`rol_id`) USING BTREE,
  UNIQUE INDEX `uni_name`(`rol_name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES (3, '学生');
INSERT INTO `role` VALUES (2, '教师');
INSERT INTO `role` VALUES (1, '管理员');

-- ----------------------------
-- Table structure for score
-- ----------------------------
DROP TABLE IF EXISTS `score`;
CREATE TABLE `score`  (
  `sco_id` int(11) NOT NULL AUTO_INCREMENT,
  `sco_daily` float NULL DEFAULT 0,
  `sco_exam` float NULL DEFAULT 0,
  `sco_count` float NULL DEFAULT 0,
  `stu_id` int(11) NULL DEFAULT NULL,
  `sub_id` int(11) NULL DEFAULT NULL,
  `cla2sub_id` int(11) NOT NULL,
  `cla_id` int(11) NOT NULL,
  PRIMARY KEY (`sco_id`) USING BTREE,
  UNIQUE INDEX `uni_stu_sub`(`stu_id`, `sub_id`, `cla2sub_id`) USING BTREE,
  INDEX `fk_sco_sub`(`sub_id`) USING BTREE,
  INDEX `fk_sco_stu`(`stu_id`) USING BTREE,
  INDEX `fk_sco_cla`(`cla2sub_id`) USING BTREE,
  INDEX `cla_id`(`cla_id`) USING BTREE,
  CONSTRAINT `score_ibfk_1` FOREIGN KEY (`stu_id`) REFERENCES `student` (`stu_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `score_ibfk_2` FOREIGN KEY (`sub_id`) REFERENCES `subject` (`sub_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `score_ibfk_3` FOREIGN KEY (`cla2sub_id`) REFERENCES `cla2sub` (`cla2sub_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `score_ibfk_4` FOREIGN KEY (`cla_id`) REFERENCES `classes` (`cla_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 31 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of score
-- ----------------------------
INSERT INTO `score` VALUES (1, 66, 30, 96, 1, 1, 1, 1);
INSERT INTO `score` VALUES (2, 20, 72, 92, 1, 2, 2, 1);
INSERT INTO `score` VALUES (3, 33, 64, 97, 2, 1, 1, 1);
INSERT INTO `score` VALUES (4, 28, 62, 90, 2, 2, 2, 1);
INSERT INTO `score` VALUES (5, 18, 61, 79, 3, 1, 3, 2);
INSERT INTO `score` VALUES (6, 31, 66, 97, 3, 3, 4, 2);
INSERT INTO `score` VALUES (7, 28, 60, 88, 3, 4, 5, 2);
INSERT INTO `score` VALUES (8, 33, 56, 89, 4, 1, 3, 2);
INSERT INTO `score` VALUES (9, 21, 45, 66, 4, 3, 4, 2);
INSERT INTO `score` VALUES (10, 25, 65, 90, 4, 4, 5, 2);
INSERT INTO `score` VALUES (12, 0, 0, 0, 5, 2, 7, 3);
INSERT INTO `score` VALUES (14, 30, 66, 96, 6, 2, 7, 3);
INSERT INTO `score` VALUES (15, 0, 0, 0, 7, 4, 8, 4);
INSERT INTO `score` VALUES (16, 0, 0, 0, 7, 5, 9, 4);
INSERT INTO `score` VALUES (25, 0, 0, 0, 8, 4, 8, 4);
INSERT INTO `score` VALUES (26, 0, 0, 0, 8, 5, 9, 4);
INSERT INTO `score` VALUES (27, 0, 0, 0, 9, 3, 16, 5);
INSERT INTO `score` VALUES (28, 0, 0, 0, 10, 3, 16, 5);
INSERT INTO `score` VALUES (29, 0, 0, 0, 9, 5, 17, 5);
INSERT INTO `score` VALUES (30, 0, 0, 0, 10, 5, 17, 5);

-- ----------------------------
-- Table structure for student
-- ----------------------------
DROP TABLE IF EXISTS `student`;
CREATE TABLE `student`  (
  `stu_id` int(11) NOT NULL AUTO_INCREMENT,
  `ope_id` int(11) NULL DEFAULT NULL,
  `stu_no` varchar(22) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `stu_name` varchar(22) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `stu_sex` enum('男','女') CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '男',
  `stu_birth` date NULL DEFAULT NULL,
  `stu_pic` varchar(22) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `cla_id` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`stu_id`) USING BTREE,
  UNIQUE INDEX `uni_no`(`stu_no`) USING BTREE,
  UNIQUE INDEX `uni_ope`(`ope_id`) USING BTREE,
  INDEX `fk_stu_cla`(`cla_id`) USING BTREE,
  INDEX `fk_stu_ope`(`ope_id`) USING BTREE,
  CONSTRAINT `fk_stu_cla` FOREIGN KEY (`cla_id`) REFERENCES `classes` (`cla_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_stu_ope` FOREIGN KEY (`ope_id`) REFERENCES `operator` (`ope_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of student
-- ----------------------------
INSERT INTO `student` VALUES (1, 8, '01', '陈美丽', '女', '2013-02-26', '../upload/01.jpg', 1);
INSERT INTO `student` VALUES (2, 9, '02', '王伟强', '男', '2013-11-23', '../images/person.png', 1);
INSERT INTO `student` VALUES (3, 10, '03', '蔡佳金', '女', '2013-11-19', '../images/person.png', 2);
INSERT INTO `student` VALUES (4, 11, '04', '何凤', '男', '2013-11-05', '../images/person.png', 2);
INSERT INTO `student` VALUES (5, 12, '05', '李言春', '女', '2013-11-19', '../images/person.png', 3);
INSERT INTO `student` VALUES (6, 13, '06', '董明', '男', '2013-11-03', '../images/person.png', 3);
INSERT INTO `student` VALUES (7, 14, '07', '吴小娟', '女', '2013-11-03', '../images/person.png', 4);
INSERT INTO `student` VALUES (8, 36, '08', '周建国', '男', '2013-09-06', '../images/person.png', 4);
INSERT INTO `student` VALUES (9, 38, '09', '魏坤', '女', '2013-11-19', '../images/person.png', 5);
INSERT INTO `student` VALUES (10, 39, '10', '管华山', '男', '2013-11-21', '../images/person.png', 5);

-- ----------------------------
-- Table structure for subject
-- ----------------------------
DROP TABLE IF EXISTS `subject`;
CREATE TABLE `subject`  (
  `sub_id` int(11) NOT NULL AUTO_INCREMENT,
  `sub_name` varchar(22) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sub_type` varchar(22) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sub_times` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`sub_id`) USING BTREE,
  UNIQUE INDEX `uni_name`(`sub_name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of subject
-- ----------------------------
INSERT INTO `subject` VALUES (1, 'J2SE', '必修', 108);
INSERT INTO `subject` VALUES (2, 'C语言', '必修', 108);
INSERT INTO `subject` VALUES (3, 'PhotoShop', '选修', 56);
INSERT INTO `subject` VALUES (4, 'DIV+CSS', '必修', 96);
INSERT INTO `subject` VALUES (5, '矢量图', '选修', 56);

-- ----------------------------
-- Table structure for teacher
-- ----------------------------
DROP TABLE IF EXISTS `teacher`;
CREATE TABLE `teacher`  (
  `tec_id` int(11) NOT NULL AUTO_INCREMENT,
  `ope_id` int(11) NULL DEFAULT NULL,
  `tec_name` varchar(22) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `tec_birth` date NULL DEFAULT NULL,
  `tec_sex` enum('男','女') CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '男',
  `tec_major` varchar(22) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `tec_phone` varchar(22) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`tec_id`) USING BTREE,
  UNIQUE INDEX `uni_ope`(`ope_id`) USING BTREE,
  UNIQUE INDEX `fk_tec_ope`(`ope_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of teacher
-- ----------------------------
INSERT INTO `teacher` VALUES (1, 2, '李红', '1988-04-14', '女', 'J2SE', '1234567');
INSERT INTO `teacher` VALUES (2, 3, '陈鑫', '1990-07-21', '女', 'C语言', '1234567');
INSERT INTO `teacher` VALUES (3, 4, '王伟', '2013-10-07', '男', 'DIV+CSS', '1234567');
INSERT INTO `teacher` VALUES (4, 5, '钟宁涛', '2013-10-24', '女', 'PhotoShop', '1234567');
INSERT INTO `teacher` VALUES (5, 6, '陶月敏', '1990-08-06', '男', '矢量图', '1234567');
INSERT INTO `teacher` VALUES (6, 7, '刘海', '2013-11-19', '女', 'J2SE', '1234567');
INSERT INTO `teacher` VALUES (7, 37, '钱五', '1987-11-11', '男', 'PhotoShop', '1234567');
INSERT INTO `teacher` VALUES (8, 40, '田静', '2013-10-29', '女', 'PHP', '1234576');

-- ----------------------------
-- Table structure for teacher_evaluate
-- ----------------------------
DROP TABLE IF EXISTS `teacher_evaluate`;
CREATE TABLE `teacher_evaluate`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tec_id` int(11) NULL DEFAULT NULL,
  `stu_id` int(11) NULL DEFAULT NULL,
  `evaluate` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `score1` int(10) NULL DEFAULT NULL,
  `score2` int(10) NULL DEFAULT NULL,
  `score3` int(10) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of teacher_evaluate
-- ----------------------------
INSERT INTO `teacher_evaluate` VALUES (2, 1, 1, '11111', 100, 10, 20);
INSERT INTO `teacher_evaluate` VALUES (3, 1, 3, '123123', 13, 11, 33);
INSERT INTO `teacher_evaluate` VALUES (4, 1, 7, '123123', 13, 11, 33);

-- ----------------------------
-- Table structure for vacation
-- ----------------------------
DROP TABLE IF EXISTS `vacation`;
CREATE TABLE `vacation`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tec_id` int(11) NULL DEFAULT NULL,
  `stu_id` int(11) NULL DEFAULT NULL,
  `is_approv` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `start` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `end` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of vacation
-- ----------------------------
INSERT INTO `vacation` VALUES (1, 1, 2, '0', '8:00', '12:00');
INSERT INTO `vacation` VALUES (5, 1, 1, '1', '8:00', '10:00');

-- ----------------------------
-- Triggers structure for table cla2sub
-- ----------------------------
DROP TRIGGER IF EXISTS `TG_5`;
delimiter ;;
CREATE TRIGGER `TG_5` AFTER DELETE ON `cla2sub` FOR EACH ROW BEGIN
DELETE FROM score WHERE stu_id IN (SELECT stu_id FROM student WHERE cla_id = old.cla_id ) AND sub_id = old.sub_id;
END
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table classes
-- ----------------------------
DROP TRIGGER IF EXISTS `TG_7`;
delimiter ;;
CREATE TRIGGER `TG_7` BEFORE DELETE ON `classes` FOR EACH ROW BEGIN
DELETE FROM operator WHERE ope_id IN (SELECT ope_id FROM student WHERE cla_id = old.cla_id);
END
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table major
-- ----------------------------
DROP TRIGGER IF EXISTS `TG_8`;
delimiter ;;
CREATE TRIGGER `TG_8` BEFORE DELETE ON `major` FOR EACH ROW BEGIN
DELETE FROM operator WHERE ope_id IN(SELECT ope_id FROM student WHERE cla_id IN(SELECT cla_id FROM classes WHERE maj_id = old.maj_id));
END
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table student
-- ----------------------------
DROP TRIGGER IF EXISTS `TG_3`;
delimiter ;;
CREATE TRIGGER `TG_3` AFTER DELETE ON `student` FOR EACH ROW BEGIN
DELETE FROM operator WHERE ope_id = old.ope_id;
END
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table teacher
-- ----------------------------
DROP TRIGGER IF EXISTS `TG_4`;
delimiter ;;
CREATE TRIGGER `TG_4` AFTER DELETE ON `teacher` FOR EACH ROW BEGIN
DELETE FROM operator WHERE ope_id = old.ope_id;
END
;;
delimiter ;

SET FOREIGN_KEY_CHECKS = 1;
