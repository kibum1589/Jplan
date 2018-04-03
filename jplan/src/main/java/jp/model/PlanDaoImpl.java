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

import jp.bean.Plan;

@Controller
@Repository("planDao")
public class PlanDaoImpl implements PlanDao {

	private Logger log = LoggerFactory.getLogger(getClass());

	@Autowired
	private JdbcTemplate jdbcTemplate;

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

	// 일정 조회 메소드
	@Override
	public Plan select(int no) throws Exception{
		String sql = "select * from plan where no=?";
		return jdbcTemplate.query(sql, extractor, no);
	}
	
	// mno로 일정 조회 메소드
	@Override
	public List<Plan> getPlan(int mno) {
		String sql = "select * from plan where mno = ?";
		Object[] args = {mno};
		return jdbcTemplate.query(sql, args,mapper);
	}

	//일정 리스트 메소드
	public List<Plan> list(int sno, int eno) throws Exception{
		String sql = "select * from ("
				+ "select rownum rn, A.* from ("
				+ "select * from plan "
				+ "order by no asc"
			+ ")A"
		+ ") "
		+ "where rn between ? and ?";
		return jdbcTemplate.query(sql, mapper, sno, eno);
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

	// 일정 작성 메소드
	@Override
	public int create(Plan plan) throws Exception {
		String sql = "select plan_seq.nextval from dual";
		int no = jdbcTemplate.queryForObject(sql, Integer.class);
		
		// 위의 번호로 insert 처리
		sql = "insert into plan values(?, ?, ?, ?, ?, ?, ?, sysdate)";
		Object[] args = 
			{ no, plan.getMno(), plan.getTitle(), plan.getDur(), plan.getSday(), plan.getLook(), plan.getLove()};
		jdbcTemplate.update(sql, args);
		return no;
	}
	
	//일정 검색 메소드
	@Override
	public List<Plan> find(String sort, String keyword, int sno, int eno) {
		String sql = "select * from ("
				+ "select rownum rn, A.* from ("
				+ "select * from plan where "+sort+" like '%'||?||'%' order by no desc"
				+ ")A"
				+ ") "
				+ "where rn between ? and ?";
		return jdbcTemplate.query(sql, mapper, keyword, sno, eno);
	}
	
	//일정 개수 구하는 메소드
	@Override
	public int getCount() {
		String sql = "select count(*) from plan";
		return jdbcTemplate.queryForObject(sql, Integer.class);
	}
	@Override
	public int getCount(String sort, String keyword) {
		String sql = "select count(*) from plan "
								+ "where "+sort+" like '%'||?||'%' "
								+ "order by no desc";
		return jdbcTemplate.queryForObject(sql, Integer.class, keyword);
	}


	
}