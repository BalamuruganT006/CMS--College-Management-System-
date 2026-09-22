package com.college.cms.dao;

import com.college.cms.model.Marks;
import com.college.cms.util.DBConnection;
import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

public class MarksDAO {

    public void upsert(int examId, int studentId, BigDecimal marks, String grade) {
        String sql = "INSERT INTO marks (exam_id, student_id, marks_obtained, grade) VALUES (?,?,?,?) "
                   + "ON DUPLICATE KEY UPDATE marks_obtained = VALUES(marks_obtained), grade = VALUES(grade)";
        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, examId);
            ps.setInt(2, studentId);
            ps.setBigDecimal(3, marks);
            ps.setString(4, grade);
            ps.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException("Could not save marks", e);
        }
    }

    public List<Marks> findByExam(int examId) {
        String sql = "SELECT s.student_id, s.roll_no, s.name, m.marks_id, m.marks_obtained, m.grade "
                   + "FROM student s "
                   + "LEFT JOIN marks m ON m.student_id = s.student_id AND m.exam_id = ? "
                   + "ORDER BY s.roll_no";
        List<Marks> list = new ArrayList<>();
        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, examId);
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    Marks m = new Marks();
                    m.setExamId(examId);
                    m.setStudentId(rs.getInt("student_id"));
                    m.setRollNo(rs.getString("roll_no"));
                    m.setStudentName(rs.getString("name"));
                    int mid = rs.getInt("marks_id");
                    if (!rs.wasNull()) {
                        m.setMarksId(mid);
                        m.setMarksObtained(rs.getBigDecimal("marks_obtained"));
                        m.setGrade(rs.getString("grade"));
                    }
                    list.add(m);
                }
            }
            return list;
        } catch (SQLException e) {
            throw new RuntimeException("Database error while loading marks", e);
        }
    }

    public List<Marks> findByStudent(int studentId) {
        String sql = "SELECT m.marks_id, m.exam_id, m.student_id, m.marks_obtained, m.grade, "
                   + "e.exam_name, e.max_marks, c.course_code, c.course_name "
                   + "FROM marks m JOIN exam e ON e.exam_id = m.exam_id "
                   + "LEFT JOIN course c ON c.course_id = e.course_id "
                   + "WHERE m.student_id = ? ORDER BY e.exam_date DESC";
        List<Marks> list = new ArrayList<>();
        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, studentId);
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    Marks m = new Marks();
                    m.setMarksId(rs.getInt("marks_id"));
                    m.setExamId(rs.getInt("exam_id"));
                    m.setStudentId(rs.getInt("student_id"));
                    m.setMarksObtained(rs.getBigDecimal("marks_obtained"));
                    m.setGrade(rs.getString("grade"));
                    m.setExamName(rs.getString("exam_name"));
                    int mm = rs.getInt("max_marks");
                    m.setMaxMarks(rs.wasNull() ? null : mm);
                    m.setCourseCode(rs.getString("course_code"));
                    m.setCourseName(rs.getString("course_name"));
                    list.add(m);
                }
            }
            return list;
        } catch (SQLException e) {
            throw new RuntimeException("Database error while loading marksheet", e);
        }
    }

    public Map<String, Object> examSummary(int examId) {
        String sql = "SELECT COUNT(*) AS cnt, AVG(marks_obtained) AS avg_marks, MAX(marks_obtained) AS max_m, "
                   + "MIN(marks_obtained) AS min_m, SUM(CASE WHEN marks_obtained >= 40 THEN 1 ELSE 0 END) AS passed "
                   + "FROM marks WHERE exam_id = ?";
        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, examId);
            try (ResultSet rs = ps.executeQuery()) {
                Map<String, Object> row = new LinkedHashMap<>();
                if (rs.next()) {
                    row.put("count", rs.getLong("cnt"));
                    row.put("average", rs.getBigDecimal("avg_marks"));
                    row.put("highest", rs.getBigDecimal("max_m"));
                    row.put("lowest", rs.getBigDecimal("min_m"));
                    row.put("passed", rs.getLong("passed"));
                }
                return row;
            }
        } catch (SQLException e) {
            throw new RuntimeException("Database error while computing exam summary", e);
        }
    }

    public List<Map<String, Object>> allExamSummaries() {
        String sql = "SELECT e.exam_id, e.exam_name, c.course_code, e.max_marks, COUNT(m.marks_id) AS cnt, "
                   + "AVG(m.marks_obtained) AS avg_marks, MAX(m.marks_obtained) AS max_m, "
                   + "SUM(CASE WHEN m.marks_obtained >= 40 THEN 1 ELSE 0 END) AS passed "
                   + "FROM exam e LEFT JOIN course c ON c.course_id = e.course_id "
                   + "LEFT JOIN marks m ON m.exam_id = e.exam_id "
                   + "GROUP BY e.exam_id, e.exam_name, c.course_code, e.max_marks ORDER BY e.exam_date DESC";
        List<Map<String, Object>> rows = new ArrayList<>();
        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                Map<String, Object> row = new LinkedHashMap<>();
                row.put("examId", rs.getInt("exam_id"));
                row.put("examName", rs.getString("exam_name"));
                row.put("courseCode", rs.getString("course_code"));
                row.put("maxMarks", rs.getObject("max_marks"));
                row.put("count", rs.getLong("cnt"));
                row.put("average", rs.getBigDecimal("avg_marks"));
                row.put("highest", rs.getBigDecimal("max_m"));
                row.put("passed", rs.getLong("passed"));
                rows.add(row);
            }
            return rows;
        } catch (SQLException e) {
            throw new RuntimeException("Database error while computing result summary", e);
        }
    }
}
