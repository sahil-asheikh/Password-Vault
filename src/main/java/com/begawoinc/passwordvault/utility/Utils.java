/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.begawoinc.passwordvault.utility;

import java.io.File;
import java.util.Random;

/**
 *
 * @author LENOVO
 */
public class Utils {

    private static String generateRandomString(int length) {
        String alphabets = "abcdefghijklmnopqrstuvwxyz0123456789";
        Random random = new Random();
        StringBuilder s = new StringBuilder();
        for (int i = 0; i < length; i++) {
            s.append(alphabets.charAt(random.nextInt(alphabets.length())));
        }
        return new String(s);
    }

    public static String generatePublicId(int length) {
        return generateRandomString(length);
    }

    public static boolean isEmpty(String s) {
        return ((s == null) || ("".equals(s)) || ("null".equals(s)));
    }

    public static <T> T requiredNotNull(T obj, String message) {
        if (obj == null || obj == "" || obj == " " || obj == "null") {
            throw new RuntimeException(message);
        }
        return obj;
    }

    public static String getFileExtension(String file_name, int position) {
        String file_extension = "";
        for (int i = file_name.length() - position; i < file_name.length(); i++) {
            file_extension += file_name.charAt(i);
        }
        return file_extension;
    }

    public static boolean checkFileType(String fileName, String fileExtension) {
        return fileExtension.equals(getFileExtension(fileName, 4));
    }

    public static boolean checkFilePath(String filePath) {
        File file = new File(filePath);
        return file.exists();
    }

    public static void main(String[] args) {
//        System.out.println(generatePublicId(30));
//        System.out.println(isEmpty(generatePublicId(30)));
//        System.out.println(isEmpty(""));
    }

}
