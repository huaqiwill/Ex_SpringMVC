<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>添加学生</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-100">
    <div class="container mx-auto px-4 py-8">
        <div class="max-w-md mx-auto bg-white rounded-lg shadow-md overflow-hidden">
            <div class="px-6 py-4 bg-blue-500">
                <h2 class="text-xl font-bold text-white">添加学生</h2>
            </div>
            
            <form action="${pageContext.request.contextPath}/student/add" method="post" class="p-6">
                <div class="mb-4">
                    <label for="name" class="block text-gray-700 text-sm font-bold mb-2">姓名:</label>
                    <input type="text" id="name" name="name" required 
                           class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline">
                </div>
                
                <div class="mb-4">
                    <label for="age" class="block text-gray-700 text-sm font-bold mb-2">年龄:</label>
                    <input type="number" id="age" name="age" required min="1" max="120"
                           class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline">
                </div>
                
                <div class="mb-6">
                    <label class="block text-gray-700 text-sm font-bold mb-2">性别:</label>
                    <div class="flex items-center space-x-4">
                        <label class="inline-flex items-center">
                            <input type="radio" name="gender" value="男" checked class="form-radio h-4 w-4 text-blue-600">
                            <span class="ml-2 text-gray-700">男</span>
                        </label>
                        <label class="inline-flex items-center">
                            <input type="radio" name="gender" value="女" class="form-radio h-4 w-4 text-pink-600">
                            <span class="ml-2 text-gray-700">女</span>
                        </label>
                    </div>
                </div>
                
                <div class="flex items-center justify-between">
                    <button type="submit" class="bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded focus:outline-none focus:shadow-outline">
                        保存
                    </button>
                    <a href="${pageContext.request.contextPath}/student" class="inline-block align-baseline font-bold text-sm text-blue-500 hover:text-blue-800">
                        返回列表
                    </a>
                </div>
            </form>
        </div>
    </div>
</body>
</html>