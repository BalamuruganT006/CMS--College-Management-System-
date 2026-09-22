package com.college.cms.web;

import com.college.cms.service.CourseService;
import com.college.cms.service.DepartmentService;
import com.college.cms.service.FacultyService;
import com.college.cms.util.AuthUtil;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class CourseServlet extends BaseServlet {

    private final CourseService service = new CourseService();
    private final DepartmentService departmentService = new DepartmentService();
    private final FacultyService facultyService = new FacultyService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        if (!AuthUtil.requireRole(request, response, "ADMIN")) {
            return;
        }
        request.setAttribute("courses", service.list());
        request.setAttribute("departments", departmentService.list());
        request.setAttribute("faculties", facultyService.list());
        request.setAttribute("success", param(request, "ok"));
        request.setAttribute("error", param(request, "err"));
        view(request, response, "courses.jsp");
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
                service.save(param(request, "id"), param(request, "courseCode"), param(request, "courseName"),
                        param(request, "credits"), param(request, "semester"), param(request, "departmentId"));
                redirectWithMsg(response, request.getContextPath() + "/courses", "ok", "Course saved");
            } else if ("delete".equals(action)) {
                service.delete(Integer.parseInt(param(request, "id")));
                redirectWithMsg(response, request.getContextPath() + "/courses", "ok", "Course deleted");
            } else if ("assign".equals(action)) {
                Integer facultyId = param(request, "facultyId").isEmpty()
                        ? null : Integer.parseInt(param(request, "facultyId"));
                service.assignFaculty(Integer.parseInt(param(request, "courseId")), facultyId);
                redirectWithMsg(response, request.getContextPath() + "/courses", "ok", "Faculty assignment updated");
            } else {
                response.sendRedirect(request.getContextPath() + "/courses");
            }
        } catch (RuntimeException e) {
            redirectWithMsg(response, request.getContextPath() + "/courses", "err", e.getMessage());
        }
    }
}
