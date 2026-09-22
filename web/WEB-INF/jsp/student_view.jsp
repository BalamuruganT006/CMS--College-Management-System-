<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@ include file="common/top.jsp" %>
<h1 class="page-title">Student Profile</h1>

<%
    com.college.cms.model.Student student = (com.college.cms.model.Student) request.getAttribute("student");
    java.util.List<java.util.Map<String, Object>> overallPct =
            (java.util.List<java.util.Map<String, Object>>) request.getAttribute("overallPct");
    java.util.List<java.util.Map<String, Object>> coursePct =
            (java.util.List<java.util.Map<String, Object>>) request.getAttribute("coursePct");
%>
<div class="card">
    <h2><%= esc(student.getName()) %> (<%= esc(student.getRollNo()) %>)</h2>
    <table class="data">
        <tr><th>Department</th><td><%= esc(student.getDepartmentName()) %></td></tr>
        <tr><th>Year of Study</th><td><%= student.getYearOfStudy() == null ? "-" : student.getYearOfStudy() %></td></tr>
        <tr><th>Date of Birth</th><td><%= student.getDob() == null ? "-" : student.getDob() %></td></tr>
        <tr><th>Gender</th><td><%= esc(student.getGender()) %></td></tr>
        <tr><th>Email</th><td><%= esc(student.getEmail()) %></td></tr>
        <tr><th>Phone</th><td><%= esc(student.getPhone()) %></td></tr>
        <tr><th>Address</th><td><%= esc(student.getAddress()) %></td></tr>
        <tr><th>Admission Date</th><td><%= student.getAdmissionDate() == null ? "-" : student.getAdmissionDate() %></td></tr>
    </table>
</div>

<div class="card">
    <h2>Attendance Summary</h2>
<% if (overallPct == null || overallPct.isEmpty()) { %>
    <p class="muted">No attendance records yet.</p>
<% } else {
        java.util.Map<String, Object> row = overallPct.get(0); %>
    <p>Overall: <strong><%= String.format("%.1f%%", ((Number) row.get("percentage")).doubleValue()) %></strong>
       (<%= row.get("present") %> present out of <%= row.get("total") %> classes)</p>
<% } %>
<% if (coursePct != null && !coursePct.isEmpty()) { %>
    <table class="data mt">
        <tr><th>Course</th><th>Present</th><th>Total</th><th>%</th></tr>
    <% for (java.util.Map<String, Object> r : coursePct) { %>
        <tr>
            <td><%= esc(String.valueOf(r.get("courseCode"))) %> - <%= esc(String.valueOf(r.get("courseName"))) %></td>
            <td><%= r.get("present") %></td>
            <td><%= r.get("total") %></td>
            <td><span class="badge <%= (((Number) r.get("percentage")).doubleValue() >= 75) ? "Present" : "Absent" %>">
                <%= String.format("%.1f%%", ((Number) r.get("percentage")).doubleValue()) %></span></td>
        </tr>
    <% } %>
    </table>
<% } %>
</div>

<p><a class="btn secondary" href="<%= ctx %>/students">Back to Students</a></p>
<%@ include file="common/bottom.jsp" %>
