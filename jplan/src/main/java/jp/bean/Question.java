package jp.bean;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Date;

import org.springframework.stereotype.Component;

@Component
public class Question {
	private int no;
	private int mno;
	private String title;
	private String content;
	private Date reg;
	
	public Question() {
		super();
	}

	public Question(ResultSet rs) throws SQLException{
		this.setNo(rs.getInt("no"));
		this.setMno(rs.getInt("mno"));
		this.setTitle(rs.getString("title"));
		this.setContent(rs.getString("content"));
		this.setReg(rs.getDate("reg"));
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public int getMno() {
		return mno;
	}

	public void setMno(int mno) {
		this.mno = mno;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Date getReg() {
		return reg;
	}

	public void setReg(Date reg) {
		this.reg = reg;
	}
	
	
}
