package com.newspublish.service;

import javax.servlet.http.HttpServletRequest;

import com.newspublish.bean.AjaxResult;
import com.newspublish.bean.User;

public interface UserService {

    void registerUser(User user);

    void login(HttpServletRequest request, AjaxResult result, String userAccount, String userPsw, String role);

    void editUser(AjaxResult result, Integer id, String userAccount, String userName, String userPsw);

}
