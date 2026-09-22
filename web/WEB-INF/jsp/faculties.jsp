<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@ include file="common/top.jsp" %>
<h1 class="page-title">Faculty</h1>

<div class="card">
    <table class="data">
        <tr><th>Emp Code</th><th>Name</th><th>Department</th><th>Designation</th><th>Email</th><th>Phone</th><th>Actions</th></tr>
<%
    java.util.List<com.college.cms.model.Faculty> faculties =
            (java.util.List<com.college.cms.model.Faculty>) request.getAttribute("faculties");
    if (faculties == null || faculties.isEmpty()) {
%>
        <tr><td colspan="7" class="muted">No faculty records.</td></tr>
<% } else {
        for (com.college.cms.model.Faculty f : faculties) { %>
        <tr>
            <td><%= esc(f.getEmpCode()) %></td>
            <td><%= esc(f.getName()) %></td>
            <td><%= esc(f.getDepartmentName()) %></td>
            <td><%= esc(f.getDesignation()) %></td>
            <td><%= esc(f.getEmail()) %></td>
            <td><%= esc(f.getPhone()) %></td>
            <td>
                <a class="btn small secondary" href="<%= ctx %>/faculties?action=form&edit=<%= f.getFacultyId() %>">Edit</a>
                <form class="inline" method="post" action="<%= ctx %>/faculties"
                      onsubmit="return confirm('Delete this faculty member and their login?');">
                    <input type="hidden" name="action" value="delete">
                    <input type="hidden" name="id" value="<%= f.getFacultyId() %>">
                    <button type="submit" class="btn small danger">Delete</button>
                </form>
            </td>
        </tr>
<%      }
    } %>
    </table>
    <p class="mt"><a class="btn" href="<%= ctx %>/faculties?action=form">Add Faculty</a></p>
</div>
<%@ include file="common/bottom.jsp" %>
