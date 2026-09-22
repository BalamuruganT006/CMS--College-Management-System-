package com.college.cms.web;

import com.college.cms.model.User;
import com.college.cms.service.CourseService;
import com.college.cms.service.ExamService;
import com.college.cms.service.MarksService;
import com.college.cms.util.AuthUtil;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ExamServlet extends BaseServlet {

    private final ExamService service = new ExamService();
    private final CourseService courseService = new CourseService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        if (!AuthUtil.requireRole(request, response, "ADMIN", "FACULTY")) {
            return;
        }
        if ("form".equals(param(request, "action"))) {
            String editId = param(request, "edit");
            if (!editId.isEmpty()) {
                request.setAttribute("editExam", service.get(Integer.parseInt(editId)));
            }
            request.setAttribute("courses", courseService.list());
            view(request, response, "exam_form.jsp");
            return;
        }
        request.setAttribute("exams", service.list());
        request.setAttribute("success", param(request, "ok"));
        request.setAttribute("error", param(request, "err"));
        view(request, response, "exams.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        if (!AuthUtil.requireRole(request, response, "ADMIN", "FACULTY")) {
            return;
        }
        String action = param(request, "action");
        try {
            if ("save".equals(action)) {
                service.save(param(request, "id"), param(request, "examName"), param(request, "courseId"),
                        param(request, "examDate"), param(request, "maxMarks"));
                redirectWithMsg(response, request.getContextPath() + "/exams", "ok", "Exam saved");
            } else if ("delete".equals(action)) {
                service.delete(Integer.parseInt(param(request, "id")));
                redirectWithMsg(response, request.getContextPath() + "/exams", "ok", "Exam deleted");
            } else {
                response.sendRedirect(request.getContextPath() + "/exams");
            }
        } catch (RuntimeException e) {
            redirectWithMsg(response, request.getContextPath() + "/exams", "err", e.getMessage());
        }
    }
}
