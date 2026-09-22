package com.college.cms.util;

import java.time.LocalDate;
import java.time.format.DateTimeParseException;

public final class ValidationUtil {

    private static final String EMAIL_RE = "^[A-Za-z0-9+_.-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}$";
    private static final String PHONE_RE = "^[0-9]{10}$";

    private ValidationUtil() {
    }

    public static void notNull(Object value, String field) {
        if (value == null) {
            throw new IllegalArgumentException(field + " is required");
        }
    }

    public static void notBlank(String value, String field) {
        if (value == null || value.trim().isEmpty()) {
            throw new IllegalArgumentException(field + " is required");
        }
    }

    public static void maxLength(String value, int max, String field) {
        if (value != null && value.length() > max) {
            throw new IllegalArgumentException(field + " must be at most " + max + " characters");
        }
    }

    public static void email(String value) {
        if (value != null && !value.trim().isEmpty() && !value.trim().matches(EMAIL_RE)) {
            throw new IllegalArgumentException("Invalid email address");
        }
    }

    public static void phone(String value) {
        if (value != null && !value.trim().isEmpty() && !value.trim().matches(PHONE_RE)) {
            throw new IllegalArgumentException("Phone must be exactly 10 digits");
        }
    }

    public static void positiveNumber(String value, String field) {
        try {
            if (Double.parseDouble(value) <= 0) {
                throw new NumberFormatException();
            }
        } catch (NumberFormatException e) {
            throw new IllegalArgumentException(field + " must be a positive number");
        }
    }

    public static void nonNegativeNumber(String value, String field) {
        try {
            if (Double.parseDouble(value) < 0) {
                throw new NumberFormatException();
            }
        } catch (NumberFormatException e) {
            throw new IllegalArgumentException(field + " must be zero or a positive number");
        }
    }

    public static LocalDate date(String value, String field) {
        notBlank(value, field);
        try {
            return LocalDate.parse(value.trim());
        } catch (DateTimeParseException e) {
            throw new IllegalArgumentException(field + " must be a valid date (YYYY-MM-DD)");
        }
    }

    public static Integer optionalInt(String value, String field) {
        if (value == null || value.trim().isEmpty()) {
            return null;
        }
        try {
            return Integer.parseInt(value.trim());
        } catch (NumberFormatException e) {
            throw new IllegalArgumentException(field + " must be a whole number");
        }
    }

    public static int requiredInt(String value, String field) {
        Integer v = optionalInt(value, field);
        if (v == null) {
            throw new IllegalArgumentException(field + " is required");
        }
        return v;
    }
}
