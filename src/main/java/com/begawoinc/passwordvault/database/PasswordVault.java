/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.begawoinc.passwordvault.database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *
 * @author Masarrat
 */
public class PasswordVault {

    private static final String DATABASE = PasswordVault.class.getSimpleName().toLowerCase();
    private static final String JDBC_DRIVER = "com.mysql.cj.jdbc.Driver";
    private static final String DB_URL = "jdbc:mysql://localhost/" + DATABASE;
    
//    Local username and password
    private static final String USER = "root";
    private static final String PASS = "admin";

//    Live username and password
//    private static final String USER = "live_root";
//    private static final String PASS = "live_admin";
    

    public static Connection connectDb() {
        Connection con = null;
        try {
            Class.forName(JDBC_DRIVER);
            con = DriverManager.getConnection(DB_URL, USER, PASS);
            System.out.println("com.qt.sad.database.PasswordVault.connectDb()::DATABASE `" + DATABASE + "` CONNECTED");
        } catch (ClassNotFoundException | SQLException e) {
            System.out.println("com.qt.sad.database.Quizdb.connectDb()::" + e.getMessage());
        }
        return con;
    }

    public static void main(String[] args) {
        connectDb();
    }
}
