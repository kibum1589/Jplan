package jp.model;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import jp.bean.Member;

@Repository("MemberDeleteDao")
public class MemberDeleteDaoImpl implements MemberDeleteDao{
	
	private Logger log=LoggerFactory.getLogger(getClass());

	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
		this.jdbcTemplate = jdbcTemplate;
	}
	
	//탈퇴
	//아이디만 가지고 삭제 후 성공 실패 확인
	public boolean memberdelete(String email) {
		log.debug(("{}"),email);
		String sql = "delete member where email=?";
		return jdbcTemplate.update(sql, email) > 0;
	}
	public boolean memberdelete(Member Member) {
		return memberdelete(Member.getEmail());
	}
}
