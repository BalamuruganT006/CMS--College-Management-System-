package com.college.cms.web;

import com.college.cms.service.DepartmentService;
import com.college.cms.service.FacultyService;
import com.college.cms.util.AuthUtil;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class FacultyServlet extends BaseServlet {

    private final FacultyService service = new FacultyService();
    private final DepartmentService departmentService = new DepartmentService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        if (!AuthUtil.requireRole(request, response, "ADMIN")) {
            return;
        }
        if ("form".equals(param(request, "action"))) {
            String editId = param(request, "edit");
            if (!editId.isEmpty()) {
                request.setAttribute("editFaculty", service.get(Integer.parseInt(editId)));
            }
            request.setAttribute("departments", departmentService.list());
            view(request, response, "faculty_form.jsp");
            return;
        }
        request.setAttribute("faculties", service.list());
        request.setAttribute("success", param(request, "ok"));
        request.setAttribute("error", param(request, "err"));
        view(request, response, "faculties.jsp");
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
                service.save(param(request, "id"), param(request, "empCode"), param(request, "name"),
                        param(request, "email"), param(request, "phone"), param(request, "departmentId"),
                        param(request, "designation"), param(request, "joiningDate"), createLogin);
                redirectWithMsg(response, request.getContextPath() + "/faculties", "ok",
                        "Faculty saved" + (createLogin ? " (login: emp code / welcome123)" : ""));
            } else if ("delete".equals(action)) {
                service.delete(Integer.parseInt(param(request, "id")));
                redirectWithMsg(response, request.getContextPath() + "/faculties", "ok", "Faculty deleted");
            } else {
                response.sendRedirect(request.getContextPath() + "/faculties");
            }
        } catch (RuntimeException e) {
            redirectWithMsg(response, request.getContextPath() + "/faculties", "err", e.getMessage());
        }
    }
}
