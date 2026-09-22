<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@ include file="common/top.jsp" %>
<h1 class="page-title">Mark Attendance</h1>

<%
    java.util.List<com.college.cms.model.Course> courses =
            (java.util.List<com.college.cms.model.Course>) request.getAttribute("courses");
    String selectedCourseId = (String) request.getAttribute("selectedCourseId");
    String selectedDate = (String) request.getAttribute("selectedDate");
    java.util.List<com.college.cms.model.Student> roster =
            (java.util.List<com.college.cms.model.Student>) request.getAttribute("roster");
    java.util.Map<Integer, com.college.cms.model.Attendance> existing =
            (java.util.Map<Integer, com.college.cms.model.Attendance>) request.getAttribute("existing");
    if (request.getAttribute("errorParam") != null && !((String) request.getAttribute("errorParam")).isEmpty()) {
%>
<div class="alert error"><%= esc((String) request.getAttribute("errorParam")) %></div>
<% } %>

<div class="card">
    <h2>Step 1: Select Course and Date</h2>
    <form method="get" action="<%= ctx %>/attendance">
        <input type="hidden" name="action" value="load">
        <label class="field"><span class="lbl">Course *</span>
            <select name="courseId" required>
                <option value="">Select course</option>
<%  if (courses != null) {
        for (com.college.cms.model.Course c : courses) { %>
                <option value="<%= c.getCourseId() %>" <%= String.valueOf(c.getCourseId()).equals(selectedCourseId) ? "selected" : "" %>><%= esc(c.getCourseCode()) %> - <%= esc(c.getCourseName()) %></option>
<%      }
    } %>
            </select>
        </label>
        <label class="field"><span class="lbl">Date *</span>
            <input type="date" name="date" required value="<%= selectedDate == null ? java.time.LocalDate.now().toString() : esc(selectedDate) %>">
        </label>
        <button type="submit" class="btn">Load Students</button>
    </form>
</div>

<% if (roster != null) { %>
<div class="card">
    <h2>Step 2: Mark Attendance</h2>
    <form method="post" action="<%= ctx %>/attendance">
        <input type="hidden" name="action" value="save">
        <input type="hidden" name="courseId" value="<%= esc(selectedCourseId) %>">
        <input type="hidden" name="date" value="<%= esc(selectedDate) %>">
        <table class="data">
            <tr><th>Roll No</th><th>Name</th><th>Status</th></tr>
        <% for (com.college.cms.model.Student s : roster) {
               com.college.cms.model.Attendance prev = existing == null ? null : existing.get(s.getStudentId());
               String status = prev == null ? "Present" : prev.getStatus(); %>
            <tr>
                <td><%= esc(s.getRollNo()) %></td>
                <td><%= esc(s.getName()) %></td>
                <td>
                    <label style="margin-right:14px"><input type="radio" name="status_<%= s.getStudentId() %>" value="Present" <%= "Present".equals(status) ? "checked" : "" %> style="width:auto"> Present</label>
                    <label><input type="radio" name="status_<%= s.getStudentId() %>" value="Absent" <%= "Absent".equals(status) ? "checked" : "" %> style="width:auto"> Absent</label>
                </td>
            </tr>
        <% } %>
        </table>
        <p class="mt"><button type="submit" class="btn">Save Attendance</button></p>
    </form>
</div>
<% } %>
<%@ include file="common/bottom.jsp" %>
