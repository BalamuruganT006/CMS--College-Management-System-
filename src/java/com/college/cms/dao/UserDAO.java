package com.college.cms.dao;

import com.college.cms.model.User;
import com.college.cms.util.DBConnection;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class UserDAO {

    public User findByUsername(String username) {
        String sql = "SELECT user_id, username, password, role, linked_id FROM users WHERE username = ?";
        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, username);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    User u = new User();
                    u.setUserId(rs.getInt("user_id"));
                    u.setUsername(rs.getString("username"));
                    u.setPassword(rs.getString("password"));
                    u.setRole(rs.getString("role"));
                    int linked = rs.getInt("linked_id");
                    u.setLinkedId(rs.wasNull() ? null : linked);
                    return u;
                }
            }
            return null;
        } catch (SQLException e) {
            throw new RuntimeException("Database error while loading user", e);
        }
    }

    public boolean usernameExists(String username) {
        return findByUsername(username) != null;
    }

    public void insert(User user) {
        String sql = "INSERT INTO users (username, password, role, linked_id) VALUES (?,?,?,?)";
        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, user.getUsername());
            ps.setString(2, user.getPassword());
            ps.setString(3, user.getRole());
            if (user.getLinkedId() == null) {
                ps.setNull(4, java.sql.Types.INTEGER);
            } else {
                ps.setInt(4, user.getLinkedId());
            }
            ps.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException("Database error while creating user account", e);
        }
    }

    public void deleteForLinked(String role, int linkedId) {
        String sql = "DELETE FROM users WHERE role = ? AND linked_id = ?";
        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, role);
            ps.setInt(2, linkedId);
            ps.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException("Database error while removing user account", e);
        }
    }
}
