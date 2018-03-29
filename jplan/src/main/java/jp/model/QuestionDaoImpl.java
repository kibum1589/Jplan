package jp.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.ResultSetExtractor;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Repository;

import jp.bean.Question;

@Controller
@Repository("questionDao")
public class QuestionDaoImpl implements QuestionDao{

	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
		this.jdbcTemplate = jdbcTemplate;
	}
	
	// RowMapper와 ResultSetExtractor
		private RowMapper<Question> mapper = (rs, index) -> {
			return new Question(rs);
		};
		private ResultSetExtractor<Question> extractor = (rs) -> {
			if (rs.next())
				return new Question(rs);
			else
				return null;
		};

		@Override
		public int create(Question question) {
			String sql = "select question_seq.nextval from dual";
			int no = jdbcTemplate.queryForObject(sql, Integer.class);
			
			sql = "insert into question values(?, ?, ?, ?, sysdate)";
			Object[] args = 
				{no, question.getMno(), question.getTitle(), question.getContent()};
			jdbcTemplate.update(sql, args);
			return no;
		}
		
		@Override
		public Question select(int no) {
			String sql = "select * from question where no=?";
			return jdbcTemplate.query(sql, extractor, no);
		}
		
		@Override
		public List<Question> list(int sno, int eno) {
			String sql = "select * from ("
					+ "select rownum rn, A.* from ("
					+ "select * from question "
					+ "order by no asc"
				+ ")A"
			+ ") "
			+ "where rn between ? and ?";
			return jdbcTemplate.query(sql, mapper, sno, eno);
		}

		@Override
		public int getCount() {
			String sql = "select count(*) from question";
			return jdbcTemplate.queryForObject(sql, Integer.class);
		}
		
	
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
}
