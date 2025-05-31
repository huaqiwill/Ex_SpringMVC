package org.example.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class IndexController {

    @GetMapping("/")
    public String index() {
        // 将根路径请求重定向到学生列表页面
        return "redirect:/student";
    }

    @GetMapping("/test")
    @ResponseBody
    public String test() {
        return "Hello World!";
    }
}
