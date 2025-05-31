<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>课程详情</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-100">
    <div class="container mx-auto px-4 py-8">
        <div class="bg-white rounded-lg shadow-md overflow-hidden mb-6">
            <div class="px-6 py-4 bg-blue-500">
                <h2 class="text-xl font-bold text-white">课程详情</h2>
            </div>
            
            <div class="p-6">
                <div class="grid grid-cols-2 gap-4 mb-6">
                    <div>
                        <p class="text-gray-600 text-sm">ID</p>
                        <p class="text-gray-900 font-medium">${course.id}</p>
                    </div>
                    <div>
                        <p class="text-gray-600 text-sm">课程名称</p>
                        <p class="text-gray-900 font-medium">${course.courseName}</p>
                    </div>
                    <div>
                        <p class="text-gray-600 text-sm">任课教师</p>
                        <p class="text-gray-900 font-medium">${course.teacherName}</p>
                    </div>
                </div>
                
                <div class="flex justify-end space-x-2">
                    <a href="${pageContext.request.contextPath}/course/edit/${course.id}" class="bg-indigo-500 hover:bg-indigo-600 text-white px-4 py-2 rounded">
                        编辑
                    </a>
                    <a href="${pageContext.request.contextPath}/course" class="bg-gray-500 hover:bg-gray-600 text-white px-4 py-2 rounded">
                        返回列表
                    </a>
                </div>
            </div>
        </div>
        
        <!-- 选修学生列表 -->
        <div class="bg-white rounded-lg shadow-md overflow-hidden">
            <div class="px-6 py-4 bg-green-500 flex justify-between items-center">
                <h2 class="text-xl font-bold text-white">选修学生</h2>
                <a href="${pageContext.request.contextPath}/score/add?courseId=${course.id}" class="bg-white text-green-500 hover:bg-gray-100 px-4 py-2 rounded">
                    添加学生成绩
                </a>
            </div>
            
            <div class="p-6">
                <c:if test="${empty course.scoreList}">
                    <p class="text-gray-500 text-center py-4">该课程暂无选修学生</p>
                </c:if>
                
                <c:if test="${not empty course.scoreList}">
                    <table class="min-w-full divide-y divide-gray-200">
                        <thead class="bg-gray-50">
                            <tr>
                                <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">学生姓名</th>
                                <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">年龄</th>
                                <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">性别</th>
                                <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">成绩</th>
                                <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">操作</th>
                            </tr>
                        </thead>
                        <tbody class="bg-white divide-y divide-gray-200">
                            <c:forEach items="${course.scoreList}" var="score">
                                <tr class="hover:bg-gray-50">
                                    <td class="px-6 py-4 whitespace-nowrap text-sm font-medium text-gray-900">${score.student.name}</td>
                                    <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-500">${score.student.age}</td>
                                    <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-500">${score.student.gender}</td>
                                    <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-500">${score.score}</td>
                                    <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-500 space-x-2">
                                        <a href="${pageContext.request.contextPath}/score/edit/${score.id}" class="text-indigo-600 hover:text-indigo-900">编辑成绩</a>
                                        <a href="${pageContext.request.contextPath}/score/delete/${score.id}?returnUrl=/course/${course.id}" class="text-red-600 hover:text-red-900" onclick="return confirm('确定要删除该成绩记录吗？')">删除成绩</a>
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