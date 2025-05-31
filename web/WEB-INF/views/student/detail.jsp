<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>学生详情</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-100">
    <div class="container mx-auto px-4 py-8">
        <div class="bg-white rounded-lg shadow-md overflow-hidden mb-6">
            <div class="px-6 py-4 bg-blue-500">
                <h2 class="text-xl font-bold text-white">学生详情</h2>
            </div>
            
            <div class="p-6">
                <div class="grid grid-cols-2 gap-4 mb-6">
                    <div>
                        <p class="text-gray-600 text-sm">ID</p>
                        <p class="text-gray-900 font-medium">${student.id}</p>
                    </div>
                    <div>
                        <p class="text-gray-600 text-sm">姓名</p>
                        <p class="text-gray-900 font-medium">${student.name}</p>
                    </div>
                    <div>
                        <p class="text-gray-600 text-sm">年龄</p>
                        <p class="text-gray-900 font-medium">${student.age}</p>
                    </div>
                    <div>
                        <p class="text-gray-600 text-sm">性别</p>
                        <p class="text-gray-900 font-medium">${student.gender}</p>
                    </div>
                </div>
                
                <div class="flex justify-end space-x-2">
                    <a href="${pageContext.request.contextPath}/student/edit/${student.id}" class="bg-indigo-500 hover:bg-indigo-600 text-white px-4 py-2 rounded">
                        编辑
                    </a>
                    <a href="${pageContext.request.contextPath}/student" class="bg-gray-500 hover:bg-gray-600 text-white px-4 py-2 rounded">
                        返回列表
                    </a>
                </div>
            </div>
        </div>
        
        <!-- 成绩列表 -->
        <div class="bg-white rounded-lg shadow-md overflow-hidden">
            <div class="px-6 py-4 bg-green-500 flex justify-between items-center">
                <h2 class="text-xl font-bold text-white">课程成绩</h2>
                <a href="${pageContext.request.contextPath}/score/add?studentId=${student.id}" class="bg-white text-green-500 hover:bg-gray-100 px-4 py-2 rounded">
                    添加成绩
                </a>
            </div>
            
            <div class="p-6">
                <c:if test="${empty student.scoreList}">
                    <p class="text-gray-500 text-center py-4">该学生暂无成绩记录</p>
                </c:if>
                
                <c:if test="${not empty student.scoreList}">
                    <table class="min-w-full divide-y divide-gray-200">
                        <thead class="bg-gray-50">
                            <tr>
                                <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">课程名称</th>
                                <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">任课教师</th>
                                <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">成绩</th>
                                <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">操作</th>
                            </tr>
                        </thead>
                        <tbody class="bg-white divide-y divide-gray-200">
                            <c:forEach items="${student.scoreList}" var="score">
                                <tr class="hover:bg-gray-50">
                                    <td class="px-6 py-4 whitespace-nowrap text-sm font-medium text-gray-900">${score.course.courseName}</td>
                                    <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-500">${score.course.teacherName}</td>
                                    <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-500">${score.score}</td>
                                    <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-500 space-x-2">
                                        <a href="${pageContext.request.contextPath}/score/edit/${score.id}" class="text-indigo-600 hover:text-indigo-900">编辑</a>
                                        <a href="${pageContext.request.contextPath}/score/delete/${score.id}?returnUrl=/student/${student.id}" class="text-red-600 hover:text-red-900" onclick="return confirm('确定要删除该成绩记录吗？')">删除</a>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </c:if>
            </div>
        </div>
    </div>
</body>
</html>