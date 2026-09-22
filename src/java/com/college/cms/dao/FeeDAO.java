package com.college.cms.dao;

import com.college.cms.model.Fee;
import com.college.cms.util.DBConnection;
import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

public class FeeDAO {

    private static final String BASE_SELECT =
            "SELECT f.fee_id, f.student_id, f.total_amount, f.paid_amount, f.due_date, f.paid_date, f.status, "
          + "s.name, s.roll_no FROM fee f JOIN student s ON s.student_id = f.student_id ";

    public List<Fee> findAll() {
        String sql = BASE_SELECT + "ORDER BY f.status DESC, s.roll_no";
        List<Fee> list = new ArrayList<>();
        try (Connection con = DBConnection.getConnection();
             Statement st = con.createStatement();
             ResultSet rs = st.executeQuery(sql)) {
            while (rs.next()) {
                list.add(mapRow(rs));
            }
            return list;
        } catch (SQLException e) {
            throw new RuntimeException("Database error while loading fees", e);
        }
    }

    public List<Fee> findByStudent(int studentId) {
        String sql = BASE_SELECT + "WHERE f.student_id = ? ORDER BY f.due_date";
        List<Fee> list = new ArrayList<>();
        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, studentId);
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    list.add(mapRow(rs));
                }
            }
            return list;
        } catch (SQLException e) {
            throw new RuntimeException("Database error while loading fees", e);
        }
    }

    public void insert(Fee fee) {
        String sql = "INSERT INTO fee (student_id, total_amount, paid_amount, due_date) VALUES (?,?,0,?)";
        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, fee.getStudentId());
            ps.setBigDecimal(2, fee.getTotalAmount());
            if (fee.getDueDate() == null) {
                ps.setNull(3, java.sql.Types.DATE);
            } else {
                ps.setDate(3, Date.valueOf(fee.getDueDate()));
            }
            ps.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException("Could not generate fee record", e);
        }
    }

    public void delete(int id) {
        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement("DELETE FROM fee WHERE fee_id = ?")) {
            ps.setInt(1, id);
            ps.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException("Could not delete fee record", e);
        }
    }

    public int recordPayment(int feeId, BigDecimal amount) {
        String sql = "UPDATE fee SET "
                   + "paid_amount = LEAST(paid_amount + ?, total_amount), "
                   + "status = CASE WHEN LEAST(paid_amount + ?, total_amount) >= total_amount THEN 'Paid' "
                   + "WHEN LEAST(paid_amount + ?, total_amount) > 0 THEN 'Partial' ELSE status END, "
                   + "paid_date = CASE WHEN LEAST(paid_amount + ?, total_amount) >= total_amount THEN CURRENT_DATE ELSE paid_date END "
                   + "WHERE fee_id = ?";
        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            for (int i = 1; i <= 4; i++) {
                ps.setBigDecimal(i, amount);
            }
            ps.setInt(5, feeId);
            return ps.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException("Could not record payment", e);
        }
    }

    public Map<String, Object> summary() {
        String sql = "SELECT COALESCE(SUM(total_amount),0) AS billed, COALESCE(SUM(paid_amount),0) AS collected, "
                   + "SUM(CASE WHEN status='Unpaid' THEN 1 ELSE 0 END) AS unpaid_cnt, "
                   + "SUM(CASE WHEN status='Partial' THEN 1 ELSE 0 END) AS partial_cnt, "
                   + "SUM(CASE WHEN status='Paid' THEN 1 ELSE 0 END) AS paid_cnt "
                   + "FROM fee";
        try (Connection con = DBConnection.getConnection();
             Statement st = con.createStatement();
             ResultSet rs = st.executeQuery(sql)) {
            Map<String, Object> row = new LinkedHashMap<>();
            if (rs.next()) {
                row.put("billed", rs.getBigDecimal("billed"));
                row.put("collected", rs.getBigDecimal("collected"));
                row.put("pending", rs.getBigDecimal("billed").subtract(rs.getBigDecimal("collected")));
                row.put("unpaidCount", rs.getLong("unpaid_cnt"));
                row.put("partialCount", rs.getLong("partial_cnt"));
                row.put("paidCount", rs.getLong("paid_cnt"));
            }
            return row;
        } catch (SQLException e) {
            throw new RuntimeException("Database error while computing fee summary", e);
        }
    }

    private static Fee mapRow(ResultSet rs) throws SQLException {
        Fee f = new Fee();
        f.setFeeId(rs.getInt("fee_id"));
        f.setStudentId(rs.getInt("student_id"));
        f.setTotalAmount(rs.getBigDecimal("total_amount"));
        f.setPaidAmount(rs.getBigDecimal("paid_amount"));
        Date due = rs.getDate("due_date");
        f.setDueDate(due == null ? null : due.toLocalDate());
        Date paid = rs.getDate("paid_date");
        f.setPaidDate(paid == null ? null : paid.toLocalDate());
        f.setStatus(rs.getString("status"));
        f.setStudentName(rs.getString("name"));
        f.setRollNo(rs.getString("roll_no"));
        return f;
    }
}
