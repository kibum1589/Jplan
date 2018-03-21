package jp.model;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;
import org.springframework.web.servlet.ModelAndView;

import jp.bean.Member;

@Repository("MemberListDao")
public class MemberListDaoImpl implements MemberListDao{
	
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
		this.jdbcTemplate = jdbcTemplate;
	}
	
	private RowMapper<Member> mapper = (rs, idx)->{
		return new Member(rs);
	};
	
	@Override
	public List<Member> memberList() {
		String sql ="select * from member where power != 'a' order by email";
		return jdbcTemplate.query(sql, mapper);
	}
}
