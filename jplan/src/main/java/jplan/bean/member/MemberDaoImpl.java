package jplan.bean.member;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Component;

@Component("memberDao")
public class MemberDaoImpl implements MemberDao{
	
	// DB 연결
	JdbcTemplate jdbcTemplate;

	public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
		this.jdbcTemplate = jdbcTemplate;
	}

	// 로그인 메소드
	@Override
	public boolean login(Member member) {
		String sql = "select * from member where email=? and pw = ?";
		
		return jdbcTemplate.update(sql)>0;
	}
	
	// 회원가입 메소드
	@Override
	public void sign(Member member) {
		String sql = "insert into member values(seq_member.nextval,?,?,?,'m',sysdate)";
				
		jdbcTemplate.update(sql,member.getEmail(),member.getPw(),member.getName());
		
	}

}
