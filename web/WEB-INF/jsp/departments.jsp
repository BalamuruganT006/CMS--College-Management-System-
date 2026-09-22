<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@ include file="common/top.jsp" %>
<h1 class="page-title">Departments</h1>

<div class="card">
    <h2><%= request.getAttribute("editDept") != null ? "Edit Department" : "Add Department" %></h2>
<%
    com.college.cms.model.Department editDept = (com.college.cms.model.Department) request.getAttribute("editDept");
%>
    <form method="post" action="<%= ctx %>/departments">
        <input type="hidden" name="action" value="save">
        <input type="hidden" name="id" value="<%= editDept == null ? "" : editDept.getDepartmentId() %>">
        <label class="field"><span class="lbl">Department Name *</span>
            <input type="text" name="deptName" maxlength="100" required
                   value="<%= editDept == null ? "" : esc(editDept.getDeptName()) %>">
        </label>
        <label class="field"><span class="lbl">HOD Name</span>
            <input type="text" name="hodName" maxlength="100"
                   value="<%= editDept == null ? "" : esc(editDept.getHodName()) %>">
        </label>
        <button type="submit" class="btn">Save</button>
<% if (editDept != null) { %>
        <a class="btn secondary" href="<%= ctx %>/departments">Cancel</a>
<% } %>
    </form>
</div>

<div class="card">
    <h2>All Departments</h2>
<%
    java.util.List<com.college.cms.model.Department> departments =
            (java.util.List<com.college.cms.model.Department>) request.getAttribute("departments");
    if (departments == null || departments.isEmpty()) {
%>
    <p class="muted">No departments yet.</p>
<% } else { %>
    <table class="data">
        <tr><th>ID</th><th>Department</th><th>HOD</th><th>Actions</th></tr>
    <% for (com.college.cms.model.Department d : departments) { %>
        <tr>
            <td><%= d.getDepartmentId() %></td>
            <td><%= esc(d.getDeptName()) %></td>
            <td><%= esc(d.getHodName()) %></td>
            <td>
                <a class="btn small secondary" href="<%= ctx %>/departments?edit=<%= d.getDepartmentId() %>">Edit</a>
                <form class="inline" method="post" action="<%= ctx %>/departments"
                      onsubmit="return confirm('Delete this department?');">
                    <input type="hidden" name="action" value="delete">
                    <input type="hidden" name="id" value="<%= d.getDepartmentId() %>">
                    <button type="submit" class="btn small danger">Delete</button>
                </form>
            </td>
        </tr>
    <% } %>
    </table>
<% } %>
</div>
<%@ include file="common/bottom.jsp" %>
