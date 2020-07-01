package com.newspublish.bean;

public class AjaxResult {
	private boolean flag = true;
	private String message;
	private Object datas;
	private int code=0;
	
	public int getCode() {
		return code;
	}
	public void setCode(int code) {
		this.code = code;
	}
	public boolean isFlag() {
		return flag;
	}
	public void setFlag(boolean flag) {
		this.flag = flag;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	public Object getDatas() {
		return datas;
	}
	public void setDatas(Object datas) {
		this.datas = datas;
	}
	@Override
	public String toString() {
		return "AjaxResult [flag=" + flag + ", message=" + message + ", datas=" + datas + ", code=" + code + "]";
	}
	
	
}
