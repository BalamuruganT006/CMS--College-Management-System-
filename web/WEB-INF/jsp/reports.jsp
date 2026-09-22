<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@ include file="common/top.jsp" %>
<h1 class="page-title">Reports</h1>

<div class="card">
    <div class="toolbar">
        <a class="btn <%= "students".equals(request.getAttribute("currentReport")) ? "" : "secondary" %>"
           href="<%= ctx %>/reports?report=students">Student List</a>
        <a class="btn <%= "defaulters".equals(request.getAttribute("currentReport")) ? "" : "secondary" %>"
           href="<%= ctx %>/reports?report=defaulters">Attendance Defaulters</a>
        <a class="btn <%= "results".equals(request.getAttribute("currentReport")) ? "" : "secondary" %>"
           href="<%= ctx %>/reports?report=results">Result Summary</a>
        <a class="btn <%= "fees".equals(request.getAttribute("currentReport")) ? "" : "secondary" %>"
           href="<%= ctx %>/reports?report=fees">Fee Collection</a>
    </div>

<% if ("students".equals(request.getAttribute("currentReport"))) { %>
    <form class="toolbar" method="get" action="<%= ctx %>/reports">
        <input type="hidden" name="report" value="students">
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
    } %>
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
        <button type="submit" class="btn">Apply Filters</button>
    </form>
<% } %>

    <h2><%= esc((String) request.getAttribute("title")) %></h2>
<%
    String[] headers = (String[]) request.getAttribute("headers");
    java.util.List<String[]> rows = (java.util.List<String[]>) request.getAttribute("rows");
    StringBuilder qs = new StringBuilder("?report=" + request.getAttribute("currentReport"));
    if (deptFilter != null && !deptFilter.isEmpty()) {
        qs.append("&dept=").append(deptFilter);
    }
    if (yearFilter != null && !yearFilter.isEmpty()) {
        qs.append("&year=").append(yearFilter);
    }
%>
    <p><a class="btn small secondary" href="<%= ctx %>/reports<%= qs %>&format=csv">Export CSV</a></p>
<% if (rows == null || rows.isEmpty()) { %>
    <p class="muted mt">No data for this report.</p>
<% } else { %>
    <table class="data mt">
        <tr><% for (String h : headers) { %><th><%= esc(h) %></th><% } %></tr>
    <% for (String[] row : rows) { %>
        <tr><% for (String cell : row) { %><td><%= esc(cell) %></td><% } %></tr>
    <% } %>
    </table>
<% } %>
</div>
<%@ include file="common/bottom.jsp" %>
