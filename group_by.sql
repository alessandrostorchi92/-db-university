-- 1. Contare quanti iscritti ci sono stati ogni anno 

SELECT YEAR(`enrolment_date`) AS "Anno", COUNT(*) AS "Iscritti"
FROM `students`
GROUP BY YEAR(`enrolment_date`);

-- 2. Contare gli insegnanti che hanno l'ufficio nello stesso edificio 

SELECT `office_address` AS "Indirizzo ufficio", COUNT(*) AS "Numero professori aventi l'ufficio a quell'indirizzo"
FROM `teachers`
GROUP BY `office_address`;

-- 3. Calcolare la media dei voti di ogni appello d'esame 

SELECT `exam_id` AS "Appello D'esame", ROUND(AVG(`vote`),2) AS "Media Voti"
FROM `exam_student`
GROUP BY `exam_id`

-- 4. Contare quanti corsi di laurea ci sono per ogni dipartimento 

SELECT `department_id` AS "Dipartimento", COUNT(*) AS "Corso di Laurea"
FROM `degrees`
GROUP BY `department_id`;
