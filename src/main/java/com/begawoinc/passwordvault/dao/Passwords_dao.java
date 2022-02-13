/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.begawoinc.passwordvault.dao;

import com.begawoinc.passwordvault.database.PasswordVault;
import com.begawoinc.passwordvault.enums.PasswordResponseMessages;
import com.begawoinc.passwordvault.model.Passwords;
import com.begawoinc.passwordvault.utility.Utils;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author LENOVO
 */
public class Passwords_dao {

    Passwords password = new Passwords();
    String message;
    int i;
    Connection con;
    CallableStatement cs;
    ResultSet rs;
    String sql;
    String TABLENAME = Passwords.class.getSimpleName().toLowerCase();

    public String addPassword(Passwords password) {
        con = PasswordVault.connectDb();
        sql = "INSERT INTO " + TABLENAME + " (password_primary_key, user_primary_key, password, password_key, username, user_email, app_name, url) VALUES (?,?,?,?,?,?,?,?)";
        try {
            cs = con.prepareCall(sql);
            cs.setString(1, Utils.generatePublicId(30));
            cs.setString(2, password.getUser_primary_key());
            cs.setString(3, password.getPassword());
            cs.setInt(4, password.getPassword_key());
            cs.setString(5, password.getUsername());
            cs.setString(6, password.getUser_email());
            cs.setString(7, password.getApp_name());
            cs.setString(8, password.getUrl());
            i = cs.executeUpdate();
            if (i == 1) {
                message = PasswordResponseMessages.PASSWORD_ADDED.getPasswordResponseMessages();
            } else {
                message = PasswordResponseMessages.OPERATION_FAILED.getPasswordResponseMessages();
            }
        } catch (SQLException e) {
            message = "com.begawoinc.passwordvault.dao.Passwords_dao.addPassword()::" + e.getMessage();
        } finally {
            try {
                if (con != null) {
                    con.close();
                }
            } catch (SQLException e) {
                message = "com.begawoinc.passwordvault.dao.Users_dao.addPassword()::" + e.getMessage();
            }
        }
        return message;
    }

    public String updatePassword(Passwords password) {
        con = PasswordVault.connectDb();
        sql = "UPDATE " + TABLENAME + " set password = ?, password_key = ?, username = ?, user_email = ?, app_name = ?, url = ? WHERE password_primary_key = ?";
        try {
            cs = con.prepareCall(sql);
            cs.setString(1, password.getPassword());
            cs.setInt(2, password.getPassword_key());
            cs.setString(3, password.getUsername());
            cs.setString(4, password.getUser_email());
            cs.setString(5, password.getApp_name());
            cs.setString(6, password.getUrl());
            cs.setString(7, password.getPassword_primary_key());
            i = cs.executeUpdate();
            if (i == 1) {
                message = PasswordResponseMessages.PASSWORD_UPDATED.getPasswordResponseMessages();
            } else {
                message = PasswordResponseMessages.OPERATION_FAILED.getPasswordResponseMessages();
            }
        } catch (SQLException e) {
            message = "com.begawoinc.passwordvault.dao.Passwords_dao.updatePassword()::" + e.getMessage();
        } finally {
            try {
                if (con != null) {
                    con.close();
                }
            } catch (SQLException e) {
                message = "com.begawoinc.passwordvault.dao.Passwords_dao.updatePassword()::" + e.getMessage();
            }
        }
        return message;
    }

    public String deletePassword(String password_primary_key) {
        con = PasswordVault.connectDb();
        sql = "DELETE FROM " + TABLENAME + " WHERE password_primary_key = ?";
        try {
            cs = con.prepareCall(sql);
            cs.setString(1, password_primary_key);
            i = cs.executeUpdate();
            if (i == 1) {
                message = PasswordResponseMessages.PASSWORD_DELETED.getPasswordResponseMessages();
            } else {
                message = PasswordResponseMessages.OPERATION_FAILED.getPasswordResponseMessages();
            }
        } catch (SQLException e) {
            message = "com.begawoinc.passwordvault.dao.Passwords_dao.deletePassword()::" + e.getMessage();
        } finally {
            try {
                if (con != null) {
                    con.close();
                }
            } catch (SQLException e) {
                message = "com.begawoinc.passwordvault.dao.Passwords_dao.deletePassword()::" + e.getMessage();
            }
        }
        return message;
    }

    public List<Passwords> findPasswordsByUserID(String user_primary_key) {
        ArrayList<Passwords> passwords = new ArrayList<>();

        con = PasswordVault.connectDb();
        sql = "SELECT * FROM " + TABLENAME + " where user_primary_key = '" + user_primary_key + "'";
        try {
            cs = con.prepareCall(sql);
            rs = cs.executeQuery();
            while (rs.next()) {
                passwords.add(new Passwords(
                        rs.getString("password_primary_key"),
                        rs.getString("user_primary_key"),
                        rs.getString("password"),
                        rs.getInt("password_key"),
                        rs.getString("username"),
                        rs.getString("user_email"),
                        rs.getString("app_name"),
                        rs.getString("url"),
                        rs.getString("created_at"),
                        rs.getString("modified_at")
                ));
            }
        } catch (SQLException e) {
            message = "com.begawoinc.passwordvault.dao.Passwords_dao.findPasswordsByUserId::" + e.getMessage();
        } finally {
            try {
                if (con != null) {
                    con.close();
                }
            } catch (SQLException e) {
                message = "com.begawoinc.passwordvault.dao.Passwords_dao.findPasswordsByUserId::" + e.getMessage();
            }
        }
        return passwords;
    }

}
