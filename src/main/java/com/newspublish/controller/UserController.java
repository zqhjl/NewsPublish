package com.newspublish.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.newspublish.bean.AjaxResult;
import com.newspublish.service.UserService;

@Controller
@RequestMapping("/user")
public class UserController {
    @Autowired
    private UserService service;

    @RequestMapping("/toEditUser")
    public String toEditUser() {
        return "editUser";
    }

    @RequestMapping("/index")
    public String toIndex() {
        return "index";
    }

    @ResponseBody
    @RequestMapping("/editUser")
    public AjaxResult editUser(HttpServletRequest request, Integer id, String userAccount, String userName, String userPsw) {
        AjaxResult result = new AjaxResult();
        HttpSession session = request.getSession();
        service.editUser(result, id, userAccount, userName, userPsw);
        session.removeAttribute("user");
        return result;
    }


    @RequestMapping("/loginOut")
    public String loginOut(HttpServletRequest request) {
        HttpSession session = request.getSession();
        session.removeAttribute("user");
        return "redirect:toLogin";
    }

}
