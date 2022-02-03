/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.begawoinc.passwordvault.dao;

import com.begawoinc.passwordvault.database.PasswordVault;
import com.begawoinc.passwordvault.enums.PasswordResponseMessages;
import com.begawoinc.passwordvault.model.Users;
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
public class Users_dao {

    Users quiz = new Users();
    String message;
    int i;
    Connection con;
    CallableStatement cs;
    ResultSet rs;
    String sql;
    String TABLENAME = Users.class.getSimpleName().toLowerCase();

}
