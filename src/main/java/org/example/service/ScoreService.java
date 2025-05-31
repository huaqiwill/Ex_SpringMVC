package org.example.service;

import org.example.pojo.Score;

import java.util.List;

public interface ScoreService {
    
    /**
     * 添加成绩
     * @param score 成绩对象
     * @return 是否成功
     */
    boolean addScore(Score score);
    
    /**
     * 根据ID查询成绩
     * @param id 成绩ID
     * @return 成绩对象
     */
    Score getScoreById(Integer id);
    
    /**
     * 根据学生ID查询成绩
     * @param studentId 学生ID
     * @return 成绩列表
     */
    List<Score> getScoresByStudentId(Integer studentId);
    
    /**
     * 根据课程ID查询成绩
     * @param courseId 课程ID
     * @return 成绩列表
     */
    List<Score> getScoresByCourseId(Integer courseId);
    
    /**
     * 动态SQL查询：根据学生姓名、课程名称和成绩范围进行查询
     * @param studentName 学生姓名（模糊查询）
     * @param courseName 课程名称（模糊查询）
     * @param minScore 最低分数
     * @param maxScore 最高分数
     * @return 成绩列表
     */
    List<Score> getScoresByCondition(String studentName, String courseName, Double minScore, Double maxScore);
    
    /**
     * 更新成绩
     * @param score 成绩对象
     * @return 是否成功
     */
    boolean updateScore(Score score);
    
    /**
     * 删除成绩
     * @param id 成绩ID
     * @return 是否成功
     */
    boolean deleteScore(Integer id);
}