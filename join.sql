-- 1. Selezionare tutti gli studenti iscritti al Corso di Laurea in Economia

SELECT `students`.`name` AS "nome_studente" , `students`.`surname` AS "cognome_studente", `degrees`.`name` AS "Corso di Laurea" 
FROM `degrees` 
INNER JOIN `students` 
    ON `students`.`degree_id` = `degrees`.`id` 
WHERE `degrees`.`name` = 'Corso di Laurea in Economia';

-- 2. Selezionare tutti i Corsi di Laurea Magistrale del Dipartimento di Neuroscienze 

SELECT `departments`.`name` AS "Dipartimento", `degrees`.`name` AS "Corso di Laurea", `degrees`.`level` AS "Tipologia"
FROM `departments`
INNER JOIN `degrees`
	ON `degrees`.`department_id` = `departments`.`id`
WHERE `departments`.`name` = "Dipartimento di Neuroscienze"
	AND `degrees`.`level` = "magistrale";

-- 3. Selezionare tutti i corsi in cui insegna Fulvio Amato (id=44)

SELECT `courses`.`name` AS "Corso", `teachers`.name AS 'Nome', `teachers`.surname AS 'Cognome', `teachers`.id AS 'id' 
FROM `courses`
INNER JOIN `course_teacher`
	ON `courses`.id = `course_teacher`.`course_id`
INNER JOIN `teachers`
	ON `teachers`.`id` = `course_teacher`.`teacher_id` 
WHERE `teachers`.`id`= 44;

-- 4. Selezionare tutti gli studenti con i dati relativi al corso di laurea a cui sono iscritti e il relativo dipartimento, in ordine alfabetico per cognome e nome 

SELECT `students`.`name` AS "Nome", `students`.`surname` AS "Cognome", `degrees`.*, `departments`.`name` AS "Dipartimento"
FROM `students`
INNER JOIN `degrees`
	ON `students`.`id` = `degrees`.`id`
INNER JOIN `departments`
	ON `degrees`.`department_id` = `departments`.`id`
ORDER BY `students`.`name`, `students`.`surname` ASC;

-- 5. Selezionare tutti i corsi di laurea con i relativi corsi e insegnanti 

SELECT `degrees`.`name` AS "Corsi di Laurea",`courses`.`name` AS "Corso",`teachers`.`name` AS "Nome",`teachers`.`surname` AS "Cognome"
FROM `degrees`
JOIN `courses`
    ON `courses`.`degree_id` = `degrees`.`id`
JOIN `course_teacher`
    ON `course_teacher`.`course_id` = `courses`.`id`
JOIN `teachers`
    ON `teachers`.`id` = `course_teacher`.`teacher_id`;

-- 6. Selezionare tutti i docenti che insegnano nel Dipartimento di Matematica (64) 

SELECT `departments`.`name` AS "Dipartimento", `teachers`.`surname` AS "Cognome", `teachers`.`name` AS "Nome", `degrees`.`name` AS "Corso"
FROM `departments`
JOIN `degrees`
    ON `degrees`.`department_id` = `departments`.`id`
JOIN `courses`
    ON `courses`.`degree_id` = `degrees`.`id`
JOIN `course_teacher`
    ON `course_teacher`.`course_id` = `courses`.`id`
JOIN `teachers`
    ON `teachers`.`id` = `course_teacher`.`teacher_id`
WHERE `departments`.`name` = 'Dipartimento di Matematica';
