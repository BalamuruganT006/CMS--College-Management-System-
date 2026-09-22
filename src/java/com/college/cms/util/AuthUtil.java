package com.college.cms.util;

import com.college.cms.model.User;
import java.io.IOException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public final class AuthUtil {

    public static final String SESSION_USER = "cmsUser";

    private AuthUtil() {
    }

    public static User getUser(HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        return session == null ? null : (User) session.getAttribute(SESSION_USER);
    }

    public static boolean hasRole(HttpServletRequest request, String... roles) {
        User user = getUser(request);
        if (user == null) {
            return false;
        }
        for (String role : roles) {
            if (user.getRole().equals(role)) {
                return true;
            }
        }
        return false;
    }

    public static boolean requireLogin(HttpServletRequest request, HttpServletResponse response) throws IOException {
        if (getUser(request) == null) {
            response.sendRedirect(request.getContextPath() + "/login");
            return false;
        }
        return true;
    }

    public static boolean requireRole(HttpServletRequest request, HttpServletResponse response, String... roles)
            throws IOException {
        if (!requireLogin(request, response)) {
            return false;
        }
        if (!hasRole(request, roles)) {
            response.sendRedirect(request.getContextPath() + "/dashboard?denied=1");
            return false;
        }
        return true;
    }
}
