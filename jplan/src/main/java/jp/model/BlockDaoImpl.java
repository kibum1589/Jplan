package jp.model;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.ResultSetExtractor;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import jp.bean.Block;
import jp.bean.Member;

@Repository("blockDao")
public class BlockDaoImpl implements BlockDao{
	
	@Autowired
	JdbcTemplate jdbcTemplate;
	
	
	private ResultSetExtractor<Block> extractor = (rs) -> {
		if (rs.next())
			return new Block(rs);
		else
			return null;
	};
	
	public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
		this.jdbcTemplate = jdbcTemplate;
	}
	
	private RowMapper<Block> mapper = (rs, idx)->{
		return new Block(rs);
	};
	
	//제제 회원 조회
	@Override
	public String check(int mno) {
		String sql = "select * from block where mno =? order by reg asc";
		Object[] obj= {mno};
		Block block =  jdbcTemplate.query(sql,obj,extractor);
		
		if(block !=null ) {
			String msg = 
					"제제당한 회원입니다 \n"+
					"제제원인 : " + block.getType() +"\n 제제이유 : "+ block.getReason();
			return msg ;
		} 
		else {
			return null ;
		}
		
	}

	//제제 회원 리스트
	@Override
	public List<Block> memberBlockList(int sno, int eno) throws Exception {
		String sql ="select * from ("
				+ "select rownum rn, A.* from ("
				+ "select * from block "
				+ "order by no desc"
			+ ")A"
		+ ") "
		+ "where rn between ? and ?";
		
		return jdbcTemplate.query(sql, mapper, sno, eno);
	}
	
	//제제 회원 검색 메소드
	@Override
	public List<Block> find(String sort, String keyword, int sno, int eno) throws Exception {
		String sql = "select * from ("
				+ "select rownum rn, A.* from ("
				+ "select * from block where "+sort+" like '%'||?||'%' order by no desc"
				+ ")A"
				+ ") "
				+ "where rn between ? and ?";
		return jdbcTemplate.query(sql, mapper, keyword, sno, eno);
	}

	//제제한 회원 수 메소드
	@Override
	public int getCount() {
		String sql = "select count(*) from block";
		return jdbcTemplate.queryForObject(sql, Integer.class);
	}


	@Override
	public int getCount(String sort, String keyword) {
		String sql = "select count(*) from block "
								+ "where "+sort+" like '%'||?||'%'"
								+ "order by no desc";
		return jdbcTemplate.queryForObject(sql, Integer.class, keyword);
	}


	

}
