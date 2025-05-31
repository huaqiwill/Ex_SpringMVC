package org.example.service.impl;

import org.example.mapper.StudentMapper;
import org.example.pojo.Student;
import org.example.service.StudentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class StudentServiceImpl implements StudentService {
    
    @Autowired
    private StudentMapper studentMapper;
    
    @Override
    @Transactional
    public boolean addStudent(Student student) {
        return studentMapper.insertStudent(student) > 0;
    }
    
    @Override
    public Student getStudentById(Integer id) {
        return studentMapper.selectStudentById(id);
    }
    
    @Override
    public Student getStudentWithScoresById(Integer id) {
        return studentMapper.selectStudentWithScoresById(id);
    }
    
    @Override
    public List<Student> getStudentsByName(String name) {
        return studentMapper.selectStudentsByName(name);
    }
    
    @Override
    @Transactional
    public boolean updateStudent(Student student) {
        return studentMapper.updateStudent(student) > 0;
    }
    
    @Override
    @Transactional
    public boolean deleteStudent(Integer id) {
        return studentMapper.deleteStudent(id) > 0;
    }
}