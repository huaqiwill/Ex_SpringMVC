<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>成绩详情</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-100">
    <div class="container mx-auto px-4 py-8">
        <div class="max-w-2xl mx-auto bg-white rounded-lg shadow-md overflow-hidden">
            <div class="px-6 py-4 bg-blue-500">
                <h2 class="text-xl font-bold text-white">成绩详情</h2>
            </div>
            
            <div class="p-6">
                <div class="grid grid-cols-2 gap-6 mb-6">
                    <div>
                        <h3 class="text-lg font-semibold text-gray-800 mb-2">学生信息</h3>
                        <div class="bg-gray-50 p-4 rounded">
                            <div class="mb-2">
                                <p class="text-gray-600 text-sm">学生ID</p>
                                <p class="text-gray-900 font-medium">${score.student.id}</p>
                            </div>
                            <div class="mb-2">
                                <p class="text-gray-600 text-sm">姓名</p>
                                <p class="text-gray-900 font-medium">${score.student.name}</p>
                            </div>
                            <div class="mb-2">
                                <p class="text-gray-600 text-sm">年龄</p>
                                <p class="text-gray-900 font-medium">${score.student.age}</p>
                            </div>
                            <div>
                                <p class="text-gray-600 text-sm">性别</p>
                                <p class="text-gray-900 font-medium">${score.student.gender}</p>
                            </div>
                        </div>
                    </div>
                    
                    <div>
                        <h3 class="text-lg font-semibold text-gray-800 mb-2">课程信息</h3>
                        <div class="bg-gray-50 p-4 rounded">
                            <div class="mb-2">
                                <p class="text-gray-600 text-sm">课程ID</p>
                                <p class="text-gray-900 font-medium">${score.course.id}</p>
                            </div>
                            <div class="mb-2">
                                <p class="text-gray-600 text-sm">课程名称</p>
                                <p class="text-gray-900 font-medium">${score.course.courseName}</p>
                            </div>
                            <div>
                                <p class="text-gray-600 text-sm">任课教师</p>
                                <p class="text-gray-900 font-medium">${score.course.teacherName}</p>
                            </div>
                        </div>
                    </div>
                </div>
                
                <div class="bg-blue-50 p-4 rounded mb-6">
                    <h3 class="text-lg font-semibold text-blue-800 mb-2">成绩信息</h3>
                    <div class="mb-2">
                        <p class="text-gray-600 text-sm">成绩ID</p>
                        <p class="text-gray-900 font-medium">${score.id}</p>
                    </div>
                    <div>
                        <p class="text-gray-600 text-sm">分数</p>
                        <p class="text-gray-900 font-medium text-xl">${score.score}</p>
                    </div>
                </div>
                
                <div class="flex justify-end space-x-2">
                    <a href="${pageContext.request.contextPath}/score/edit/${score.id}" class="bg-indigo-500 hover:bg-indigo-600 text-white px-4 py-2 rounded">
                        编辑
                    </a>
                    <a href="${pageContext.request.contextPath}/score" class="bg-gray-500 hover:bg-gray-600 text-white px-4 py-2 rounded">
                        返回列表
                    </a>
                </div>
            </div>
        </div>
    </div>
</body>
</html>