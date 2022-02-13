/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.begawoinc.passwordvault.enums;

/**
 *
 * @author LENOVO
 */
public enum PasswordResponseMessages {
    PASSWORD_ADDED("Password added successfully!"),
    PASSWORD_UPDATED("Password updated successfully!"),
    PASSWORD_DELETED("Password deleted successfully!"),
    OPERATION_FAILED("Operation Failed");

    private String passwordResponseMessages;

    private PasswordResponseMessages(String passwordResponseMessages) {
        this.passwordResponseMessages = passwordResponseMessages;
    }

    public String getPasswordResponseMessages() {
        return passwordResponseMessages;
    }

    public void setPasswordResponseMessages(String passwordResponseMessages) {
        this.passwordResponseMessages = passwordResponseMessages;
    }

}
