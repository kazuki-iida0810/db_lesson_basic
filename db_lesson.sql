-- Q1
-- db_lessonからdepartmentsのテーブルを作る。
-- department_idのカラム名主キー、NULLを入れない、整数値にし
-- 自動で連続の整数値を作る。そして負の値をイオれないようにする。

-- nameは、２０列まで入れるようにし、NULLを入れないようにする。
-- created_atのタイプは、日時を保存、オプションは、値を指定をしなかった時現在の日時を自動で入れ、
-- updated_at、のタイプは、日時を保存、オプションは作成日時を自動で入れ、更新日時も自動でかえる。

-- 入れ終えたら、desc depaetmentsを実行して、表示内容と一致しているか確認。

-- Q2
-- peopleテーブルを変更
-- emailの後にdepartment_idを移動し
-- 整数値にし、負の値を入れないようにした。

-- Q3
-- departmentsのテーブルのnameに営業、開発、経理、人事、情報システムを追加する。

-- peopleテーブルに変更し、新たに10人追加しname,email,department,age,genderを追加。
-- 人数比率も指定されているので
-- 営業3人、開発4人、経理1人、人事1人、情報システム1人も入れていく。

-- reportsテーブルに変更し、先程追加した10人の日報を書く
-- 最低10文字以上。
-- 元々いた人たちは何もいじらない。

-- Q4
-- mysql> SELECT * FROM people;で現状どうなっていうるのかを確認する。
-- peopleのテーブルから、所属部署（department_id）が決まっていない未割り当てのすべてのデータを取得する

-- peopleテーブルのdepartment_idから
-- person_idに絞り込み、修正する

-- Q５
-- 名前と年齢を取得し
-- peopleテーブルから
-- 男性を絞り込み
-- 年齢を降順にする。

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

-- Q8
-- 全てのカラムを取得し
-- peopleテーブルから
-- 営業部に所属している人だけを
-- 年齢を昇順で絞りこむ。

-- Q9
-- 平均年齢を取得し
-- peopleテーブルから
-- 開発部の女性を絞りこむ。
-- カラム名をaverage_ageにする

-- Q10
-- departmentsの部署名、 peopleの名前、reportsの日報カラムを取得する。
-- peopleテーブルから
-- departments.department_idとpeople.department_idと
-- people.person_idとreports.person_idを結合させる。
-- 豊島さんは日報を提出していないので反映されてません。

-- Q11
-- people nameを取得し
-- peopleテーブルから
-- peopleテーブルperson_idとreportsテーブルのperson_id
-- を外部結合をして
-- reportsのperson_idでNULLになっている人を絞りこむ。
