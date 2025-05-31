<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>编辑课程</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-100">
    <div class="container mx-auto px-4 py-8">
        <div class="max-w-md mx-auto bg-white rounded-lg shadow-md overflow-hidden">
            <div class="px-6 py-4 bg-indigo-500">
                <h2 class="text-xl font-bold text-white">编辑课程</h2>
            </div>
            
            <form action="${pageContext.request.contextPath}/course/edit/${course.id}" method="post" class="p-6">
                <div class="mb-4">
                    <label for="courseName" class="block text-gray-700 text-sm font-bold mb-2">课程名称:</label>
                    <input type="text" id="courseName" name="courseName" value="${course.courseName}" required 
                           class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline">
                </div>
                
                <div class="mb-6">
                    <label for="teacherName" class="block text-gray-700 text-sm font-bold mb-2">任课教师:</label>
                    <input type="text" id="teacherName" name="teacherName" value="${course.teacherName}" required
                           class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline">
                </div>
                
                <div class="flex items-center justify-between">
                    <button type="submit" class="bg-indigo-500 hover:bg-indigo-700 text-white font-bold py-2 px-4 rounded focus:outline-none focus:shadow-outline">
                        更新
                    </button>
                    <a href="${pageContext.request.contextPath}/course" class="inline-block align-baseline font-bold text-sm text-indigo-500 hover:text-indigo-800">
                        返回列表
                    </a>
                </div>
            </form>
        </div>
    </div>
</body>
</html>