package jp.model;

import org.springframework.jdbc.core.JdbcTemplate;

import jp.bean.Member;

public class MemberDeleteDaoImpl {
	
	private JdbcTemplate jdbcTemplate;
	public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
		this.jdbcTemplate = jdbcTemplate;
	}
	
//	[3] 탈퇴(exit)
//	 - 아이디만 가지고 삭제 후 성공 실패 확인
	public boolean exit(String email) {
		String sql = "delete member where email=?";
		return jdbcTemplate.update(sql, email) > 0;
	}
	public boolean exit(Member Member) {
		return exit(Member.getEmail());
	}
}
