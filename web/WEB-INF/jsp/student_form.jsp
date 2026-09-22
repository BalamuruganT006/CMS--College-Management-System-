<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@ include file="common/top.jsp" %>
<h1 class="page-title"><%= request.getAttribute("editStudent") != null ? "Edit Student" : "Add Student" %></h1>

<div class="card">
<%
    com.college.cms.model.Student editStudent = (com.college.cms.model.Student) request.getAttribute("editStudent");
    java.util.List<com.college.cms.model.Department> departments =
            (java.util.List<com.college.cms.model.Department>) request.getAttribute("departments");
%>
    <form method="post" action="<%= ctx %>/students">
        <input type="hidden" name="action" value="save">
        <input type="hidden" name="id" value="<%= editStudent == null ? "" : editStudent.getStudentId() %>">
        <label class="field"><span class="lbl">Roll No <%= editStudent == null ? "(blank = auto-generate)" : "" %></span>
            <input type="text" name="rollNo" maxlength="20"
                   value="<%= editStudent == null ? "" : esc(editStudent.getRollNo()) %>">
        </label>
        <label class="field"><span class="lbl">Full Name *</span>
            <input type="text" name="name" maxlength="100" required
                   value="<%= editStudent == null ? "" : esc(editStudent.getName()) %>">
        </label>
        <label class="field"><span class="lbl">Date of Birth</span>
            <input type="date" name="dob"
                   value="<%= editStudent == null || editStudent.getDob() == null ? "" : editStudent.getDob().toString() %>">
        </label>
        <label class="field"><span class="lbl">Gender</span>
            <select name="gender">
<%  String g = editStudent == null ? null : editStudent.getGender();
    String[] genders = {"Male", "Female", "Other"};
    for (String opt : genders) { %>
                <option value="<%= opt %>" <%= opt.equals(g) ? "selected" : "" %>><%= opt %></option>
<% } %>
                <option value="" <%= g == null || g.isEmpty() ? "selected" : "" %>>Not specified</option>
            </select>
        </label>
        <label class="field"><span class="lbl">Email</span>
            <input type="email" name="email" maxlength="100"
                   value="<%= editStudent == null ? "" : esc(editStudent.getEmail()) %>">
        </label>
        <label class="field"><span class="lbl">Phone (10 digits)</span>
            <input type="text" name="phone" maxlength="15"
                   value="<%= editStudent == null ? "" : esc(editStudent.getPhone()) %>">
        </label>
        <label class="field"><span class="lbl">Address</span>
            <input type="text" name="address" maxlength="255"
                   value="<%= editStudent == null ? "" : esc(editStudent.getAddress()) %>">
        </label>
        <label class="field"><span class="lbl">Department</span>
            <select name="departmentId">
                <option value="">None</option>
<%  if (departments != null) {
        Integer selDept = editStudent == null ? null : editStudent.getDepartmentId();
        for (com.college.cms.model.Department d : departments) { %>
                <option value="<%= d.getDepartmentId() %>" <%= selDept != null && selDept == d.getDepartmentId() ? "selected" : "" %>><%= esc(d.getDeptName()) %></option>
<%      }
    } %>
            </select>
        </label>
        <label class="field"><span class="lbl">Year of Study</span>
            <select name="yearOfStudy">
                <option value="">None</option>
<%  Integer selYear = editStudent == null ? null : editStudent.getYearOfStudy();
    for (int y = 1; y <= 5; y++) { %>
                <option value="<%= y %>" <%= selYear != null && selYear == y ? "selected" : "" %>><%= y %></option>
<% } %>
            </select>
        </label>
<% if (editStudent == null) { %>
        <label class="field"><span class="lbl">
            <input type="checkbox" name="createLogin" checked style="width:auto"> Create login account (username = roll no, password = welcome123)
        </span></label>
<% } %>
        <button type="submit" class="btn">Save Student</button>
        <a class="btn secondary" href="<%= ctx %>/students">Cancel</a>
    </form>
</div>
<%@ include file="common/bottom.jsp" %>
