/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.begawoinc.passwordvault.dao;

import com.begawoinc.passwordvault.database.PasswordVault;
import com.begawoinc.passwordvault.enums.PasswordResponseMessages;
import com.begawoinc.passwordvault.model.Users;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author LENOVO
 */
public class Users_dao {

    Users quiz = new Users();
    String message;
    int i;
    Connection con;
    CallableStatement cs;
    ResultSet rs;
    String sql;
    String TABLENAME = Users.class.getSimpleName().toLowerCase();

    public Users findByUsername(String username) {
        Users user = null;
        con = PasswordVault.connectDb();
        sql = "SELECT * FROM " + TABLENAME + " where username = '" + username + "'";
        try {
            cs = con.prepareCall(sql);
            rs = cs.executeQuery();
            while (rs.next()) {
                user = new Users(
                        rs.getInt("id"),
                        rs.getString("user_primary_key"),
                        rs.getString("username"),
                        rs.getString("password"),
                        rs.getString("user_email"),
                        rs.getInt("attempts"),
                        rs.getInt("is_deleted"),
                        rs.getString("created_at"),
                        rs.getString("modified_at")
                );
            }
        } catch (SQLException e) {
            message = "com.begawoinc.passwordvault.dao.Users_dao.select_user()::" + e.getMessage();
        } finally {
            try {
                if (con != null) {
                    con.close();
                }
            } catch (SQLException e) {
                message = "com.begawoinc.passwordvault.dao.Users_dao.select_user()::" + e.getMessage();
            }
        }
        return user;
    }

    public int count_attempts(String user_primary_key) {
        con = PasswordVault.connectDb();
        sql = "SELECT attempts FROM " + TABLENAME + " where user_primary_key = ?";
        int attempts = 0;
        try {
            cs = con.prepareCall(sql);
            cs.setString(1, user_primary_key);
            rs = cs.executeQuery();
            if (rs.next()) {
                attempts = rs.getInt("attempts");
            }
        } catch (SQLException e) {
            message = "com.begawoinc.passwordvault.dao.Users_dao.count_attempts()" + e.getMessage();
        } finally {
            try {
                if (con != null) {
                    con.close();
                }
            } catch (SQLException e) {
                message = "com.begawoinc.passwordvault.dao.Users_dao.count_attempts()" + e.getMessage();
            }
        }
        return attempts;
    }

    public int increase_attempt(String user_primary_key, int count) {
        con = PasswordVault.connectDb();
        sql = "UPDATE " + TABLENAME + " SET attempts = ? WHERE user_primary_key = ?";
        try {
            cs = con.prepareCall(sql);
            cs.setInt(1, count + 1);
            cs.setString(2, user_primary_key);
            i = cs.executeUpdate();
        } catch (SQLException e) {
            message = "com.begawoinc.passwordvault.dao.Users_dao.increase_attempt()" + e.getMessage();
        } finally {
            try {
                if (con != null) {
                    con.close();
                }
            } catch (SQLException e) {
                message = "com.begawoinc.passwordvault.dao.Users_dao.increase_attempt()" + e.getMessage();
            }
        }
        return i;
    }

    public int reset_attempts(String user_primary_key) {
        con = PasswordVault.connectDb();
        sql = "UPDATE " + TABLENAME + " SET attempts = 0 WHERE user_primary_key = ?";
        try {
            cs = con.prepareCall(sql);
            cs.setString(1, user_primary_key);
            i = cs.executeUpdate();
        } catch (SQLException e) {
            message = "com.begawoinc.passwordvault.dao.Users_dao.reset_attempts()" + e.getMessage();
        } finally {
            try {
                if (con != null) {
                    con.close();
                }
            } catch (SQLException e) {
                message = "com.begawoinc.passwordvault.dao.Users_dao.reset_attempts()" + e.getMessage();
            }
        }
        return i;
    }

    public boolean checkPassword(String old_password, String user_primary_key) {
        con = PasswordVault.connectDb();
        sql = "SELECT password FROM " + TABLENAME + " where user_primary_key = ?";
        boolean check_password = false;
        try {
            cs = con.prepareCall(sql);
            cs.setString(1, user_primary_key);
            rs = cs.executeQuery();
            if (rs.next()) {
                if (rs.getString("password").equals(old_password)) {
                    check_password = true;
                }
            }
        } catch (SQLException e) {
            message = "com.qt.begawoinc.passwordvaulto.dao.Users_dao.checkPassword()::" + e.getMessage();
        } finally {
            try {
                if (con != null) {
                    con.close();
                }
            } catch (SQLException e) {
                message = "com.begawoinc.passwordvault.dao.Users_dao.checkPassword()::" + e.getMessage();
            }
        }
        return check_password;
    }

    public String updatePassword(Users user) {
        con = PasswordVault.connectDb();
        sql = "UPDATE " + TABLENAME + " set password = ? WHERE user_primary_key = ?";
        try {
            cs = con.prepareCall(sql);
            cs.setString(1, user.getPassword());
            cs.setString(2, user.getUser_primary_key());
            i = cs.executeUpdate();
            if (i == 1) {
                message = PasswordResponseMessages.PASSWORD_UPDATED.getPasswordResponseMessages();
            } else {
                message = PasswordResponseMessages.OPERATION_FAILED.getPasswordResponseMessages();
            }
        } catch (SQLException e) {
            message = "com.begawoinc.passwordvault.dao.Users_dao.updatePassword()::" + e.getMessage();
        } finally {
            try {
                if (con != null) {
                    con.close();
                }
            } catch (SQLException e) {
                message = "com.begawoinc.passwordvault.dao.Users_dao.updatePassword()::" + e.getMessage();
            }
        }
        return message;
    }

    public String insert_user(Users user) {
        con = PasswordVault.connectDb();
        sql = "INSERT INTO " + TABLENAME + " (user_primary_key, username, password, user_email) VALUES (?,?,?,?)";
        try {
            cs = con.prepareCall(sql);
            cs.setString(1, user.getUser_primary_key());
            cs.setString(2, user.getUsername());
            cs.setString(3, user.getPassword());
            cs.setString(4, user.getUser_email());
            i = cs.executeUpdate();
            if (i == 1) {
                message = PasswordResponseMessages.PASSWORD_ADDED.getPasswordResponseMessages();
            }
        } catch (SQLException e) {
            message = "com.begawoinc.passwordvault.dao.TblUser_dao.insert_user()::" + e.getMessage();
        } finally {
            try {
                if (con != null) {
                    con.close();
                }
            } catch (SQLException e) {
                message = "com.begawoinc.passwordvault.dao.TblUser_dao.insert_user()::" + e.getMessage();
            }
        }
        return message;
    }

}
