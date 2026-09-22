<%@ page contentType="text/html" pageEncoding="UTF-8" isErrorPage="true" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Error - College Management System</title>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
    </head>
    <body>
        <div class="login-wrap">
            <div class="login-box">
                <h1>Something went wrong</h1>
                <p class="sub">Status code: ${pageContext.errorData.statusCode == 0 ? 500 : pageContext.errorData.statusCode}</p>
                <div class="alert error">
                    An unexpected error occurred. Please go back and try again.
                </div>
                <a class="btn" href="${pageContext.request.contextPath}/dashboard">Back to Dashboard</a>
            </div>
        </div>
    </body>
</html>
