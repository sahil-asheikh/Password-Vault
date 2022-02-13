/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.begawoinc.passwordvault.service;

import com.begawoinc.passwordvault.dao.Users_dao;
import com.begawoinc.passwordvault.enums.AuthResponseMessages;
import com.begawoinc.passwordvault.model.Users;
import com.begawoinc.passwordvault.utility.Utils;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

/**
 *
 * @author LENOVO
 */
public class Users_service {

    Users user = new Users();
    Users_dao users_dao = new Users_dao();

    public String user_login(Users user, HttpServletRequest request) {
        Users existUser = users_dao.findByUsername(user.getUsername());
        if (existUser == null) {
            return AuthResponseMessages.USER_NOT_FOUND.getAuthResponseMessage();
        } else {
            if (existUser.getAttempts() >= 3) {
                return AuthResponseMessages.BLOCKED_ACCOUNT.getAuthResponseMessage();
            } else if (existUser.getIs_deleted() == 1) {
                return AuthResponseMessages.USER_NOT_FOUND.getAuthResponseMessage();
            } else {
                if (existUser.getUsername().equals(user.getUsername()) && existUser.getPassword().equals(user.getPassword())) {
                    int i = users_dao.reset_attempts(existUser.getUser_primary_key());
                    if (i == 1) {
                        HttpSession session = request.getSession();
                        session.setAttribute("user_name", existUser.getUsername());
                        session.setAttribute("user_primary_key", existUser.getUser_primary_key());
                        return AuthResponseMessages.LOGIN_SUCCESS.getAuthResponseMessage();
                    } else {
                        return AuthResponseMessages.LOGIN_FAILED.getAuthResponseMessage();
                    }
                } else {
                    int i = users_dao.increase_attempt(existUser.getUser_primary_key(), existUser.getAttempts());
                    if (i == 1) {
                        return AuthResponseMessages.LOGIN_FAILED.getAuthResponseMessage();
                    } else {
                        return AuthResponseMessages.LOGIN_FAILED.getAuthResponseMessage();
                    }
                }
            }
        }
    }

    public boolean checkNewPassword(String old_password, String user_id) {
        if (users_dao.checkPassword(old_password, user_id)) {
            return true;
        } else {
            return false;
        }
    }

    public String register_user(Users user) {
        this.user.setUser_primary_key(Utils.generatePublicId(30));
        this.user.setUsername(user.getUsername());
        this.user.setUser_email(user.getUser_email());
        this.user.setPassword(user.getPassword());
        return users_dao.insert_user(this.user);
    }

    public Users findUserByUsername(String user_primary_key) {
        return users_dao.findUserByUsername(user_primary_key);
    }

    public String update_user(Users user) {
        return users_dao.update_user(user);
    }

}
