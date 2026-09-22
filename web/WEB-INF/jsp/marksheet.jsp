<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@ include file="common/top.jsp" %>
<h1 class="page-title">My Marksheet</h1>

<div class="card">
<%
    java.util.List<com.college.cms.model.Marks> marks =
            (java.util.List<com.college.cms.model.Marks>) request.getAttribute("marks");
    if (marks == null || marks.isEmpty()) {
%>
    <p class="muted">No marks published yet.</p>
<% } else { %>
    <table class="data">
        <tr><th>Course</th><th>Exam</th><th>Marks</th><th>Max</th><th>Grade</th></tr>
    <% for (com.college.cms.model.Marks m : marks) { %>
        <tr>
            <td><%= esc(m.getCourseCode()) %></td>
            <td><%= esc(m.getExamName()) %></td>
            <td><%= m.getMarksObtained() == null ? "-" : m.getMarksObtained().stripTrailingZeros().toPlainString() %></td>
            <td><%= m.getMaxMarks() == null ? "-" : m.getMaxMarks() %></td>
            <td><span class="badge <%= "F".equals(m.getGrade()) ? "Absent" : "Present" %>"><%= esc(m.getGrade()) %></span></td>
        </tr>
    <% } %>
    </table>
<% } %>
</div>
<%@ include file="common/bottom.jsp" %>
