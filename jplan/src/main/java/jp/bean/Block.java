package jp.bean;

import java.sql.ResultSet;
import java.sql.SQLException;

public class Block {
		private int no;
		private int mno;
		private int ano;
		private String type;
		private String reason;
		private int dur;
		private String reg;
		
		public Block() {};
		
		public Block(ResultSet rs) throws SQLException {
			setNo( rs.getInt("no"));
			setMno( rs.getInt("mno"));
			setAno( rs.getInt("ano"));
			setType( rs.getString("type"));
			setReason( rs.getString("reason"));
			setDur( rs.getInt("dur"));
			setReg( rs.getString("reg"));
		};
		
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
		public int getAno() {
			return ano;
		}
		public void setAno(int ano) {
			this.ano = ano;
		}
		public String getType() {
			return type;
		}
		public void setType(String type) {
			this.type = type;
		}
		public String getReason() {
			return reason;
		}
		public void setReason(String reason) {
			this.reason = reason;
		}
		public int getDur() {
			return dur;
		}
		public void setDur(int dur) {
			this.dur = dur;
		}
		public String getReg() {
			return reg;
		}
		public void setReg(String reg) {
			this.reg = reg;
		}


}