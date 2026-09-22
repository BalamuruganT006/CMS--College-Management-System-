<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%
    com.college.cms.model.User currentUser = (com.college.cms.model.User) session.getAttribute("cmsUser");
    String ctx = request.getContextPath();
%>
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
        <title>College Management System</title>
        <link rel="stylesheet" href="<%= ctx %>/css/style.css">
    </head>
    <body>
        <nav class="navbar">
            <span class="brand">CMS</span>
            <a href="<%= ctx %>/">Home</a>
            <a href="<%= ctx %>/dashboard">Dashboard</a>
<% if (currentUser != null && "ADMIN".equals(currentUser.getRole())) { %>
            <a href="<%= ctx %>/students">Students</a>
            <a href="<%= ctx %>/faculties">Faculty</a>
            <a href="<%= ctx %>/departments">Departments</a>
            <a href="<%= ctx %>/courses">Courses</a>
            <a href="<%= ctx %>/attendance">Attendance</a>
            <a href="<%= ctx %>/exams">Exams</a>
            <a href="<%= ctx %>/marks">Marks</a>
            <a href="<%= ctx %>/fees">Fees</a>
            <a href="<%= ctx %>/reports">Reports</a>
<% } else if (currentUser != null && "FACULTY".equals(currentUser.getRole())) { %>
            <a href="<%= ctx %>/attendance">Attendance</a>
            <a href="<%= ctx %>/exams">Exams</a>
            <a href="<%= ctx %>/marks">Marks</a>
<% } else if (currentUser != null && "STUDENT".equals(currentUser.getRole())) { %>
            <a href="<%= ctx %>/attendance">My Attendance</a>
            <a href="<%= ctx %>/marks">My Marks</a>
            <a href="<%= ctx %>/fees">My Fees</a>
<% } %>
            <span class="spacer"></span>
<% if (currentUser != null) { %>
            <span class="user-chip"><%= esc(currentUser.getUsername()) %> (<%= esc(currentUser.getRole()) %>)</span>
            <a href="<%= ctx %>/logout">Logout</a>
<% } %>
        </nav>
        <div class="container">
<%
    String okMsg = request.getParameter("ok");
    String errMsg = request.getParameter("err");
    if (okMsg != null && !okMsg.isEmpty()) {
%>
            <div class="alert success"><%= esc(okMsg) %></div>
<% } else if (request.getAttribute("success") != null && !((String) request.getAttribute("success")).isEmpty()) { %>
            <div class="alert success"><%= esc((String) request.getAttribute("success")) %></div>
<% }
    if (errMsg != null && !errMsg.isEmpty()) {
%>
            <div class="alert error"><%= esc(errMsg) %></div>
<% } else if (request.getAttribute("error") != null && !((String) request.getAttribute("error")).isEmpty()) { %>
            <div class="alert error"><%= esc((String) request.getAttribute("error")) %></div>
<% } %>
