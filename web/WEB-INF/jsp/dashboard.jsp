<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@ include file="common/top.jsp" %>
<h1 class="page-title">Dashboard</h1>
<% if ("1".equals(request.getParameter("denied"))) { %>
<div class="alert error">You do not have permission to access that page.</div>
<% } %>

<%
    String role = currentUser == null ? "" : currentUser.getRole();
    if ("ADMIN".equals(role)) {
        java.util.List<java.util.Map<String, Object>> defList =
                (java.util.List<java.util.Map<String, Object>>) request.getAttribute("defaulters");
        java.util.Map<String, Object> feeSummary = (java.util.Map<String, Object>) request.getAttribute("feeSummary");
        Object billed = feeSummary.get("billed");
        Object collected = feeSummary.get("collected");
        Object pending = feeSummary.get("pending");
%>
<div class="stats-grid">
    <div class="stat-card"><div class="stat-value"><%= request.getAttribute("studentCount") %></div><div class="stat-label">Students</div></div>
    <div class="stat-card"><div class="stat-value"><%= request.getAttribute("facultyCount") %></div><div class="stat-label">Faculty</div></div>
    <div class="stat-card"><div class="stat-value"><%= request.getAttribute("courseCount") %></div><div class="stat-label">Courses</div></div>
    <div class="stat-card"><div class="stat-value">&#8377; <%= esc(String.valueOf(pending)) %></div><div class="stat-label">Pending Fees</div></div>
</div>

<div class="card">
    <h2>Fees Overview</h2>
    <p>Billed: &#8377; <%= esc(String.valueOf(billed)) %> &nbsp;|&nbsp; Collected: &#8377; <%= esc(String.valueOf(collected)) %> &nbsp;|&nbsp; Pending: &#8377; <%= esc(String.valueOf(pending)) %></p>
    <p class="mt"><a class="btn small" href="<%= ctx %>/fees">Manage Fees</a></p>
</div>

<div class="card">
    <h2>Attendance Defaulters (&lt; 75%)</h2>
<% if (defList == null || defList.isEmpty()) { %>
    <p class="muted">No defaulters. Everyone is above 75%.</p>
<% } else { %>
    <table class="data">
        <tr><th>Roll No</th><th>Name</th><th>Present</th><th>Total</th><th>%</th></tr>
    <% for (java.util.Map<String, Object> r : defList) { %>
        <tr>
            <td><%= esc(String.valueOf(r.get("rollNo"))) %></td>
            <td><%= esc(String.valueOf(r.get("name"))) %></td>
            <td><%= r.get("present") %></td>
            <td><%= r.get("total") %></td>
            <td><span class="badge Absent"><%= String.format("%.1f%%", ((Number) r.get("percentage")).doubleValue()) %></span></td>
        </tr>
    <% } %>
    </table>
<% } %>
</div>
<%
    } else if ("FACULTY".equals(role)) {
        java.util.List<com.college.cms.model.Course> myCourses =
                (java.util.List<com.college.cms.model.Course>) request.getAttribute("myCourses");
%>
<div class="card">
    <h2>My Courses</h2>
<% if (myCourses == null || myCourses.isEmpty()) { %>
    <p class="muted">No courses assigned yet. Contact the admin.</p>
<% } else { %>
    <table class="data">
        <tr><th>Code</th><th>Course</th><th>Semester</th><th>Credits</th><th>Actions</th></tr>
    <% for (com.college.cms.model.Course c : myCourses) { %>
        <tr>
            <td><%= esc(c.getCourseCode()) %></td>
            <td><%= esc(c.getCourseName()) %></td>
            <td><%= c.getSemester() == null ? "-" : c.getSemester() %></td>
            <td><%= c.getCredits() == null ? "-" : c.getCredits() %></td>
            <td>
                <a class="btn small secondary" href="<%= ctx %>/attendance?action=load&courseId=<%= c.getCourseId() %>&date=<%= java.time.LocalDate.now() %>">Mark Attendance</a>
                <a class="btn small" href="<%= ctx %>/marks?action=load&examId=0">Enter Marks</a>
            </td>
        </tr>
    <% } %>
    </table>
<% } %>
</div>
<%
    } else if ("STUDENT".equals(role)) {
        Double attendancePercent = (Double) request.getAttribute("attendancePercent");
        java.util.List<com.college.cms.model.Fee> fees = (java.util.List<com.college.cms.model.Fee>) request.getAttribute("fees");
        java.math.BigDecimal due = java.math.BigDecimal.ZERO;
        if (fees != null) {
            for (com.college.cms.model.Fee f : fees) {
                if (!"Paid".equals(f.getStatus())) {
                    due = due.add(f.getBalance());
                }
            }
        }
%>
<div class="stats-grid">
    <div class="stat-card">
        <div class="stat-value"><%= attendancePercent == null ? "0.0" : String.format("%.1f%%", attendancePercent) %></div>
        <div class="stat-label">Overall Attendance</div>
    </div>
    <div class="stat-card">
        <div class="stat-value">&#8377; <%= esc(due.toPlainString()) %></div>
        <div class="stat-label">Fee Due</div>
    </div>
</div>
<div class="card">
    <h2>Quick Links</h2>
    <p><a href="<%= ctx %>/attendance">View detailed attendance</a></p>
    <p><a href="<%= ctx %>/marks">View my marks</a></p>
    <p><a href="<%= ctx %>/fees">View fee history</a></p>
</div>
<% } %>
<%@ include file="common/bottom.jsp" %>
