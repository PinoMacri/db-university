-- 1) Selezionare tutti gli studenti iscritti al corso di laurea in economia
SELECT `degrees`.`name` , `students`.`name` FROM `degrees` JOIN `students` ON `students`.`degree_id` = `degrees`.`id` WHERE `degrees`.`name` = 'Corso di Laurea in Economia';
--2) Selezionare tutti i corsi di laurea del dipartimento di neuroscienze
SELECT `departments`.`name` , `degrees`.`name` FROM `departments` JOIN `degrees` ON `departments`.`id` = `degrees`.`department_id` WHERE `departments`.`name` = 'Dipartimento di Neuroscienze';
--3) Selezionare tutti i corsi in cui insegna Fulvio Amato (id=44)
SELECT * FROM `course_teacher` WHERE `course_teacher`.`teacher_id` = 44;
--4) Selezionare tutti gli studenti con i dati relativi al corso di laurea a cui sono iscritti e il relativo dipartimento, in ordine alfabetico per cognome e nome
SELECT `students`. `name` AS'Nome',  `students`.`surname` AS 'Cognome', `degrees`.`name` AS 'Tipo di Corso' ,`degrees`.`level` AS 'Livello',`degrees`.`address`AS 'Sede Operativa',`degrees`.`email`AS 'Email' ,`degrees`.`website` AS 'Sito Web' 
FROM `degrees` 
JOIN `students` 
ON `students`.`degree_id` = `degrees`.`id`
ORDER BY `students`.`surname`,`students`.`name`;
--5) Selezionare tutti i corsi di laurea con i relativi corsi e insegnanti
SELECT  `teachers`.`name` AS 'Nome Docente',  `teachers`.`surname` AS 'Cognome Docente', `degrees`.`name` AS 'Nome Corso', `courses`.`name`AS 'Tipo Corso'
FROM `degrees`
JOIN `courses`
ON `degrees`.`id` = `courses`.`degree_id`
JOIN `course_teacher`
ON `courses`.`id` = `course_teacher`.`course_id`
JOIN `teachers`
ON `teachers`.`id` = `course_teacher`.`teacher_id`;
--6) Selezionare tutti i docenti che insegnano nel dipartimenti di matematica (54)
SELECT DISTINCT `teachers`.`name` AS'Nome', `teachers`.`surname` AS'Cognome' ,`departments`.`name` 'Dipartimenti di Competenza (Verifica)'
FROM `teachers`
JOIN `course_teacher`
ON `teachers`.`id` = `course_teacher`.`teacher_id`
JOIN `courses`
ON `courses`.`id` = `course_teacher`.`course_id`
JOIN `degrees`
ON `degrees`.`id` = `courses`.`degree_id`
JOIN `departments`
ON `departments`.`id` = `degrees`.`department_id`
WHERE `departments`.`name` = 'Dipartimento di Matematica';
