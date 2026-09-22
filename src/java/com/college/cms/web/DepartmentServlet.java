package com.college.cms.web;

import com.college.cms.service.DepartmentService;
import com.college.cms.util.AuthUtil;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class DepartmentServlet extends BaseServlet {

    private final DepartmentService service = new DepartmentService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        if (!AuthUtil.requireRole(request, response, "ADMIN")) {
            return;
        }
        String editId = param(request, "edit");
        if (!editId.isEmpty()) {
            request.setAttribute("editDept", service.get(Integer.parseInt(editId)));
        }
        request.setAttribute("departments", service.list());
        request.setAttribute("success", param(request, "ok"));
        request.setAttribute("error", param(request, "err"));
        view(request, response, "departments.jsp");
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
                service.save(param(request, "id"), param(request, "deptName"), param(request, "hodName"));
                redirectWithMsg(response, request.getContextPath() + "/departments", "ok", "Department saved");
            } else if ("delete".equals(action)) {
                service.delete(Integer.parseInt(param(request, "id")));
                redirectWithMsg(response, request.getContextPath() + "/departments", "ok", "Department deleted");
            } else {
                response.sendRedirect(request.getContextPath() + "/departments");
            }
        } catch (RuntimeException e) {
            redirectWithMsg(response, request.getContextPath() + "/departments", "err", e.getMessage());
        }
    }
}
