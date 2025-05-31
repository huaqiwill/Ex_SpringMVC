package org.example.controller;

import org.example.pojo.Student;
import org.example.service.StudentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.List;

@Controller
@RequestMapping("/student")
public class StudentController {
    
    @Autowired
    private StudentService studentService;
    
    /**
     * 显示学生列表
     */
    @GetMapping("")
    public String listStudents(Model model) {
        List<Student> students = studentService.getStudentsByName("");
        model.addAttribute("students", students);
        return "student/list";
    }
    
    /**
     * 显示添加学生表单
     */
    @GetMapping("/add")
    public String showAddForm(Model model) {
        model.addAttribute("student", new Student());
        return "student/add";
    }
    
    /**
     * 处理添加学生请求
     */
    @PostMapping("/add")
    public String addStudent(Student student, RedirectAttributes redirectAttributes) {
        boolean success = studentService.addStudent(student);
        if (success) {
            redirectAttributes.addFlashAttribute("message", "学生添加成功！");
        } else {
            redirectAttributes.addFlashAttribute("error", "学生添加失败！");
        }
        return "redirect:/student";
    }
    
    /**
     * 显示学生详情（包含成绩）
     */
    @GetMapping("/{id}")
    public String showStudentDetail(@PathVariable Integer id, Model model) {
        Student student = studentService.getStudentWithScoresById(id);
        if (student == null) {
            return "redirect:/student";
        }
        model.addAttribute("student", student);
        return "student/detail";
    }
    
    /**
     * 显示编辑学生表单
     */
    @GetMapping("/edit/{id}")
    public String showEditForm(@PathVariable Integer id, Model model) {
        Student student = studentService.getStudentById(id);
        if (student == null) {
            return "redirect:/student";
        }
        model.addAttribute("student", student);
        return "student/edit";
    }
    
    /**
     * 处理编辑学生请求
     */
    @PostMapping("/edit/{id}")
    public String updateStudent(@PathVariable Integer id, Student student, RedirectAttributes redirectAttributes) {
        student.setId(id);
        boolean success = studentService.updateStudent(student);
        if (success) {
            redirectAttributes.addFlashAttribute("message", "学生信息更新成功！");
        } else {
            redirectAttributes.addFlashAttribute("error", "学生信息更新失败！");
        }
        return "redirect:/student";
    }
    
    /**
     * 处理删除学生请求
     */
    @GetMapping("/delete/{id}")
    public String deleteStudent(@PathVariable Integer id, RedirectAttributes redirectAttributes) {
        boolean success = studentService.deleteStudent(id);
        if (success) {
            redirectAttributes.addFlashAttribute("message", "学生删除成功！");
        } else {
            redirectAttributes.addFlashAttribute("error", "学生删除失败！");
        }
        return "redirect:/student";
    }
    
    /**
     * 根据姓名搜索学生
     */
    @GetMapping("/search")
    public String searchStudents(@RequestParam(required = false) String name, Model model) {
        List<Student> students = studentService.getStudentsByName(name);
        model.addAttribute("students", students);
        model.addAttribute("searchName", name);
        return "student/list";
    }
}