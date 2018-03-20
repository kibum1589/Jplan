package jp.model;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.ResultSetExtractor;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Repository;

import jp.bean.Place;
import jp.bean.Plan;

@Controller
@Repository("PlanDao")
public class PlanDaoImpl implements PlanDao {

	private Logger log = LoggerFactory.getLogger(getClass());

	@Autowired
	private JdbcTemplate jdbcTemplate;

	public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
		this.jdbcTemplate = jdbcTemplate;
	}

	// RowMapper와 ResultSetExtractor
	private RowMapper<Plan> mapper = (rs, index) -> {
		return new Plan(rs);
	};
	private ResultSetExtractor<Plan> extractor = (rs) -> {
		if (rs.next())
			return new Plan(rs);
		else
			return null;
	};

//	@Override
//	public int create(Plan plan) throws Exception{
//		String sql = "select plan_seq.nextval from dual";
//		int no = jdbcTemplate.queryForObject(sql, Integer.class);
//
//		// 위의 번호로 insert 처리
//		sql = "insert into plan values(?, ?, ?, ?, ?, ?, ?, sysdate)";
//		Object[] args = { plan.getNo(), plan.getMno(), plan.getTitle(), plan.getDur(), plan.getSday(), plan.getLook(),
//				plan.getLove(), plan.getReg() };
//		jdbcTemplate.update(sql, args);
//		return no;
//	}

	// 일정 조회 메소드
	@Override
	public Plan select(int no) throws Exception{
		String sql = "select * from plan where no=?";
		return jdbcTemplate.query(sql, extractor, no);
	}

	//일정 리스트 메소드
	@Override
	public List<Plan> list() throws Exception{
		String sql = "select no, title, dur, look, reg from plan order by no asc";
		return jdbcTemplate.query(sql, mapper);
	}
	
	// 조회수 1 증가 메소드
	@Override
	public void lookPlus(int no, String email) throws Exception{
		String sql = "update plan set look=look+1 where no=? and mno != ?";
		jdbcTemplate.update(sql, no, email);
	}

	// 좋아요 1 증가 메소드
	@Override
	public void lovePlus(int no, String email) throws Exception{
		String sql = "update plan set love=love+1 where no=? and mno != ?";
		jdbcTemplate.update(sql, no, email);
	}

	
}