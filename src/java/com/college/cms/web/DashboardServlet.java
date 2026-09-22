package com.college.cms.web;

import com.college.cms.model.User;
import com.college.cms.service.AttendanceService;
import com.college.cms.service.CourseService;
import com.college.cms.service.FeeService;
import com.college.cms.service.FacultyService;
import com.college.cms.service.StudentService;
import com.college.cms.util.AuthUtil;
import java.io.IOException;
import java.util.List;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class DashboardServlet extends BaseServlet {

    private final StudentService studentService = new StudentService();
    private final FacultyService facultyService = new FacultyService();
    private final CourseService courseService = new CourseService();
    private final FeeService feeService = new FeeService();
    private final AttendanceService attendanceService = new AttendanceService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        if (!AuthUtil.requireLogin(request, response)) {
            return;
        }
        User user = AuthUtil.getUser(request);
        String role = user.getRole();
        if ("ADMIN".equals(role)) {
            request.setAttribute("studentCount", studentService.list().size());
            request.setAttribute("facultyCount", facultyService.list().size());
            request.setAttribute("courseCount", courseService.list().size());
            request.setAttribute("feeSummary", feeService.summary());
            request.setAttribute("defaulters", attendanceService.defaulters(75.0));
        } else if ("FACULTY".equals(role)) {
            if (user.getLinkedId() != null) {
                request.setAttribute("myCourses", courseService.listForFaculty(user.getLinkedId()));
            }
        } else if ("STUDENT".equals(role) && user.getLinkedId() != null) {
            int studentId = user.getLinkedId();
            List<Map<String, Object>> pct = attendanceService.overallPercentage(studentId);
            double overall = pct.isEmpty() ? 0.0 : ((Number) pct.get(0).get("percentage")).doubleValue();
            request.setAttribute("attendancePercent", overall);
            request.setAttribute("fees", feeService.listForStudent(studentId));
        }
        request.setAttribute("denied", param(request, "denied"));
        view(request, response, "dashboard.jsp");
    }
}
