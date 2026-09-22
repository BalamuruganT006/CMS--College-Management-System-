package com.college.cms.web;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public abstract class BaseServlet extends HttpServlet {

    protected void view(HttpServletRequest request, HttpServletResponse response, String jsp)
            throws ServletException, IOException {
        RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/jsp/" + jsp);
        rd.forward(request, response);
    }

    protected void redirectWithMsg(HttpServletResponse response, String path, String msgType, String message)
            throws IOException {
        String sep = path.contains("?") ? "&" : "?";
        StringBuilder url = new StringBuilder(path);
        if (message != null && !message.isEmpty()) {
            url.append(sep).append(msgType).append("=").append(java.net.URLEncoder.encode(message, "UTF-8"));
        }
        response.sendRedirect(url.toString());
    }

    protected String param(HttpServletRequest request, String name) {
        String value = request.getParameter(name);
        return value == null ? "" : value.trim();
    }
}
