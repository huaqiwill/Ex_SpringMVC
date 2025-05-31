package org.example.pojo;

import java.util.List;

public class Student {
    private Integer id;
    private String name;
    private Integer age;
    private String gender;
    
    // 一对多关系：一个学生有多个成绩
    private List<Score> scoreList;
    
    // 构造方法
    public Student() {
    }
    
    public Student(Integer id, String name, Integer age, String gender) {
        this.id = id;
        this.name = name;
        this.age = age;
        this.gender = gender;
    }
    
    // Getter和Setter方法
    public Integer getId() {
        return id;
    }
    
    public void setId(Integer id) {
        this.id = id;
    }
    
    public String getName() {
        return name;
    }
    
    public void setName(String name) {
        this.name = name;
    }
    
    public Integer getAge() {
        return age;
    }
    
    public void setAge(Integer age) {
        this.age = age;
    }
    
    public String getGender() {
        return gender;
    }
    
    public void setGender(String gender) {
        this.gender = gender;
    }
    
    public List<Score> getScoreList() {
        return scoreList;
    }
    
    public void setScoreList(List<Score> scoreList) {
        this.scoreList = scoreList;
    }
    
    @Override
    public String toString() {
        return "Student{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", age=" + age +
                ", gender='" + gender + '\'' +
                "}";
    }
}