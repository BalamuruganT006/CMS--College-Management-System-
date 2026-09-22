package com.college.cms.service;

import com.college.cms.dao.FacultyDAO;
import com.college.cms.model.Faculty;
import com.college.cms.util.ValidationUtil;
import java.time.LocalDate;
import java.util.List;

public class FacultyService {

    private final FacultyDAO dao = new FacultyDAO();
    private final AuthService authService = new AuthService();

    public List<Faculty> list() {
        return dao.findAll();
    }

    public Faculty get(int id) {
        return dao.findById(id);
    }

    public void save(String idParam, String empCode, String name, String email, String phone, String deptParam,
                     String designation, String joiningParam, boolean createLogin) {
        ValidationUtil.notBlank(name, "Name");
        ValidationUtil.maxLength(name, 100, "Name");
        ValidationUtil.email(email);
        ValidationUtil.phone(phone);
        ValidationUtil.maxLength(designation, 50, "Designation");
        LocalDate joining = joiningParam == null || joiningParam.trim().isEmpty()
                ? null : ValidationUtil.date(joiningParam, "Joining date");
        Integer departmentId = ValidationUtil.optionalInt(deptParam, "Department");

        Faculty f = new Faculty();
        f.setName(name.trim());
        f.setEmail(email == null ? null : email.trim());
        f.setPhone(phone);
        f.setDepartmentId(departmentId);
        f.setDesignation(designation);
        f.setJoiningDate(joining);

        Integer id = ValidationUtil.optionalInt(idParam, "Faculty id");
        if (id == null) {
            f.setEmpCode((empCode == null || empCode.trim().isEmpty()) ? dao.nextEmpCode() : empCode.trim());
            dao.insert(f);
            if (createLogin) {
                authService.createLogin(f.getEmpCode().toLowerCase(), "welcome123", "FACULTY", findIdByCode(f.getEmpCode()));
            }
        } else {
            f.setFacultyId(id);
            f.setEmpCode(empCode == null || empCode.trim().isEmpty() ? dao.findById(id).getEmpCode() : empCode.trim());
            dao.update(f);
        }
    }

    private int findIdByCode(String empCode) {
        for (Faculty f : dao.findAll()) {
            if (f.getEmpCode().equals(empCode)) {
                return f.getFacultyId();
            }
        }
        return 0;
    }

    public void delete(int id) {
        authService.removeLogin("FACULTY", id);
        dao.delete(id);
    }
}
