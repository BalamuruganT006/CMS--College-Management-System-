package com.college.cms.web;

import com.college.cms.model.User;
import com.college.cms.service.AuthService;
import com.college.cms.util.AuthUtil;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class LoginServlet extends BaseServlet {

    private final AuthService authService = new AuthService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        if (AuthUtil.getUser(request) != null) {
            response.sendRedirect(request.getContextPath() + "/dashboard");
            return;
        }
        view(request, response, "login.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            User user = authService.login(param(request, "username"), request.getParameter("password"));
            request.getSession(true).setAttribute(AuthUtil.SESSION_USER, user);
            response.sendRedirect(request.getContextPath() + "/dashboard");
        } catch (IllegalArgumentException e) {
            request.setAttribute("error", e.getMessage());
            view(request, response, "login.jsp");
        }
    }
}
