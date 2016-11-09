/*
Navicat MySQL Data Transfer

Source Server         : 百思陵园
Source Server Version : 50626
Source Host           : localhost:3306
Source Database       : cemetery

Target Server Type    : MYSQL
Target Server Version : 50626
File Encoding         : 65001

Date: 2016-11-08 20:46:55
*/


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
-- Event structure for `parkGrowth`
-- 2016-11-08 21:17:00 时间改为 真实发布时间
-- ----------------------------
DROP EVENT IF EXISTS `parkGrowth`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` EVENT `parkGrowth` ON SCHEDULE AT '2016-11-08 21:17:00' ON COMPLETION NOT PRESERVE ENABLE DO CALL proc_parkGrowth
;;
DELIMITER ;