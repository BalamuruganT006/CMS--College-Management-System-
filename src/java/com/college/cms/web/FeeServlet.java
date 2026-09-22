package com.college.cms.web;

import com.college.cms.model.User;
import com.college.cms.service.FeeService;
import com.college.cms.service.StudentService;
import com.college.cms.util.AuthUtil;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class FeeServlet extends BaseServlet {

    private final FeeService service = new FeeService();
    private final StudentService studentService = new StudentService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        User user = AuthUtil.getUser(request);
        if ("STUDENT".equals(user.getRole())) {
            if (user.getLinkedId() == null) {
                response.sendRedirect(request.getContextPath() + "/dashboard?denied=1");
                return;
            }
            request.setAttribute("fees", service.listForStudent(user.getLinkedId()));
            view(request, response, "my_fees.jsp");
            return;
        }
        if (!AuthUtil.requireRole(request, response, "ADMIN")) {
            return;
        }
        request.setAttribute("fees", service.list());
        request.setAttribute("students", studentService.list());
        request.setAttribute("summary", service.summary());
        request.setAttribute("success", param(request, "ok"));
        request.setAttribute("error", param(request, "err"));
        view(request, response, "fees.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        if (!AuthUtil.requireRole(request, response, "ADMIN")) {
            return;
        }
        String action = param(request, "action");
        try {
            if ("generate".equals(action)) {
                service.generate(param(request, "studentId"), param(request, "totalAmount"), param(request, "dueDate"));
                redirectWithMsg(response, request.getContextPath() + "/fees", "ok", "Fee record generated");
            } else if ("pay".equals(action)) {
                service.recordPayment(param(request, "feeId"), param(request, "amount"));
                redirectWithMsg(response, request.getContextPath() + "/fees", "ok", "Payment recorded");
            } else if ("delete".equals(action)) {
                service.delete(Integer.parseInt(param(request, "id")));
                redirectWithMsg(response, request.getContextPath() + "/fees", "ok", "Fee record deleted");
            } else {
                response.sendRedirect(request.getContextPath() + "/fees");
            }
        } catch (RuntimeException e) {
            redirectWithMsg(response, request.getContextPath() + "/fees", "err", e.getMessage());
        }
    }
}
