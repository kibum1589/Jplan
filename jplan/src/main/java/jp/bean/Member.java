package jp.bean;

import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;

public class Member {
	private int no;
	private String email;
	private String pw;
	private String name;
	private String power;
	private String reg;
	
	public Member(ResultSet rs)throws SQLException{
		this.setNo(rs.getInt("no"));
		this.setEmail(rs.getString("email"));
		this.setPw(rs.getString("pw"));
		this.setName(rs.getString("name"));
		this.setPower(rs.getString("power"));
		this.setReg(rs.getString("reg"));
	}
	
	public Member(HttpServletRequest request) {
		setEmail(request.getParameter("email"));
		setPw(request.getParameter("pw"));
		setName(request.getParameter("name"));
		setPower(request.getParameter("power"));
		setReg(request.getParameter("reg"));
	}
	
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPower() {
		return power;
	}
	public void setPower(String power) {
		this.power = power;
	}
	public String getReg() {
		return reg;
	}
	public void setReg(String reg) {
		this.reg = reg;
	}

	public Member(int no, String email, String pw, String name, String power, String reg) {
		super();
		this.no = no;
		this.email = email;
		this.pw = pw;
		this.name = name;
		this.power = power;
		this.reg = reg;
	}
	
	public Member() {
		super();
		}
	
}
