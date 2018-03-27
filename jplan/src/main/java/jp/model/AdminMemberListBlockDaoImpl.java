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
	public boolean admin_memberlist_block(Block block,int no, int getmno) {
		int result = -1;
		String sql = "insert into member values(block_seq.nextval,?,?,?,?,?,sysdate,?)";
		Object[] args = new Object[] { getmno, no, block.getType(), block.getReason(), block.getDur(),"" };
		result = jdbcTemplate.update(sql, args);

		return result > 0;
	}

	@Override
	public Member powergetno(String power) {
		String sql="select no from member where power=?";
		return jdbcTemplate.query(sql, extractor,power);
	}

	@Override
	public Member getmno(int no) {
		String sql="select no from member where no=?";
		return jdbcTemplate.query(sql, extractor,no);
	}
}
