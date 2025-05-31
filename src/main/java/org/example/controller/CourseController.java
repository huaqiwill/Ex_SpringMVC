package org.example.controller;

import org.example.pojo.Course;
import org.example.pojo.Student;
import org.example.service.CourseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.List;

@Controller
@RequestMapping("/course")
public class CourseController {
    
    @Autowired
    private CourseService courseService;
    
    /**
     * 显示课程列表
     */
    @GetMapping("")
    public String listCourses(Model model) {
        List<Course> courses = courseService.getCoursesByName("");
        model.addAttribute("courses", courses);
        return "course/list";
    }
    
    /**
     * 显示添加课程表单
     */
    @GetMapping("/add")
    public String showAddForm(Model model) {
        model.addAttribute("course", new Course());
        return "course/add";
    }
    
    /**
     * 处理添加课程请求
     */
    @PostMapping("/add")
    public String addCourse(Course course, RedirectAttributes redirectAttributes) {
        boolean success = courseService.addCourse(course);
        if (success) {
            redirectAttributes.addFlashAttribute("message", "课程添加成功！");
        } else {
            redirectAttributes.addFlashAttribute("error", "课程添加失败！");
        }
        return "redirect:/course";
    }
    
    /**
     * 显示课程详情（包含选修该课程的学生）
     */
    @GetMapping("/{id}")
    public String showCourseDetail(@PathVariable Integer id, Model model) {
        Course course = courseService.getCourseById(id);
        if (course == null) {
            return "redirect:/course";
        }
        model.addAttribute("course", course);
        return "course/detail";
    }
    
    /**
     * 显示编辑课程表单
     */
    @GetMapping("/edit/{id}")
    public String showEditForm(@PathVariable Integer id, Model model) {
        Course course = courseService.getCourseById(id);
        if (course == null) {
            return "redirect:/course";
        }
        model.addAttribute("course", course);
        return "course/edit";
    }
    
    /**
     * 处理编辑课程请求
     */
    @PostMapping("/edit/{id}")
    public String updateCourse(@PathVariable Integer id, Course course, RedirectAttributes redirectAttributes) {
        course.setId(id);
        boolean success = courseService.updateCourse(course);
        if (success) {
            redirectAttributes.addFlashAttribute("message", "课程信息更新成功！");
        } else {
            redirectAttributes.addFlashAttribute("error", "课程信息更新失败！");
        }
        return "redirect:/course";
    }
    
    /**
     * 处理删除课程请求
     */
    @GetMapping("/delete/{id}")
    public String deleteCourse(@PathVariable Integer id, RedirectAttributes redirectAttributes) {
        boolean success = courseService.deleteCourse(id);
        if (success) {
            redirectAttributes.addFlashAttribute("message", "课程删除成功！");
        } else {
            redirectAttributes.addFlashAttribute("error", "课程删除失败！");
        }
        return "redirect:/course";
    }
    
    /**
     * 根据课程名称搜索课程
     */
    @GetMapping("/search")
    public String searchCourses(@RequestParam(required = false) String courseName, Model model) {
        List<Course> courses = courseService.getCoursesByName(courseName);
        model.addAttribute("courses", courses);
        model.addAttribute("searchName", courseName);
        return "course/list";
    }
    
    /**
     * 根据课程名称查询选修该课程的所有学生及其成绩
     */
    @GetMapping("/students")
    public String getStudentsByCourse(@RequestParam String courseName, Model model) {
        List<Student> students = courseService.getStudentsByCourse(courseName);
        model.addAttribute("students", students);
        model.addAttribute("courseName", courseName);
        return "course/students";
    }
}