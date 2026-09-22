package com.college.cms.web;

import com.college.cms.util.AuthUtil;
import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class AuthFilter implements Filter {

    @Override
    public void init(FilterConfig filterConfig) {
    }

    @Override
    public void doFilter(ServletRequest req, ServletResponse res, FilterChain chain)
            throws IOException, ServletException {
        HttpServletRequest request = (HttpServletRequest) req;
        HttpServletResponse response = (HttpServletResponse) res;
        request.setCharacterEncoding("UTF-8");

        String path = request.getRequestURI().substring(request.getContextPath().length());
        boolean publicPath = path.equals("/login") || path.equals("/logout") || path.equals("/error.jsp")
                || path.startsWith("/css/") || path.equals("/index.html") || path.isEmpty() || path.equals("/");

        if (path.isEmpty() || path.equals("/") || path.equals("/index.html")) {
            response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
            response.setHeader("Pragma", "no-cache");
            response.setDateHeader("Expires", 0);
        }

        if (!publicPath && AuthUtil.getUser(request) == null) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }
        chain.doFilter(req, res);
    }

    @Override
    public void destroy() {
    }
}
