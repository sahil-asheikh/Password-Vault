/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.begawoinc.passwordvault.model;

/**
 *
 * @author LENOVO
 */
public class Users {

    private int id;
    private String user_primary_key;
    private String username;
    private String password;
    private String user_email;
    private int attempt;
    private int is_deleted;
    private String created_at;
    private String modified_at;

    public Users(int id, String user_primary_key, String username, String password, String user_email, int attempt, int is_deleted, String created_at, String modified_at) {
        this.id = id;
        this.user_primary_key = user_primary_key;
        this.username = username;
        this.password = password;
        this.user_email = user_email;
        this.attempt = attempt;
        this.is_deleted = is_deleted;
        this.created_at = created_at;
        this.modified_at = modified_at;
    }

    public Users() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getUser_primary_key() {
        return user_primary_key;
    }

    public void setUser_primary_key(String user_primary_key) {
        this.user_primary_key = user_primary_key;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getUser_email() {
        return user_email;
    }

    public void setUser_email(String user_email) {
        this.user_email = user_email;
    }

    public int getAttempt() {
        return attempt;
    }

    public void setAttempt(int attempt) {
        this.attempt = attempt;
    }

    public int getIs_deleted() {
        return is_deleted;
    }

    public void setIs_deleted(int is_deleted) {
        this.is_deleted = is_deleted;
    }

    public String getCreated_at() {
        return created_at;
    }

    public void setCreated_at(String created_at) {
        this.created_at = created_at;
    }

    public String getModified_at() {
        return modified_at;
    }

    public void setModified_at(String modified_at) {
        this.modified_at = modified_at;
    }

}
