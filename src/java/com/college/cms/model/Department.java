package com.college.cms.model;

public class Department {

    private int departmentId;
    private String deptName;
    private String hodName;

    public Department() {
    }

    public Department(int departmentId, String deptName, String hodName) {
        this.departmentId = departmentId;
        this.deptName = deptName;
        this.hodName = hodName;
    }

    public int getDepartmentId() {
        return departmentId;
    }

    public void setDepartmentId(int departmentId) {
        this.departmentId = departmentId;
    }

    public String getDeptName() {
        return deptName;
    }

    public void setDeptName(String deptName) {
        this.deptName = deptName;
    }

    public String getHodName() {
        return hodName;
    }

    public void setHodName(String hodName) {
        this.hodName = hodName;
    }
}
