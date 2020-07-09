package com.newspublish.bean;

import lombok.Data;

@Data
public class AjaxResult {
    private boolean flag = true;
    private String message;
    private Object datas;
    private int code = 0;
}
