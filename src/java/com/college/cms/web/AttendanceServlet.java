package com.college.cms.web;

import com.college.cms.model.User;
import com.college.cms.service.AttendanceService;
import com.college.cms.service.CourseService;
import com.college.cms.util.AuthUtil;
import com.college.cms.util.ValidationUtil;
import java.io.IOException;
import java.time.LocalDate;
import java.util.List;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class AttendanceServlet extends BaseServlet {

    private final AttendanceService service = new AttendanceService();
    private final CourseService courseService = new CourseService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        User user = AuthUtil.getUser(request);
        if ("STUDENT".equals(user.getRole())) {
            if (user.getLinkedId() == null) {
                response.sendRedirect(request.getContextPath() + "/dashboard?denied=1");
                return;
            }
            int studentId = user.getLinkedId();
            request.setAttribute("overall", service.overallPercentage(studentId));
            request.setAttribute("perCourse", service.coursePercentage(studentId));
            view(request, response, "my_attendance.jsp");
            return;
        }

        if (!AuthUtil.requireRole(request, response, "ADMIN", "FACULTY")) {
            return;
        }

        List<com.college.cms.model.Course> courses = "FACULTY".equals(user.getRole()) && user.getLinkedId() != null
                ? courseService.listForFaculty(user.getLinkedId())
                : courseService.list();
        request.setAttribute("courses", courses);

        String action = param(request, "action");
        if ("load".equals(action) || "save".equals(action)) {
            try {
                int courseId = ValidationUtil.requiredInt(param(request, "courseId"), "Course");
                LocalDate date = ValidationUtil.date(param(request, "date"), "Attendance date");
                request.setAttribute("selectedCourseId", courseId);
                request.setAttribute("selectedDate", date.toString());
                Map<Integer, com.college.cms.model.Attendance> existing =
                        "load".equals(action) ? service.loadRosterStatus(courseId, date) : null;
                if (existing != null) {
                    request.setAttribute("existing", existing);
                    request.setAttribute("roster", service.roster());
                }
            } catch (IllegalArgumentException e) {
                request.setAttribute("error", e.getMessage());
            }
        }
        request.setAttribute("success", param(request, "ok"));
        request.setAttribute("errorParam", param(request, "err"));
        view(request, response, "attendance.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        User user = AuthUtil.getUser(request);
        if (!AuthUtil.requireRole(request, response, "ADMIN", "FACULTY")) {
            return;
        }
        try {
            int courseId = ValidationUtil.requiredInt(param(request, "courseId"), "Course");
            LocalDate date = ValidationUtil.date(param(request, "date"), "Attendance date");
            Integer markedBy = "FACULTY".equals(user.getRole()) ? user.getLinkedId() : null;
            service.save(date, courseId, markedBy, request.getParameterMap());
            redirectWithMsg(response, request.getContextPath() + "/attendance?action=load&courseId=" + courseId
                    + "&date=" + date, "ok", "Attendance saved for " + date);
        } catch (RuntimeException e) {
            redirectWithMsg(response, request.getContextPath() + "/attendance", "err", e.getMessage());
        }
    }
}
