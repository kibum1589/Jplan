package jp.bean;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.stereotype.Component;

@Component
public class Review {
	private int no;
	private String pid;
	private String content;
	private String reg;
	private int mno;
	
	public Review(ResultSet rs) throws SQLException {
		setNo(rs.getInt("no"));
		setPid(rs.getString("pid"));
		setContent(rs.getString("content"));
		setReg(rs.getString("reg"));
		setMno(rs.getInt("mno"));
	}
	
	public Review() {
		super();
	}
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getPid() {
		return pid;
	}
	public void setPid(String pid) {
		this.pid = pid;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getReg() {
		return reg;
	}
	public void setReg(String reg) {
		this.reg = reg;
	}
	public int getMno() {
		return mno;
	}
	public void setMno(int mno) {
		this.mno = mno;
	}
	
	
}
