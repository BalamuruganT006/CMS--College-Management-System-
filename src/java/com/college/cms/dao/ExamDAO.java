package com.college.cms.dao;

import com.college.cms.model.Exam;
import com.college.cms.util.DBConnection;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class ExamDAO {

    private static final String BASE_SELECT =
            "SELECT e.exam_id, e.exam_name, e.course_id, e.exam_date, e.max_marks, c.course_code, c.course_name "
          + "FROM exam e LEFT JOIN course c ON c.course_id = e.course_id ";

    public List<Exam> findAll() {
        String sql = BASE_SELECT + "ORDER BY e.exam_date DESC, e.exam_id DESC";
        List<Exam> list = new ArrayList<>();
        try (Connection con = DBConnection.getConnection();
             Statement st = con.createStatement();
             ResultSet rs = st.executeQuery(sql)) {
            while (rs.next()) {
                list.add(mapRow(rs));
            }
            return list;
        } catch (SQLException e) {
            throw new RuntimeException("Database error while loading exams", e);
        }
    }

    public Exam findById(int id) {
        String sql = BASE_SELECT + "WHERE e.exam_id = ?";
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
            throw new RuntimeException("Database error while loading exam", e);
        }
    }

    public void insert(Exam e) {
        String sql = "INSERT INTO exam (exam_name, course_id, exam_date, max_marks) VALUES (?,?,?,?)";
        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            bind(ps, e);
            ps.executeUpdate();
        } catch (SQLException ex) {
            throw new RuntimeException("Could not save exam: " + StudentDAO.friendly(ex), ex);
        }
    }

    public void update(Exam e) {
        String sql = "UPDATE exam SET exam_name=?, course_id=?, exam_date=?, max_marks=? WHERE exam_id=?";
        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            bind(ps, e);
            ps.setInt(5, e.getExamId());
            ps.executeUpdate();
        } catch (SQLException ex) {
            throw new RuntimeException("Could not update exam: " + StudentDAO.friendly(ex), ex);
        }
    }

    public void delete(int id) {
        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement("DELETE FROM exam WHERE exam_id = ?")) {
            ps.setInt(1, id);
            ps.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException("Cannot delete exam: marks records exist", e);
        }
    }

    private void bind(PreparedStatement ps, Exam e) throws SQLException {
        ps.setString(1, e.getExamName());
        StudentDAO.setNullableInt(ps, 2, e.getCourseId());
        if (e.getExamDate() == null) {
            ps.setNull(3, java.sql.Types.DATE);
        } else {
            ps.setDate(3, Date.valueOf(e.getExamDate()));
        }
        StudentDAO.setNullableInt(ps, 4, e.getMaxMarks());
    }

    private static Exam mapRow(ResultSet rs) throws SQLException {
        Exam e = new Exam();
        e.setExamId(rs.getInt("exam_id"));
        e.setExamName(rs.getString("exam_name"));
        int cid = rs.getInt("course_id");
        e.setCourseId(rs.wasNull() ? null : cid);
        Date d = rs.getDate("exam_date");
        e.setExamDate(d == null ? null : d.toLocalDate());
        int mm = rs.getInt("max_marks");
        e.setMaxMarks(rs.wasNull() ? null : mm);
        e.setCourseCode(rs.getString("course_code"));
        e.setCourseName(rs.getString("course_name"));
        return e;
    }
}
