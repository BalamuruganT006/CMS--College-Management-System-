package com.college.cms.service;

import com.college.cms.dao.ExamDAO;
import com.college.cms.dao.MarksDAO;
import com.college.cms.model.Exam;
import com.college.cms.model.Marks;
import com.college.cms.util.ValidationUtil;
import java.math.BigDecimal;
import java.util.List;
import java.util.Map;

public class MarksService {

    private final MarksDAO marksDAO = new MarksDAO();
    private final ExamDAO examDAO = new ExamDAO();

    public List<Marks> rosterWithMarks(int examId) {
        return marksDAO.findByExam(examId);
    }

    public List<Marks> marksheet(int studentId) {
        return marksDAO.findByStudent(studentId);
    }

    public void saveEntries(String examParam, Map<String, String[]> params) {
        int examId = ValidationUtil.requiredInt(examParam, "Exam");
        Exam exam = examDAO.findById(examId);
        if (exam == null) {
            throw new IllegalArgumentException("Exam not found");
        }
        int maxMarks = exam.getMaxMarks() == null ? 100 : exam.getMaxMarks();
        int saved = 0;
        for (Map.Entry<String, String[]> entry : params.entrySet()) {
            if (!entry.getKey().startsWith("marks_")) {
                continue;
            }
            int studentId;
            try {
                studentId = Integer.parseInt(entry.getKey().substring("marks_".length()));
            } catch (NumberFormatException e) {
                continue;
            }
            String value = entry.getValue() == null || entry.getValue().length == 0 ? "" : entry.getValue()[0].trim();
            if (value.isEmpty()) {
                continue;
            }
            BigDecimal marks;
            try {
                marks = new BigDecimal(value);
            } catch (NumberFormatException e) {
                throw new IllegalArgumentException("Invalid marks value for roll " + studentRoll(studentId));
            }
            if (marks.signum() < 0 || marks.doubleValue() > maxMarks) {
                throw new IllegalArgumentException(
                        "Marks for one or more students are outside the range 0 to " + maxMarks);
            }
            marksDAO.upsert(examId, studentId, marks, gradeFor(marks.doubleValue(), maxMarks));
            saved++;
        }
        if (saved == 0) {
            throw new IllegalArgumentException("No marks were submitted");
        }
    }

    private String studentRoll(int studentId) {
        return String.valueOf(studentId);
    }

    public static String gradeFor(double percentage) {
        if (percentage >= 90) {
            return "A+";
        }
        if (percentage >= 80) {
            return "A";
        }
        if (percentage >= 70) {
            return "B+";
        }
        if (percentage >= 60) {
            return "B";
        }
        if (percentage >= 50) {
            return "C";
        }
        if (percentage >= 40) {
            return "D";
        }
        return "F";
    }

    public static String gradeFor(double marks, double maxMarks) {
        return gradeFor(maxMarks == 0 ? 0 : (marks / maxMarks) * 100.0);
    }

    public Map<String, Object> examSummary(int examId) {
        return marksDAO.examSummary(examId);
    }

    public List<Map<String, Object>> resultSummary() {
        return marksDAO.allExamSummaries();
    }
}
