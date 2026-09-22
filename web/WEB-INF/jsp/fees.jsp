<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@ include file="common/top.jsp" %>
<h1 class="page-title">Fee Management</h1>

<%
    java.util.List<com.college.cms.model.Fee> fees =
            (java.util.List<com.college.cms.model.Fee>) request.getAttribute("fees");
    java.util.List<com.college.cms.model.Student> students =
            (java.util.List<com.college.cms.model.Student>) request.getAttribute("students");
    java.util.Map<String, Object> summary = (java.util.Map<String, Object>) request.getAttribute("summary");
%>
<div class="stats-grid">
    <div class="stat-card"><div class="stat-value">&#8377; <%= esc(String.valueOf(summary.get("billed"))) %></div><div class="stat-label">Total Billed</div></div>
    <div class="stat-card"><div class="stat-value">&#8377; <%= esc(String.valueOf(summary.get("collected"))) %></div><div class="stat-label">Collected</div></div>
    <div class="stat-card"><div class="stat-value">&#8377; <%= esc(String.valueOf(summary.get("pending"))) %></div><div class="stat-label">Pending</div></div>
</div>

<div class="card">
    <h2>Generate Fee Record</h2>
    <form method="post" action="<%= ctx %>/fees">
        <input type="hidden" name="action" value="generate">
        <label class="field"><span class="lbl">Student *</span>
            <select name="studentId" required>
                <option value="">Select student</option>
<%  if (students != null) {
        for (com.college.cms.model.Student s : students) { %>
                <option value="<%= s.getStudentId() %>"><%= esc(s.getRollNo()) %> - <%= esc(s.getName()) %></option>
<%      }
    } %>
            </select>
        </label>
        <label class="field"><span class="lbl">Total Amount *</span>
            <input type="number" name="totalAmount" step="0.01" min="0.01" required>
        </label>
        <label class="field"><span class="lbl">Due Date</span>
            <input type="date" name="dueDate">
        </label>
        <button type="submit" class="btn">Generate</button>
    </form>
</div>

<div class="card">
    <h2>All Fee Records</h2>
<% if (fees == null || fees.isEmpty()) { %>
    <p class="muted">No fee records yet.</p>
<% } else { %>
    <table class="data">
        <tr><th>Student</th><th>Total</th><th>Paid</th><th>Balance</th><th>Due Date</th><th>Paid On</th><th>Status</th><th>Record Payment</th><th></th></tr>
    <% for (com.college.cms.model.Fee f : fees) {
           if (!"Paid".equals(f.getStatus())) { %>
        <tr>
            <td><%= esc(f.getRollNo()) %> - <%= esc(f.getStudentName()) %></td>
            <td><%= f.getTotalAmount().toPlainString() %></td>
            <td><%= f.getPaidAmount() == null ? "0" : f.getPaidAmount().toPlainString() %></td>
            <td><%= f.getBalance().toPlainString() %></td>
            <td><%= f.getDueDate() == null ? "-" : f.getDueDate() %></td>
            <td><%= f.getPaidDate() == null ? "-" : f.getPaidDate() %></td>
            <td><span class="badge <%= f.getStatus() %>"><%= esc(f.getStatus()) %></span></td>
            <td>
                <form class="inline" method="post" action="<%= ctx %>/fees">
                    <input type="hidden" name="action" value="pay">
                    <input type="hidden" name="feeId" value="<%= f.getFeeId() %>">
                    <input type="number" name="amount" step="0.01" min="0.01"
                           max="<%= f.getBalance().toPlainString() %>" placeholder="Amount" required style="max-width:110px">
                    <button type="submit" class="btn small">Pay</button>
                </form>
            </td>
            <td>
                <form class="inline" method="post" action="<%= ctx %>/fees"
                      onsubmit="return confirm('Delete this fee record?');">
                    <input type="hidden" name="action" value="delete">
                    <input type="hidden" name="id" value="<%= f.getFeeId() %>">
                    <button type="submit" class="btn small danger">Delete</button>
                </form>
            </td>
        </tr>
<%      }
    }
        for (com.college.cms.model.Fee f : fees) {
            if ("Paid".equals(f.getStatus())) { %>
        <tr>
            <td><%= esc(f.getRollNo()) %> - <%= esc(f.getStudentName()) %></td>
            <td><%= f.getTotalAmount().toPlainString() %></td>
            <td><%= f.getPaidAmount() == null ? "0" : f.getPaidAmount().toPlainString() %></td>
            <td>0</td>
            <td><%= f.getDueDate() == null ? "-" : f.getDueDate() %></td>
            <td><%= f.getPaidDate() == null ? "-" : f.getPaidDate() %></td>
            <td><span class="badge Paid">Paid</span></td>
            <td>-</td>
            <td>
                <form class="inline" method="post" action="<%= ctx %>/fees"
                      onsubmit="return confirm('Delete this fee record?');">
                    <input type="hidden" name="action" value="delete">
                    <input type="hidden" name="id" value="<%= f.getFeeId() %>">
                    <button type="submit" class="btn small danger">Delete</button>
                </form>
            </td>
        </tr>
<%      }
    } %>
    </table>
<% } %>
</div>
<%@ include file="common/bottom.jsp" %>
