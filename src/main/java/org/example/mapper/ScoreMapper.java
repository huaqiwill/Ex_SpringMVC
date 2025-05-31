package org.example.mapper;

import org.apache.ibatis.annotations.Param;
import org.example.pojo.Score;

import java.util.List;

public interface ScoreMapper {
    
    /**
     * 添加成绩
     * @param score 成绩对象
     * @return 影响行数
     */
    int insertScore(Score score);
    
    /**
     * 根据ID查询成绩
     * @param id 成绩ID
     * @return 成绩对象
     */
    Score selectScoreById(Integer id);
    
    /**
     * 根据学生ID查询成绩
     * @param studentId 学生ID
     * @return 成绩列表
     */
    List<Score> selectScoresByStudentId(Integer studentId);
    
    /**
     * 根据课程ID查询成绩
     * @param courseId 课程ID
     * @return 成绩列表
     */
    List<Score> selectScoresByCourseId(Integer courseId);
    
    /**
     * 动态SQL查询：根据学生姓名、课程名称和成绩范围进行查询
     * @param studentName 学生姓名（模糊查询）
     * @param courseName 课程名称（模糊查询）
     * @param minScore 最低分数
     * @param maxScore 最高分数
     * @return 成绩列表
     */
    List<Score> selectScoresByCondition(
            @Param("studentName") String studentName,
            @Param("courseName") String courseName,
            @Param("minScore") Double minScore,
            @Param("maxScore") Double maxScore);
    
    /**
     * 更新成绩
     * @param score 成绩对象
     * @return 影响行数
     */
    int updateScore(Score score);
    
    /**
     * 删除成绩
     * @param id 成绩ID
     * @return 影响行数
     */
    int deleteScore(Integer id);
}