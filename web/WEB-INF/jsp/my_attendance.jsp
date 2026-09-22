<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@ include file="common/top.jsp" %>
<h1 class="page-title">My Attendance</h1>

<%
    java.util.List<java.util.Map<String, Object>> overall =
            (java.util.List<java.util.Map<String, Object>>) request.getAttribute("overall");
    java.util.List<java.util.Map<String, Object>> perCourse =
            (java.util.List<java.util.Map<String, Object>>) request.getAttribute("perCourse");
%>
<div class="card">
    <h2>Overall</h2>
<% if (overall == null || overall.isEmpty()) { %>
    <p class="muted">No attendance records yet.</p>
<% } else {
        java.util.Map<String, Object> row = overall.get(0);
        double pct = ((Number) row.get("percentage")).doubleValue(); %>
    <div class="stats-grid">
        <div class="stat-card">
            <div class="stat-value"><%= String.format("%.1f%%", pct) %></div>
            <div class="stat-label"><%= pct >= 75 ? "Good standing" : "Below 75% - at risk" %></div>
        </div>
        <div class="stat-card">
            <div class="stat-value"><%= row.get("present") %> / <%= row.get("total") %></div>
            <div class="stat-label">Classes Present</div>
        </div>
    </div>
<% } %>
</div>

<div class="card">
    <h2>Course-wise</h2>
<% if (perCourse == null || perCourse.isEmpty()) { %>
    <p class="muted">No course attendance yet.</p>
<% } else { %>
    <table class="data">
        <tr><th>Course</th><th>Present</th><th>Total</th><th>Percentage</th></tr>
    <% for (java.util.Map<String, Object> r : perCourse) {
           double pct = ((Number) r.get("percentage")).doubleValue(); %>
        <tr>
            <td><%= esc(String.valueOf(r.get("courseCode"))) %> - <%= esc(String.valueOf(r.get("courseName"))) %></td>
            <td><%= r.get("present") %></td>
            <td><%= r.get("total") %></td>
            <td><span class="badge <%= pct >= 75 ? "Present" : "Absent" %>"><%= String.format("%.1f%%", pct) %></span></td>
        </tr>
    <% } %>
    </table>
<% } %>
</div>
<%@ include file="common/bottom.jsp" %>
