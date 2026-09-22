package com.college.cms.service;

import com.college.cms.dao.UserDAO;
import com.college.cms.model.User;
import com.college.cms.util.PasswordUtil;
import com.college.cms.util.ValidationUtil;

public class AuthService {

    private final UserDAO userDAO = new UserDAO();

    public User login(String username, String password) {
        ValidationUtil.notBlank(username, "Username");
        ValidationUtil.notBlank(password, "Password");
        User user = userDAO.findByUsername(username.trim());
        if (user == null || !PasswordUtil.verify(password, user.getPassword())) {
            throw new IllegalArgumentException("Invalid username or password");
        }
        return user;
    }

    public void createLogin(String username, String plainPassword, String role, Integer linkedId) {
        if (userDAO.usernameExists(username)) {
            return;
        }
        User u = new User();
        u.setUsername(username);
        u.setPassword(PasswordUtil.hash(plainPassword));
        u.setRole(role);
        u.setLinkedId(linkedId);
        userDAO.insert(u);
    }

    public void removeLogin(String role, int linkedId) {
        userDAO.deleteForLinked(role, linkedId);
    }
}
