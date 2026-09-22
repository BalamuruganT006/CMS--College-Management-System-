package com.college.cms.web;

import com.college.cms.service.AttendanceService;
import com.college.cms.service.DepartmentService;
import com.college.cms.service.FeeService;
import com.college.cms.service.MarksService;
import com.college.cms.service.StudentService;
import com.college.cms.util.AuthUtil;
import java.io.IOException;
import java.io.PrintWriter;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ReportServlet extends BaseServlet {

    private final StudentService studentService = new StudentService();
    private final DepartmentService departmentService = new DepartmentService();
    private final AttendanceService attendanceService = new AttendanceService();
    private final MarksService marksService = new MarksService();
    private final FeeService feeService = new FeeService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        if (!AuthUtil.requireRole(request, response, "ADMIN")) {
            return;
        }
        String report = param(request, "report");
        if (report.isEmpty()) {
            report = "students";
        }
        Integer deptId = param(request, "dept").isEmpty() ? null : Integer.parseInt(param(request, "dept"));
        Integer year = param(request, "year").isEmpty() ? null : Integer.parseInt(param(request, "year"));

        List<String[]> rows;
        String[] headers;
        String title;

        switch (report) {
            case "defaulters":
                title = "Attendance Defaulters (below 75%)";
                headers = new String[]{"Roll No", "Name", "Present", "Total", "Percentage"};
                rows = defaultersRows();
                break;
            case "results":
                title = "Result Summary by Exam";
                headers = new String[]{"Exam", "Course", "Entries", "Average", "Highest", "Passed"};
                rows = resultsRows();
                break;
            case "fees":
                title = "Fee Collection Summary";
                headers = new String[]{"Metric", "Value"};
                rows = feeRows();
                break;
            default:
                title = "Student List";
                headers = new String[]{"Roll No", "Name", "Department", "Year", "Email", "Phone"};
                rows = studentsRows(deptId, year);
                report = "students";
                break;
        }

        if ("csv".equals(param(request, "format"))) {
            writeCsv(response, "report_" + report + ".csv", headers, rows);
            return;
        }

        request.setAttribute("title", title);
        request.setAttribute("headers", headers);
        request.setAttribute("rows", rows);
        request.setAttribute("currentReport", report);
        request.setAttribute("departments", departmentService.list());
        request.setAttribute("deptFilter", param(request, "dept"));
        request.setAttribute("yearFilter", param(request, "year"));
        view(request, response, "reports.jsp");
    }

    private List<String[]> studentsRows(Integer deptId, Integer year) {
        List<String[]> rows = new ArrayList<>();
        for (com.college.cms.model.Student s : studentService.search(null, deptId, year)) {
            rows.add(new String[]{s.getRollNo(), s.getName(),
                s.getDepartmentName() == null ? "-" : s.getDepartmentName(),
                s.getYearOfStudy() == null ? "-" : String.valueOf(s.getYearOfStudy()),
                s.getEmail() == null ? "-" : s.getEmail(),
                s.getPhone() == null ? "-" : s.getPhone()});
        }
        return rows;
    }

    private List<String[]> defaultersRows() {
        List<String[]> rows = new ArrayList<>();
        for (Map<String, Object> r : attendanceService.defaulters(75.0)) {
            rows.add(new String[]{String.valueOf(r.get("rollNo")), String.valueOf(r.get("name")),
                String.valueOf(r.get("present")), String.valueOf(r.get("total")),
                String.format("%.1f%%", ((Number) r.get("percentage")).doubleValue())});
        }
        return rows;
    }

    private List<String[]> resultsRows() {
        List<String[]> rows = new ArrayList<>();
        for (Map<String, Object> r : marksService.resultSummary()) {
            BigDecimal avg = (BigDecimal) r.get("average");
            BigDecimal high = (BigDecimal) r.get("highest");
            rows.add(new String[]{String.valueOf(r.get("examName")),
                r.get("courseCode") == null ? "-" : String.valueOf(r.get("courseCode")),
                String.valueOf(r.get("count")),
                avg == null ? "-" : avg.toPlainString(),
                high == null ? "-" : high.toPlainString(),
                String.valueOf(r.get("passed"))});
        }
        return rows;
    }

    private List<String[]> feeRows() {
        Map<String, Object> s = feeService.summary();
        List<String[]> rows = new ArrayList<>();
        rows.add(new String[]{"Total Billed", money(s.get("billed"))});
        rows.add(new String[]{"Total Collected", money(s.get("collected"))});
        rows.add(new String[]{"Pending", money(s.get("pending"))});
        rows.add(new String[]{"Paid Records", String.valueOf(s.get("paidCount"))});
        rows.add(new String[]{"Partial Records", String.valueOf(s.get("partialCount"))});
        rows.add(new String[]{"Unpaid Records", String.valueOf(s.get("unpaidCount"))});
        return rows;
    }

    private String money(Object value) {
        return value instanceof BigDecimal ? ((BigDecimal) value).toPlainString() : String.valueOf(value);
    }

    private void writeCsv(HttpServletResponse response, String filename, String[] headers, List<String[]> rows)
            throws IOException {
        response.setContentType("text/csv;charset=UTF-8");
        response.setHeader("Content-Disposition", "attachment; filename=\"" + filename + "\"");
        try (PrintWriter out = response.getWriter()) {
            out.println(String.join(",", escapeAll(headers)));
            for (String[] row : rows) {
                out.println(String.join(",", escapeAll(row)));
            }
        }
    }

    private String[] escapeAll(String[] values) {
        String[] out = new String[values.length];
        for (int i = 0; i < values.length; i++) {
            String v = values[i] == null ? "" : values[i];
            if (v.contains(",") || v.contains("\"") || v.contains("\n")) {
                v = "\"" + v.replace("\"", "\"\"") + "\"";
            }
            out[i] = v;
        }
        return out;
    }
}
