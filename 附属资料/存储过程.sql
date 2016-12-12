/*
Navicat MySQL Data Transfer

Source Server         : 百思陵园
Source Server Version : 50626
Source Host           : localhost:3306
Source Database       : cemetery

Target Server Type    : MYSQL
Target Server Version : 50626
File Encoding         : 65001

Date: 2016-11-19 15:57:58
*/



-- ----------------------------
-- Procedure structure for `proc_clearGoodsUseRelate`
-- ----------------------------
DROP PROCEDURE IF EXISTS `proc_clearGoodsUseRelate`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_clearGoodsUseRelate`()
BEGIN
	/* 定义变量 */
	DECLARE l_id VARCHAR(32);
	DECLARE l_lifecycle INT;
	DECLARE l_createTime INT;
	DECLARE _end INT DEFAULT 0;
		
	/* 定义光标 */
	DECLARE _Cur CURSOR FOR 
		SELECT id, lifecycle, create_time FROM goods_use_relat 
			WHERE UNIX_TIMESTAMP(SYSDATE()) - create_time > lifecycle*24*3600;
		
	DECLARE CONTINUE HANDLER FOR NOT FOUND set _end = 1;

	/* 打开光标 */	
	OPEN _Cur;
		/* 循环执行 */
		REPEAT
			FETCH _Cur INTO l_id, l_lifecycle, l_createTime;
				/* 删除超时的商品 */
				DELETE FROM goods_use_relat WHERE id= l_id;
		UNTIL _end END REPEAT;
	CLOSE _Cur;

END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for `proc_parkGrowth`
-- ----------------------------
DROP PROCEDURE IF EXISTS `proc_parkGrowth`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_parkGrowth`()
BEGIN
	/* 定义变量 */
	DECLARE max_young_day INT DEFAULT 10;
	DECLARE max_growth_day INT DEFAULT 20;
	DECLARE max_mature_day INT DEFAULT 30;

	DECLARE l_id VARCHAR(32);
	DECLARE l_growing_days INT;
	DECLARE l_life_value INT;
	DECLARE l_goods_id VARCHAR(32);
	DECLARE l_type INT;
	DECLARE l_grouping INT;
	DECLARE l_phase INT;
	DECLARE n_goods_id VARCHAR(32);
	DECLARE _end INT DEFAULT 0;
		
	/* 定义光标 */
	DECLARE _Cur CURSOR FOR 
		SELECT id, growing_days, life_value, goods_id FROM park WHERE life_value > 0;
		
	DECLARE CONTINUE HANDLER FOR NOT FOUND set _end = 1;

	/* 打开光标 */	
	OPEN _Cur;
		/* 循环执行 */
		REPEAT
			FETCH _Cur INTO l_id, l_growing_days, l_life_value, l_goods_id;
			IF NOT _end	THEN
				SET l_life_value = l_life_value-1;
				SET l_growing_days = l_growing_days+1;
				/* 生命值减1，总成长天数加1 */
				UPDATE park SET growing_days=l_growing_days, life_value=l_life_value WHERE id = l_id;
				/* 总成长天数达到幼年期最大值 */
				IF l_growing_days - max_young_day = 0 
					OR l_growing_days - max_growth_day = 0 OR l_growing_days - max_mature_day = 0
				THEN
					SELECT type, grouping, phase INTO l_type, l_grouping, l_phase
						FROM plants_and_animals WHERE id=l_goods_id;
					SELECT id INTO n_goods_id FROM plants_and_animals 
						WHERE type=l_type AND grouping=l_grouping AND phase=l_phase+1;
					UPDATE park SET goods_id=n_goods_id where id=l_id;
				END IF;
			END IF;
		UNTIL _end END REPEAT;
	CLOSE _Cur;

END
;;
DELIMITER ;

-- ----------------------------
-- Event structure for `event_clearGoodsUseRelate`
-- ----------------------------
DROP EVENT IF EXISTS `event_clearGoodsUseRelate`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` EVENT `event_clearGoodsUseRelate` ON SCHEDULE EVERY 12 HOUR STARTS '2017-11-19 00:00:00' ON COMPLETION NOT PRESERVE ENABLE DO CALL proc_clearGoodsUseRelate
;;
DELIMITER ;

-- ----------------------------
-- Event structure for `event_parkGrowth`
-- ----------------------------
DROP EVENT IF EXISTS `event_parkGrowth`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` EVENT `event_parkGrowth` ON SCHEDULE AT '2016-11-08 21:17:00' ON COMPLETION NOT PRESERVE ENABLE DO CALL proc_parkGrowth
;;
DELIMITER ;
