DELIMITER $$

USE `shaemus`$$

DROP PROCEDURE IF EXISTS `USP_BCSEA_GET_RATIO_MARKS`$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `USP_BCSEA_GET_RATIO_MARKS`()
BEGIN 
        DECLARE var_avg_eng_marks_male DECIMAL(18,2) DEFAULT NULL;  
        DECLARE var_avg_eng_marks_female DECIMAL(18,2) DEFAULT NULL;
        DECLARE var_avg_dzo_marks_male DECIMAL(18,2) DEFAULT NULL;  
        DECLARE var_avg_dzo_marks_female DECIMAL(18,2) DEFAULT NULL;  
        
	SET var_avg_eng_marks_male = (SELECT AVG(D.english) FROM student_detail D  WHERE D.sex ='M'); 
	SET var_avg_eng_marks_female = (SELECT AVG(D.english) FROM student_detail D WHERE D.sex ='F');
	SET var_avg_dzo_marks_male = (SELECT AVG(D.dzongkha) FROM student_detail D WHERE D.sex ='M');
	SET var_avg_dzo_marks_female = (SELECT AVG(D.dzongkha) FROM student_detail D WHERE D.sex ='F');
	
	SELECT var_avg_eng_marks_male AS englishMarksMale,
	var_avg_eng_marks_female AS englishMarksFemale,
	var_avg_dzo_marks_male AS dzongkhaMarksMale,
	var_avg_dzo_marks_female AS dzongkhaMarksFemale;
 END$$

DELIMITER ;