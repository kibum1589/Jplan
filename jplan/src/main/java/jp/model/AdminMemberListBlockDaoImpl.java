package jp.model;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.ResultSetExtractor;
import org.springframework.stereotype.Repository;

import jp.bean.Block;
import jp.bean.Member;
@Repository("adminMemberlistBlockDao")
public class AdminMemberListBlockDaoImpl implements AdminMemberListBlockDao{
	@Autowired
	JdbcTemplate jdbcTemplate;

	public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
		this.jdbcTemplate = jdbcTemplate;
	}
	
	private ResultSetExtractor<Member> extractor = (rs) -> {
		if (rs.next())
			return new Member(rs);
		else
			return null;
	};
	
	@Override
	public boolean admin_memberlist_block(Block block,int no,String email) {
		System.out.println(email);
		int result = -1;
		String sql = "insert into block values(block_seq.nextval,?,1,?,?,?,sysdate,?)";
		Object[] args = new Object[] { no, block.getType(), block.getReason(), block.getDur(),email};
		result = jdbcTemplate.update(sql, args);

		return result > 0;
	}

	//관리자가 중복일 경우에는 power로 구분하기 어려워서 이 메서드를 주석 처리 하였다.
	/*@Override
	public Member powergetno(String power) {
		String sql="select no from member where power=?";
		return jdbcTemplate.query(sql, extractor,power);
	}*/

	@Override
	public Member getmno(int no) {
		String sql="select no from member where no=?";
		return jdbcTemplate.query(sql, extractor,no);
	}
}
