package com.college.cms.service;

import com.college.cms.dao.DepartmentDAO;
import com.college.cms.model.Department;
import com.college.cms.util.ValidationUtil;

public class DepartmentService {

    private final DepartmentDAO dao = new DepartmentDAO();

    public java.util.List<Department> list() {
        return dao.findAll();
    }

    public Department get(int id) {
        return dao.findById(id);
    }

    public void save(String idParam, String deptName, String hodName) {
        ValidationUtil.notBlank(deptName, "Department name");
        ValidationUtil.maxLength(deptName, 100, "Department name");
        ValidationUtil.maxLength(hodName, 100, "HOD name");
        Department d = new Department();
        d.setDeptName(deptName.trim());
        d.setHodName(hodName == null ? null : hodName.trim());
        Integer id = ValidationUtil.optionalInt(idParam, "Department id");
        if (id == null) {
            dao.insert(d);
        } else {
            d.setDepartmentId(id);
            dao.update(d);
        }
    }

    public void delete(int id) {
        dao.delete(id);
    }
}
