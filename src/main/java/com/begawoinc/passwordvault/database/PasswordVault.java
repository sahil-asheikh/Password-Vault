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

    private static final String JDBC_DRIVER = "com.mysql.cj.jdbc.Driver";

//    Live database URL, username and password
//    CLEARDB_DATABASE_URL ==> mysql://bd9304fc3e58f3:c78956e6@us-cdbr-east-05.cleardb.net/heroku_ad5e21ffb6191cc?reconnect=true
//    private static final String DATABASE = "heroku_ad5e21ffb6191cc".toLowerCase();
//    private static final String DB_URL = "jdbc:mysql://us-cdbr-east-05.cleardb.net/" + DATABASE;
//    private static final String USER = "bd9304fc3e58f3";
//    private static final String PASS = "c78956e6";
//    =================================================================================
//    Local database URL, username and password
    private static final String DATABASE = PasswordVault.class.getSimpleName().toLowerCase();
    private static final String DB_URL = "jdbc:mysql://localhost/" + DATABASE;
    private static final String USER = "root";
    private static final String PASS = "admin";

    public static Connection connectDb() {
        Connection con = null;
        try {
            Class.forName(JDBC_DRIVER);
            con = DriverManager.getConnection(DB_URL, USER, PASS);
//            System.out.println("com.begawoinc.PasswordVault.connectDb()::DATABASE `" + DATABASE + "` CONNECTED");
        } catch (ClassNotFoundException | SQLException e) {
            System.out.println("com.begawoinc.Quizdb.connectDb()::" + e.getMessage());
        }
        return con;
    }

    public static void main(String[] args) {
        connectDb();
    }
}
