package com.college.cms.util;

import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.security.SecureRandom;

public final class PasswordUtil {

    private PasswordUtil() {
    }

    public static String hash(String plain) {
        byte[] salt = new byte[16];
        new SecureRandom().nextBytes(salt);
        String saltHex = toHex(salt);
        return saltHex + ":" + sha256Hex(saltHex + plain);
    }

    public static boolean verify(String plain, String stored) {
        if (plain == null || stored == null) {
            return false;
        }
        int idx = stored.indexOf(':');
        if (idx <= 0) {
            return false;
        }
        String saltHex = stored.substring(0, idx);
        String expected = stored.substring(idx + 1);
        return MessageDigest.isEqual(
                sha256Hex(saltHex + plain).getBytes(StandardCharsets.UTF_8),
                expected.getBytes(StandardCharsets.UTF_8));
    }

    private static String sha256Hex(String data) {
        try {
            MessageDigest md = MessageDigest.getInstance("SHA-256");
            return toHex(md.digest(data.getBytes(StandardCharsets.UTF_8)));
        } catch (NoSuchAlgorithmException e) {
            throw new IllegalStateException("SHA-256 not available", e);
        }
    }

    private static String toHex(byte[] bytes) {
        StringBuilder sb = new StringBuilder(bytes.length * 2);
        for (byte b : bytes) {
            sb.append(Character.forDigit((b >> 4) & 0xF, 16));
            sb.append(Character.forDigit(b & 0xF, 16));
        }
        return sb.toString();
    }
}
