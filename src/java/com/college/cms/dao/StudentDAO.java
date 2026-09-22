package com.college.cms.dao;

import com.college.cms.model.Student;
import com.college.cms.util.DBConnection;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class StudentDAO {

    private static final String BASE_SELECT =
            "SELECT s.student_id, s.roll_no, s.name, s.dob, s.gender, s.email, s.phone, s.address, "
          + "s.department_id, s.year_of_study, s.admission_date, d.dept_name "
          + "FROM student s LEFT JOIN department d ON d.department_id = s.department_id ";

    public List<Student> findAll() {
        return search(null, null, null);
    }

    public List<Student> search(String keyword, Integer departmentId, Integer year) {
        StringBuilder sql = new StringBuilder(BASE_SELECT);
        List<Object> params = new ArrayList<>();
        List<String> where = new ArrayList<>();
        if (keyword != null && !keyword.trim().isEmpty()) {
            where.add("(s.name LIKE ? OR s.roll_no LIKE ? OR s.email LIKE ?)");
            String like = "%" + keyword.trim() + "%";
            params.add(like);
            params.add(like);
            params.add(like);
        }
        if (departmentId != null) {
            where.add("s.department_id = ?");
            params.add(departmentId);
        }
        if (year != null) {
            where.add("s.year_of_study = ?");
            params.add(year);
        }
        if (!where.isEmpty()) {
            sql.append("WHERE ").append(String.join(" AND ", where)).append(" ");
        }
        sql.append("ORDER BY s.roll_no");
        List<Student> list = new ArrayList<>();
        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql.toString())) {
            for (int i = 0; i < params.size(); i++) {
                ps.setObject(i + 1, params.get(i));
            }
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    list.add(mapRow(rs));
                }
            }
            return list;
        } catch (SQLException e) {
            throw new RuntimeException("Database error while loading students", e);
        }
    }

    public Student findById(int id) {
        String sql = BASE_SELECT + "WHERE s.student_id = ?";
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
            throw new RuntimeException("Database error while loading student", e);
        }
    }

    public void insert(Student s) {
        String sql = "INSERT INTO student (roll_no, name, dob, gender, email, phone, address, department_id, year_of_study) "
                   + "VALUES (?,?,?,?,?,?,?,?,?)";
        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            bind(ps, s);
            ps.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException("Could not save student: " + friendly(e), e);
        }
    }

    public void update(Student s) {
        String sql = "UPDATE student SET roll_no=?, name=?, dob=?, gender=?, email=?, phone=?, address=?, "
                   + "department_id=?, year_of_study=? WHERE student_id=?";
        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            bind(ps, s);
            ps.setInt(10, s.getStudentId());
            ps.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException("Could not update student: " + friendly(e), e);
        }
    }

    public void delete(int id) {
        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement("DELETE FROM student WHERE student_id = ?")) {
            ps.setInt(1, id);
            ps.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException("Cannot delete student: attendance, marks or fee records exist", e);
        }
    }

    public String nextRollNo() {
        String sql = "SELECT roll_no FROM student WHERE roll_no LIKE 'STU%' ORDER BY LENGTH(roll_no) DESC, roll_no DESC";
        int max = 0;
        try (Connection con = DBConnection.getConnection();
             Statement st = con.createStatement();
             ResultSet rs = st.executeQuery(sql)) {
            while (rs.next()) {
                String roll = rs.getString(1).substring(3);
                try {
                    max = Math.max(max, Integer.parseInt(roll));
                } catch (NumberFormatException ignore) {
                }
            }
        } catch (SQLException e) {
            throw new RuntimeException("Database error while generating roll number", e);
        }
        return String.format("STU%04d", max + 1);
    }

    private void bind(PreparedStatement ps, Student s) throws SQLException {
        ps.setString(1, s.getRollNo());
        ps.setString(2, s.getName());
        if (s.getDob() == null) {
            ps.setNull(3, java.sql.Types.DATE);
        } else {
            ps.setDate(3, Date.valueOf(s.getDob()));
        }
        ps.setString(4, emptyToNull(s.getGender()));
        ps.setString(5, emptyToNull(s.getEmail()));
        ps.setString(6, emptyToNull(s.getPhone()));
        ps.setString(7, emptyToNull(s.getAddress()));
        setNullableInt(ps, 8, s.getDepartmentId());
        setNullableInt(ps, 9, s.getYearOfStudy());
    }

    private static Student mapRow(ResultSet rs) throws SQLException {
        Student s = new Student();
        s.setStudentId(rs.getInt("student_id"));
        s.setRollNo(rs.getString("roll_no"));
        s.setName(rs.getString("name"));
        Date dob = rs.getDate("dob");
        s.setDob(dob == null ? null : dob.toLocalDate());
        s.setGender(rs.getString("gender"));
        s.setEmail(rs.getString("email"));
        s.setPhone(rs.getString("phone"));
        s.setAddress(rs.getString("address"));
        int dept = rs.getInt("department_id");
        s.setDepartmentId(rs.wasNull() ? null : dept);
        int year = rs.getInt("year_of_study");
        s.setYearOfStudy(rs.wasNull() ? null : year);
        Date adm = rs.getDate("admission_date");
        s.setAdmissionDate(adm == null ? null : adm.toLocalDate());
        s.setDepartmentName(rs.getString("dept_name"));
        return s;
    }

    static void setNullableInt(PreparedStatement ps, int index, Integer value) throws SQLException {
        if (value == null) {
            ps.setNull(index, java.sql.Types.INTEGER);
        } else {
            ps.setInt(index, value);
        }
    }

    static String emptyToNull(String v) {
        return (v == null || v.trim().isEmpty()) ? null : v.trim();
    }

    static String friendly(SQLException e) {
        String msg = e.getMessage() == null ? "" : e.getMessage().toLowerCase();
        if (msg.contains("duplicate")) {
            return "a record with the same unique value already exists";
        }
        if (msg.contains("foreign key")) {
            return "the referenced department does not exist";
        }
        return "database rejected the operation";
    }
}
