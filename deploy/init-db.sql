-- 途吉天下卡车管理系统数据库初始化脚本

CREATE DATABASE IF NOT EXISTS tugig DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

USE tugig;

-- 用户表
CREATE TABLE IF NOT EXISTS `users` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `username` VARCHAR(50) NOT NULL UNIQUE,
  `password` VARCHAR(255) NOT NULL,
  `nickname` VARCHAR(50) DEFAULT NULL,
  `phone` VARCHAR(20) DEFAULT NULL,
  `email` VARCHAR(100) DEFAULT NULL,
  `role` TINYINT DEFAULT 1 COMMENT '1=普通用户,2=管理员',
  `status` TINYINT DEFAULT 1 COMMENT '1=正常,0=禁用',
  `create_time` DATETIME DEFAULT CURRENT_TIMESTAMP,
  `update_time` DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- 车辆表
CREATE TABLE IF NOT EXISTS `vehicles` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `plate_number` VARCHAR(50) NOT NULL COMMENT '车牌号',
  `brand` VARCHAR(50) DEFAULT NULL COMMENT '品牌',
  `model` VARCHAR(50) DEFAULT NULL COMMENT '型号',
  `vehicle_type` VARCHAR(20) DEFAULT NULL COMMENT '车辆类型',
  `color` VARCHAR(20) DEFAULT NULL COMMENT '颜色',
  `owner_id` INT DEFAULT NULL COMMENT '车主ID',
  `status` TINYINT DEFAULT 1 COMMENT '1=正常,0=离线',
  `create_time` DATETIME DEFAULT CURRENT_TIMESTAMP,
  `update_time` DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- 定位表
CREATE TABLE IF NOT EXISTS `locations` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `vehicle_id` INT NOT NULL COMMENT '车辆ID',
  `latitude` DECIMAL(10,7) NOT NULL COMMENT '纬度',
  `longitude` DECIMAL(11,7) NOT NULL COMMENT '经度',
  `speed` FLOAT DEFAULT NULL COMMENT '速度(km/h)',
  `direction` INT DEFAULT NULL COMMENT '方向(角度)',
  `accuracy` FLOAT DEFAULT NULL COMMENT '精度',
  `create_time` DATETIME DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `idx_vehicle_time` (`vehicle_id`, `create_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- 轨迹表
CREATE TABLE IF NOT EXISTS `tracks` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `vehicle_id` INT NOT NULL COMMENT '车辆ID',
  `start_time` DATETIME NOT NULL COMMENT '开始时间',
  `end_time` DATETIME DEFAULT NULL COMMENT '结束时间',
  `distance` FLOAT DEFAULT 0 COMMENT '里程(km)',
  `create_time` DATETIME DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `idx_vehicle` (`vehicle_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- 油耗记录表
CREATE TABLE IF NOT EXISTS `fuel_records` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `vehicle_id` INT NOT NULL COMMENT '车辆ID',
  `fuel_amount` DECIMAL(10,2) NOT NULL COMMENT '加油量(升)',
  `fuel_price` DECIMAL(10,2) DEFAULT NULL COMMENT '单价(元/升)',
  `total_price` DECIMAL(10,2) DEFAULT NULL COMMENT '总价',
  `mileage` INT DEFAULT NULL COMMENT '加油时里程(km)',
  `location` VARCHAR(255) DEFAULT NULL COMMENT '加油地点',
  `record_time` DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT '加油时间',
  `create_time` DATETIME DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `idx_vehicle_time` (`vehicle_id`, `record_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- 电子围栏表
CREATE TABLE IF NOT EXISTS `fences` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(100) NOT NULL COMMENT '围栏名称',
  `vehicle_id` INT DEFAULT NULL COMMENT '关联车辆(可选)',
  `fence_type` TINYINT NOT NULL COMMENT '类型:1=圆形,2=矩形,3=多边形',
  `center_lat` DECIMAL(10,7) DEFAULT NULL COMMENT '中心纬度',
  `center_lng` DECIMAL(11,7) DEFAULT NULL COMMENT '中心经度',
  `radius` INT DEFAULT NULL COMMENT '半径(米,圆形用)',
  `coordinates` TEXT COMMENT '坐标点(JSON)',
  `alert_type` TINYINT DEFAULT 3 COMMENT '告警类型:1=进入,2=离开,3=进出都告警',
  `status` TINYINT DEFAULT 1 COMMENT '1=启用,0=禁用',
  `create_time` DATETIME DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- 插入测试数据
INSERT INTO `users` (`username`, `password`, `nickname`, `phone`, `role`) VALUES
('admin', '$2a$10$N.zmdr9k7uOCQb376NoUnuTJ8iAt6Z5EHsM8lE9lBOsl7iAt6Z5EH', '管理员', '13800138000', 2);

INSERT INTO `vehicles` (`plate_number`, `brand`, `model`, `vehicle_type`, `color`, `owner_id`, `status`) VALUES
('京A12345', '解放', 'J6P', '重型卡车', '红色', 1, 1),
('京B67890', '东风', '天龙', '重型卡车', '蓝色', 1, 1);
