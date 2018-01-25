/*
SQLyog Ultimate v9.30 
MySQL - 5.7.9-log : Database - asura_amp_db
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`asura_amp_db` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;

USE `asura_amp_db`;

/*Table structure for table `sys_config` */

DROP TABLE IF EXISTS `sys_config`;

CREATE TABLE `sys_config` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `type` varchar(20) NOT NULL COMMENT '类型',
  `code` varchar(50) NOT NULL DEFAULT '' COMMENT '编码',
  `name` varchar(40) DEFAULT NULL COMMENT '名称',
  `value` varchar(500) DEFAULT NULL COMMENT '值',
  `notes` varchar(100) DEFAULT NULL COMMENT '描述',
  `is_delete` tinyint(1) DEFAULT '0' COMMENT '是否删除 1删除 0未删除',
  `update_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`,`type`,`code`)
) ENGINE=InnoDB AUTO_INCREMENT=136 DEFAULT CHARSET=utf8;

/*Table structure for table `sys_log` */

DROP TABLE IF EXISTS `sys_log`;

CREATE TABLE `sys_log` (
  `logId` int(11) NOT NULL AUTO_INCREMENT COMMENT '日志自增id',
  `logonName` varchar(50) DEFAULT NULL COMMENT '登录名字',
  `jobNum` varchar(50) DEFAULT NULL COMMENT '工号',
  `logonDate` bigint(15) DEFAULT NULL COMMENT '登录时间',
  `operationUrl` varchar(500) DEFAULT NULL COMMENT '操作url',
  `clientIp` varchar(50) DEFAULT NULL COMMENT '客户端请求ip',
  `isNormalOperation` tinyint(1) DEFAULT NULL COMMENT '是否非法操作 0非法 1合法',
  PRIMARY KEY (`logId`)
) ENGINE=InnoDB AUTO_INCREMENT=14147 DEFAULT CHARSET=utf8;

/*Table structure for table `sys_operator` */

DROP TABLE IF EXISTS `sys_operator`;

CREATE TABLE `sys_operator` (
  `operator_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '操作员id',
  `operator_name` varchar(50) DEFAULT NULL COMMENT '操作员名字',
  `login_name` varchar(50) DEFAULT NULL COMMENT '登录账号',
  `login_pwd` varchar(32) DEFAULT NULL COMMENT '登录密码',
  `job_num` varchar(20) DEFAULT NULL COMMENT '工号',
  `telephone` varchar(20) DEFAULT NULL COMMENT '电话',
  `operator_status` tinyint(1) DEFAULT NULL COMMENT '操作员状态 0:失效 1:正常 2:删除',
  `operator_email` varchar(50) DEFAULT NULL COMMENT '操作员邮箱',
  `operator_type` tinyint(1) DEFAULT NULL COMMENT '操作员类型 1：操作员 2：系统管理员',
  `operator_department` tinyint(2) DEFAULT NULL COMMENT '操作员所属部门 1:采购部 3:财务部 4:运营部 5:技术部 6:法务部',
  PRIMARY KEY (`operator_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Table structure for table `sys_operator_resource` */

DROP TABLE IF EXISTS `sys_operator_resource`;

CREATE TABLE `sys_operator_resource` (
  `ore_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `operator_id` int(11) DEFAULT NULL COMMENT '用户id',
  `res_id` int(11) DEFAULT NULL COMMENT '资源id',
  PRIMARY KEY (`ore_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `sys_operator_role` */

DROP TABLE IF EXISTS `sys_operator_role`;

CREATE TABLE `sys_operator_role` (
  `or_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `operator_id` int(11) DEFAULT NULL COMMENT '用户id',
  `role_id` int(11) DEFAULT NULL COMMENT '角色id',
  PRIMARY KEY (`or_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Table structure for table `sys_resource` */

DROP TABLE IF EXISTS `sys_resource`;

CREATE TABLE `sys_resource` (
  `res_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '资源id 自增',
  `res_name` varchar(50) DEFAULT NULL COMMENT '资源名称',
  `parent_id` int(11) DEFAULT NULL COMMENT '父资源id',
  `res_url` varchar(200) DEFAULT NULL COMMENT '资源访问连接',
  `res_urlparam` varchar(100) DEFAULT NULL COMMENT '资源访问参数',
  `res_type` varchar(10) DEFAULT NULL COMMENT '资源类型, 01:菜单 02:功能',
  `res_order` int(10) DEFAULT NULL COMMENT '显示顺序号',
  `res_level` int(10) DEFAULT NULL COMMENT '级数',
  `res_function_type` varchar(10) DEFAULT NULL COMMENT '资源功能类型, 01:查询 02:增加 03:修改 04:删除',
  `res_desc` varchar(200) DEFAULT NULL COMMENT '资源描述',
  `is_admin_menu` tinyint(1) DEFAULT NULL COMMENT '是否是管理 1是 0否',
  `is_shield` tinyint(1) DEFAULT '0' COMMENT '是否屏蔽 1是 0否',
  PRIMARY KEY (`res_id`)
) ENGINE=InnoDB AUTO_INCREMENT=545 DEFAULT CHARSET=utf8;

/*Table structure for table `sys_role` */

DROP TABLE IF EXISTS `sys_role`;

CREATE TABLE `sys_role` (
  `role_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '角色id',
  `role_name` varchar(50) DEFAULT NULL COMMENT '角色名称',
  `role_desc` varchar(200) DEFAULT NULL COMMENT '角色描述',
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Table structure for table `sys_role_resource` */

DROP TABLE IF EXISTS `sys_role_resource`;

CREATE TABLE `sys_role_resource` (
  `rr_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `role_id` int(11) DEFAULT NULL COMMENT '角色id',
  `res_id` int(11) DEFAULT NULL COMMENT '资源id',
  PRIMARY KEY (`rr_id`)
) ENGINE=InnoDB AUTO_INCREMENT=932 DEFAULT CHARSET=utf8;

/*Table structure for table `sys_statistics` */

DROP TABLE IF EXISTS `sys_statistics`;

CREATE TABLE `sys_statistics` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `application` varchar(50) DEFAULT NULL COMMENT '应用名',
  `service` varchar(100) NOT NULL COMMENT '接口全名',
  `method` varchar(50) NOT NULL COMMENT '方法名',
  `version` varchar(20) DEFAULT NULL COMMENT '方法版本号',
  `provider` varchar(15) NOT NULL COMMENT '提供者IP',
  `consumer` varchar(15) NOT NULL COMMENT '消费者IP',
  `type` varchar(20) NOT NULL COMMENT 'CONSUMER, PROVIDER',
  `statisticstype` varchar(20) NOT NULL COMMENT 'SUCCESS, FAILURE, ELAPSED, CONCURRENT, MAX_ELAPSED, MAX_CONCURRENT',
  `dtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '接口调用时间',
  `cntval` int(11) NOT NULL COMMENT '次数',
  PRIMARY KEY (`id`),
  KEY `idx_dtime` (`dtime`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `sys_statistics_detail` */

DROP TABLE IF EXISTS `sys_statistics_detail`;

CREATE TABLE `sys_statistics_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `keyid` char(32) NOT NULL COMMENT '记录Key，sys_statistics_key id',
  `type` char(1) NOT NULL COMMENT '1：CONSUMER, 0：PROVIDER',
  `success` int(11) DEFAULT NULL COMMENT 'SUCCESS 次数',
  `failure` int(11) DEFAULT NULL COMMENT 'FAILURE 次数',
  `elapsed` int(11) DEFAULT NULL COMMENT 'ELAPSED 次数',
  `concurrent` int(11) DEFAULT NULL COMMENT 'CONCURRENT 次数',
  `max_elapsed` int(11) DEFAULT NULL COMMENT 'MAX_ELAPSED 次数',
  `max_concurrent` int(11) DEFAULT NULL COMMENT 'MAX_CONCURRENT 次数',
  `dtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '接口调用时间',
  PRIMARY KEY (`id`),
  KEY `ix_dtime` (`dtime`)
) ENGINE=InnoDB AUTO_INCREMENT=40668980 DEFAULT CHARSET=utf8;

/*Table structure for table `sys_statistics_key` */

DROP TABLE IF EXISTS `sys_statistics_key`;

CREATE TABLE `sys_statistics_key` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `checkcode` char(32) NOT NULL COMMENT 'MD5唯一判断',
  `application` varchar(50) DEFAULT NULL COMMENT '应用名',
  `service` varchar(100) NOT NULL COMMENT '接口全名',
  `method` varchar(50) NOT NULL COMMENT '方法名',
  `version` varchar(20) DEFAULT NULL COMMENT '方法版本号',
  `provider` varchar(15) NOT NULL COMMENT '提供者IP',
  `consumer` varchar(15) NOT NULL COMMENT '消费者IP',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31747 DEFAULT CHARSET=utf8;

/*Table structure for table `zookeeper_alarm` */

DROP TABLE IF EXISTS `zookeeper_alarm`;

CREATE TABLE `zookeeper_alarm` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `cluster_id` int(11) NOT NULL COMMENT '集群id',
  `email_list` varchar(500) DEFAULT NULL COMMENT '报警邮箱',
  `phone_list` varchar(500) DEFAULT NULL COMMENT '报警电话',
  `max_delay_of_check` int(11) DEFAULT NULL COMMENT '检测最大延迟(秒)',
  `max_cpu_usage` varchar(10) DEFAULT NULL COMMENT 'cpu最大使用率（%）',
  `max_memory_usage` varchar(10) DEFAULT NULL COMMENT '内存最大使用率（%）',
  `max_load` varchar(10) DEFAULT NULL COMMENT '最大负载率（%）',
  `max_watch_per_ip` int(11) DEFAULT NULL COMMENT '最大watch数',
  `max_connection_per_ip` int(11) DEFAULT NULL COMMENT '最大连接数',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `zookeeper_cluster` */

DROP TABLE IF EXISTS `zookeeper_cluster`;

CREATE TABLE `zookeeper_cluster` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `desc` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `zookeeper_server` */

DROP TABLE IF EXISTS `zookeeper_server`;

CREATE TABLE `zookeeper_server` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `ip` varchar(50) NOT NULL,
  `port` int(11) NOT NULL,
  `cluster_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/* Function  structure for function  `currval` */

/*!50003 DROP FUNCTION IF EXISTS `currval` */;
DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` FUNCTION `currval`(`seq_name` VARCHAR(50)) RETURNS int(11)
    DETERMINISTIC
    COMMENT '获取当前序列值'
BEGIN
    DECLARE VALUE INTEGER;
    SET VALUE=0;
    SELECT current_value INTO VALUE
    FROM sys_sequence 
    WHERE NAME=seq_name;
    RETURN VALUE;
END */$$
DELIMITER ;

/* Function  structure for function  `nextval` */

/*!50003 DROP FUNCTION IF EXISTS `nextval` */;
DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` FUNCTION `nextval`(`seq_name` VARCHAR(50)) RETURNS int(11)
    DETERMINISTIC
    COMMENT '获取序列下一个值'
BEGIN
   UPDATE sys_sequence SET CURRENT_VALUE = CURRENT_VALUE + INCREMENT where  NAME=seq_name;
   return currval(seq_name);
END */$$
DELIMITER ;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
