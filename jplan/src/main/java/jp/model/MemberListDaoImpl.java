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
	
	//회원 리스트 메소드
	@Override
	public List<Member> memberList(int sno, int eno) throws Exception{
		String sql ="select * from ("
				+ "select rownum rn, A.* from ("
				+ "select * from member "
				+ "where power != 'a' "
				+ "order by no desc"
			+ ")A"
		+ ") "
		+ "where rn between ? and ?";
		return jdbcTemplate.query(sql, mapper, sno, eno);
	}
	
	//회원 검색 메소드
	@Override
	public List<Member> find(String sort, String keyword, int sno, int eno) {
		String sql = "select * from ("
				+ "select rownum rn, A.* from ("
				+ "select * from member where "+sort+" like '%'||?||'%' order by no desc"
				+ ")A"
				+ ") "
				+ "where rn between ? and ?";
		return jdbcTemplate.query(sql, mapper, keyword, sno, eno);
	}
	
	//회원 총 인원수 구하는 메소드
	@Override
	public int getCount() {
		String sql = "select count(*) from member";
		return jdbcTemplate.queryForObject(sql, Integer.class);
	}

	@Override
	public int getCount(String sort, String keyword) {
		String sql = "select count(*) from member "
				+ "where "+sort+" like '%'||?||'%' "
				+ "order by no desc";
		return jdbcTemplate.queryForObject(sql, Integer.class, keyword);
	}

	
	
}
