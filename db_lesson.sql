--- Q1
-- 
-- CREATE TABLE `departments`(
-- `department_id` INT unsigned auto_increment PRIMARY KEY,
-- name VARCHAR(20) NOT NULL,
-- `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
-- updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP);

-- Q2
-- 
--ALTER TABLE people MODIFY department_id INT unsigned AFTER email;

-- Q3
-- 
-- INSERT INTO departments (name)
-- VALUES
-- ('営業'),
-- ('開発'),
-- ('経理'),
-- ('人事'),
-- ('情報システム');

-- 
-- INSERT INTO people (name, email, department_id, age, gender)
-- VALUES
-- ('大谷翔平', NULL, 1, 32, 1),
-- ('ムーキー・ベッツ', NULL, 1, 34, 1),
-- ('白石麻衣', NULL, 2, 28, 2),
-- ('岡本和真', NULL, 5, 30, 1),
-- ('前田敦子', NULL, 2, 36, 2),
-- ('杉谷拳士', NULL, 1, 35, 1),
-- ('山本リンダ', NULL, 3, 55, 2),
-- ('藤川球児', NULL, 2, 44, 1),
-- ('橋本環奈', NULL, 2, 24, 2),
-- ('木村拓哉', NULL, 4, 48, 1);


-- INSERT INTO reports (person_id, content)
-- VALUES
-- (7, '憧れるのをやめましょう'),
-- (8, '日本はとても安全なところだ'),
-- (9, '私はアイドルの中心です'),
-- (10, '僕は奈良県で産まれました'),
-- (11, '昔アイドルグループに入ってました'),
-- (12, '野球とお笑いの二刀流です'),
-- (13, '私は歌手で高校野球には人気です'),
-- (14, '火の玉ボールに投げるものです'),
-- (15, '1000年に一度の美女です'),
-- (16, '有名なジャニーズに所属してました');

-- Q4
-- 
-- SELECT * FROM people;
-- SELECT * FROM people WHERE department_id IS NULL;


-- UPDATE people SET department_id = 2 WHERE person_id = 2;
-- UPDATE people SET department_id = 3 WHERE person_id = 3;
-- UPDATE people SET department_id = 4 WHERE person_id = 4;
-- UPDATE people SET department_id = 6 WHERE person_id = 5;
-- UPDATE people SET department_id = 5 WHERE person_id = 6;
-- SELECT * FROM people;

-- Q５ 

-- SELECT name, age 
-- FROM people
-- WHERE  gender = 1
-- ORDER BY age DESC;

-- Q6
-- SELECT（取得）
-- 名前とメールと年齢のカラムを取得する。
-- FROM（どのテーブルから欲しいか）
-- peopleテーブルから
-- WHERE（どのレコード？絞り込み条件は？）
-- department_id` = 1のレコードから絞りこむ。
-- ORDER BY（並び替える）
-- created_at`;のカラムの値を昇順に並び替える。

-- Q7
-- 
-- SELECT name
-- FROM people
-- WHERE (gender = '2' AND age BETWEEN 20 AND 29)
-- OR
-- (gender = '1' AND age BETWEEN 40 AND 49);

-- Q8
-- 
-- SELECT *
-- FROM people
-- WHERE department_id = '1'
-- ORDER BY age ASC;

-- Q9
-- 
-- SELECT AVG(age) AS average_age
-- FROM people
-- WHERE department_id = '2'
-- AND gender = '2';


-- Q10
-- 
-- SELECT departments.name AS d,  
-- people.name AS p,
-- reports.content AS r
-- FROM people
-- INNER JOIN
-- departments ON departments.department_id = people.department_id 
-- INNER JOIN reports ON people.person_id = reports.person_id;

-- Q11

-- SELECT
-- p.name
-- FROM
-- people p
-- LEFT OUTER JOIN
-- reports r USING (person_id)
-- WHERE
-- r.person_id IS NULL;  