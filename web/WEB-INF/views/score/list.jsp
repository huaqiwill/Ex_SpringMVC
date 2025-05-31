<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>成绩列表</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-100">
    <div class="container mx-auto px-4 py-8">
        <div class="flex justify-between items-center mb-6">
            <h1 class="text-2xl font-bold text-gray-800">成绩管理</h1>
            <div class="flex space-x-2">
                <a href="${pageContext.request.contextPath}/score/add" class="bg-blue-500 hover:bg-blue-600 text-white px-4 py-2 rounded">
                    添加成绩
                </a>
                <a href="${pageContext.request.contextPath}/student" class="bg-green-500 hover:bg-green-600 text-white px-4 py-2 rounded">
                    学生管理
                </a>
                <a href="${pageContext.request.contextPath}/course" class="bg-purple-500 hover:bg-purple-600 text-white px-4 py-2 rounded">
                    课程管理
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
            <form action="${pageContext.request.contextPath}/score/search" method="get" class="space-y-4">
                <div class="grid grid-cols-1 md:grid-cols-3 gap-4">
                    <div>
                        <label for="studentName" class="block text-sm font-medium text-gray-700 mb-1">学生姓名</label>
                        <input type="text" id="studentName" name="studentName" value="${param.studentName}" 
                               class="border rounded px-3 py-2 w-full focus:outline-none focus:ring-2 focus:ring-blue-500">
                    </div>
                    <div>
                        <label for="courseName" class="block text-sm font-medium text-gray-700 mb-1">课程名称</label>
                        <input type="text" id="courseName" name="courseName" value="${param.courseName}" 
                               class="border rounded px-3 py-2 w-full focus:outline-none focus:ring-2 focus:ring-blue-500">
                    </div>
                    <div>
                        <label for="scoreRange" class="block text-sm font-medium text-gray-700 mb-1">成绩范围</label>
                        <div class="flex items-center space-x-2">
                            <input type="number" id="minScore" name="minScore" value="${param.minScore}" placeholder="最低分" min="0" max="100"
                                   class="border rounded px-3 py-2 w-full focus:outline-none focus:ring-2 focus:ring-blue-500">
                            <span>-</span>
                            <input type="number" id="maxScore" name="maxScore" value="${param.maxScore}" placeholder="最高分" min="0" max="100"
                                   class="border rounded px-3 py-2 w-full focus:outline-none focus:ring-2 focus:ring-blue-500">
                        </div>
                    </div>
                </div>
                <div class="flex justify-end">
                    <button type="submit" class="bg-blue-500 hover:bg-blue-600 text-white px-4 py-2 rounded">
                        搜索
                    </button>
                </div>
            </form>
        </div>
        
        <!-- 成绩列表 -->
        <div class="bg-white rounded shadow overflow-hidden">
            <table class="min-w-full divide-y divide-gray-200">
                <thead class="bg-gray-50">
                    <tr>
                        <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">ID</th>
                        <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">学生</th>
                        <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">课程</th>
                        <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">成绩</th>
                        <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">操作</th>
                    </tr>
                </thead>
                <tbody class="bg-white divide-y divide-gray-200">
                    <c:forEach items="${scores}" var="score">
                        <tr class="hover:bg-gray-50">
                            <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-500">${score.id}</td>
                            <td class="px-6 py-4 whitespace-nowrap text-sm font-medium text-gray-900">${score.student.name}</td>
                            <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-500">${score.course.courseName}</td>
                            <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-500">${score.score}</td>
                            <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-500 space-x-2">
                                <a href="${pageContext.request.contextPath}/score/${score.id}" class="text-blue-600 hover:text-blue-900">查看</a>
                                <a href="${pageContext.request.contextPath}/score/edit/${score.id}" class="text-indigo-600 hover:text-indigo-900">编辑</a>
                                <a href="${pageContext.request.contextPath}/score/delete/${score.id}" class="text-red-600 hover:text-red-900" onclick="return confirm('确定要删除该成绩记录吗？')">删除</a>
                            </td>
                        </tr>
                    </c:forEach>
                    
                    <c:if test="${empty scores}">
                        <tr>
                            <td colspan="5" class="px-6 py-4 text-center text-gray-500">暂无成绩数据</td>
                        </tr>
                    </c:if>
                </tbody>
            </table>
        </div>
    </div>
</body>
</html>