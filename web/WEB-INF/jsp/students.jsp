<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@ include file="common/top.jsp" %>
<h1 class="page-title">Students</h1>

<div class="card">
    <form class="toolbar" method="get" action="<%= ctx %>/students">
        <label class="field"><span class="lbl">Search</span>
            <input type="text" name="q" placeholder="Name, roll no or email" value="<%= esc((String) request.getAttribute("q")) %>">
        </label>
        <label class="field"><span class="lbl">Department</span>
            <select name="dept">
                <option value="">All</option>
<%
    java.util.List<com.college.cms.model.Department> departments =
            (java.util.List<com.college.cms.model.Department>) request.getAttribute("departments");
    String deptFilter = (String) request.getAttribute("deptFilter");
    if (departments != null) {
        for (com.college.cms.model.Department d : departments) {
%>
                <option value="<%= d.getDepartmentId() %>" <%= String.valueOf(d.getDepartmentId()).equals(deptFilter) ? "selected" : "" %>><%= esc(d.getDeptName()) %></option>
<%      }
    }
%>
            </select>
        </label>
        <label class="field"><span class="lbl">Year</span>
            <select name="year">
                <option value="">All</option>
<%  String yearFilter = (String) request.getAttribute("yearFilter");
    for (int y = 1; y <= 5; y++) { %>
                <option value="<%= y %>" <%= String.valueOf(y).equals(yearFilter) ? "selected" : "" %>><%= y %></option>
<% } %>
            </select>
        </label>
        <button type="submit" class="btn">Filter</button>
        <a class="btn secondary" href="<%= ctx %>/students">Reset</a>
        <a class="btn" href="<%= ctx %>/students?action=form">Add Student</a>
    </form>

<%
    java.util.List<com.college.cms.model.Student> students =
            (java.util.List<com.college.cms.model.Student>) request.getAttribute("students");
    if (students == null || students.isEmpty()) {
%>
    <p class="muted">No students found.</p>
<% } else { %>
    <table class="data">
        <tr><th>Roll No</th><th>Name</th><th>Department</th><th>Year</th><th>Email</th><th>Phone</th><th>Actions</th></tr>
    <% for (com.college.cms.model.Student s : students) { %>
        <tr>
            <td><%= esc(s.getRollNo()) %></td>
            <td><%= esc(s.getName()) %></td>
            <td><%= esc(s.getDepartmentName()) %></td>
            <td><%= s.getYearOfStudy() == null ? "-" : s.getYearOfStudy() %></td>
            <td><%= esc(s.getEmail()) %></td>
            <td><%= esc(s.getPhone()) %></td>
            <td>
                <a class="btn small" href="<%= ctx %>/students?action=view&id=<%= s.getStudentId() %>">View</a>
                <a class="btn small secondary" href="<%= ctx %>/students?action=form&edit=<%= s.getStudentId() %>">Edit</a>
                <form class="inline" method="post" action="<%= ctx %>/students"
                      onsubmit="return confirm('Delete this student and their login?');">
                    <input type="hidden" name="action" value="delete">
                    <input type="hidden" name="id" value="<%= s.getStudentId() %>">
                    <button type="submit" class="btn small danger">Delete</button>
                </form>
            </td>
        </tr>
    <% } %>
    </table>
<% } %>
</div>
<%@ include file="common/bottom.jsp" %>
