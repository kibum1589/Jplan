package jp.bean;

import java.sql.ResultSet;
import java.sql.SQLException;

public class Plan {
	private int no;
	private int mno;
	private String title;
	private int dur;
	private String sday;
	private int look;
	private int love;
	private String reg;
	
	public Plan() {
		super();
	}
	
	public Plan(ResultSet rs) throws SQLException {
		this.setNo(rs.getInt("no"));
		this.setMno(rs.getInt("mno"));
		this.setTitle(rs.getString("title"));
		this.setDur(rs.getInt("dur"));
		this.setSday(rs.getString("sday"));
		this.setLook(rs.getInt("look"));
		this.setLove(rs.getInt("love"));
		this.setReg(rs.getString("reg"));
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

	public int getDur() {
		return dur;
	}

	public void setDur(int dur) {
		this.dur = dur;
	}

	public String getSday() {
		return sday;
	}

	public void setSday(String sday) {
		this.sday = sday;
	}

	public int getLook() {
		return look;
	}

	public void setLook(int look) {
		this.look = look;
	}

	public int getLove() {
		return love;
	}

	public void setLove(int love) {
		this.love = love;
	}

	public String getReg() {
		return reg;
	}

	public void setReg(String reg) {
		this.reg = reg;
	}

}
