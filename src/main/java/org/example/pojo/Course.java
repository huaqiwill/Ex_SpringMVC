package org.example.pojo;

import java.util.List;

public class Course {
    private Integer id;
    private String courseName;
    private String teacherName;
    
    // 一对多关系：一个课程有多个成绩
    private List<Score> scoreList;
    
    // 构造方法
    public Course() {
    }
    
    public Course(Integer id, String courseName, String teacherName) {
        this.id = id;
        this.courseName = courseName;
        this.teacherName = teacherName;
    }
    
    // Getter和Setter方法
    public Integer getId() {
        return id;
    }
    
    public void setId(Integer id) {
        this.id = id;
    }
    
    public String getCourseName() {
        return courseName;
    }
    
    public void setCourseName(String courseName) {
        this.courseName = courseName;
    }
    
    public String getTeacherName() {
        return teacherName;
    }
    
    public void setTeacherName(String teacherName) {
        this.teacherName = teacherName;
    }
    
    public List<Score> getScoreList() {
        return scoreList;
    }
    
    public void setScoreList(List<Score> scoreList) {
        this.scoreList = scoreList;
    }
    
    @Override
    public String toString() {
        return "Course{" +
                "id=" + id +
                ", courseName='" + courseName + '\'' +
                ", teacherName='" + teacherName + '\'' +
                "}";
    }
}