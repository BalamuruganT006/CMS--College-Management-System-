<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@ include file="common/top.jsp" %>
<h1 class="page-title">My Fees</h1>

<div class="card">
<%
    java.util.List<com.college.cms.model.Fee> fees =
            (java.util.List<com.college.cms.model.Fee>) request.getAttribute("fees");
    if (fees == null || fees.isEmpty()) {
%>
    <p class="muted">No fee records yet.</p>
<% } else { %>
    <table class="data">
        <tr><th>Total</th><th>Paid</th><th>Balance</th><th>Due Date</th><th>Paid On</th><th>Status</th></tr>
    <% for (com.college.cms.model.Fee f : fees) { %>
        <tr>
            <td><%= f.getTotalAmount().toPlainString() %></td>
            <td><%= f.getPaidAmount() == null ? "0" : f.getPaidAmount().toPlainString() %></td>
            <td><%= f.getBalance().toPlainString() %></td>
            <td><%= f.getDueDate() == null ? "-" : f.getDueDate() %></td>
            <td><%= f.getPaidDate() == null ? "-" : f.getPaidDate() %></td>
            <td><span class="badge <%= f.getStatus() %>"><%= esc(f.getStatus()) %></span></td>
        </tr>
    <% } %>
    </table>
<% } %>
</div>
<%@ include file="common/bottom.jsp" %>
