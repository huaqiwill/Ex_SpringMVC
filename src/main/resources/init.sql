-- 创建数据库
CREATE DATABASE IF NOT EXISTS db_student_course_zy2 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

USE db_student_course_zy2;

-- 创建学生表
CREATE TABLE IF NOT EXISTS student (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL,
    age INT NOT NULL,
    gender VARCHAR(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- 创建课程表
CREATE TABLE IF NOT EXISTS course (
    id INT PRIMARY KEY AUTO_INCREMENT,
    course_name VARCHAR(100) NOT NULL,
    teacher_name VARCHAR(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- 创建成绩表
CREATE TABLE IF NOT EXISTS score (
    id INT PRIMARY KEY AUTO_INCREMENT,
    student_id INT NOT NULL,
    course_id INT NOT NULL,
    score DECIMAL(5,2) NOT NULL,
    FOREIGN KEY (student_id) REFERENCES student(id) ON DELETE CASCADE,
    FOREIGN KEY (course_id) REFERENCES course(id) ON DELETE CASCADE,
    UNIQUE KEY unique_student_course (student_id, course_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- 插入示例数据
-- 学生数据
INSERT INTO student (name, age, gender) VALUES
('张三', 20, '男'),
('李四', 19, '男'),
('王五', 21, '男'),
('赵六', 20, '女'),
('钱七', 22, '女');

-- 课程数据
INSERT INTO course (course_name, teacher_name) VALUES
('Java程序设计', '陈老师'),
('数据库原理', '李老师'),
('Web开发技术', '王老师'),
('操作系统', '张老师'),
('计算机网络', '刘老师');

-- 成绩数据
INSERT INTO score (student_id, course_id, score) VALUES
(1, 1, 85.5),
(1, 2, 90.0),
(1, 3, 82.5),
(2, 1, 78.0),
(2, 2, 86.5),
(2, 4, 92.0),
(3, 2, 89.5),
(3, 3, 94.0),
(3, 5, 88.0),
(4, 1, 95.5),
(4, 4, 91.0),
(4, 5, 87.5),
(5, 3, 93.0),
(5, 4, 84.5),
(5, 5, 90.5);