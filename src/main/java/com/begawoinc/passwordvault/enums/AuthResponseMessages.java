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
public enum AuthResponseMessages {
    LOGIN_SUCCESS("Loged in succesfully"),
    LOGIN_FAILED("Incorrect username or password"),
    USER_NOT_FOUND("User not found"),
    BLOCKED_ACCOUNT("Your account is blocked because of multiple invalid attempts");

    private String authResponsseMessage;

    private AuthResponseMessages(String authResponsseMessage) {
        this.authResponsseMessage = authResponsseMessage;
    }

    public String getAuthResponseMessage() {
        return this.authResponsseMessage;
    }

    public void setAuthResponseMessage(String authResponseMessage) {
        this.authResponsseMessage = authResponseMessage;
    }

}
