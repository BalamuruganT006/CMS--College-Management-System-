package com.college.cms.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {

    private static final String URL = env("CMS_DB_URL",
            "jdbc:mysql://localhost:3306/college_management?useSSL=false&allowPublicKeyRetrieval=true&serverTimezone=UTC");
    private static final String USER = env("CMS_DB_USER", "root");
    private static final String PASSWORD = env("CMS_DB_PASSWORD", "Thalapathy@20");

    private DBConnection() {
    }

    public static Connection getConnection() throws SQLException {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            throw new SQLException("MySQL JDBC driver not found on classpath", e);
        }
        return DriverManager.getConnection(URL, USER, PASSWORD);
    }

    private static String env(String key, String def) {
        String v = System.getenv(key);
        return (v == null || v.isEmpty()) ? def : v;
    }
}
