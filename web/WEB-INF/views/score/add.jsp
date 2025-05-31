<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>添加成绩</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-100">
    <div class="container mx-auto px-4 py-8">
        <div class="max-w-md mx-auto bg-white rounded-lg shadow-md overflow-hidden">
            <div class="px-6 py-4 bg-blue-500">
                <h2 class="text-xl font-bold text-white">添加成绩</h2>
            </div>
            
            <form action="${pageContext.request.contextPath}/score/add" method="post" class="p-6">
                <div class="mb-4">
                    <label for="studentId" class="block text-gray-700 text-sm font-bold mb-2">学生:</label>
                    <select id="studentId" name="studentId" required 
                            class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline">
                        <option value="">请选择学生</option>
                        <c:forEach items="${students}" var="student">
                            <option value="${student.id}" ${param.studentId == student.id ? 'selected' : ''}>${student.name}</option>
                        </c:forEach>
                    </select>
                </div>
                
                <div class="mb-4">
                    <label for="courseId" class="block text-gray-700 text-sm font-bold mb-2">课程:</label>
                    <select id="courseId" name="courseId" required 
                            class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline">
                        <option value="">请选择课程</option>
                        <c:forEach items="${courses}" var="course">
                            <option value="${course.id}" ${param.courseId == course.id ? 'selected' : ''}>${course.courseName}</option>
                        </c:forEach>
                    </select>
                </div>
                
                <div class="mb-6">
                    <label for="score" class="block text-gray-700 text-sm font-bold mb-2">成绩:</label>
                    <input type="number" id="score" name="score" required min="0" max="100" step="0.1"
                           class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline">
                </div>
                
                <div class="flex items-center justify-between">
                    <button type="submit" class="bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded focus:outline-none focus:shadow-outline">
                        保存
                    </button>
                    <a href="${pageContext.request.contextPath}/score" class="inline-block align-baseline font-bold text-sm text-blue-500 hover:text-blue-800">
                        返回列表
                    </a>
                </div>
            </form>
        </div>
    </div>
</body>
</html>