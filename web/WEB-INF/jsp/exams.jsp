<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@ include file="common/top.jsp" %>
<h1 class="page-title">Exams</h1>

<div class="card">
    <table class="data">
        <tr><th>Exam</th><th>Course</th><th>Date</th><th>Max Marks</th><th>Actions</th></tr>
<%
    java.util.List<com.college.cms.model.Exam> exams =
            (java.util.List<com.college.cms.model.Exam>) request.getAttribute("exams");
    if (exams == null || exams.isEmpty()) {
%>
        <tr><td colspan="5" class="muted">No exams created yet.</td></tr>
<% } else {
        for (com.college.cms.model.Exam e : exams) { %>
        <tr>
            <td><%= esc(e.getExamName()) %></td>
            <td><%= esc(e.getCourseCode()) %><%= e.getCourseName() == null ? "" : " - " + esc(e.getCourseName()) %></td>
            <td><%= e.getExamDate() == null ? "-" : e.getExamDate() %></td>
            <td><%= e.getMaxMarks() == null ? "-" : e.getMaxMarks() %></td>
            <td>
                <a class="btn small" href="<%= ctx %>/marks?action=load&examId=<%= e.getExamId() %>">Enter Marks</a>
                <a class="btn small secondary" href="<%= ctx %>/exams?action=form&edit=<%= e.getExamId() %>">Edit</a>
                <form class="inline" method="post" action="<%= ctx %>/exams"
                      onsubmit="return confirm('Delete this exam?');">
                    <input type="hidden" name="action" value="delete">
                    <input type="hidden" name="id" value="<%= e.getExamId() %>">
                    <button type="submit" class="btn small danger">Delete</button>
                </form>
            </td>
        </tr>
<%      }
    } %>
    </table>
    <p class="mt"><a class="btn" href="<%= ctx %>/exams?action=form">Create Exam</a></p>
</div>
<%@ include file="common/bottom.jsp" %>
