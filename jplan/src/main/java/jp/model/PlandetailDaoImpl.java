package jp.model;

import java.util.List;

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
import jp.bean.Plandetail;

@Controller
@Repository("PlandetailDao")
public class PlandetailDaoImpl implements PlandetailDao {

	private Logger log = LoggerFactory.getLogger(getClass());

	private JdbcTemplate jdbcTemplate;

	public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
		this.jdbcTemplate = jdbcTemplate;
	}
	
	@Autowired
	private PlanDao plandao;

	// RowMapper와 ResultSetExtractor
	private RowMapper<Plandetail> mapper = (rs, index) -> {
		return new Plandetail(rs);
	};
	private ResultSetExtractor<Plandetail> extractor = (rs) -> {
		if (rs.next())
			return new Plandetail(rs);
		else
			return null;
	};

	//세부일정 조회 메소드
	@Override
	public List<Plandetail> pdlist(int pno) {
		String sql = "select * from plandetail where pno=? order by no asc ";
		return jdbcTemplate.query(sql, mapper, pno);
	}

}