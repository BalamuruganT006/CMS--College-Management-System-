package com.college.cms.web;

import com.college.cms.model.User;
import com.college.cms.service.ExamService;
import com.college.cms.service.MarksService;
import com.college.cms.util.AuthUtil;
import com.college.cms.util.ValidationUtil;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MarksServlet extends BaseServlet {

    private final MarksService marksService = new MarksService();
    private final ExamService examService = new ExamService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        User user = AuthUtil.getUser(request);
        if ("STUDENT".equals(user.getRole())) {
            if (user.getLinkedId() == null) {
                response.sendRedirect(request.getContextPath() + "/dashboard?denied=1");
                return;
            }
            request.setAttribute("marks", marksService.marksheet(user.getLinkedId()));
            view(request, response, "marksheet.jsp");
            return;
        }

        if (!AuthUtil.requireRole(request, response, "ADMIN", "FACULTY")) {
            return;
        }
        request.setAttribute("exams", examService.list());
        if ("load".equals(param(request, "action"))) {
            try {
                int examId = ValidationUtil.requiredInt(param(request, "examId"), "Exam");
                request.setAttribute("selectedExam", examService.get(examId));
                request.setAttribute("roster", marksService.rosterWithMarks(examId));
                request.setAttribute("summary", marksService.examSummary(examId));
            } catch (IllegalArgumentException e) {
                request.setAttribute("error", e.getMessage());
            }
        }
        request.setAttribute("success", param(request, "ok"));
        request.setAttribute("errorParam", param(request, "err"));
        view(request, response, "marks_entry.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        if (!AuthUtil.requireRole(request, response, "ADMIN", "FACULTY")) {
            return;
        }
        try {
            String examId = param(request, "examId");
            marksService.saveEntries(examId, request.getParameterMap());
            redirectWithMsg(response, request.getContextPath() + "/marks?action=load&examId=" + examId,
                    "ok", "Marks saved and grades updated");
        } catch (RuntimeException e) {
            redirectWithMsg(response, request.getContextPath() + "/marks", "err", e.getMessage());
        }
    }
}
