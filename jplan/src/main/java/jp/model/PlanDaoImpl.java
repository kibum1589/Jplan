package jp.model;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.ResultSetExtractor;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Repository;

import jp.bean.Place;
import jp.bean.Plan;

@Controller
@Repository("PlanDao")
public class PlanDaoImpl implements PlanDao{
	
	private Logger log = LoggerFactory.getLogger(getClass());
	
	private JdbcTemplate jdbcTemplate;
	
	public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
		this.jdbcTemplate = jdbcTemplate;
	}

	Plan plan = new Plan();
	
	//RowMapper와 ResultSetExtractor
		private RowMapper<Plan> mapper = (rs, index)->{
			return new Plan(rs);
		};
		private ResultSetExtractor<Plan> extractor = (rs)->{
			if(rs.next())
				return new Plan(rs);
			else
				return null;
		};
	
	@Override
	public int write(Plan plan) {
		return 0;
	}

	//일정 조회 메소드
	@Override
	public Plan select(int no, int mno) {
		log.debug(plan.getTitle());
		log.debug(plan.getSday());
		log.debug(plan.getReg());
		
		String sql = "select * from plan where no=? and mno=?";
		return jdbcTemplate.query(sql, extractor, no, mno);
	}

	//조회수 1 증가 메소드
	@Override
	public void lookPlus(int no, String email) {
		String sql = "update plan set look=look+1 where no=? and mno != ?";
		jdbcTemplate.update(sql, no, email);
	}

	//좋아요 1 증가 메소드
	@Override
	public void lovePlus(int no, String email) {
		String sql = "update plan set love=love+1 where no=? and mno != ?";
		jdbcTemplate.update(sql, no, email);
	}
	
	
	
	
	
}















