<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@ include file="common/top.jsp" %>
<h1 class="page-title"><%= request.getAttribute("editFaculty") != null ? "Edit Faculty" : "Add Faculty" %></h1>

<div class="card">
<%
    com.college.cms.model.Faculty editFaculty = (com.college.cms.model.Faculty) request.getAttribute("editFaculty");
    java.util.List<com.college.cms.model.Department> departments =
            (java.util.List<com.college.cms.model.Department>) request.getAttribute("departments");
%>
    <form method="post" action="<%= ctx %>/faculties">
        <input type="hidden" name="action" value="save">
        <input type="hidden" name="id" value="<%= editFaculty == null ? "" : editFaculty.getFacultyId() %>">
        <label class="field"><span class="lbl">Emp Code <%= editFaculty == null ? "(blank = auto-generate)" : "" %></span>
            <input type="text" name="empCode" maxlength="20"
                   value="<%= editFaculty == null ? "" : esc(editFaculty.getEmpCode()) %>">
        </label>
        <label class="field"><span class="lbl">Full Name *</span>
            <input type="text" name="name" maxlength="100" required
                   value="<%= editFaculty == null ? "" : esc(editFaculty.getName()) %>">
        </label>
        <label class="field"><span class="lbl">Email</span>
            <input type="email" name="email" maxlength="100"
                   value="<%= editFaculty == null ? "" : esc(editFaculty.getEmail()) %>">
        </label>
        <label class="field"><span class="lbl">Phone (10 digits)</span>
            <input type="text" name="phone" maxlength="15"
                   value="<%= editFaculty == null ? "" : esc(editFaculty.getPhone()) %>">
        </label>
        <label class="field"><span class="lbl">Department</span>
            <select name="departmentId">
                <option value="">None</option>
<%  if (departments != null) {
        Integer selDept = editFaculty == null ? null : editFaculty.getDepartmentId();
        for (com.college.cms.model.Department d : departments) { %>
                <option value="<%= d.getDepartmentId() %>" <%= selDept != null && selDept == d.getDepartmentId() ? "selected" : "" %>><%= esc(d.getDeptName()) %></option>
<%      }
    } %>
            </select>
        </label>
        <label class="field"><span class="lbl">Designation</span>
            <input type="text" name="designation" maxlength="50"
                   value="<%= editFaculty == null ? "" : esc(editFaculty.getDesignation()) %>">
        </label>
        <label class="field"><span class="lbl">Joining Date</span>
            <input type="date" name="joiningDate"
                   value="<%= editFaculty == null || editFaculty.getJoiningDate() == null ? "" : editFaculty.getJoiningDate().toString() %>">
        </label>
<% if (editFaculty == null) { %>
        <label class="field"><span class="lbl">
            <input type="checkbox" name="createLogin" checked style="width:auto"> Create login account (username = emp code, password = welcome123)
        </span></label>
<% } %>
        <button type="submit" class="btn">Save Faculty</button>
        <a class="btn secondary" href="<%= ctx %>/faculties">Cancel</a>
    </form>
</div>
<%@ include file="common/bottom.jsp" %>
