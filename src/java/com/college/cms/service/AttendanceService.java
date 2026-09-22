package com.college.cms.service;

import com.college.cms.dao.AttendanceDAO;
import com.college.cms.dao.StudentDAO;
import com.college.cms.model.Attendance;
import com.college.cms.model.Student;
import com.college.cms.util.ValidationUtil;
import java.sql.Date;
import java.time.LocalDate;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class AttendanceService {

    private final AttendanceDAO dao = new AttendanceDAO();
    private final StudentDAO studentDAO = new StudentDAO();

    public Map<Integer, Attendance> loadRosterStatus(int courseId, LocalDate date) {
        return dao.findByCourseAndDate(courseId, Date.valueOf(date));
    }

    public List<Student> roster() {
        return studentDAO.findAll();
    }

    public void save(LocalDate date, int courseId, Integer markedBy, Map<String, String[]> params) {
        ValidationUtil.notNull(date, "Attendance date");
        int saved = 0;
        for (Map.Entry<String, String[]> entry : params.entrySet()) {
            if (!entry.getKey().startsWith("status_")) {
                continue;
            }
            int studentId;
            try {
                studentId = Integer.parseInt(entry.getKey().substring("status_".length()));
            } catch (NumberFormatException e) {
                continue;
            }
            String status = entry.getValue() == null || entry.getValue().length == 0 ? null : entry.getValue()[0];
            if (!"Present".equals(status) && !"Absent".equals(status)) {
                continue;
            }
            dao.upsert(studentId, courseId, Date.valueOf(date), status, markedBy);
            saved++;
        }
        if (saved == 0) {
            throw new IllegalArgumentException("No attendance statuses were submitted");
        }
    }

    public List<Map<String, Object>> overallPercentage(Integer studentId) {
        return dao.percentagePerStudent(studentId);
    }

    public List<Map<String, Object>> coursePercentage(int studentId) {
        return dao.percentageForStudentCourses(studentId);
    }

    public List<Map<String, Object>> defaulters(double threshold) {
        return dao.defaulters(threshold);
    }

    public double percentageFor(int studentId, List<Map<String, Object>> rows) {
        for (Map<String, Object> row : rows) {
            if (((Number) row.get("studentId")).intValue() == studentId) {
                return ((Number) row.get("percentage")).doubleValue();
            }
        }
        return 0.0;
    }

    public Map<String, Double> coursePercentages(int studentId) {
        Map<String, Double> result = new HashMap<>();
        for (Map<String, Object> row : coursePercentage(studentId)) {
            result.put((String) row.get("courseCode"), ((Number) row.get("percentage")).doubleValue());
        }
        return result;
    }
}
