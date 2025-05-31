<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>用户登录</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-100">
    <div class="min-h-screen flex items-center justify-center py-12 px-4 sm:px-6 lg:px-8">
        <div class="max-w-md w-full">
            <div class="bg-white rounded-lg shadow-xl overflow-hidden">
                <div class="px-6 py-8">
                    <div class="text-center">
                        <h2 class="text-3xl font-extrabold text-gray-900 mb-2">
                            欢迎回来
                        </h2>
                        <p class="text-sm text-gray-600">
                            请登录您的账户
                        </p>
                    </div>

                    <c:if test="${not empty error}">
                        <div class="mt-4 rounded-md bg-red-50 p-4">
                            <div class="flex">
                                <div class="flex-shrink-0">
                                    <svg class="h-5 w-5 text-red-400" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" fill="currentColor">
                                        <path fill-rule="evenodd" d="M10 18a8 8 0 100-16 8 8 0 000 16zM8.707 7.293a1 1 0 00-1.414 1.414L8.586 10l-1.293 1.293a1 1 0 101.414 1.414L10 11.414l1.293 1.293a1 1 0 001.414-1.414L11.414 10l1.293-1.293a1 1 0 00-1.414-1.414L10 8.586 8.707 7.293z" clip-rule="evenodd" />
                                    </svg>
                                </div>
                                <div class="ml-3">
                                    <h3 class="text-sm font-medium text-red-800">${error}</h3>
                                </div>
                            </div>
                        </div>
                    </c:if>

                    <form class="mt-8 space-y-6" action="${pageContext.request.contextPath}/user/login" method="post">
                        <div class="space-y-4">
                            <div>
                                <label for="uname" class="block text-sm font-medium text-gray-700">用户名</label>
                                <input id="uname" name="uname" type="text" required 
                                       class="mt-1 block w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm placeholder-gray-400 focus:outline-none focus:ring-indigo-500 focus:border-indigo-500 sm:text-sm" 
                                       placeholder="请输入用户名">
                            </div>
                            <div>
                                <label for="upass" class="block text-sm font-medium text-gray-700">密码</label>
                                <input id="upass" name="upass" type="password" required 
                                       class="mt-1 block w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm placeholder-gray-400 focus:outline-none focus:ring-indigo-500 focus:border-indigo-500 sm:text-sm" 
                                       placeholder="请输入密码">
                            </div>
                        </div>

                        <div>
                            <button type="submit" 
                                    class="w-full flex justify-center py-2 px-4 border border-transparent rounded-md shadow-sm text-sm font-medium text-white bg-indigo-600 hover:bg-indigo-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-indigo-500">
                                登录
                            </button>
                        </div>
                    </form>
                </div>
                
                <div class="px-6 py-4 bg-gray-50 border-t border-gray-200">
                    <div class="text-sm text-center">
                        <a href="${pageContext.request.contextPath}/user/register" class="font-medium text-indigo-600 hover:text-indigo-500">
                            还没有账号？立即注册
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html> 