<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>课程列表</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-100">
    <div class="container mx-auto px-4 py-8">
        <div class="flex justify-between items-center mb-6">
            <h1 class="text-2xl font-bold text-gray-800">课程管理</h1>
            <div class="flex space-x-2">
                <a href="${pageContext.request.contextPath}/course/add" class="bg-blue-500 hover:bg-blue-600 text-white px-4 py-2 rounded">
                    添加课程
                </a>
                <a href="${pageContext.request.contextPath}/student" class="bg-green-500 hover:bg-green-600 text-white px-4 py-2 rounded">
                    学生管理
                </a>
                <a href="${pageContext.request.contextPath}/score" class="bg-purple-500 hover:bg-purple-600 text-white px-4 py-2 rounded">
                    成绩管理
                </a>
            </div>
        </div>
        
        <!-- 消息提示 -->
        <c:if test="${not empty message}">
            <div class="bg-green-100 border border-green-400 text-green-700 px-4 py-3 rounded mb-4">
                ${message}
            </div>
        </c:if>
        <c:if test="${not empty error}">
            <div class="bg-red-100 border border-red-400 text-red-700 px-4 py-3 rounded mb-4">
                ${error}
            </div>
        </c:if>
        
        <!-- 搜索表单 -->
        <div class="bg-white p-4 rounded shadow mb-6">
            <form action="${pageContext.request.contextPath}/course/search" method="get" class="flex items-center">
                <input type="text" name="courseName" value="${searchCourseName}" placeholder="输入课程名称搜索" 
                       class="border rounded px-3 py-2 w-64 focus:outline-none focus:ring-2 focus:ring-blue-500">
                <button type="submit" class="ml-2 bg-blue-500 hover:bg-blue-600 text-white px-4 py-2 rounded">
                    搜索
                </button>
            </form>
        </div>
        
        <!-- 课程列表 -->
        <div class="bg-white rounded shadow overflow-hidden">
            <table class="min-w-full divide-y divide-gray-200">
                <thead class="bg-gray-50">
                    <tr>
                        <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">ID</th>
                        <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">课程名称</th>
                        <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">任课教师</th>
                        <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">操作</th>
                    </tr>
                </thead>
                <tbody class="bg-white divide-y divide-gray-200">
                    <c:forEach items="${courses}" var="course">
                        <tr class="hover:bg-gray-50">
                            <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-500">${course.id}</td>
                            <td class="px-6 py-4 whitespace-nowrap text-sm font-medium text-gray-900">${course.courseName}</td>
                            <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-500">${course.teacherName}</td>
                            <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-500 space-x-2">
                                <a href="${pageContext.request.contextPath}/course/${course.id}" class="text-blue-600 hover:text-blue-900">查看</a>
                                <a href="${pageContext.request.contextPath}/course/edit/${course.id}" class="text-indigo-600 hover:text-indigo-900">编辑</a>
                                <a href="${pageContext.request.contextPath}/course/delete/${course.id}" class="text-red-600 hover:text-red-900" onclick="return confirm('确定要删除该课程吗？')">删除</a>
                            </td>
                        </tr>
                    </c:forEach>
                    
                    <c:if test="${empty courses}">
                        <tr>
                            <td colspan="4" class="px-6 py-4 text-center text-gray-500">暂无课程数据</td>
                        </tr>
                    </c:if>
                </tbody>
            </table>
        </div>
    </div>
</body>
</html>