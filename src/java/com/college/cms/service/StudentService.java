package com.college.cms.service;

import com.college.cms.dao.StudentDAO;
import com.college.cms.model.Student;
import com.college.cms.util.ValidationUtil;
import java.time.LocalDate;
import java.util.List;

public class StudentService {

    private final StudentDAO dao = new StudentDAO();
    private final AuthService authService = new AuthService();

    public List<Student> list() {
        return dao.findAll();
    }

    public List<Student> search(String keyword, Integer departmentId, Integer year) {
        return dao.search(keyword, departmentId, year);
    }

    public Student get(int id) {
        Student s = dao.findById(id);
        if (s == null) {
            throw new IllegalArgumentException("Student not found");
        }
        return s;
    }

    public void save(String idParam, String rollNo, String name, String dobParam, String gender, String email,
                     String phone, String address, String deptParam, String yearParam, boolean createLogin) {
        ValidationUtil.notBlank(name, "Name");
        ValidationUtil.maxLength(name, 100, "Name");
        ValidationUtil.email(email);
        ValidationUtil.phone(phone);
        ValidationUtil.maxLength(address, 255, "Address");
        if (gender != null && !gender.isEmpty()
                && !"Male".equals(gender) && !"Female".equals(gender) && !"Other".equals(gender)) {
            throw new IllegalArgumentException("Invalid gender");
        }
        LocalDate dob = dobParam == null || dobParam.trim().isEmpty() ? null : ValidationUtil.date(dobParam, "Date of birth");
        Integer departmentId = ValidationUtil.optionalInt(deptParam, "Department");
        Integer year = ValidationUtil.optionalInt(yearParam, "Year of study");
        if (year != null && (year < 1 || year > 6)) {
            throw new IllegalArgumentException("Year of study must be between 1 and 6");
        }

        Student s = new Student();
        s.setName(name.trim());
        s.setDob(dob);
        s.setGender(gender == null || gender.isEmpty() ? null : gender);
        s.setEmail(email == null ? null : email.trim());
        s.setPhone(phone);
        s.setAddress(address);
        s.setDepartmentId(departmentId);
        s.setYearOfStudy(year);

        Integer id = ValidationUtil.optionalInt(idParam, "Student id");
        if (id == null) {
            s.setRollNo((rollNo == null || rollNo.trim().isEmpty()) ? dao.nextRollNo() : rollNo.trim());
            dao.insert(s);
            if (createLogin) {
                authService.createLogin(s.getRollNo().toLowerCase(), "welcome123", "STUDENT", findIdByRoll(s.getRollNo()));
            }
        } else {
            s.setStudentId(id);
            s.setRollNo(rollNo == null || rollNo.trim().isEmpty() ? dao.findById(id).getRollNo() : rollNo.trim());
            dao.update(s);
        }
    }

    private int findIdByRoll(String rollNo) {
        for (Student s : dao.findAll()) {
            if (s.getRollNo().equals(rollNo)) {
                return s.getStudentId();
            }
        }
        return 0;
    }

    public void delete(int id) {
        authService.removeLogin("STUDENT", id);
        dao.delete(id);
    }
}
