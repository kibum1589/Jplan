package jp.model;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import jp.bean.Member;

@Repository("memberEditDao")
public class MemberEditDaoImpl implements MemberEditDao{
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
		this.jdbcTemplate = jdbcTemplate;
	}
	
	
	public boolean memberedit(Member member) {
		String sql = "update member set name=?, pw=? where email=?";
		Object[] args = new Object[] {
				 member.getName(), member.getPw(), member.getEmail()
		};
		System.out.println("멤버에딧"+member.getName());
		return jdbcTemplate.update(sql, args) > 0;
	}
}
