package jp.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import jp.bean.Review;

@Repository("reviewDao")
public class ReviewDaoImpl implements ReviewDao{
	
	@Autowired
	JdbcTemplate jdbcTemplate;

	RowMapper<Review> mapper = (rs,index)->{
		return new Review(rs);
	};
	
	// 해당 장소의 review 목록 가져오는 메소드
	@Override
	public List<Review> read(String pid) {
		String sql = "select * from review where pid = ?";
		Object[] args = {pid};
		List<Review> list =  jdbcTemplate.query(sql,args, mapper);
		return list;
	}

	// review 작성 메소드
	@Override
	public void write(Review review) {
		String sql = "insert into review values(review_seq.nextval, ?, ?, sysdate, ?)";
		Object[] args = {review.getPid(), review.getContent(),review.getMno()};
		jdbcTemplate.update(sql, args);
	}

	
}
