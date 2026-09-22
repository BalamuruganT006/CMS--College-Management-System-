package com.college.cms.service;

import com.college.cms.dao.ExamDAO;
import com.college.cms.model.Exam;
import com.college.cms.util.ValidationUtil;
import java.time.LocalDate;
import java.util.List;

public class ExamService {

    private final ExamDAO dao = new ExamDAO();

    public List<Exam> list() {
        return dao.findAll();
    }

    public Exam get(int id) {
        return dao.findById(id);
    }

    public void save(String idParam, String examName, String courseParam, String dateParam, String maxParam) {
        ValidationUtil.notBlank(examName, "Exam name");
        ValidationUtil.maxLength(examName, 100, "Exam name");
        Integer courseId = ValidationUtil.optionalInt(courseParam, "Course");
        LocalDate examDate = ValidationUtil.date(dateParam, "Exam date");
        Integer maxMarks = ValidationUtil.optionalInt(maxParam, "Max marks");
        if (maxMarks != null && maxMarks <= 0) {
            throw new IllegalArgumentException("Max marks must be positive");
        }

        Exam e = new Exam();
        e.setExamName(examName.trim());
        e.setCourseId(courseId);
        e.setExamDate(examDate);
        e.setMaxMarks(maxMarks == null ? 100 : maxMarks);

        Integer id = ValidationUtil.optionalInt(idParam, "Exam id");
        if (id == null) {
            dao.insert(e);
        } else {
            e.setExamId(id);
            dao.update(e);
        }
    }

    public void delete(int id) {
        dao.delete(id);
    }
}
