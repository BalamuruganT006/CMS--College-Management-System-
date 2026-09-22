package com.college.cms.service;

import com.college.cms.dao.CourseDAO;
import com.college.cms.model.Course;
import com.college.cms.util.ValidationUtil;
import java.util.List;

public class CourseService {

    private final CourseDAO dao = new CourseDAO();

    public List<Course> list() {
        return dao.findAll();
    }

    public List<Course> listForFaculty(int facultyId) {
        return dao.findByFaculty(facultyId);
    }

    public Course get(int id) {
        return dao.findById(id);
    }

    public void save(String idParam, String courseCode, String courseName, String creditsParam,
                     String semesterParam, String deptParam) {
        ValidationUtil.notBlank(courseCode, "Course code");
        ValidationUtil.notBlank(courseName, "Course name");
        ValidationUtil.maxLength(courseCode, 20, "Course code");
        ValidationUtil.maxLength(courseName, 100, "Course name");
        Integer credits = ValidationUtil.optionalInt(creditsParam, "Credits");
        Integer semester = ValidationUtil.optionalInt(semesterParam, "Semester");
        if (semester != null && (semester < 1 || semester > 10)) {
            throw new IllegalArgumentException("Semester must be between 1 and 10");
        }
        Integer departmentId = ValidationUtil.optionalInt(deptParam, "Department");

        Course c = new Course();
        c.setCourseCode(courseCode.trim());
        c.setCourseName(courseName.trim());
        c.setCredits(credits);
        c.setSemester(semester);
        c.setDepartmentId(departmentId);

        Integer id = ValidationUtil.optionalInt(idParam, "Course id");
        if (id == null) {
            dao.insert(c);
        } else {
            c.setCourseId(id);
            dao.update(c);
        }
    }

    public void delete(int id) {
        dao.delete(id);
    }

    public void assignFaculty(int courseId, Integer facultyId) {
        dao.assignFaculty(courseId, facultyId);
    }
}
