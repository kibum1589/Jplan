package jp.model;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.ResultSetExtractor;
import org.springframework.stereotype.Repository;

import jp.bean.Member;

@Repository("memberDeleteDao")
public class MemberDeleteDaoImpl implements MemberDeleteDao{
	
	private Logger log=LoggerFactory.getLogger(getClass());
	
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	private ResultSetExtractor<Member> extractor = (rs) -> {
		if (rs.next())
			return new Member(rs);
		else
			return null;
	};
	
	//탈퇴
	//no만 가지고 block 으로 데이터를 옮기며 제제 처리 
	@Override
	public boolean MemberDelete(int no) {
		log.debug(("{}"),no);
		int result = -1;
		String sql = "insert into block values(block_seq.nextval,?,?,?,?,?,sysdate)";
		Object[] args= new Object[]{
				no,no,"회원탈퇴","사용자에의한",""
			};
			result = jdbcTemplate.update(sql, args);
			
			return result>0;
	}

}
