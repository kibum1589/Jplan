package jp.bean;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.stereotype.Component;

@Component
public class Plandetail {
	private int no;
	private int pno;
	private String id;
	private int turn;
	private int day;
	
	public Plandetail() {
		super();
	}
	
	public Plandetail(int no, int pno, String id, int turn, int day) {
		super();
		this.no = no;
		this.pno = pno;
		this.id = id;
		this.turn = turn;
		this.day = day;
	}

	public Plandetail(ResultSet rs) throws SQLException {
		this.setNo(rs.getInt("no"));
		this.setPno(rs.getInt("pno"));
		this.setId(rs.getString("id"));
		this.setTurn(rs.getInt("turn"));
		this.setDay(rs.getInt("day"));
	}
	
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public int getPno() {
		return pno;
	}
	public void setPno(int pno) {
		this.pno = pno;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public int getTurn() {
		return turn;
	}
	public void setTurn(int turn) {
		this.turn = turn;
	}
	public int getDay() {
		return day;
	}
	public void setDay(int day) {
		this.day = day;
	}
	
}
