package com.begawoinc.passwordvault.model;

public class Passwords {

    private int id;
    private String password_primary_key;
    private String user_primary_key;
    private String password;
    private int password_key;
    private String username;
    private String user_email;
    private String app_name;
    private String url;
    private String created_at;
    private String modified_at;

    public Passwords(String password_primary_key, String user_primary_key, String password, int password_key, String username, String user_email, String app_name, String url, String created_at, String modified_at) {
        this.password_primary_key = password_primary_key;
        this.user_primary_key = user_primary_key;
        this.password = password;
        this.password_key = password_key;
        this.username = username;
        this.user_email = user_email;
        this.app_name = app_name;
        this.url = url;
        this.created_at = created_at;
        this.modified_at = modified_at;
    }

    public Passwords() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getPassword_primary_key() {
        return password_primary_key;
    }

    public void setPassword_primary_key(String password_primary_key) {
        this.password_primary_key = password_primary_key;
    }

    public String getUser_primary_key() {
        return user_primary_key;
    }

    public void setUser_primary_key(String user_primary_key) {
        this.user_primary_key = user_primary_key;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public int getPassword_key() {
        return password_key;
    }

    public void setPassword_key(int password_key) {
        this.password_key = password_key;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getUser_email() {
        return user_email;
    }

    public void setUser_email(String user_email) {
        this.user_email = user_email;
    }

    public String getApp_name() {
        return app_name;
    }

    public void setApp_name(String app_name) {
        this.app_name = app_name;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
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
