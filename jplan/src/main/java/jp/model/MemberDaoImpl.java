package jp.model;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import jp.bean.Member;

@Repository("memberDao")
public class MemberDaoImpl implements MemberDao{
	
	@Autowired
	JdbcTemplate jdbcTemplate;
	
	public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
		this.jdbcTemplate = jdbcTemplate;
	}

	@Override
	public boolean login(Member member) {
		String sql = "select * from member where email =? and pw=?";
		return jdbcTemplate.update(sql, member.getEmail(), member.getPw())>0;
	}

	@Override
	public void sign(Member member) {
		String sql = "insert into member values(member_seq.nextval,?,?,?,'m',sysdate)";
		Object[] args = new Object[]{
				member.getEmail(), member.getPw(),member.getName()
			};
			jdbcTemplate.update(sql, args);
	}
}
