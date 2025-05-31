package org.example.service.impl;

import org.example.mapper.CourseMapper;
import org.example.pojo.Course;
import org.example.pojo.Student;
import org.example.service.CourseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class CourseServiceImpl implements CourseService {
    
    @Autowired
    private CourseMapper courseMapper;
    
    @Override
    @Transactional
    public boolean addCourse(Course course) {
        return courseMapper.insertCourse(course) > 0;
    }
    
    @Override
    public Course getCourseById(Integer id) {
        return courseMapper.selectCourseById(id);
    }
    
    @Override
    public List<Course> getCoursesByName(String courseName) {
        return courseMapper.selectCoursesByName(courseName);
    }
    
    @Override
    public List<Student> getStudentsByCourse(String courseName) {
        return courseMapper.selectStudentsByCourse(courseName);
    }
    
    @Override
    @Transactional
    public boolean updateCourse(Course course) {
        return courseMapper.updateCourse(course) > 0;
    }
    
    @Override
    @Transactional
    public boolean deleteCourse(Integer id) {
        return courseMapper.deleteCourse(id) > 0;
    }
}