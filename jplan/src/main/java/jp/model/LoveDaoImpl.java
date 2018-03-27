package jp.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import jp.bean.Love;

@Repository("loveDao")
public class LoveDaoImpl implements LoveDao{
	
	@Autowired
	JdbcTemplate jdbcTemplate;
	
	RowMapper<Love> mapper = (rs,index)->{
		return new Love(rs);
	};

	// 좋아요 증가
	@Override
	public void increase(Love love) {
		String sql = "insert into love values(?,?)";
		Object[] args = {love.getMno(), love.getPid()};
		jdbcTemplate.update(sql,args);
	}

	// 좋아요 감소
	@Override
	public void decrease(Love love) {
		String sql = "delete love where mno=? and pid=?";
		Object[] args = {love.getMno(), love.getPid()};
		jdbcTemplate.update(sql,args);
	}

	// 좋아요 목록 반환
	@Override
	public List<Love> getLove(String pid) {
		String sql = "select * from love where pid=? ";
		Object[] args =  {pid};
		
		List<Love> list = jdbcTemplate.query(sql, args ,mapper);
		return list;
	}

	

}
