package com.college.cms.service;

import com.college.cms.dao.FeeDAO;
import com.college.cms.model.Fee;
import com.college.cms.util.ValidationUtil;
import java.math.BigDecimal;
import java.time.LocalDate;
import java.util.List;
import java.util.Map;

public class FeeService {

    private final FeeDAO dao = new FeeDAO();

    public List<Fee> list() {
        return dao.findAll();
    }

    public List<Fee> listForStudent(int studentId) {
        return dao.findByStudent(studentId);
    }

    public void generate(String studentParam, String amountParam, String dueParam) {
        int studentId = ValidationUtil.requiredInt(studentParam, "Student");
        ValidationUtil.positiveNumber(amountParam, "Total amount");
        BigDecimal total = new BigDecimal(amountParam.trim());
        if (total.scale() > 2) {
            throw new IllegalArgumentException("Amount can have at most 2 decimal places");
        }
        LocalDate due = dueParam == null || dueParam.trim().isEmpty() ? null : ValidationUtil.date(dueParam, "Due date");
        Fee fee = new Fee();
        fee.setStudentId(studentId);
        fee.setTotalAmount(total);
        fee.setDueDate(due);
        dao.insert(fee);
    }

    public void recordPayment(String feeParam, String amountParam) {
        int feeId = ValidationUtil.requiredInt(feeParam, "Fee record");
        ValidationUtil.positiveNumber(amountParam, "Payment amount");
        BigDecimal amount = new BigDecimal(amountParam.trim());
        if (dao.recordPayment(feeId, amount) == 0) {
            throw new IllegalArgumentException("Fee record not found");
        }
    }

    public void delete(int id) {
        dao.delete(id);
    }

    public Map<String, Object> summary() {
        return dao.summary();
    }
}
