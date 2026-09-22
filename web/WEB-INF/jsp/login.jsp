<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%!
    public static String esc(String v) {
        if (v == null) {
            return "";
        }
        return v.replace("&", "&amp;").replace("<", "&lt;").replace(">", "&gt;").replace("\"", "&quot;");
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Login - College Management System</title>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
    </head>
    <body>
        <div class="login-wrap">
            <div class="login-box">
                <h1>College Management System</h1>
                <p class="sub">Sign in with your account</p>
<% if (request.getAttribute("error") != null) { %>
                <div class="alert error"><%= esc(request.getAttribute("error").toString()) %></div>
<% } %>
                <form method="post" action="${pageContext.request.contextPath}/login">
                    <label class="field"><span class="lbl">Username</span>
                        <input type="text" name="username" required autofocus>
                    </label>
                    <label class="field"><span class="lbl">Password</span>
                        <input type="password" name="password" required>
                    </label>
                    <button type="submit" class="btn">Login</button>
                </form>
                <a class="back-link" href="${pageContext.request.contextPath}/">Back to home</a>
            </div>
        </div>
    </body>
</html>
