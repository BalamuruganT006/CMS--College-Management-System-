package com.college.cms.dao;

import com.college.cms.model.Course;
import com.college.cms.util.DBConnection;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class CourseDAO {

    private static final String BASE_SELECT =
            "SELECT c.course_id, c.course_code, c.course_name, c.credits, c.semester, c.department_id, "
          + "d.dept_name, fc.faculty_id, f.name "
          + "FROM course c "
          + "LEFT JOIN department d ON d.department_id = c.department_id "
          + "LEFT JOIN faculty_course fc ON fc.course_id = c.course_id "
          + "LEFT JOIN faculty f ON f.faculty_id = fc.faculty_id ";

    public List<Course> findAll() {
        String sql = BASE_SELECT + "ORDER BY c.course_code";
        List<Course> list = new ArrayList<>();
        try (Connection con = DBConnection.getConnection();
             Statement st = con.createStatement();
             ResultSet rs = st.executeQuery(sql)) {
            while (rs.next()) {
                list.add(mapRow(rs));
            }
            return list;
        } catch (SQLException e) {
            throw new RuntimeException("Database error while loading courses", e);
        }
    }

    public List<Course> findByFaculty(int facultyId) {
        String sql = BASE_SELECT + "WHERE fc.faculty_id = ? ORDER BY c.course_code";
        List<Course> list = new ArrayList<>();
        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, facultyId);
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    list.add(mapRow(rs));
                }
            }
            return list;
        } catch (SQLException e) {
            throw new RuntimeException("Database error while loading faculty courses", e);
        }
    }

    public Course findById(int id) {
        String sql = BASE_SELECT + "WHERE c.course_id = ?";
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
            throw new RuntimeException("Database error while loading course", e);
        }
    }

    public void insert(Course c) {
        String sql = "INSERT INTO course (course_code, course_name, credits, semester, department_id) VALUES (?,?,?,?,?)";
        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            bind(ps, c);
            ps.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException("Could not save course: " + StudentDAO.friendly(e), e);
        }
    }

    public void update(Course c) {
        String sql = "UPDATE course SET course_code=?, course_name=?, credits=?, semester=?, department_id=? WHERE course_id=?";
        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            bind(ps, c);
            ps.setInt(6, c.getCourseId());
            ps.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException("Could not update course: " + StudentDAO.friendly(e), e);
        }
    }

    public void delete(int id) {
        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement("DELETE FROM course WHERE course_id = ?")) {
            ps.setInt(1, id);
            ps.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException("Cannot delete course: exams or attendance records exist", e);
        }
    }

    public void assignFaculty(int courseId, Integer facultyId) {
        try (Connection con = DBConnection.getConnection()) {
            try (PreparedStatement del = con.prepareStatement("DELETE FROM faculty_course WHERE course_id = ?")) {
                del.setInt(1, courseId);
                del.executeUpdate();
            }
            if (facultyId != null) {
                try (PreparedStatement ins = con.prepareStatement(
                        "INSERT INTO faculty_course (faculty_id, course_id) VALUES (?,?)")) {
                    ins.setInt(1, facultyId);
                    ins.setInt(2, courseId);
                    ins.executeUpdate();
                }
            }
        } catch (SQLException e) {
            throw new RuntimeException("Could not assign faculty to course", e);
        }
    }

    private void bind(PreparedStatement ps, Course c) throws SQLException {
        ps.setString(1, c.getCourseCode());
        ps.setString(2, c.getCourseName());
        StudentDAO.setNullableInt(ps, 3, c.getCredits());
        StudentDAO.setNullableInt(ps, 4, c.getSemester());
        StudentDAO.setNullableInt(ps, 5, c.getDepartmentId());
    }

    private static Course mapRow(ResultSet rs) throws SQLException {
        Course c = new Course();
        c.setCourseId(rs.getInt("course_id"));
        c.setCourseCode(rs.getString("course_code"));
        c.setCourseName(rs.getString("course_name"));
        int credits = rs.getInt("credits");
        c.setCredits(rs.wasNull() ? null : credits);
        int sem = rs.getInt("semester");
        c.setSemester(rs.wasNull() ? null : sem);
        int dept = rs.getInt("department_id");
        c.setDepartmentId(rs.wasNull() ? null : dept);
        c.setDepartmentName(rs.getString("dept_name"));
        int fid = rs.getInt("faculty_id");
        if (!rs.wasNull()) {
            c.setFacultyId(fid);
            c.setFacultyName(rs.getString("name"));
        }
        return c;
    }
}
