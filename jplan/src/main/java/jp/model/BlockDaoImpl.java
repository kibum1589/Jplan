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


	@Override
	public List<Block> memberBlockList() throws Exception {
		String sql ="select * from block order by reg desc";
		return jdbcTemplate.query(sql, mapper);
	}

}
