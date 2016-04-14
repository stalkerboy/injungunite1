package com.injung.vo;

public class UserVO {

	private long mem_snum;
	private String mem_id;
	private String mem_passwd;
	private String mem_name;
	private String mem_email;
	private String mem_gender;
	private String mem_birth;
	private String mem_profile;
	private String mem_regdate;
	
	public long getMem_snum() {
		return mem_snum;
	}
	public void setMem_snum(long mem_snum) {
		this.mem_snum = mem_snum;
	}
	public String getMem_id() {
		return mem_id;
	}
	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}
	public String getMem_passwd() {
		return mem_passwd;
	}
	public void setMem_passwd(String mem_passwd) {
		this.mem_passwd = mem_passwd;
	}
	public String getMem_name() {
		return mem_name;
	}
	public void setMem_name(String mem_name) {
		this.mem_name = mem_name;
	}
	public String getMem_email() {
		return mem_email;
	}
	public void setMem_email(String mem_email) {
		this.mem_email = mem_email;
	}
	public String getMem_gender() {
		return mem_gender;
	}
	public void setMem_gender(String mem_gender) {
		this.mem_gender = mem_gender;
	}
	public String getMem_birth() {
		return mem_birth;
	}
	public void setMem_birth(String mem_birth) {
		this.mem_birth = mem_birth;
	}
	public String getMem_profile() {
		return mem_profile;
	}
	public void setMem_profile(String mem_profile) {
		this.mem_profile = mem_profile;
	}
	public String getMem_regdate() {
		return mem_regdate;
	}
	public void setMem_regdate(String mem_regdate) {
		this.mem_regdate = mem_regdate;
	}
	@Override
	public String toString() {
		return "UserVO [mem_snum=" + mem_snum + ", mem_id=" + mem_id + ", mem_passwd=" + mem_passwd + ", mem_name=" + mem_name + ", mem_email=" + mem_email + ", mem_gender=" + mem_gender + ", mem_birth=" + mem_birth + ", mem_profile=" + mem_profile + ", mem_regdate=" + mem_regdate + "]";
	}
}
