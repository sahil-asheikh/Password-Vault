/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.begawoinc.passwordvault.service;

import com.begawoinc.passwordvault.dao.Passwords_dao;
import com.begawoinc.passwordvault.model.Passwords;
import com.begawoinc.passwordvault.utility.Cipher;
import com.begawoinc.passwordvault.utility.Utils;
import java.util.List;

/**
 *
 * @author LENOVO
 */
public class Passwords_service {

    Passwords password = new Passwords();
    Passwords_dao password_dao = new Passwords_dao();

    public String addPassword(Passwords password) {
        this.password.setUser_primary_key(password.getUser_primary_key());
        this.password.setPassword(Cipher.encPass(password.getPassword(), password.getPassword_key()));
        this.password.setPassword_key(password.getPassword_key());
        this.password.setUsername(password.getUsername());
        this.password.setUser_email(password.getUser_email());
        this.password.setApp_name(password.getApp_name());
        this.password.setUrl(password.getUrl());
        return password_dao.addPassword(this.password);
    }

    public String updatePassword(Passwords password) {
        this.password.setPassword(Cipher.encPass(password.getPassword(), password.getPassword_key()));
        this.password.setPassword_key(password.getPassword_key());
        this.password.setUsername(password.getUsername());
        this.password.setUser_email(password.getUser_email());
        this.password.setApp_name(password.getApp_name());
        this.password.setUrl(password.getUrl());
        this.password.setPassword_primary_key(password.getPassword_primary_key());
        return password_dao.updatePassword(this.password);
    }

    public String deletePassword(String password_primary_key) {
        return password_dao.deletePassword(password_primary_key);
    }

    public List<Passwords> findPasswordsByUserID(String user_primary_key) {
        return password_dao.findPasswordsByUserID(user_primary_key);
    }

    public Passwords findPasswordByPasswordID(String password_primary_key) {
        return password_dao.findPasswordByPasswordID(password_primary_key);
    }

}
