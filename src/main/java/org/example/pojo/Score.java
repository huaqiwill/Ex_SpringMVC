package org.example.pojo;

public class Score {
    private Integer id;
    private Integer studentId;
    private Integer courseId;
    private Double score;
    
    // 多对一关系：多个成绩对应一个学生
    private Student student;
    
    // 多对一关系：多个成绩对应一个课程
    private Course course;
    
    // 构造方法
    public Score() {
    }
    
    public Score(Integer id, Integer studentId, Integer courseId, Double score) {
        this.id = id;
        this.studentId = studentId;
        this.courseId = courseId;
        this.score = score;
    }
    
    // Getter和Setter方法
    public Integer getId() {
        return id;
    }
    
    public void setId(Integer id) {
        this.id = id;
    }
    
    public Integer getStudentId() {
        return studentId;
    }
    
    public void setStudentId(Integer studentId) {
        this.studentId = studentId;
    }
    
    public Integer getCourseId() {
        return courseId;
    }
    
    public void setCourseId(Integer courseId) {
        this.courseId = courseId;
    }
    
    public Double getScore() {
        return score;
    }
    
    public void setScore(Double score) {
        this.score = score;
    }
    
    public Student getStudent() {
        return student;
    }
    
    public void setStudent(Student student) {
        this.student = student;
    }
    
    public Course getCourse() {
        return course;
    }
    
    public void setCourse(Course course) {
        this.course = course;
    }
    
    @Override
    public String toString() {
        return "Score{" +
                "id=" + id +
                ", studentId=" + studentId +
                ", courseId=" + courseId +
                ", score=" + score +
                "}";
    }
}