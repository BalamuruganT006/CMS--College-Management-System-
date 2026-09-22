<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@ include file="common/top.jsp" %>
<h1 class="page-title">Enter Marks</h1>

<%
    java.util.List<com.college.cms.model.Exam> exams =
            (java.util.List<com.college.cms.model.Exam>) request.getAttribute("exams");
    com.college.cms.model.Exam selectedExam = (com.college.cms.model.Exam) request.getAttribute("selectedExam");
    java.util.List<com.college.cms.model.Marks> roster =
            (java.util.List<com.college.cms.model.Marks>) request.getAttribute("roster");
    java.util.Map<String, Object> summary = (java.util.Map<String, Object>) request.getAttribute("summary");
    if (request.getAttribute("errorParam") != null && !((String) request.getAttribute("errorParam")).isEmpty()) {
%>
<div class="alert error"><%= esc((String) request.getAttribute("errorParam")) %></div>
<% } %>

<div class="card">
    <h2>Step 1: Select Exam</h2>
    <form method="get" action="<%= ctx %>/marks">
        <input type="hidden" name="action" value="load">
        <label class="field"><span class="lbl">Exam *</span>
            <select name="examId" required>
                <option value="">Select exam</option>
<%  if (exams != null) {
        for (com.college.cms.model.Exam e : exams) { %>
                <option value="<%= e.getExamId() %>" <%= selectedExam != null && selectedExam.getExamId() == e.getExamId() ? "selected" : "" %>><%= esc(e.getExamName()) %><%= e.getCourseCode() == null ? "" : " (" + esc(e.getCourseCode()) + ")" %></option>
<%      }
    } %>
            </select>
        </label>
        <button type="submit" class="btn">Load Students</button>
    </form>
</div>

<% if (roster != null && selectedExam != null) { %>
<div class="card">
    <h2>Step 2: Enter Marks for <%= esc(selectedExam.getExamName()) %> (max <%= selectedExam.getMaxMarks() == null ? 100 : selectedExam.getMaxMarks() %>)</h2>
<% if (summary != null && ((Number) summary.getOrDefault("count", 0)).longValue() > 0) { %>
    <p class="muted">Saved entries: <%= summary.get("count") %> | Average: <%= summary.get("average") == null ? "-" : summary.get("average") %> | Highest: <%= summary.get("highest") == null ? "-" : summary.get("highest") %> | Passed: <%= summary.get("passed") %></p>
<% } %>
    <form method="post" action="<%= ctx %>/marks">
        <input type="hidden" name="examId" value="<%= selectedExam.getExamId() %>">
        <table class="data">
            <tr><th>Roll No</th><th>Name</th><th>Marks Obtained</th><th>Current Grade</th></tr>
        <% for (com.college.cms.model.Marks m : roster) { %>
            <tr>
                <td><%= esc(m.getRollNo()) %></td>
                <td><%= esc(m.getStudentName()) %></td>
                <td>
                    <input type="number" step="0.01" min="0" max="<%= selectedExam.getMaxMarks() == null ? 100 : selectedExam.getMaxMarks() %>"
                           name="marks_<%= m.getStudentId() %>" style="max-width:110px"
                           value="<%= m.getMarksObtained() == null ? "" : m.getMarksObtained().stripTrailingZeros().toPlainString() %>">
                </td>
                <td><%= m.getGrade() == null ? "-" : esc(m.getGrade()) %></td>
            </tr>
        <% } %>
        </table>
        <p class="mt"><button type="submit" class="btn">Save Marks</button></p>
    </form>
</div>
<% } %>
<%@ include file="common/bottom.jsp" %>
