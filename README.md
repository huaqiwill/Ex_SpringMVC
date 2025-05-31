# Ex_SpringMVC 学生成绩管理系统

这是一个基于Spring MVC + MyBatis的学生成绩管理系统，实现了学生、课程和成绩的CRUD操作，以及多表关联查询功能。

## 项目技术栈

- **后端框架**：Spring MVC 5.3.22
- **ORM框架**：MyBatis 3.5.11
- **数据库**：MySQL 8.0
- **连接池**：HikariCP 4.0.3
- **前端视图**：JSP + JSTL
- **构建工具**：Maven
- **JDK版本**：Java 8

## 环境要求

- JDK 8+
- Maven 3.6+
- MySQL 8.0+
- Tomcat 8.5+

## 项目结构

```
├── src/main/java/org/example/
│   ├── controller/       # 控制器层
│   ├── mapper/           # MyBatis映射接口
│   ├── pojo/             # 实体类
│   └── service/          # 服务层
├── src/main/resources/
│   ├── org/example/mapper/  # MyBatis XML映射文件
│   ├── db.properties     # 数据库配置
│   ├── init.sql          # 数据库初始化脚本
│   └── mybatis-config.xml   # MyBatis配置
├── web/
│   ├── WEB-INF/
│   │   ├── views/        # JSP视图
│   │   ├── spring-mvc.xml   # Spring MVC配置
│   │   └── web.xml      # Web应用配置
└── pom.xml              # Maven依赖
```

## 数据库设置

1. 创建MySQL数据库并执行初始化脚本：

```sql
-- 在MySQL中执行以下命令
source /path/to/init.sql
```

或者直接复制`src/main/resources/init.sql`中的内容到MySQL客户端执行。

2. 配置数据库连接：

编辑`src/main/resources/db.properties`文件，修改数据库连接信息：

```properties
db.driver=com.mysql.cj.jdbc.Driver
db.url=jdbc:mysql://localhost:3306/db_student_course_zy2?useSSL=false&serverTimezone=UTC&characterEncoding=utf8
db.username=root
db.password=123456

db.initialSize=5
db.maxActive=20
db.maxIdle=10
db.minIdle=5
```

## 项目构建与运行

1. 导入项目到IDEA
   - 选择 `File` -> `Open` 或 `Import Project`
   - 选择项目根目录，点击 `OK`
   - 选择 `Import project from external model` -> `Maven`
   - 点击 `Next` 直到完成导入

2. 配置Tomcat服务器
   - 点击 `Run` -> `Edit Configurations`
   - 点击 `+` 按钮，选择 `Tomcat Server` -> `Local`
   - 在 `Server` 选项卡中配置Tomcat路径
   - 在 `Deployment` 选项卡中点击 `+` 按钮，选择 `Artifact`
   - 选择 `zy3:war exploded`
   - 设置 `Application context` 为 `/zy3`
   - 点击 `OK` 保存配置

3. 运行项目
   - 点击工具栏中的 `Run` 按钮或使用快捷键 `Shift+F10`
   - IDEA会自动启动Tomcat并部署项目

4. 访问应用
   - 浏览器会自动打开 `http://localhost:8080/zy3/`
   - 如果没有自动打开，请手动在浏览器中输入地址


## 常见问题及解决方案

### 数据库连接问题

- **问题**：无法连接到数据库
- **解决方案**：
  - 确认MySQL服务已启动
  - 检查`db.properties`中的用户名和密码是否正确
  - 确认数据库`db_student_course_zy2`已创建

### 404错误

- **问题**：访问页面出现404错误
- **解决方案**：
  - 确认应用上下文路径是否正确（应为`/zy3`）
  - 检查`web.xml`和`spring-mvc.xml`配置是否正确
  - 确认JSP文件位于正确的目录（`/WEB-INF/views/`）

### 500错误

- **问题**：服务器内部错误
- **解决方案**：
  - 检查Tomcat日志（`%TOMCAT_HOME%/logs/catalina.out`）
  - 确认所有依赖项已正确加载
  - 检查数据库表结构是否与实体类匹配

## 功能说明

### 学生管理

- 学生列表：`/student`
- 添加学生：`/student/add`
- 学生详情：`/student/{id}`
- 编辑学生：`/student/edit/{id}`
- 删除学生：`/student/delete/{id}`

### 课程管理

- 课程列表：`/course`
- 添加课程：`/course/add`
- 课程详情：`/course/{id}`
- 编辑课程：`/course/edit/{id}`
- 删除课程：`/course/delete/{id}`

### 成绩管理

- 成绩列表：`/score`
- 添加成绩：`/score/add`
- 编辑成绩：`/score/edit/{id}`
- 删除成绩：`/score/delete/{id}`

## 数据模型

### 学生(Student)
- id：学生ID
- name：姓名
- age：年龄
- gender：性别
- scoreList：成绩列表（一对多关系）

### 课程(Course)
- id：课程ID
- courseName：课程名称
- teacherName：教师姓名
- scoreList：成绩列表（一对多关系）

### 成绩(Score)
- id：成绩ID
- studentId：学生ID
- courseId：课程ID
- score：分数
- student：学生对象（多对一关系）
- course：课程对象（多对一关系）