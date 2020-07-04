package com.newspublish.service;

import javax.servlet.http.HttpServletRequest;

import com.newspublish.bean.AjaxResult;
import com.newspublish.bean.User;

public interface UserService {

    void registerUser(User user);

    void login(HttpServletRequest request, String role, AjaxResult result, String userAccount, String userPsw);

    void editUser(AjaxResult result, Integer id, String userName, String userPsw);

}
