package com.college.cms.dao;

import com.college.cms.model.Faculty;
import com.college.cms.util.DBConnection;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class FacultyDAO {

    private static final String BASE_SELECT =
            "SELECT f.faculty_id, f.emp_code, f.name, f.email, f.phone, f.department_id, f.designation, "
          + "f.joining_date, d.dept_name "
          + "FROM faculty f LEFT JOIN department d ON d.department_id = f.department_id ";

    public List<Faculty> findAll() {
        String sql = BASE_SELECT + "ORDER BY f.emp_code";
        List<Faculty> list = new ArrayList<>();
        try (Connection con = DBConnection.getConnection();
             Statement st = con.createStatement();
             ResultSet rs = st.executeQuery(sql)) {
            while (rs.next()) {
                list.add(mapRow(rs));
            }
            return list;
        } catch (SQLException e) {
            throw new RuntimeException("Database error while loading faculty", e);
        }
    }

    public Faculty findById(int id) {
        String sql = BASE_SELECT + "WHERE f.faculty_id = ?";
        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, id);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    return mapRow(rs);
                }
            }
            return null;
        } catch (SQLException e) {
            throw new RuntimeException("Database error while loading faculty", e);
        }
    }

    public void insert(Faculty f) {
        String sql = "INSERT INTO faculty (emp_code, name, email, phone, department_id, designation, joining_date) "
                   + "VALUES (?,?,?,?,?,?,?)";
        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            bind(ps, f);
            ps.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException("Could not save faculty: " + StudentDAO.friendly(e), e);
        }
    }

    public void update(Faculty f) {
        String sql = "UPDATE faculty SET emp_code=?, name=?, email=?, phone=?, department_id=?, designation=?, "
                   + "joining_date=? WHERE faculty_id=?";
        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            bind(ps, f);
            ps.setInt(8, f.getFacultyId());
            ps.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException("Could not update faculty: " + StudentDAO.friendly(e), e);
        }
    }

    public void delete(int id) {
        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement("DELETE FROM faculty WHERE faculty_id = ?")) {
            ps.setInt(1, id);
            ps.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException("Cannot delete faculty: course assignments or attendance records exist", e);
        }
    }

    public String nextEmpCode() {
        String sql = "SELECT emp_code FROM faculty WHERE emp_code LIKE 'EMP%' ORDER BY LENGTH(emp_code) DESC, emp_code DESC";
        int max = 0;
        try (Connection con = DBConnection.getConnection();
             Statement st = con.createStatement();
             ResultSet rs = st.executeQuery(sql)) {
            while (rs.next()) {
                String code = rs.getString(1).substring(3);
                try {
                    max = Math.max(max, Integer.parseInt(code));
                } catch (NumberFormatException ignore) {
                }
            }
        } catch (SQLException e) {
            throw new RuntimeException("Database error while generating employee code", e);
        }
        return String.format("EMP%04d", max + 1);
    }

    private void bind(PreparedStatement ps, Faculty f) throws SQLException {
        ps.setString(1, f.getEmpCode());
        ps.setString(2, f.getName());
        ps.setString(3, StudentDAO.emptyToNull(f.getEmail()));
        ps.setString(4, StudentDAO.emptyToNull(f.getPhone()));
        StudentDAO.setNullableInt(ps, 5, f.getDepartmentId());
        ps.setString(6, StudentDAO.emptyToNull(f.getDesignation()));
        if (f.getJoiningDate() == null) {
            ps.setNull(7, java.sql.Types.DATE);
        } else {
            ps.setDate(7, Date.valueOf(f.getJoiningDate()));
        }
    }

    private static Faculty mapRow(ResultSet rs) throws SQLException {
        Faculty f = new Faculty();
        f.setFacultyId(rs.getInt("faculty_id"));
        f.setEmpCode(rs.getString("emp_code"));
        f.setName(rs.getString("name"));
        f.setEmail(rs.getString("email"));
        f.setPhone(rs.getString("phone"));
        int dept = rs.getInt("department_id");
        f.setDepartmentId(rs.wasNull() ? null : dept);
        f.setDesignation(rs.getString("designation"));
        Date jd = rs.getDate("joining_date");
        f.setJoiningDate(jd == null ? null : jd.toLocalDate());
        f.setDepartmentName(rs.getString("dept_name"));
        return f;
    }
}
