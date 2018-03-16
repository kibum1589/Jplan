package jp.model;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Repository;

import jp.bean.Member;

@Controller
@Repository("memberDao")
public class MemberDaoImpl implements MemberDao{
//	@Autowired
	private Logger log=LoggerFactory.getLogger(getClass());
	
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
		log.debug(member.getName());
		log.debug(member.getPw());
		log.debug(member.getEmail());

		String sql = "insert into member values(member_seq.nextval,?,?,?,'m',sysdate)";
		Object[] args = new Object[]{
				member.getEmail(), member.getPw(),member.getName()
			};
			jdbcTemplate.update(sql, args);
	}
	
}