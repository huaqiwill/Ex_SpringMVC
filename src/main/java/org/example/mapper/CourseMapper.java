package org.example.mapper;

import org.apache.ibatis.annotations.Param;
import org.example.pojo.Course;
import org.example.pojo.Student;

import java.util.List;

public interface CourseMapper {
    
    /**
     * 添加课程
     * @param course 课程对象
     * @return 影响行数
     */
    int insertCourse(Course course);
    
    /**
     * 根据ID查询课程
     * @param id 课程ID
     * @return 课程对象
     */
    Course selectCourseById(Integer id);
    
    /**
     * 根据课程名称查询课程
     * @param courseName 课程名称
     * @return 课程列表
     */
    List<Course> selectCoursesByName(@Param("courseName") String courseName);
    
    /**
     * 根据课程名称查询选修该课程的所有学生及其成绩（多表联合查询）
     * @param courseName 课程名称
     * @return 包含学生和成绩信息的课程对象
     */
    List<Student> selectStudentsByCourse(@Param("courseName") String courseName);
    
    /**
     * 更新课程信息
     * @param course 课程对象
     * @return 影响行数
     */
    int updateCourse(Course course);
    
    /**
     * 删除课程
     * @param id 课程ID
     * @return 影响行数
     */
    int deleteCourse(Integer id);
}