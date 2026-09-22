package com.college.cms.web;

import com.college.cms.service.AttendanceService;
import com.college.cms.service.CourseService;
import com.college.cms.service.DepartmentService;
import com.college.cms.service.StudentService;
import com.college.cms.model.User;
import com.college.cms.util.AuthUtil;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class StudentServlet extends BaseServlet {

    private final StudentService service = new StudentService();
    private final DepartmentService departmentService = new DepartmentService();
    private final CourseService courseService = new CourseService();
    private final AttendanceService attendanceService = new AttendanceService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        User user = AuthUtil.getUser(request);
        String action = param(request, "action");

        if ("view".equals(action)) {
            int id = Integer.parseInt(param(request, "id"));
            if ("STUDENT".equals(user.getRole()) && (user.getLinkedId() == null || user.getLinkedId() != id)) {
                response.sendRedirect(request.getContextPath() + "/dashboard?denied=1");
                return;
            }
            request.setAttribute("student", service.get(id));
            request.setAttribute("overallPct", attendanceService.overallPercentage(id));
            request.setAttribute("coursePct", attendanceService.coursePercentage(id));
            view(request, response, "student_view.jsp");
            return;
        }

        if (!AuthUtil.requireRole(request, response, "ADMIN")) {
            return;
        }

        if ("form".equals(action)) {
            String editId = param(request, "edit");
            if (!editId.isEmpty()) {
                request.setAttribute("editStudent", service.get(Integer.parseInt(editId)));
            }
            request.setAttribute("departments", departmentService.list());
            view(request, response, "student_form.jsp");
            return;
        }

        request.setAttribute("students", service.search(
                param(request, "q"),
                param(request, "dept").isEmpty() ? null : Integer.parseInt(param(request, "dept")),
                param(request, "year").isEmpty() ? null : Integer.parseInt(param(request, "year"))));
        request.setAttribute("departments", departmentService.list());
        request.setAttribute("success", param(request, "ok"));
        request.setAttribute("error", param(request, "err"));
        request.setAttribute("q", param(request, "q"));
        request.setAttribute("deptFilter", param(request, "dept"));
        request.setAttribute("yearFilter", param(request, "year"));
        view(request, response, "students.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        if (!AuthUtil.requireRole(request, response, "ADMIN")) {
            return;
        }
        String action = param(request, "action");
        try {
            if ("save".equals(action)) {
                boolean createLogin = !"off".equals(param(request, "createLogin"));
                service.save(param(request, "id"), param(request, "rollNo"), param(request, "name"),
                        param(request, "dob"), param(request, "gender"), param(request, "email"),
                        param(request, "phone"), param(request, "address"), param(request, "departmentId"),
                        param(request, "yearOfStudy"), createLogin);
                redirectWithMsg(response, request.getContextPath() + "/students", "ok",
                        "Student saved" + (createLogin ? " (login: roll no / welcome123)" : ""));
            } else if ("delete".equals(action)) {
                service.delete(Integer.parseInt(param(request, "id")));
                redirectWithMsg(response, request.getContextPath() + "/students", "ok", "Student deleted");
            } else {
                response.sendRedirect(request.getContextPath() + "/students");
            }
        } catch (RuntimeException e) {
            redirectWithMsg(response, request.getContextPath() + "/students", "err", e.getMessage());
        }
    }
}
