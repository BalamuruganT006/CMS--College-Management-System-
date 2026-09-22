<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@ include file="common/top.jsp" %>
<h1 class="page-title">Courses</h1>

<%
    java.util.List<com.college.cms.model.Course> courses =
            (java.util.List<com.college.cms.model.Course>) request.getAttribute("courses");
    java.util.List<com.college.cms.model.Department> departments =
            (java.util.List<com.college.cms.model.Department>) request.getAttribute("departments");
    java.util.List<com.college.cms.model.Faculty> faculties =
            (java.util.List<com.college.cms.model.Faculty>) request.getAttribute("faculties");

    com.college.cms.model.Course editCourse = null;
    String editId = request.getParameter("edit");
    if (editId != null && courses != null) {
        for (com.college.cms.model.Course c : courses) {
            if (String.valueOf(c.getCourseId()).equals(editId)) {
                editCourse = c;
                break;
            }
        }
    }
%>
<div class="card">
    <h2><%= editCourse == null ? "Add Course" : "Edit Course" %></h2>
    <form method="post" action="<%= ctx %>/courses">
        <input type="hidden" name="action" value="save">
        <input type="hidden" name="id" value="<%= editCourse == null ? "" : editCourse.getCourseId() %>">
        <label class="field"><span class="lbl">Course Code *</span>
            <input type="text" name="courseCode" maxlength="20" required
                   value="<%= editCourse == null ? "" : esc(editCourse.getCourseCode()) %>">
        </label>
        <label class="field"><span class="lbl">Course Name *</span>
            <input type="text" name="courseName" maxlength="100" required
                   value="<%= editCourse == null ? "" : esc(editCourse.getCourseName()) %>">
        </label>
        <label class="field"><span class="lbl">Credits</span>
            <input type="number" name="credits" min="1" max="10"
                   value="<%= editCourse == null || editCourse.getCredits() == null ? "" : editCourse.getCredits() %>">
        </label>
        <label class="field"><span class="lbl">Semester</span>
            <input type="number" name="semester" min="1" max="10"
                   value="<%= editCourse == null || editCourse.getSemester() == null ? "" : editCourse.getSemester() %>">
        </label>
        <label class="field"><span class="lbl">Department</span>
            <select name="departmentId">
                <option value="">None</option>
<%  if (departments != null) {
        Integer selDept = editCourse == null ? null : editCourse.getDepartmentId();
        for (com.college.cms.model.Department d : departments) { %>
                <option value="<%= d.getDepartmentId() %>" <%= selDept != null && selDept == d.getDepartmentId() ? "selected" : "" %>><%= esc(d.getDeptName()) %></option>
<%      }
    } %>
            </select>
        </label>
        <button type="submit" class="btn">Save Course</button>
<% if (editCourse != null) { %>
        <a class="btn secondary" href="<%= ctx %>/courses">Cancel</a>
<% } %>
    </form>
</div>

<div class="card">
    <h2>All Courses</h2>
<% if (courses == null || courses.isEmpty()) { %>
    <p class="muted">No courses yet.</p>
<% } else { %>
    <table class="data">
        <tr><th>Code</th><th>Name</th><th>Credits</th><th>Sem</th><th>Department</th><th>Assigned Faculty</th><th>Actions</th></tr>
    <% for (com.college.cms.model.Course c : courses) { %>
        <tr>
            <td><%= esc(c.getCourseCode()) %></td>
            <td><%= esc(c.getCourseName()) %></td>
            <td><%= c.getCredits() == null ? "-" : c.getCredits() %></td>
            <td><%= c.getSemester() == null ? "-" : c.getSemester() %></td>
            <td><%= esc(c.getDepartmentName()) %></td>
            <td>
                <form class="inline" method="post" action="<%= ctx %>/courses">
                    <input type="hidden" name="action" value="assign">
                    <input type="hidden" name="courseId" value="<%= c.getCourseId() %>">
                    <select name="facultyId" style="max-width:180px">
                        <option value="">Unassigned</option>
                    <% if (faculties != null) {
                           for (com.college.cms.model.Faculty f : faculties) { %>
                        <option value="<%= f.getFacultyId() %>" <%= c.getFacultyId() != null && c.getFacultyId() == f.getFacultyId() ? "selected" : "" %>><%= esc(f.getName()) %></option>
                    <%      }
                       } %>
                    </select>
                    <button type="submit" class="btn small secondary">Assign</button>
                </form>
            </td>
            <td>
                <a class="btn small secondary" href="<%= ctx %>/courses?edit=<%= c.getCourseId() %>">Edit</a>
                <form class="inline" method="post" action="<%= ctx %>/courses"
                      onsubmit="return confirm('Delete this course?');">
                    <input type="hidden" name="action" value="delete">
                    <input type="hidden" name="id" value="<%= c.getCourseId() %>">
                    <button type="submit" class="btn small danger">Delete</button>
                </form>
            </td>
        </tr>
    <% } %>
    </table>
<% } %>
</div>
<%@ include file="common/bottom.jsp" %>
