package jp.model;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.ResultSetExtractor;
import org.springframework.stereotype.Repository;

import jp.bean.Member;

@Repository("MemberInfoDao")
public class MemberInfoDaoImpl implements MemberInfoDao{
	
	private Logger log=LoggerFactory.getLogger(getClass());
	
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
		this.jdbcTemplate = jdbcTemplate;
	}
	
	private ResultSetExtractor<Member> extractor = (rs)->{
		if(rs.next()) return new Member(rs);
		else return null;
	};
	
	public Member memberinfo(String email){
		log.debug(("{}"),email);
		String sql = "select * from member where email=?";
		return jdbcTemplate.query(sql, extractor, email);
	}
}
