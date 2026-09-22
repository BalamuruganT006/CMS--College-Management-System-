<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@ include file="common/top.jsp" %>
<h1 class="page-title"><%= request.getAttribute("editExam") != null ? "Edit Exam" : "Create Exam" %></h1>

<div class="card">
<%
    com.college.cms.model.Exam editExam = (com.college.cms.model.Exam) request.getAttribute("editExam");
    java.util.List<com.college.cms.model.Course> courses =
            (java.util.List<com.college.cms.model.Course>) request.getAttribute("courses");
%>
    <form method="post" action="<%= ctx %>/exams">
        <input type="hidden" name="action" value="save">
        <input type="hidden" name="id" value="<%= editExam == null ? "" : editExam.getExamId() %>">
        <label class="field"><span class="lbl">Exam Name *</span>
            <input type="text" name="examName" maxlength="100" required
                   value="<%= editExam == null ? "" : esc(editExam.getExamName()) %>">
        </label>
        <label class="field"><span class="lbl">Course *</span>
            <select name="courseId" required>
                <option value="">Select course</option>
<%  if (courses != null) {
        Integer selCourse = editExam == null ? null : editExam.getCourseId();
        for (com.college.cms.model.Course c : courses) { %>
                <option value="<%= c.getCourseId() %>" <%= selCourse != null && selCourse == c.getCourseId() ? "selected" : "" %>><%= esc(c.getCourseCode()) %> - <%= esc(c.getCourseName()) %></option>
<%      }
    } %>
            </select>
        </label>
        <label class="field"><span class="lbl">Exam Date *</span>
            <input type="date" name="examDate" required
                   value="<%= editExam == null || editExam.getExamDate() == null ? "" : editExam.getExamDate().toString() %>">
        </label>
        <label class="field"><span class="lbl">Max Marks</span>
            <input type="number" name="maxMarks" min="1"
                   value="<%= editExam == null || editExam.getMaxMarks() == null ? 100 : editExam.getMaxMarks() %>">
        </label>
        <button type="submit" class="btn">Save Exam</button>
        <a class="btn secondary" href="<%= ctx %>/exams">Cancel</a>
    </form>
</div>
<%@ include file="common/bottom.jsp" %>
