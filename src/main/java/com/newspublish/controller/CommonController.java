package com.newspublish.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.newspublish.bean.AjaxResult;
import com.newspublish.bean.User;
import com.newspublish.service.UserService;

@Controller
public class CommonController {

    @Autowired
    private UserService userService;

    @RequestMapping("/toLogin")
    public String toLogin() {
        return "login";
    }

    @ResponseBody
    @RequestMapping("/login")
    public AjaxResult login(String role,String userAccount,String userPsw,HttpServletRequest request) {
        AjaxResult result = new AjaxResult();
        userService.login(request, role, result, userAccount, userPsw);
        return result;
    }

    @RequestMapping("/toRegister")
    public String toRegister() {
        return "register";
    }

    @ResponseBody
    @RequestMapping("/register")
    public AjaxResult register(
            @RequestParam("userName") String userName,
            @RequestParam("userAccount") String userAccount,
            @RequestParam("userPsw") String userPsw,
            HttpServletRequest request
    ) {
        AjaxResult result = new AjaxResult();
        User user = new User(userName, userAccount, userPsw);
        userService.registerUser(user);
        System.out.println(result);
        return result;
    }

}
