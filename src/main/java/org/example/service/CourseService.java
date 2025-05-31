package org.example.service;

import org.example.pojo.Course;
import org.example.pojo.Student;

import java.util.List;

public interface CourseService {
    
    /**
     * 添加课程
     * @param course 课程对象
     * @return 是否成功
     */
    boolean addCourse(Course course);
    
    /**
     * 根据ID查询课程
     * @param id 课程ID
     * @return 课程对象
     */
    Course getCourseById(Integer id);
    
    /**
     * 根据课程名称查询课程
     * @param courseName 课程名称
     * @return 课程列表
     */
    List<Course> getCoursesByName(String courseName);
    
    /**
     * 根据课程名称查询选修该课程的所有学生及其成绩（多表联合查询）
     * @param courseName 课程名称
     * @return 学生列表
     */
    List<Student> getStudentsByCourse(String courseName);
    
    /**
     * 更新课程信息
     * @param course 课程对象
     * @return 是否成功
     */
    boolean updateCourse(Course course);
    
    /**
     * 删除课程
     * @param id 课程ID
     * @return 是否成功
     */
    boolean deleteCourse(Integer id);
}