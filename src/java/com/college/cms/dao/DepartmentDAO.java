package com.college.cms.dao;

import com.college.cms.model.Department;
import com.college.cms.util.DBConnection;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class DepartmentDAO {

    public List<Department> findAll() {
        String sql = "SELECT department_id, dept_name, hod_name FROM department ORDER BY dept_name";
        List<Department> list = new ArrayList<>();
        try (Connection con = DBConnection.getConnection();
             Statement st = con.createStatement();
             ResultSet rs = st.executeQuery(sql)) {
            while (rs.next()) {
                list.add(new Department(rs.getInt(1), rs.getString(2), rs.getString(3)));
            }
            return list;
        } catch (SQLException e) {
            throw new RuntimeException("Database error while loading departments", e);
        }
    }

    public Department findById(int id) {
        String sql = "SELECT department_id, dept_name, hod_name FROM department WHERE department_id = ?";
        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, id);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    return new Department(rs.getInt(1), rs.getString(2), rs.getString(3));
                }
            }
            return null;
        } catch (SQLException e) {
            throw new RuntimeException("Database error while loading department", e);
        }
    }

    public void insert(Department d) {
        String sql = "INSERT INTO department (dept_name, hod_name) VALUES (?,?)";
        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, d.getDeptName());
            ps.setString(2, d.getHodName());
            ps.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException("Database error while saving department", e);
        }
    }

    public void update(Department d) {
        String sql = "UPDATE department SET dept_name = ?, hod_name = ? WHERE department_id = ?";
        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, d.getDeptName());
            ps.setString(2, d.getHodName());
            ps.setInt(3, d.getDepartmentId());
            ps.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException("Database error while updating department", e);
        }
    }

    public void delete(int id) {
        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement("DELETE FROM department WHERE department_id = ?")) {
            ps.setInt(1, id);
            ps.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException("Cannot delete department: it is referenced by students, faculty or courses", e);
        }
    }
}
