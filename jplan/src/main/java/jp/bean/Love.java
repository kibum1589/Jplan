package jp.bean;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.stereotype.Component;

@Component
public class Love {

	private int mno;
	private String pid;
	
	public Love(ResultSet rs) throws SQLException {
		setMno(rs.getInt("mno"));
		setPid(rs.getString("pid"));
	}
	
	public Love() {
		super();
	}
	public int getMno() {
		return mno;
	}
	public void setMno(int mno) {
		this.mno = mno;
	}
	public String getPid() {
		return pid;
	}
	public void setPid(String pid) {
		this.pid = pid;
	}
	
	
}
