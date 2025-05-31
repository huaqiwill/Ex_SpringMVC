package org.example.service;

import org.example.pojo.Student;

import java.util.List;

public interface StudentService {
    
    /**
     * 添加学生
     * @param student 学生对象
     * @return 是否成功
     */
    boolean addStudent(Student student);
    
    /**
     * 根据ID查询学生
     * @param id 学生ID
     * @return 学生对象
     */
    Student getStudentById(Integer id);
    
    /**
     * 根据ID查询学生及其所有课程成绩（一对多查询）
     * @param id 学生ID
     * @return 包含成绩列表的学生对象
     */
    Student getStudentWithScoresById(Integer id);
    
    /**
     * 根据姓名模糊查询学生
     * @param name 学生姓名
     * @return 学生列表
     */
    List<Student> getStudentsByName(String name);
    
    /**
     * 更新学生信息
     * @param student 学生对象
     * @return 是否成功
     */
    boolean updateStudent(Student student);
    
    /**
     * 删除学生
     * @param id 学生ID
     * @return 是否成功
     */
    boolean deleteStudent(Integer id);
}