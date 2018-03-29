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
	
	RowMapper<String> stringMapper = (rs, index)->{
		return new String(rs.getString("pid"));
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

	// 해당 장소 좋아요 목록 반환
	@Override
	public List<Love> getLove(String pid) {
		String sql = "select * from love where pid=? ";
		Object[] args =  {pid};
		
		List<Love> list = jdbcTemplate.query(sql, args ,mapper);
		return list;
	}
	
	// 좋아요누른 장소 id 목록 반환
		@Override
		public List<String> getLovePlace(String mno) {
			String sql = "select pid from love where mno=? ";
			Object[] args =  {mno};
			
			List<String> list = jdbcTemplate.query(sql, args ,stringMapper);
			return list;
		}

	// 인기있는 상위 6개 장소 id 목록 반환
	@Override
	public List<String> getHotPlace() {
		String sql = "select pid from (select pid from love group by pid order by count(*) asc) where rownum <=6";
		List<String> list = jdbcTemplate.query(sql, stringMapper);
		return list;
	}


}
