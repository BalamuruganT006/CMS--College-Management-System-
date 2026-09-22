package com.college.cms.dao;

import com.college.cms.model.Attendance;
import com.college.cms.util.DBConnection;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class AttendanceDAO {

    public void upsert(int studentId, int courseId, Date date, String status, Integer markedBy) {
        String sql = "INSERT INTO attendance (student_id, course_id, attendance_date, status, marked_by) "
                   + "VALUES (?,?,?,?,?) "
                   + "ON DUPLICATE KEY UPDATE status = VALUES(status), marked_by = VALUES(marked_by)";
        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, studentId);
            ps.setInt(2, courseId);
            ps.setDate(3, date);
            ps.setString(4, status);
            if (markedBy == null) {
                ps.setNull(5, java.sql.Types.INTEGER);
            } else {
                ps.setInt(5, markedBy);
            }
            ps.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException("Could not save attendance record", e);
        }
    }

    public Map<Integer, Attendance> findByCourseAndDate(int courseId, Date date) {
        String sql = "SELECT a.attendance_id, a.student_id, a.course_id, a.attendance_date, a.status "
                   + "FROM attendance a WHERE a.course_id = ? AND a.attendance_date = ?";
        Map<Integer, Attendance> map = new HashMap<>();
        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, courseId);
            ps.setDate(2, date);
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    Attendance a = new Attendance();
                    a.setAttendanceId(rs.getInt("attendance_id"));
                    a.setStudentId(rs.getInt("student_id"));
                    a.setCourseId(rs.getInt("course_id"));
                    a.setAttendanceDate(rs.getDate("attendance_date").toLocalDate());
                    a.setStatus(rs.getString("status"));
                    map.put(a.getStudentId(), a);
                }
            }
            return map;
        } catch (SQLException e) {
            throw new RuntimeException("Database error while loading attendance", e);
        }
    }

    public List<Map<String, Object>> percentagePerStudent(Integer studentId) {
        StringBuilder sql = new StringBuilder(
                "SELECT s.student_id, s.roll_no, s.name, COUNT(a.attendance_id) AS total, "
              + "COALESCE(SUM(CASE WHEN a.status = 'Present' THEN 1 ELSE 0 END), 0) AS present ")
              .append("FROM student s LEFT JOIN attendance a ON a.student_id = s.student_id ");
        List<Object> params = new ArrayList<>();
        if (studentId != null) {
            sql.append("WHERE s.student_id = ? ");
            params.add(studentId);
        }
        sql.append("GROUP BY s.student_id, s.roll_no, s.name HAVING total > 0 ORDER BY s.roll_no");
        return runPercentageQuery(sql.toString(), params);
    }

    public List<Map<String, Object>> percentageForStudentCourses(int studentId) {
        String sql = "SELECT c.course_code, c.course_name, COUNT(a.attendance_id) AS total, "
                   + "COALESCE(SUM(CASE WHEN a.status = 'Present' THEN 1 ELSE 0 END), 0) AS present "
                   + "FROM course c JOIN attendance a ON a.course_id = c.course_id "
                   + "WHERE a.student_id = ? GROUP BY c.course_code, c.course_name ORDER BY c.course_code";
        return runPercentageQuery(sql, java.util.Collections.singletonList((Object) studentId));
    }

    public List<Map<String, Object>> defaulters(double threshold) {
        String sql = "SELECT s.student_id, s.roll_no, s.name, COUNT(a.attendance_id) AS total, "
                   + "SUM(CASE WHEN a.status = 'Present' THEN 1 ELSE 0 END) AS present "
                   + "FROM student s JOIN attendance a ON a.student_id = s.student_id "
                   + "GROUP BY s.student_id, s.roll_no, s.name "
                   + "HAVING (present / total) * 100 < ? ORDER BY (present / total) ASC";
        return runPercentageQuery(sql, java.util.Collections.singletonList((Object) threshold));
    }

    private List<Map<String, Object>> runPercentageQuery(String sql, List<Object> params) {
        List<Map<String, Object>> rows = new ArrayList<>();
        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            for (int i = 0; i < params.size(); i++) {
                ps.setObject(i + 1, params.get(i));
            }
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    Map<String, Object> row = new HashMap<>();
                    row.put("studentId", rs.getInt("student_id"));
                    if (hasColumn(rs, "roll_no")) {
                        row.put("rollNo", rs.getString("roll_no"));
                        row.put("name", rs.getString("name"));
                    }
                    if (hasColumn(rs, "course_code")) {
                        row.put("courseCode", rs.getString("course_code"));
                        row.put("courseName", rs.getString("course_name"));
                    }
                    long total = rs.getLong("total");
                    long present = rs.getLong("present");
                    row.put("total", total);
                    row.put("present", present);
                    row.put("percentage", total == 0 ? 0.0 : (present * 100.0) / total);
                    rows.add(row);
                }
            }
            return rows;
        } catch (SQLException e) {
            throw new RuntimeException("Database error while computing attendance percentage", e);
        }
    }

    private boolean hasColumn(ResultSet rs, String column) {
        try {
            rs.findColumn(column);
            return true;
        } catch (SQLException e) {
            return false;
        }
    }
}
