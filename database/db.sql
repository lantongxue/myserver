-- MySQL dump 10.13  Distrib 8.4.4, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: myserver
-- ------------------------------------------------------
-- Server version	8.4.4

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `app_sms`
--

DROP TABLE IF EXISTS `app_sms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `app_sms` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `from` varchar(11) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `content` text COLLATE utf8mb4_general_ci,
  `type` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `app` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `sender` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL COMMENT '创建时间',
  `updated_at` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='APP短信验证码';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_sms`
--

LOCK TABLES `app_sms` WRITE;
/*!40000 ALTER TABLE `app_sms` DISABLE KEYS */;
/*!40000 ALTER TABLE `app_sms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app_sms_token`
--

DROP TABLE IF EXISTS `app_sms_token`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `app_sms_token` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `token` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `ua` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `mobile` varchar(11) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL COMMENT '创建时间',
  `updated_at` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='APP短信验证码授权';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_sms_token`
--

LOCK TABLES `app_sms_token` WRITE;
/*!40000 ALTER TABLE `app_sms_token` DISABLE KEYS */;
/*!40000 ALTER TABLE `app_sms_token` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `phinxlog`
--

DROP TABLE IF EXISTS `phinxlog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `phinxlog` (
  `version` bigint NOT NULL,
  `migration_name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `start_time` timestamp NULL DEFAULT NULL,
  `end_time` timestamp NULL DEFAULT NULL,
  `breakpoint` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `phinxlog`
--

LOCK TABLES `phinxlog` WRITE;
/*!40000 ALTER TABLE `phinxlog` DISABLE KEYS */;
INSERT INTO `phinxlog` VALUES (20250418070232,'AppSms','2025-04-18 09:58:30','2025-04-18 09:58:30',0),(20250418072358,'AppSmsToken','2025-04-18 09:58:30','2025-04-18 09:58:30',0),(20250418072732,'WaAdminRoles','2025-04-18 09:58:30','2025-04-18 09:58:30',0),(20250418072848,'WaAdmins','2025-04-18 09:58:30','2025-04-18 09:58:30',0),(20250418073859,'WaOptions','2025-04-18 09:58:30','2025-04-18 09:58:30',0),(20250418074402,'WaRoles','2025-04-18 09:58:30','2025-04-18 09:58:31',0),(20250418074707,'WaRules','2025-04-18 09:58:31','2025-04-18 09:58:31',0),(20250418074922,'WaUploads','2025-04-18 09:58:31','2025-04-18 09:58:31',0),(20250418075424,'WaUsers','2025-04-18 09:58:31','2025-04-18 09:58:31',0);
/*!40000 ALTER TABLE `phinxlog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wa_admin_roles`
--

DROP TABLE IF EXISTS `wa_admin_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wa_admin_roles` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `role_id` int DEFAULT NULL COMMENT '角色id',
  `admin_id` int DEFAULT NULL COMMENT '管理员id',
  PRIMARY KEY (`id`),
  UNIQUE KEY `role_admin_id` (`role_id`,`admin_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='管理员角色表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wa_admin_roles`
--

LOCK TABLES `wa_admin_roles` WRITE;
/*!40000 ALTER TABLE `wa_admin_roles` DISABLE KEYS */;
INSERT INTO `wa_admin_roles` VALUES (1,1,1);
/*!40000 ALTER TABLE `wa_admin_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wa_admins`
--

DROP TABLE IF EXISTS `wa_admins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wa_admins` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(32) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '用户名',
  `nickname` varchar(40) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '昵称',
  `password` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '密码',
  `avatar` varchar(255) COLLATE utf8mb4_general_ci DEFAULT '/app/admin/avatar.png' COMMENT '头像',
  `email` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '邮箱',
  `mobile` varchar(16) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '手机',
  `status` tinyint DEFAULT NULL COMMENT '禁用',
  `login_at` datetime DEFAULT NULL COMMENT '登录时间',
  `created_at` datetime DEFAULT NULL COMMENT '创建时间',
  `updated_at` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='管理员表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wa_admins`
--

LOCK TABLES `wa_admins` WRITE;
/*!40000 ALTER TABLE `wa_admins` DISABLE KEYS */;
INSERT INTO `wa_admins` VALUES (1,'admin','超级管理员','$2y$12$42YVLih66nbBjkfoP75vxOjU/YqI1KDexWdudwhUrbWZSxw6PEoqu','/app/admin/avatar.png',NULL,NULL,NULL,NULL,'2025-04-03 17:33:41','2025-04-08 15:20:14');
/*!40000 ALTER TABLE `wa_admins` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wa_options`
--

DROP TABLE IF EXISTS `wa_options`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wa_options` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '键',
  `value` longtext COLLATE utf8mb4_general_ci COMMENT '值',
  `created_at` datetime DEFAULT NULL COMMENT '创建时间',
  `updated_at` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='选项表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wa_options`
--

LOCK TABLES `wa_options` WRITE;
/*!40000 ALTER TABLE `wa_options` DISABLE KEYS */;
INSERT INTO `wa_options` VALUES (1,'system_config','{\"logo\":{\"title\":\"Webman Admin\",\"image\":\"\\/app\\/admin\\/admin\\/images\\/logo.png\"},\"menu\":{\"data\":\"\\/app\\/admin\\/rule\\/get\",\"method\":\"GET\",\"accordion\":true,\"collapse\":false,\"control\":false,\"controlWidth\":500,\"select\":\"0\",\"async\":true},\"tab\":{\"enable\":true,\"keepState\":true,\"preload\":false,\"session\":true,\"max\":\"30\",\"index\":{\"id\":\"0\",\"href\":\"\\/app\\/admin\\/index\\/dashboard\",\"title\":\"\\u4eea\\u8868\\u76d8\"}},\"theme\":{\"defaultColor\":\"2\",\"defaultMenu\":\"light-theme\",\"defaultHeader\":\"light-theme\",\"allowCustom\":true,\"banner\":false},\"colors\":[{\"id\":\"1\",\"color\":\"#36b368\",\"second\":\"#f0f9eb\"},{\"id\":\"2\",\"color\":\"#2d8cf0\",\"second\":\"#ecf5ff\"},{\"id\":\"3\",\"color\":\"#f6ad55\",\"second\":\"#fdf6ec\"},{\"id\":\"4\",\"color\":\"#f56c6c\",\"second\":\"#fef0f0\"},{\"id\":\"5\",\"color\":\"#3963bc\",\"second\":\"#ecf5ff\"}],\"other\":{\"keepLoad\":\"500\",\"autoHead\":false,\"footer\":false},\"header\":{\"message\":false}}','2022-12-05 14:49:01','2022-12-08 20:20:28'),(2,'table_form_schema_wa_users','{\"id\":{\"field\":\"id\",\"_field_id\":\"0\",\"comment\":\"主键\",\"control\":\"inputNumber\",\"control_args\":\"\",\"list_show\":true,\"enable_sort\":true,\"searchable\":true,\"search_type\":\"normal\",\"form_show\":false},\"username\":{\"field\":\"username\",\"_field_id\":\"1\",\"comment\":\"用户名\",\"control\":\"input\",\"control_args\":\"\",\"form_show\":true,\"list_show\":true,\"searchable\":true,\"search_type\":\"normal\",\"enable_sort\":false},\"nickname\":{\"field\":\"nickname\",\"_field_id\":\"2\",\"comment\":\"昵称\",\"control\":\"input\",\"control_args\":\"\",\"form_show\":true,\"list_show\":true,\"searchable\":true,\"search_type\":\"normal\",\"enable_sort\":false},\"password\":{\"field\":\"password\",\"_field_id\":\"3\",\"comment\":\"密码\",\"control\":\"input\",\"control_args\":\"\",\"form_show\":true,\"search_type\":\"normal\",\"list_show\":false,\"enable_sort\":false,\"searchable\":false},\"sex\":{\"field\":\"sex\",\"_field_id\":\"4\",\"comment\":\"性别\",\"control\":\"select\",\"control_args\":\"url:\\/app\\/admin\\/dict\\/get\\/sex\",\"form_show\":true,\"list_show\":true,\"searchable\":true,\"search_type\":\"normal\",\"enable_sort\":false},\"avatar\":{\"field\":\"avatar\",\"_field_id\":\"5\",\"comment\":\"头像\",\"control\":\"uploadImage\",\"control_args\":\"url:\\/app\\/admin\\/upload\\/avatar\",\"form_show\":true,\"list_show\":true,\"search_type\":\"normal\",\"enable_sort\":false,\"searchable\":false},\"email\":{\"field\":\"email\",\"_field_id\":\"6\",\"comment\":\"邮箱\",\"control\":\"input\",\"control_args\":\"\",\"form_show\":true,\"list_show\":true,\"searchable\":true,\"search_type\":\"normal\",\"enable_sort\":false},\"mobile\":{\"field\":\"mobile\",\"_field_id\":\"7\",\"comment\":\"手机\",\"control\":\"input\",\"control_args\":\"\",\"form_show\":true,\"list_show\":true,\"searchable\":true,\"search_type\":\"normal\",\"enable_sort\":false},\"level\":{\"field\":\"level\",\"_field_id\":\"8\",\"comment\":\"等级\",\"control\":\"inputNumber\",\"control_args\":\"\",\"form_show\":true,\"searchable\":true,\"search_type\":\"normal\",\"list_show\":false,\"enable_sort\":false},\"birthday\":{\"field\":\"birthday\",\"_field_id\":\"9\",\"comment\":\"生日\",\"control\":\"datePicker\",\"control_args\":\"\",\"form_show\":true,\"searchable\":true,\"search_type\":\"between\",\"list_show\":false,\"enable_sort\":false},\"money\":{\"field\":\"money\",\"_field_id\":\"10\",\"comment\":\"余额(元)\",\"control\":\"inputNumber\",\"control_args\":\"\",\"form_show\":true,\"searchable\":true,\"search_type\":\"normal\",\"list_show\":false,\"enable_sort\":false},\"score\":{\"field\":\"score\",\"_field_id\":\"11\",\"comment\":\"积分\",\"control\":\"inputNumber\",\"control_args\":\"\",\"form_show\":true,\"searchable\":true,\"search_type\":\"normal\",\"list_show\":false,\"enable_sort\":false},\"last_time\":{\"field\":\"last_time\",\"_field_id\":\"12\",\"comment\":\"登录时间\",\"control\":\"dateTimePicker\",\"control_args\":\"\",\"form_show\":true,\"searchable\":true,\"search_type\":\"between\",\"list_show\":false,\"enable_sort\":false},\"last_ip\":{\"field\":\"last_ip\",\"_field_id\":\"13\",\"comment\":\"登录ip\",\"control\":\"input\",\"control_args\":\"\",\"form_show\":true,\"searchable\":true,\"search_type\":\"normal\",\"list_show\":false,\"enable_sort\":false},\"join_time\":{\"field\":\"join_time\",\"_field_id\":\"14\",\"comment\":\"注册时间\",\"control\":\"dateTimePicker\",\"control_args\":\"\",\"form_show\":true,\"searchable\":true,\"search_type\":\"between\",\"list_show\":false,\"enable_sort\":false},\"join_ip\":{\"field\":\"join_ip\",\"_field_id\":\"15\",\"comment\":\"注册ip\",\"control\":\"input\",\"control_args\":\"\",\"form_show\":true,\"searchable\":true,\"search_type\":\"normal\",\"list_show\":false,\"enable_sort\":false},\"token\":{\"field\":\"token\",\"_field_id\":\"16\",\"comment\":\"token\",\"control\":\"input\",\"control_args\":\"\",\"search_type\":\"normal\",\"form_show\":false,\"list_show\":false,\"enable_sort\":false,\"searchable\":false},\"created_at\":{\"field\":\"created_at\",\"_field_id\":\"17\",\"comment\":\"创建时间\",\"control\":\"dateTimePicker\",\"control_args\":\"\",\"form_show\":true,\"search_type\":\"between\",\"list_show\":false,\"enable_sort\":false,\"searchable\":false},\"updated_at\":{\"field\":\"updated_at\",\"_field_id\":\"18\",\"comment\":\"更新时间\",\"control\":\"dateTimePicker\",\"control_args\":\"\",\"search_type\":\"between\",\"form_show\":false,\"list_show\":false,\"enable_sort\":false,\"searchable\":false},\"role\":{\"field\":\"role\",\"_field_id\":\"19\",\"comment\":\"角色\",\"control\":\"inputNumber\",\"control_args\":\"\",\"search_type\":\"normal\",\"form_show\":false,\"list_show\":false,\"enable_sort\":false,\"searchable\":false},\"status\":{\"field\":\"status\",\"_field_id\":\"20\",\"comment\":\"禁用\",\"control\":\"switch\",\"control_args\":\"\",\"form_show\":true,\"list_show\":true,\"search_type\":\"normal\",\"enable_sort\":false,\"searchable\":false}}','2022-08-15 00:00:00','2022-12-23 15:28:13'),(3,'table_form_schema_wa_roles','{\"id\":{\"field\":\"id\",\"_field_id\":\"0\",\"comment\":\"主键\",\"control\":\"inputNumber\",\"control_args\":\"\",\"list_show\":true,\"search_type\":\"normal\",\"form_show\":false,\"enable_sort\":false,\"searchable\":false},\"name\":{\"field\":\"name\",\"_field_id\":\"1\",\"comment\":\"角色组\",\"control\":\"input\",\"control_args\":\"\",\"form_show\":true,\"list_show\":true,\"search_type\":\"normal\",\"enable_sort\":false,\"searchable\":false},\"rules\":{\"field\":\"rules\",\"_field_id\":\"2\",\"comment\":\"权限\",\"control\":\"treeSelectMulti\",\"control_args\":\"url:\\/app\\/admin\\/rule\\/get?type=0,1,2\",\"form_show\":true,\"list_show\":true,\"search_type\":\"normal\",\"enable_sort\":false,\"searchable\":false},\"created_at\":{\"field\":\"created_at\",\"_field_id\":\"3\",\"comment\":\"创建时间\",\"control\":\"dateTimePicker\",\"control_args\":\"\",\"search_type\":\"normal\",\"form_show\":false,\"list_show\":false,\"enable_sort\":false,\"searchable\":false},\"updated_at\":{\"field\":\"updated_at\",\"_field_id\":\"4\",\"comment\":\"更新时间\",\"control\":\"dateTimePicker\",\"control_args\":\"\",\"search_type\":\"normal\",\"form_show\":false,\"list_show\":false,\"enable_sort\":false,\"searchable\":false},\"pid\":{\"field\":\"pid\",\"_field_id\":\"5\",\"comment\":\"父级\",\"control\":\"select\",\"control_args\":\"url:\\/app\\/admin\\/role\\/select?format=tree\",\"form_show\":true,\"list_show\":true,\"search_type\":\"normal\",\"enable_sort\":false,\"searchable\":false}}','2022-08-15 00:00:00','2022-12-19 14:24:25'),(4,'table_form_schema_wa_rules','{\"id\":{\"field\":\"id\",\"_field_id\":\"0\",\"comment\":\"主键\",\"control\":\"inputNumber\",\"control_args\":\"\",\"search_type\":\"normal\",\"form_show\":false,\"list_show\":false,\"enable_sort\":false,\"searchable\":false},\"title\":{\"field\":\"title\",\"_field_id\":\"1\",\"comment\":\"标题\",\"control\":\"input\",\"control_args\":\"\",\"form_show\":true,\"list_show\":true,\"searchable\":true,\"search_type\":\"normal\",\"enable_sort\":false},\"icon\":{\"field\":\"icon\",\"_field_id\":\"2\",\"comment\":\"图标\",\"control\":\"iconPicker\",\"control_args\":\"\",\"form_show\":true,\"list_show\":true,\"search_type\":\"normal\",\"enable_sort\":false,\"searchable\":false},\"key\":{\"field\":\"key\",\"_field_id\":\"3\",\"comment\":\"标识\",\"control\":\"input\",\"control_args\":\"\",\"form_show\":true,\"list_show\":true,\"searchable\":true,\"search_type\":\"normal\",\"enable_sort\":false},\"pid\":{\"field\":\"pid\",\"_field_id\":\"4\",\"comment\":\"上级菜单\",\"control\":\"treeSelect\",\"control_args\":\"\\/app\\/admin\\/rule\\/select?format=tree&type=0,1\",\"form_show\":true,\"list_show\":true,\"search_type\":\"normal\",\"enable_sort\":false,\"searchable\":false},\"created_at\":{\"field\":\"created_at\",\"_field_id\":\"5\",\"comment\":\"创建时间\",\"control\":\"dateTimePicker\",\"control_args\":\"\",\"search_type\":\"normal\",\"form_show\":false,\"list_show\":false,\"enable_sort\":false,\"searchable\":false},\"updated_at\":{\"field\":\"updated_at\",\"_field_id\":\"6\",\"comment\":\"更新时间\",\"control\":\"dateTimePicker\",\"control_args\":\"\",\"search_type\":\"normal\",\"form_show\":false,\"list_show\":false,\"enable_sort\":false,\"searchable\":false},\"href\":{\"field\":\"href\",\"_field_id\":\"7\",\"comment\":\"url\",\"control\":\"input\",\"control_args\":\"\",\"form_show\":true,\"list_show\":true,\"search_type\":\"normal\",\"enable_sort\":false,\"searchable\":false},\"type\":{\"field\":\"type\",\"_field_id\":\"8\",\"comment\":\"类型\",\"control\":\"select\",\"control_args\":\"data:0:目录,1:菜单,2:权限\",\"form_show\":true,\"list_show\":true,\"searchable\":true,\"search_type\":\"normal\",\"enable_sort\":false},\"weight\":{\"field\":\"weight\",\"_field_id\":\"9\",\"comment\":\"排序\",\"control\":\"inputNumber\",\"control_args\":\"\",\"form_show\":true,\"list_show\":true,\"search_type\":\"normal\",\"enable_sort\":false,\"searchable\":false}}','2022-08-15 00:00:00','2022-12-08 11:44:45'),(5,'table_form_schema_wa_admins','{\"id\":{\"field\":\"id\",\"_field_id\":\"0\",\"comment\":\"ID\",\"control\":\"inputNumber\",\"control_args\":\"\",\"list_show\":true,\"enable_sort\":true,\"search_type\":\"between\",\"form_show\":false,\"searchable\":false},\"username\":{\"field\":\"username\",\"_field_id\":\"1\",\"comment\":\"用户名\",\"control\":\"input\",\"control_args\":\"\",\"form_show\":true,\"list_show\":true,\"searchable\":true,\"search_type\":\"normal\",\"enable_sort\":false},\"nickname\":{\"field\":\"nickname\",\"_field_id\":\"2\",\"comment\":\"昵称\",\"control\":\"input\",\"control_args\":\"\",\"form_show\":true,\"list_show\":true,\"searchable\":true,\"search_type\":\"normal\",\"enable_sort\":false},\"password\":{\"field\":\"password\",\"_field_id\":\"3\",\"comment\":\"密码\",\"control\":\"input\",\"control_args\":\"\",\"form_show\":true,\"search_type\":\"normal\",\"list_show\":false,\"enable_sort\":false,\"searchable\":false},\"avatar\":{\"field\":\"avatar\",\"_field_id\":\"4\",\"comment\":\"头像\",\"control\":\"uploadImage\",\"control_args\":\"url:\\/app\\/admin\\/upload\\/avatar\",\"form_show\":true,\"list_show\":true,\"search_type\":\"normal\",\"enable_sort\":false,\"searchable\":false},\"email\":{\"field\":\"email\",\"_field_id\":\"5\",\"comment\":\"邮箱\",\"control\":\"input\",\"control_args\":\"\",\"form_show\":true,\"list_show\":true,\"searchable\":true,\"search_type\":\"normal\",\"enable_sort\":false},\"mobile\":{\"field\":\"mobile\",\"_field_id\":\"6\",\"comment\":\"手机\",\"control\":\"input\",\"control_args\":\"\",\"form_show\":true,\"list_show\":true,\"searchable\":true,\"search_type\":\"normal\",\"enable_sort\":false},\"created_at\":{\"field\":\"created_at\",\"_field_id\":\"7\",\"comment\":\"创建时间\",\"control\":\"dateTimePicker\",\"control_args\":\"\",\"form_show\":true,\"searchable\":true,\"search_type\":\"between\",\"list_show\":false,\"enable_sort\":false},\"updated_at\":{\"field\":\"updated_at\",\"_field_id\":\"8\",\"comment\":\"更新时间\",\"control\":\"dateTimePicker\",\"control_args\":\"\",\"form_show\":true,\"search_type\":\"normal\",\"list_show\":false,\"enable_sort\":false,\"searchable\":false},\"login_at\":{\"field\":\"login_at\",\"_field_id\":\"9\",\"comment\":\"登录时间\",\"control\":\"dateTimePicker\",\"control_args\":\"\",\"form_show\":true,\"list_show\":true,\"search_type\":\"between\",\"enable_sort\":false,\"searchable\":false},\"status\":{\"field\":\"status\",\"_field_id\":\"10\",\"comment\":\"禁用\",\"control\":\"switch\",\"control_args\":\"\",\"form_show\":true,\"list_show\":true,\"search_type\":\"normal\",\"enable_sort\":false,\"searchable\":false}}','2022-08-15 00:00:00','2022-12-23 15:36:48'),(6,'table_form_schema_wa_options','{\"id\":{\"field\":\"id\",\"_field_id\":\"0\",\"comment\":\"\",\"control\":\"inputNumber\",\"control_args\":\"\",\"list_show\":true,\"search_type\":\"normal\",\"form_show\":false,\"enable_sort\":false,\"searchable\":false},\"name\":{\"field\":\"name\",\"_field_id\":\"1\",\"comment\":\"键\",\"control\":\"input\",\"control_args\":\"\",\"form_show\":true,\"list_show\":true,\"search_type\":\"normal\",\"enable_sort\":false,\"searchable\":false},\"value\":{\"field\":\"value\",\"_field_id\":\"2\",\"comment\":\"值\",\"control\":\"textArea\",\"control_args\":\"\",\"form_show\":true,\"list_show\":true,\"search_type\":\"normal\",\"enable_sort\":false,\"searchable\":false},\"created_at\":{\"field\":\"created_at\",\"_field_id\":\"3\",\"comment\":\"创建时间\",\"control\":\"dateTimePicker\",\"control_args\":\"\",\"search_type\":\"normal\",\"form_show\":false,\"list_show\":false,\"enable_sort\":false,\"searchable\":false},\"updated_at\":{\"field\":\"updated_at\",\"_field_id\":\"4\",\"comment\":\"更新时间\",\"control\":\"dateTimePicker\",\"control_args\":\"\",\"search_type\":\"normal\",\"form_show\":false,\"list_show\":false,\"enable_sort\":false,\"searchable\":false}}','2022-08-15 00:00:00','2022-12-08 11:36:57'),(7,'table_form_schema_wa_uploads','{\"id\":{\"field\":\"id\",\"_field_id\":\"0\",\"comment\":\"主键\",\"control\":\"inputNumber\",\"control_args\":\"\",\"list_show\":true,\"enable_sort\":true,\"search_type\":\"normal\",\"form_show\":false,\"searchable\":false},\"name\":{\"field\":\"name\",\"_field_id\":\"1\",\"comment\":\"名称\",\"control\":\"input\",\"control_args\":\"\",\"list_show\":true,\"searchable\":true,\"search_type\":\"normal\",\"form_show\":false,\"enable_sort\":false},\"url\":{\"field\":\"url\",\"_field_id\":\"2\",\"comment\":\"文件\",\"control\":\"upload\",\"control_args\":\"url:\\/app\\/admin\\/upload\\/file\",\"form_show\":true,\"list_show\":true,\"search_type\":\"normal\",\"enable_sort\":false,\"searchable\":false},\"admin_id\":{\"field\":\"admin_id\",\"_field_id\":\"3\",\"comment\":\"管理员\",\"control\":\"select\",\"control_args\":\"url:\\/app\\/admin\\/admin\\/select?format=select\",\"search_type\":\"normal\",\"form_show\":false,\"list_show\":false,\"enable_sort\":false,\"searchable\":false},\"file_size\":{\"field\":\"file_size\",\"_field_id\":\"4\",\"comment\":\"文件大小\",\"control\":\"inputNumber\",\"control_args\":\"\",\"list_show\":true,\"search_type\":\"between\",\"form_show\":false,\"enable_sort\":false,\"searchable\":false},\"mime_type\":{\"field\":\"mime_type\",\"_field_id\":\"5\",\"comment\":\"mime类型\",\"control\":\"input\",\"control_args\":\"\",\"list_show\":true,\"search_type\":\"normal\",\"form_show\":false,\"enable_sort\":false,\"searchable\":false},\"image_width\":{\"field\":\"image_width\",\"_field_id\":\"6\",\"comment\":\"图片宽度\",\"control\":\"inputNumber\",\"control_args\":\"\",\"list_show\":true,\"search_type\":\"normal\",\"form_show\":false,\"enable_sort\":false,\"searchable\":false},\"image_height\":{\"field\":\"image_height\",\"_field_id\":\"7\",\"comment\":\"图片高度\",\"control\":\"inputNumber\",\"control_args\":\"\",\"list_show\":true,\"search_type\":\"normal\",\"form_show\":false,\"enable_sort\":false,\"searchable\":false},\"ext\":{\"field\":\"ext\",\"_field_id\":\"8\",\"comment\":\"扩展名\",\"control\":\"input\",\"control_args\":\"\",\"list_show\":true,\"searchable\":true,\"search_type\":\"normal\",\"form_show\":false,\"enable_sort\":false},\"storage\":{\"field\":\"storage\",\"_field_id\":\"9\",\"comment\":\"存储位置\",\"control\":\"input\",\"control_args\":\"\",\"search_type\":\"normal\",\"form_show\":false,\"list_show\":false,\"enable_sort\":false,\"searchable\":false},\"created_at\":{\"field\":\"created_at\",\"_field_id\":\"10\",\"comment\":\"上传时间\",\"control\":\"dateTimePicker\",\"control_args\":\"\",\"searchable\":true,\"search_type\":\"between\",\"form_show\":false,\"list_show\":false,\"enable_sort\":false},\"category\":{\"field\":\"category\",\"_field_id\":\"11\",\"comment\":\"类别\",\"control\":\"select\",\"control_args\":\"url:\\/app\\/admin\\/dict\\/get\\/upload\",\"form_show\":true,\"list_show\":true,\"searchable\":true,\"search_type\":\"normal\",\"enable_sort\":false},\"updated_at\":{\"field\":\"updated_at\",\"_field_id\":\"12\",\"comment\":\"更新时间\",\"control\":\"dateTimePicker\",\"control_args\":\"\",\"form_show\":true,\"list_show\":true,\"search_type\":\"normal\",\"enable_sort\":false,\"searchable\":false}}','2022-08-15 00:00:00','2022-12-08 11:47:45'),(8,'table_form_schema_wa_uploads','{\"id\":{\"field\":\"id\",\"_field_id\":\"0\",\"comment\":\"主键\",\"control\":\"inputNumber\",\"control_args\":\"\",\"list_show\":true,\"enable_sort\":true,\"search_type\":\"normal\",\"form_show\":false,\"searchable\":false},\"name\":{\"field\":\"name\",\"_field_id\":\"1\",\"comment\":\"名称\",\"control\":\"input\",\"control_args\":\"\",\"list_show\":true,\"searchable\":true,\"search_type\":\"normal\",\"form_show\":false,\"enable_sort\":false},\"url\":{\"field\":\"url\",\"_field_id\":\"2\",\"comment\":\"文件\",\"control\":\"upload\",\"control_args\":\"url:\\/app\\/admin\\/upload\\/file\",\"form_show\":true,\"list_show\":true,\"search_type\":\"normal\",\"enable_sort\":false,\"searchable\":false},\"admin_id\":{\"field\":\"admin_id\",\"_field_id\":\"3\",\"comment\":\"管理员\",\"control\":\"select\",\"control_args\":\"url:\\/app\\/admin\\/admin\\/select?format=select\",\"search_type\":\"normal\",\"form_show\":false,\"list_show\":false,\"enable_sort\":false,\"searchable\":false},\"file_size\":{\"field\":\"file_size\",\"_field_id\":\"4\",\"comment\":\"文件大小\",\"control\":\"inputNumber\",\"control_args\":\"\",\"list_show\":true,\"search_type\":\"between\",\"form_show\":false,\"enable_sort\":false,\"searchable\":false},\"mime_type\":{\"field\":\"mime_type\",\"_field_id\":\"5\",\"comment\":\"mime类型\",\"control\":\"input\",\"control_args\":\"\",\"list_show\":true,\"search_type\":\"normal\",\"form_show\":false,\"enable_sort\":false,\"searchable\":false},\"image_width\":{\"field\":\"image_width\",\"_field_id\":\"6\",\"comment\":\"图片宽度\",\"control\":\"inputNumber\",\"control_args\":\"\",\"list_show\":true,\"search_type\":\"normal\",\"form_show\":false,\"enable_sort\":false,\"searchable\":false},\"image_height\":{\"field\":\"image_height\",\"_field_id\":\"7\",\"comment\":\"图片高度\",\"control\":\"inputNumber\",\"control_args\":\"\",\"list_show\":true,\"search_type\":\"normal\",\"form_show\":false,\"enable_sort\":false,\"searchable\":false},\"ext\":{\"field\":\"ext\",\"_field_id\":\"8\",\"comment\":\"扩展名\",\"control\":\"input\",\"control_args\":\"\",\"list_show\":true,\"searchable\":true,\"search_type\":\"normal\",\"form_show\":false,\"enable_sort\":false},\"storage\":{\"field\":\"storage\",\"_field_id\":\"9\",\"comment\":\"存储位置\",\"control\":\"input\",\"control_args\":\"\",\"search_type\":\"normal\",\"form_show\":false,\"list_show\":false,\"enable_sort\":false,\"searchable\":false},\"created_at\":{\"field\":\"created_at\",\"_field_id\":\"10\",\"comment\":\"上传时间\",\"control\":\"dateTimePicker\",\"control_args\":\"\",\"searchable\":true,\"search_type\":\"between\",\"form_show\":false,\"list_show\":false,\"enable_sort\":false},\"category\":{\"field\":\"category\",\"_field_id\":\"11\",\"comment\":\"类别\",\"control\":\"select\",\"control_args\":\"url:\\/app\\/admin\\/dict\\/get\\/upload\",\"form_show\":true,\"list_show\":true,\"searchable\":true,\"search_type\":\"normal\",\"enable_sort\":false},\"updated_at\":{\"field\":\"updated_at\",\"_field_id\":\"12\",\"comment\":\"更新时间\",\"control\":\"dateTimePicker\",\"control_args\":\"\",\"form_show\":true,\"list_show\":true,\"search_type\":\"normal\",\"enable_sort\":false,\"searchable\":false}}','2022-08-15 00:00:00','2022-12-08 11:47:45'),(9,'dict_upload','[{\"value\":\"1\",\"name\":\"分类1\"},{\"value\":\"2\",\"name\":\"分类2\"},{\"value\":\"3\",\"name\":\"分类3\"}]','2022-12-04 16:24:13','2022-12-04 16:24:13'),(10,'dict_sex','[{\"value\":\"0\",\"name\":\"女\"},{\"value\":\"1\",\"name\":\"男\"}]','2022-12-04 15:04:40','2022-12-04 15:04:40'),(11,'dict_status','[{\"value\":\"0\",\"name\":\"正常\"},{\"value\":\"1\",\"name\":\"禁用\"}]','2022-12-04 15:05:09','2022-12-04 15:05:09'),(17,'table_form_schema_wa_admin_roles','{\"id\":{\"field\":\"id\",\"_field_id\":\"0\",\"comment\":\"主键\",\"control\":\"inputNumber\",\"control_args\":\"\",\"list_show\":true,\"enable_sort\":true,\"searchable\":true,\"search_type\":\"normal\",\"form_show\":false},\"role_id\":{\"field\":\"role_id\",\"_field_id\":\"1\",\"comment\":\"角色id\",\"control\":\"inputNumber\",\"control_args\":\"\",\"form_show\":true,\"list_show\":true,\"search_type\":\"normal\",\"enable_sort\":false,\"searchable\":false},\"admin_id\":{\"field\":\"admin_id\",\"_field_id\":\"2\",\"comment\":\"管理员id\",\"control\":\"inputNumber\",\"control_args\":\"\",\"form_show\":true,\"list_show\":true,\"search_type\":\"normal\",\"enable_sort\":false,\"searchable\":false}}','2022-08-15 00:00:00','2022-12-20 19:42:51'),(18,'dict_dict_name','[{\"value\":\"dict_name\",\"name\":\"字典名称\"},{\"value\":\"status\",\"name\":\"启禁用状态\"},{\"value\":\"sex\",\"name\":\"性别\"},{\"value\":\"upload\",\"name\":\"附件分类\"}]','2022-08-15 00:00:00','2022-12-20 19:42:51'),(19,'table_form_schema_app_sms','{\"id\":{\"field\":\"id\",\"_field_id\":\"0\",\"comment\":\"主键\",\"control\":\"inputNumber\",\"control_args\":\"\",\"list_show\":true,\"enable_sort\":true,\"search_type\":\"normal\",\"form_show\":false,\"searchable\":false},\"created_at\":{\"field\":\"created_at\",\"_field_id\":\"1\",\"comment\":\"创建时间\",\"control\":\"dateTimePicker\",\"control_args\":\"\",\"list_show\":true,\"enable_sort\":true,\"searchable\":true,\"search_type\":\"between\",\"form_show\":false},\"updated_at\":{\"field\":\"updated_at\",\"_field_id\":\"2\",\"comment\":\"更新时间\",\"control\":\"dateTimePicker\",\"control_args\":\"\",\"list_show\":true,\"search_type\":\"between\",\"form_show\":false,\"enable_sort\":false,\"searchable\":false},\"from\":{\"field\":\"from\",\"_field_id\":\"3\",\"comment\":\"手机号\",\"control\":\"inputNumber\",\"control_args\":\"\",\"form_show\":true,\"list_show\":true,\"searchable\":true,\"search_type\":\"normal\",\"enable_sort\":false},\"content\":{\"field\":\"content\",\"_field_id\":\"4\",\"comment\":\"内容\",\"control\":\"input\",\"control_args\":\"\",\"form_show\":true,\"list_show\":true,\"search_type\":\"normal\",\"enable_sort\":false,\"searchable\":false},\"type\":{\"field\":\"type\",\"_field_id\":\"5\",\"comment\":\"短信类型\",\"control\":\"select\",\"control_args\":\"url:\\/app\\/admin\\/app-sms\\/selectType\",\"form_show\":true,\"list_show\":true,\"searchable\":true,\"search_type\":\"normal\",\"enable_sort\":false},\"app\":{\"field\":\"app\",\"_field_id\":\"6\",\"comment\":\"对应APP\",\"control\":\"select\",\"control_args\":\"url:\\/app\\/admin\\/app-sms\\/selectApp\",\"form_show\":true,\"list_show\":true,\"searchable\":true,\"search_type\":\"normal\",\"enable_sort\":false},\"sender\":{\"field\":\"sender\",\"_field_id\":\"7\",\"comment\":\"发送人\",\"control\":\"input\",\"control_args\":\"\",\"form_show\":true,\"list_show\":true,\"search_type\":\"normal\",\"enable_sort\":false,\"searchable\":false}}','2022-08-15 00:00:00','2025-04-11 11:47:48'),(20,'table_form_schema_app_sms_token','{\"id\":{\"field\":\"id\",\"_field_id\":\"0\",\"comment\":\"主键\",\"control\":\"inputNumber\",\"control_args\":\"\",\"list_show\":true,\"enable_sort\":true,\"search_type\":\"normal\",\"form_show\":false,\"searchable\":false},\"created_at\":{\"field\":\"created_at\",\"_field_id\":\"1\",\"comment\":\"创建时间\",\"control\":\"dateTimePicker\",\"control_args\":\"\",\"list_show\":true,\"enable_sort\":true,\"search_type\":\"between\",\"form_show\":false,\"searchable\":false},\"updated_at\":{\"field\":\"updated_at\",\"_field_id\":\"2\",\"comment\":\"更新时间\",\"control\":\"dateTimePicker\",\"control_args\":\"\",\"list_show\":true,\"search_type\":\"between\",\"form_show\":false,\"enable_sort\":false,\"searchable\":false},\"token\":{\"field\":\"token\",\"_field_id\":\"3\",\"comment\":\"\",\"control\":\"input\",\"control_args\":\"\",\"list_show\":true,\"searchable\":true,\"search_type\":\"normal\",\"form_show\":false,\"enable_sort\":false},\"ua\":{\"field\":\"ua\",\"_field_id\":\"4\",\"comment\":\"\",\"control\":\"input\",\"control_args\":\"\",\"form_show\":true,\"list_show\":true,\"searchable\":true,\"search_type\":\"normal\",\"enable_sort\":false},\"mobile\":{\"field\":\"mobile\",\"_field_id\":\"5\",\"comment\":\"\",\"control\":\"input\",\"control_args\":\"\",\"form_show\":true,\"list_show\":true,\"searchable\":true,\"search_type\":\"normal\",\"enable_sort\":false}}','2022-08-15 00:00:00','2025-04-08 10:29:50');
/*!40000 ALTER TABLE `wa_options` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wa_roles`
--

DROP TABLE IF EXISTS `wa_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wa_roles` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(80) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '角色组',
  `rules` text COLLATE utf8mb4_general_ci COMMENT '权限',
  `pid` int unsigned DEFAULT NULL COMMENT '父级',
  `created_at` datetime DEFAULT NULL COMMENT '创建时间',
  `updated_at` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='管理员角色';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wa_roles`
--

LOCK TABLES `wa_roles` WRITE;
/*!40000 ALTER TABLE `wa_roles` DISABLE KEYS */;
INSERT INTO `wa_roles` VALUES (1,'超级管理员','*',NULL,'2022-08-13 16:15:01','2022-12-23 12:05:07');
/*!40000 ALTER TABLE `wa_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wa_rules`
--

DROP TABLE IF EXISTS `wa_rules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wa_rules` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '标题',
  `icon` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '图标',
  `key` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '标识',
  `pid` int unsigned DEFAULT '0' COMMENT '上级菜单',
  `href` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'url',
  `type` int DEFAULT '1' COMMENT '类型',
  `weight` int DEFAULT '0' COMMENT '排序',
  `created_at` datetime DEFAULT NULL COMMENT '创建时间',
  `updated_at` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=136 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='权限规则';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wa_rules`
--

LOCK TABLES `wa_rules` WRITE;
/*!40000 ALTER TABLE `wa_rules` DISABLE KEYS */;
INSERT INTO `wa_rules` VALUES (1,'数据库','layui-icon-template-1','database',0,NULL,0,1000,'2025-04-03 17:32:03','2025-04-03 17:32:03'),(2,'所有表',NULL,'plugin\\admin\\app\\controller\\TableController',1,'/app/admin/table/index',1,800,'2025-04-03 17:32:03','2025-04-03 17:32:03'),(3,'权限管理','layui-icon-vercode','auth',0,NULL,0,900,'2025-04-03 17:32:03','2025-04-03 17:32:03'),(4,'账户管理',NULL,'plugin\\admin\\app\\controller\\AdminController',3,'/app/admin/admin/index',1,1000,'2025-04-03 17:32:03','2025-04-03 17:32:03'),(5,'角色管理',NULL,'plugin\\admin\\app\\controller\\RoleController',3,'/app/admin/role/index',1,900,'2025-04-03 17:32:03','2025-04-03 17:32:03'),(6,'菜单管理',NULL,'plugin\\admin\\app\\controller\\RuleController',3,'/app/admin/rule/index',1,800,'2025-04-03 17:32:03','2025-04-03 17:32:03'),(7,'会员管理','layui-icon-username','user',0,NULL,0,800,'2025-04-03 17:32:03','2025-04-03 17:32:03'),(8,'用户',NULL,'plugin\\admin\\app\\controller\\UserController',7,'/app/admin/user/index',1,800,'2025-04-03 17:32:03','2025-04-03 17:32:03'),(9,'通用设置','layui-icon-set','common',0,NULL,0,700,'2025-04-03 17:32:03','2025-04-03 17:32:03'),(10,'个人资料',NULL,'plugin\\admin\\app\\controller\\AccountController',9,'/app/admin/account/index',1,800,'2025-04-03 17:32:03','2025-04-03 17:32:03'),(11,'附件管理',NULL,'plugin\\admin\\app\\controller\\UploadController',9,'/app/admin/upload/index',1,700,'2025-04-03 17:32:03','2025-04-03 17:32:03'),(12,'字典设置',NULL,'plugin\\admin\\app\\controller\\DictController',9,'/app/admin/dict/index',1,600,'2025-04-03 17:32:03','2025-04-03 17:32:03'),(13,'系统设置',NULL,'plugin\\admin\\app\\controller\\ConfigController',9,'/app/admin/config/index',1,500,'2025-04-03 17:32:03','2025-04-03 17:32:03'),(14,'插件管理','layui-icon-app','plugin',0,NULL,0,600,'2025-04-03 17:32:03','2025-04-03 17:32:03'),(15,'应用插件',NULL,'plugin\\admin\\app\\controller\\PluginController',14,'/app/admin/plugin/index',1,800,'2025-04-03 17:32:03','2025-04-03 17:32:03'),(16,'开发辅助','layui-icon-fonts-code','dev',0,NULL,0,500,'2025-04-03 17:32:03','2025-04-03 17:32:03'),(17,'表单构建',NULL,'plugin\\admin\\app\\controller\\DevController',16,'/app/admin/dev/form-build',1,800,'2025-04-03 17:32:03','2025-04-03 17:32:03'),(18,'示例页面','layui-icon-templeate-1','demos',0,NULL,0,400,'2025-04-03 17:32:03','2025-04-03 17:32:03'),(19,'工作空间','layui-icon-console','demo1',18,'',0,0,'2025-04-03 17:32:03','2025-04-03 17:32:03'),(20,'控制后台','layui-icon-console','demo10',19,'/app/admin/demos/console/console1.html',1,0,'2025-04-03 17:32:03','2025-04-03 17:32:03'),(21,'数据分析','layui-icon-console','demo13',19,'/app/admin/demos/console/console2.html',1,0,'2025-04-03 17:32:03','2025-04-03 17:32:03'),(22,'百度一下','layui-icon-console','demo14',19,'http://www.baidu.com',1,0,'2025-04-03 17:32:03','2025-04-03 17:32:03'),(23,'主题预览','layui-icon-console','demo15',19,'/app/admin/demos/system/theme.html',1,0,'2025-04-03 17:32:03','2025-04-03 17:32:03'),(24,'常用组件','layui-icon-component','demo20',18,'',0,0,'2025-04-03 17:32:03','2025-04-03 17:32:03'),(25,'功能按钮','layui-icon-face-smile','demo2011',24,'/app/admin/demos/document/button.html',1,0,'2025-04-03 17:32:03','2025-04-03 17:32:03'),(26,'表单集合','layui-icon-face-cry','demo2014',24,'/app/admin/demos/document/form.html',1,0,'2025-04-03 17:32:03','2025-04-03 17:32:03'),(27,'字体图标','layui-icon-face-cry','demo2010',24,'/app/admin/demos/document/icon.html',1,0,'2025-04-03 17:32:03','2025-04-03 17:32:03'),(28,'多选下拉','layui-icon-face-cry','demo2012',24,'/app/admin/demos/document/select.html',1,0,'2025-04-03 17:32:03','2025-04-03 17:32:03'),(29,'动态标签','layui-icon-face-cry','demo2013',24,'/app/admin/demos/document/tag.html',1,0,'2025-04-03 17:32:03','2025-04-03 17:32:03'),(30,'数据表格','layui-icon-face-cry','demo2031',24,'/app/admin/demos/document/table.html',1,0,'2025-04-03 17:32:03','2025-04-03 17:32:03'),(31,'分布表单','layui-icon-face-cry','demo2032',24,'/app/admin/demos/document/step.html',1,0,'2025-04-03 17:32:03','2025-04-03 17:32:03'),(32,'树形表格','layui-icon-face-cry','demo2033',24,'/app/admin/demos/document/treetable.html',1,0,'2025-04-03 17:32:03','2025-04-03 17:32:03'),(33,'树状结构','layui-icon-face-cry','demo2034',24,'/app/admin/demos/document/dtree.html',1,0,'2025-04-03 17:32:03','2025-04-03 17:32:03'),(34,'文本编辑','layui-icon-face-cry','demo2035',24,'/app/admin/demos/document/tinymce.html',1,0,'2025-04-03 17:32:03','2025-04-03 17:32:03'),(35,'卡片组件','layui-icon-face-cry','demo2036',24,'/app/admin/demos/document/card.html',1,0,'2025-04-03 17:32:03','2025-04-03 17:32:03'),(36,'抽屉组件','layui-icon-face-cry','demo2021',24,'/app/admin/demos/document/drawer.html',1,0,'2025-04-03 17:32:03','2025-04-03 17:32:03'),(37,'消息通知','layui-icon-face-cry','demo2022',24,'/app/admin/demos/document/notice.html',1,0,'2025-04-03 17:32:03','2025-04-03 17:32:03'),(38,'加载组件','layui-icon-face-cry','demo2024',24,'/app/admin/demos/document/loading.html',1,0,'2025-04-03 17:32:03','2025-04-03 17:32:03'),(39,'弹层组件','layui-icon-face-cry','demo2023',24,'/app/admin/demos/document/popup.html',1,0,'2025-04-03 17:32:03','2025-04-03 17:32:03'),(40,'多选项卡','layui-icon-face-cry','demo60131',24,'/app/admin/demos/document/tab.html',1,0,'2025-04-03 17:32:03','2025-04-03 17:32:03'),(41,'数据菜单','layui-icon-face-cry','demo60132',24,'/app/admin/demos/document/menu.html',1,0,'2025-04-03 17:32:03','2025-04-03 17:32:03'),(42,'哈希加密','layui-icon-face-cry','demo2041',24,'/app/admin/demos/document/encrypt.html',1,0,'2025-04-03 17:32:03','2025-04-03 17:32:03'),(43,'图标选择','layui-icon-face-cry','demo2042',24,'/app/admin/demos/document/iconPicker.html',1,0,'2025-04-03 17:32:03','2025-04-03 17:32:03'),(44,'省市级联','layui-icon-face-cry','demo2043',24,'/app/admin/demos/document/area.html',1,0,'2025-04-03 17:32:03','2025-04-03 17:32:03'),(45,'数字滚动','layui-icon-face-cry','demo2044',24,'/app/admin/demos/document/count.html',1,0,'2025-04-03 17:32:03','2025-04-03 17:32:03'),(46,'顶部返回','layui-icon-face-cry','demo2045',24,'/app/admin/demos/document/topBar.html',1,0,'2025-04-03 17:32:03','2025-04-03 17:32:03'),(47,'结果页面','layui-icon-auz','demo666',18,'',0,0,'2025-04-03 17:32:03','2025-04-03 17:32:03'),(48,'成功','layui-icon-face-smile','demo667',47,'/app/admin/demos/result/success.html',1,0,'2025-04-03 17:32:03','2025-04-03 17:32:03'),(49,'失败','layui-icon-face-cry','demo668',47,'/app/admin/demos/result/error.html',1,0,'2025-04-03 17:32:03','2025-04-03 17:32:03'),(50,'错误页面','layui-icon-face-cry','demo-error',18,'',0,0,'2025-04-03 17:32:03','2025-04-03 17:32:03'),(51,'403','layui-icon-face-smile','demo403',50,'/app/admin/demos/error/403.html',1,0,'2025-04-03 17:32:03','2025-04-03 17:32:03'),(52,'404','layui-icon-face-cry','demo404',50,'/app/admin/demos/error/404.html',1,0,'2025-04-03 17:32:03','2025-04-03 17:32:03'),(53,'500','layui-icon-face-cry','demo500',50,'/app/admin/demos/error/500.html',1,0,'2025-04-03 17:32:03','2025-04-03 17:32:03'),(54,'系统管理','layui-icon-set-fill','demo-system',18,'',0,0,'2025-04-03 17:32:03','2025-04-03 17:32:03'),(55,'用户管理','layui-icon-face-smile','demo601',54,'/app/admin/demos/system/user.html',1,0,'2025-04-03 17:32:03','2025-04-03 17:32:03'),(56,'角色管理','layui-icon-face-cry','demo602',54,'/app/admin/demos/system/role.html',1,0,'2025-04-03 17:32:03','2025-04-03 17:32:03'),(57,'权限管理','layui-icon-face-cry','demo603',54,'/app/admin/demos/system/power.html',1,0,'2025-04-03 17:32:03','2025-04-03 17:32:03'),(58,'部门管理','layui-icon-face-cry','demo604',54,'/app/admin/demos/system/deptment.html',1,0,'2025-04-03 17:32:03','2025-04-03 17:32:03'),(59,'行为日志','layui-icon-face-cry','demo605',54,'/app/admin/demos/system/log.html',1,0,'2025-04-03 17:32:03','2025-04-03 17:32:03'),(60,'数据字典','layui-icon-face-cry','demo606',54,'/app/admin/demos/system/dict.html',1,0,'2025-04-03 17:32:03','2025-04-03 17:32:03'),(61,'常用页面','layui-icon-template-1','demo-common',18,'',0,0,'2025-04-03 17:32:03','2025-04-03 17:32:03'),(62,'空白页面','layui-icon-face-smile','demo702',61,'/app/admin/demos/system/space.html',1,0,'2025-04-03 17:32:03','2025-04-03 17:32:03'),(63,'查看表',NULL,'plugin\\admin\\app\\controller\\TableController@view',2,NULL,2,0,'2025-04-03 17:51:36','2025-04-03 17:51:36'),(64,'查询表',NULL,'plugin\\admin\\app\\controller\\TableController@show',2,NULL,2,0,'2025-04-03 17:51:36','2025-04-03 17:51:36'),(65,'创建表',NULL,'plugin\\admin\\app\\controller\\TableController@create',2,NULL,2,0,'2025-04-03 17:51:36','2025-04-03 17:51:36'),(66,'修改表',NULL,'plugin\\admin\\app\\controller\\TableController@modify',2,NULL,2,0,'2025-04-03 17:51:36','2025-04-03 17:51:36'),(67,'一键菜单',NULL,'plugin\\admin\\app\\controller\\TableController@crud',2,NULL,2,0,'2025-04-03 17:51:36','2025-04-03 17:51:36'),(68,'查询记录',NULL,'plugin\\admin\\app\\controller\\TableController@select',2,NULL,2,0,'2025-04-03 17:51:36','2025-04-03 17:51:36'),(69,'插入记录',NULL,'plugin\\admin\\app\\controller\\TableController@insert',2,NULL,2,0,'2025-04-03 17:51:36','2025-04-03 17:51:36'),(70,'更新记录',NULL,'plugin\\admin\\app\\controller\\TableController@update',2,NULL,2,0,'2025-04-03 17:51:36','2025-04-03 17:51:36'),(71,'删除记录',NULL,'plugin\\admin\\app\\controller\\TableController@delete',2,NULL,2,0,'2025-04-03 17:51:36','2025-04-03 17:51:36'),(72,'删除表',NULL,'plugin\\admin\\app\\controller\\TableController@drop',2,NULL,2,0,'2025-04-03 17:51:36','2025-04-03 17:51:36'),(73,'表摘要',NULL,'plugin\\admin\\app\\controller\\TableController@schema',2,NULL,2,0,'2025-04-03 17:51:36','2025-04-03 17:51:36'),(74,'插入',NULL,'plugin\\admin\\app\\controller\\AdminController@insert',4,NULL,2,0,'2025-04-03 17:51:36','2025-04-03 17:51:36'),(75,'更新',NULL,'plugin\\admin\\app\\controller\\AdminController@update',4,NULL,2,0,'2025-04-03 17:51:36','2025-04-03 17:51:36'),(76,'删除',NULL,'plugin\\admin\\app\\controller\\AdminController@delete',4,NULL,2,0,'2025-04-03 17:51:36','2025-04-03 17:51:36'),(77,'插入',NULL,'plugin\\admin\\app\\controller\\RoleController@insert',5,NULL,2,0,'2025-04-03 17:51:36','2025-04-03 17:51:36'),(78,'更新',NULL,'plugin\\admin\\app\\controller\\RoleController@update',5,NULL,2,0,'2025-04-03 17:51:36','2025-04-03 17:51:36'),(79,'删除',NULL,'plugin\\admin\\app\\controller\\RoleController@delete',5,NULL,2,0,'2025-04-03 17:51:36','2025-04-03 17:51:36'),(80,'获取角色权限',NULL,'plugin\\admin\\app\\controller\\RoleController@rules',5,NULL,2,0,'2025-04-03 17:51:36','2025-04-03 17:51:36'),(81,'查询',NULL,'plugin\\admin\\app\\controller\\RuleController@select',6,NULL,2,0,'2025-04-03 17:51:36','2025-04-03 17:51:36'),(82,'添加',NULL,'plugin\\admin\\app\\controller\\RuleController@insert',6,NULL,2,0,'2025-04-03 17:51:36','2025-04-03 17:51:36'),(83,'更新',NULL,'plugin\\admin\\app\\controller\\RuleController@update',6,NULL,2,0,'2025-04-03 17:51:36','2025-04-03 17:51:36'),(84,'删除',NULL,'plugin\\admin\\app\\controller\\RuleController@delete',6,NULL,2,0,'2025-04-03 17:51:36','2025-04-03 17:51:36'),(85,'插入',NULL,'plugin\\admin\\app\\controller\\UserController@insert',8,NULL,2,0,'2025-04-03 17:51:36','2025-04-03 17:51:36'),(86,'更新',NULL,'plugin\\admin\\app\\controller\\UserController@update',8,NULL,2,0,'2025-04-03 17:51:36','2025-04-03 17:51:36'),(87,'查询',NULL,'plugin\\admin\\app\\controller\\UserController@select',8,NULL,2,0,'2025-04-03 17:51:36','2025-04-03 17:51:36'),(88,'删除',NULL,'plugin\\admin\\app\\controller\\UserController@delete',8,NULL,2,0,'2025-04-03 17:51:36','2025-04-03 17:51:36'),(89,'更新',NULL,'plugin\\admin\\app\\controller\\AccountController@update',10,NULL,2,0,'2025-04-03 17:51:36','2025-04-03 17:51:36'),(90,'修改密码',NULL,'plugin\\admin\\app\\controller\\AccountController@password',10,NULL,2,0,'2025-04-03 17:51:36','2025-04-03 17:51:36'),(91,'查询',NULL,'plugin\\admin\\app\\controller\\AccountController@select',10,NULL,2,0,'2025-04-03 17:51:36','2025-04-03 17:51:36'),(92,'添加',NULL,'plugin\\admin\\app\\controller\\AccountController@insert',10,NULL,2,0,'2025-04-03 17:51:36','2025-04-03 17:51:36'),(93,'删除',NULL,'plugin\\admin\\app\\controller\\AccountController@delete',10,NULL,2,0,'2025-04-03 17:51:36','2025-04-03 17:51:36'),(94,'浏览附件',NULL,'plugin\\admin\\app\\controller\\UploadController@attachment',11,NULL,2,0,'2025-04-03 17:51:36','2025-04-03 17:51:36'),(95,'查询附件',NULL,'plugin\\admin\\app\\controller\\UploadController@select',11,NULL,2,0,'2025-04-03 17:51:36','2025-04-03 17:51:36'),(96,'更新附件',NULL,'plugin\\admin\\app\\controller\\UploadController@update',11,NULL,2,0,'2025-04-03 17:51:36','2025-04-03 17:51:36'),(97,'添加附件',NULL,'plugin\\admin\\app\\controller\\UploadController@insert',11,NULL,2,0,'2025-04-03 17:51:36','2025-04-03 17:51:36'),(98,'上传文件',NULL,'plugin\\admin\\app\\controller\\UploadController@file',11,NULL,2,0,'2025-04-03 17:51:36','2025-04-03 17:51:36'),(99,'上传图片',NULL,'plugin\\admin\\app\\controller\\UploadController@image',11,NULL,2,0,'2025-04-03 17:51:36','2025-04-03 17:51:36'),(100,'上传头像',NULL,'plugin\\admin\\app\\controller\\UploadController@avatar',11,NULL,2,0,'2025-04-03 17:51:36','2025-04-03 17:51:36'),(101,'删除附件',NULL,'plugin\\admin\\app\\controller\\UploadController@delete',11,NULL,2,0,'2025-04-03 17:51:36','2025-04-03 17:51:36'),(102,'查询',NULL,'plugin\\admin\\app\\controller\\DictController@select',12,NULL,2,0,'2025-04-03 17:51:36','2025-04-03 17:51:36'),(103,'插入',NULL,'plugin\\admin\\app\\controller\\DictController@insert',12,NULL,2,0,'2025-04-03 17:51:36','2025-04-03 17:51:36'),(104,'更新',NULL,'plugin\\admin\\app\\controller\\DictController@update',12,NULL,2,0,'2025-04-03 17:51:36','2025-04-03 17:51:36'),(105,'删除',NULL,'plugin\\admin\\app\\controller\\DictController@delete',12,NULL,2,0,'2025-04-03 17:51:36','2025-04-03 17:51:36'),(106,'更改',NULL,'plugin\\admin\\app\\controller\\ConfigController@update',13,NULL,2,0,'2025-04-03 17:51:36','2025-04-03 17:51:36'),(107,'列表',NULL,'plugin\\admin\\app\\controller\\PluginController@list',15,NULL,2,0,'2025-04-03 17:51:36','2025-04-03 17:51:36'),(108,'安装',NULL,'plugin\\admin\\app\\controller\\PluginController@install',15,NULL,2,0,'2025-04-03 17:51:36','2025-04-03 17:51:36'),(109,'卸载',NULL,'plugin\\admin\\app\\controller\\PluginController@uninstall',15,NULL,2,0,'2025-04-03 17:51:36','2025-04-03 17:51:36'),(110,'支付',NULL,'plugin\\admin\\app\\controller\\PluginController@pay',15,NULL,2,0,'2025-04-03 17:51:36','2025-04-03 17:51:36'),(111,'登录官网',NULL,'plugin\\admin\\app\\controller\\PluginController@login',15,NULL,2,0,'2025-04-03 17:51:36','2025-04-03 17:51:36'),(112,'获取已安装的插件列表',NULL,'plugin\\admin\\app\\controller\\PluginController@getInstalledPlugins',15,NULL,2,0,'2025-04-03 17:51:36','2025-04-03 17:51:36'),(113,'表单构建',NULL,'plugin\\admin\\app\\controller\\DevController@formBuild',17,NULL,2,0,'2025-04-03 17:51:36','2025-04-03 17:51:36'),(114,'验证码','layui-icon-cellphone','plugin\\admin\\app\\controller\\AppSmsController',132,'/app/admin/app-sms/index',1,0,'2025-04-07 21:26:59','2025-04-08 10:09:25'),(121,'selectType',NULL,'plugin\\admin\\app\\controller\\AppSmsController@selectType',114,NULL,2,0,'2025-04-07 22:31:26','2025-04-07 22:31:26'),(122,'selectApp',NULL,'plugin\\admin\\app\\controller\\AppSmsController@selectApp',114,NULL,2,0,'2025-04-07 22:31:26','2025-04-07 22:31:26'),(123,'查询',NULL,'plugin\\admin\\app\\controller\\AppSmsController@select',114,NULL,2,0,'2025-04-07 22:31:26','2025-04-07 22:31:26'),(127,'授权管理','layui-icon-vercode','plugin\\admin\\app\\controller\\AppSmsTokenController',132,'/app/admin/app-sms-token/index',1,0,'2025-04-08 10:08:05','2025-04-08 10:09:42'),(128,'插入',NULL,'plugin\\admin\\app\\controller\\AppSmsTokenController@insert',127,NULL,2,0,'2025-04-08 10:08:11','2025-04-08 10:08:11'),(129,'更新',NULL,'plugin\\admin\\app\\controller\\AppSmsTokenController@update',127,NULL,2,0,'2025-04-08 10:08:11','2025-04-08 10:08:11'),(130,'查询',NULL,'plugin\\admin\\app\\controller\\AppSmsTokenController@select',127,NULL,2,0,'2025-04-08 10:08:11','2025-04-08 10:08:11'),(131,'删除',NULL,'plugin\\admin\\app\\controller\\AppSmsTokenController@delete',127,NULL,2,0,'2025-04-08 10:08:11','2025-04-08 10:08:11'),(132,'APP验证码','layui-icon-cellphone','app-sms',0,'',0,0,'2025-04-08 10:08:42','2025-04-08 10:08:42'),(133,'添加',NULL,'plugin\\admin\\app\\controller\\AppSmsController@insert',114,NULL,2,0,'2025-04-10 23:25:22','2025-04-10 23:25:22'),(134,'更新',NULL,'plugin\\admin\\app\\controller\\AppSmsController@update',114,NULL,2,0,'2025-04-10 23:25:22','2025-04-10 23:25:22'),(135,'删除',NULL,'plugin\\admin\\app\\controller\\AppSmsController@delete',114,NULL,2,0,'2025-04-10 23:25:22','2025-04-10 23:25:22');
/*!40000 ALTER TABLE `wa_rules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wa_uploads`
--

DROP TABLE IF EXISTS `wa_uploads`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wa_uploads` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(128) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '名称',
  `url` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '文件',
  `admin_id` int DEFAULT NULL COMMENT '管理员',
  `file_size` int DEFAULT NULL COMMENT '文件大小',
  `mime_type` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'mime类型',
  `image_width` int DEFAULT NULL COMMENT '图片宽度',
  `image_height` int DEFAULT NULL COMMENT '图片高度',
  `ext` varchar(128) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '扩展名',
  `storage` varchar(255) COLLATE utf8mb4_general_ci DEFAULT 'local' COMMENT '存储位置',
  `category` varchar(128) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '类别',
  `created_at` datetime DEFAULT NULL COMMENT '创建时间',
  `updated_at` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `admin_id` (`admin_id`),
  KEY `category` (`category`),
  KEY `ext` (`ext`),
  KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='附件';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wa_uploads`
--

LOCK TABLES `wa_uploads` WRITE;
/*!40000 ALTER TABLE `wa_uploads` DISABLE KEYS */;
/*!40000 ALTER TABLE `wa_uploads` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wa_users`
--

DROP TABLE IF EXISTS `wa_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wa_users` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(32) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '用户名',
  `nickname` varchar(40) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '昵称',
  `password` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '密码',
  `sex` enum('0','1') COLLATE utf8mb4_general_ci DEFAULT '1' COMMENT '性别',
  `avatar` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '头像',
  `email` varchar(128) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '邮箱',
  `mobile` varchar(16) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '手机',
  `level` tinyint DEFAULT '0' COMMENT '等级',
  `birthday` date DEFAULT NULL COMMENT '生日',
  `money` decimal(10,2) DEFAULT '0.00' COMMENT '余额(元)',
  `score` int DEFAULT '0' COMMENT '积分',
  `last_time` datetime DEFAULT NULL COMMENT '登录时间',
  `last_ip` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '登录ip',
  `join_time` datetime DEFAULT NULL COMMENT '注册时间',
  `join_ip` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '注册ip',
  `token` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'token',
  `role` int DEFAULT '1' COMMENT '角色',
  `status` tinyint DEFAULT '0' COMMENT '禁用',
  `created_at` datetime DEFAULT NULL COMMENT '创建时间',
  `updated_at` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  KEY `email` (`email`),
  KEY `join_time` (`join_time`),
  KEY `mobile` (`mobile`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='用户表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wa_users`
--

LOCK TABLES `wa_users` WRITE;
/*!40000 ALTER TABLE `wa_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `wa_users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-04-18 18:00:22
