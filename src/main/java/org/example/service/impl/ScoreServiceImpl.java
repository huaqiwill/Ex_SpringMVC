package org.example.service.impl;

import org.example.mapper.ScoreMapper;
import org.example.pojo.Score;
import org.example.service.ScoreService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class ScoreServiceImpl implements ScoreService {
    
    @Autowired
    private ScoreMapper scoreMapper;
    
    @Override
    @Transactional
    public boolean addScore(Score score) {
        return scoreMapper.insertScore(score) > 0;
    }
    
    @Override
    public Score getScoreById(Integer id) {
        return scoreMapper.selectScoreById(id);
    }
    
    @Override
    public List<Score> getScoresByStudentId(Integer studentId) {
        return scoreMapper.selectScoresByStudentId(studentId);
    }
    
    @Override
    public List<Score> getScoresByCourseId(Integer courseId) {
        return scoreMapper.selectScoresByCourseId(courseId);
    }
    
    @Override
    public List<Score> getScoresByCondition(String studentName, String courseName, Double minScore, Double maxScore) {
        return scoreMapper.selectScoresByCondition(studentName, courseName, minScore, maxScore);
    }
    
    @Override
    @Transactional
    public boolean updateScore(Score score) {
        return scoreMapper.updateScore(score) > 0;
    }
    
    @Override
    @Transactional
    public boolean deleteScore(Integer id) {
        return scoreMapper.deleteScore(id) > 0;
    }
}