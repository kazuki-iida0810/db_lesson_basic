--- Q1
-- db_lessonからdepartmentsのテーブルを作る。
-- department_idのカラム名主キー、NULLを入れない、整数値にし
-- 自動で連続の整数値を作る。そして負の値をイオれないようにする。

-- nameは、２０列まで入れるようにし、NULLを入れないようにする。
-- created_atのタイプは、日時を保存、オプションは、値を指定をしなかった時現在の日時を自動で入れ、
-- updated_at、のタイプは、日時を保存、オプションは作成日時を自動で入れ、更新日時も自動でかえる。

-- 入れ終えたら、desc depaetmentsを実行して、表示内容と一致しているか確認。

-- CREATE TABLE `departments`(
-- `department_id` INT unsigned auto_increment PRIMARY KEY,
-- name VARCHAR(20) NOT NULL,
-- `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
-- updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP);

-- Q2
-- peopleテーブルを変更
-- emailの後にdepartment_idを移動し
-- 整数値にし、負の値を入れないようにした。

--ALTER TABLE people MODIFY department_id INT unsigned AFTER email;

-- Q3
-- departmentsのテーブルのnameに営業、開発、経理、人事、情報システムを追加する。

-- INSERT INTO departments (name)
-- VALUES
-- ('営業'),
-- ('開発'),
-- ('経理'),
--  ('人事'),
-- ('情報システム');

-- peopleテーブルに変更し、新たに10人追加しname,email,department,age,genderを追加。
-- 人数比率も指定されているので
-- 営業3人、開発4人、経理1人、人事1人、情報システム1人も入れていく。

-- INSERT INTO people (name, email, department_id, age, gender)
-- VALUES
-- ('大谷翔平', NULL, 1, 32, 1),
-- ('ムーキー・ベッツ', NULL, 1, 34, 1),
--('白石麻衣', NULL, 2, 28, 2),
--  ('岡本和真', NULL, 5, 30, 1),
-- ('前田敦子', NULL, 2, 36, 2),
-- ('杉谷拳士', NULL, 1, 35, 1),
-- ('山本リンダ', NULL, 3, 55, 2),
--  ('藤川球児', NULL, 2, 44, 1),
-- ('橋本環奈', NULL, 2, 24, 2),
-- ('木村拓哉', NULL, 4, 48, 1);


-- reportsテーブルに変更し、先程追加した10人の日報を書く
-- 最低10文字以上。
-- 元々いた人たちは何もいじらない。

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
-- mysql> SELECT * FROM people;で現状どうなっていうるのかを確認する。
-- peopleのテーブルから、所属部署（department_id）が決まっていない未割り当てのすべてのデータを取得する

-- SELECT * FROM people;
--  SELECT * FROM people WHERE department_id IS NULL;

-- peopleテーブルのdepartment_idから
-- person_idに絞り込み、修正する

-- UPDATE people SET department_id = 2 WHERE person_id = 2;
--  UPDATE people SET department_id = 3 WHERE person_id = 3;
-- UPDATE people SET department_id = 4 WHERE person_id = 4;
-- UPDATE people SET department_id = 6 WHERE person_id = 5;
-- UPDATE people SET department_id = 5 WHERE person_id = 6;
-- SELECT * FROM people;

-- Q５
-- 名前と年齢を取得し
-- peopleテーブルから
-- 男性を絞り込み
-- 年齢を降順にする。

-- SELECT name, age 
-- FROM people
-- WHERE  gender = 1
-- ORDER BY age DESC;

-- Q6
-- SELECT（取得）
-- 名前とメールと年齢のカラムから取得する。
-- FROM（どのテーブルから欲しいか）
-- peopleテーブルから
-- WHERE（どのレコード？絞り込み条件は？）
-- department_id` = 1のレコードから絞りこむ。
-- ORDER BY（並び替える）
-- created_at`;のカラムの値を昇順に並び替える。

-- Q7
-- 名前を取得し
-- peopleテーブルから
-- 女性は20歳から29歳まで
-- 男性は40歳から49歳まで絞り込む。

-- SELECT name
-- FROM people
--  WHERE (gender = '2' AND age BETWEEN 20 AND 29)
-- OR
-- (gender = '1' AND age BETWEEN 40 AND 49);

-- Q8
-- 全てのカラムを取得し
-- peopleテーブルから
-- 営業部に所属している人だけを
-- 年齢を昇順で絞りこむ。

-- SELECT *
-- FROM people
-- WHERE department_id = '1'
-- ORDER BY age ASC;

-- Q9
-- 平均年齢を取得し
-- peopleテーブルから
-- 開発部の女性を絞りこむ。
-- カラム名をaverage_ageにする

-- SELECT AVG(age) AS average_age
--  FROM people
-- WHERE department_id = '2'
-- AND gender = '2';


-- Q10
-- departmentsの部署名、 peopleの名前、reportsの日報カラムを取得する。
-- peopleテーブルから
-- departments.department_idとpeople.department_idと
-- people.person_idとreports.person_idを結合させる。
-- 豊島さんは日報を提出していないので反映されてません。

-- SELECT departments.name AS d,  
-- people.name as p,
-- reports.content AS r
-- FROM people
-- INNER JOIN
-- departments ON departments.department_id = people.department_id 
-- INNER JOIN reports ON people.person_id = reports.person_id;

-- Q11
-- people nameを取得し
-- peopleテーブルから
-- peopleテーブルperson_idとreportsテーブルのperson_id
-- を外部結合をして
-- reportsのperson_idでNULLになっている人を絞りこむ。

-- SELECT
-- p.name
-- FROM
-- people p
-- LEFT OUTER JOIN
-- reports r USING (person_id)
-- WHERE
-- r.person_id IS NULL;  