package org.example.controller;

import org.example.pojo.Course;
import org.example.pojo.Score;
import org.example.pojo.Student;
import org.example.service.CourseService;
import org.example.service.ScoreService;
import org.example.service.StudentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.List;

@Controller
@RequestMapping("/score")
public class ScoreController {
    
    @Autowired
    private ScoreService scoreService;
    
    @Autowired
    private StudentService studentService;
    
    @Autowired
    private CourseService courseService;
    
    /**
     * 显示成绩列表
     */
    @GetMapping("")
    public String listScores(Model model) {
        List<Score> scores = scoreService.getScoresByCondition(null, null, null, null);
        model.addAttribute("scores", scores);
        return "score/list";
    }
    
    /**
     * 显示添加成绩表单
     */
    @GetMapping("/add")
    public String showAddForm(Model model) {
        List<Student> students = studentService.getStudentsByName("");
        List<Course> courses = courseService.getCoursesByName("");
        
        model.addAttribute("score", new Score());
        model.addAttribute("students", students);
        model.addAttribute("courses", courses);
        return "score/add";
    }
    
    /**
     * 处理添加成绩请求
     */
    @PostMapping("/add")
    public String addScore(Score score, RedirectAttributes redirectAttributes) {
        boolean success = scoreService.addScore(score);
        if (success) {
            redirectAttributes.addFlashAttribute("message", "成绩添加成功！");
        } else {
            redirectAttributes.addFlashAttribute("error", "成绩添加失败！");
        }
        return "redirect:/score";
    }
    
    /**
     * 显示编辑成绩表单
     */
    @GetMapping("/edit/{id}")
    public String showEditForm(@PathVariable Integer id, Model model) {
        Score score = scoreService.getScoreById(id);
        if (score == null) {
            return "redirect:/score";
        }
        
        List<Student> students = studentService.getStudentsByName("");
        List<Course> courses = courseService.getCoursesByName("");
        
        model.addAttribute("score", score);
        model.addAttribute("students", students);
        model.addAttribute("courses", courses);
        return "score/edit";
    }
    
    /**
     * 处理编辑成绩请求
     */
    @PostMapping("/edit/{id}")
    public String updateScore(@PathVariable Integer id, Score score, RedirectAttributes redirectAttributes) {
        score.setId(id);
        boolean success = scoreService.updateScore(score);
        if (success) {
            redirectAttributes.addFlashAttribute("message", "成绩更新成功！");
        } else {
            redirectAttributes.addFlashAttribute("error", "成绩更新失败！");
        }
        return "redirect:/score";
    }
    
    /**
     * 处理删除成绩请求
     */
    @GetMapping("/delete/{id}")
    public String deleteScore(@PathVariable Integer id, RedirectAttributes redirectAttributes) {
        boolean success = scoreService.deleteScore(id);
        if (success) {
            redirectAttributes.addFlashAttribute("message", "成绩删除成功！");
        } else {
            redirectAttributes.addFlashAttribute("error", "成绩删除失败！");
        }
        return "redirect:/score";
    }
    
    /**
     * 动态条件查询成绩
     */
    @GetMapping("/search")
    public String searchScores(
            @RequestParam(required = false) String studentName,
            @RequestParam(required = false) String courseName,
            @RequestParam(required = false) Double minScore,
            @RequestParam(required = false) Double maxScore,
            Model model) {
        
        List<Score> scores = scoreService.getScoresByCondition(studentName, courseName, minScore, maxScore);
        
        model.addAttribute("scores", scores);
        model.addAttribute("studentName", studentName);
        model.addAttribute("courseName", courseName);
        model.addAttribute("minScore", minScore);
        model.addAttribute("maxScore", maxScore);
        
        return "score/list";
    }
}