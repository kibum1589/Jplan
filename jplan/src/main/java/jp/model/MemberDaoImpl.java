package jp.model;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.ResultSetExtractor;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Repository;

import jp.bean.Member;

@Controller
@Repository("memberDao")
public class MemberDaoImpl implements MemberDao{
//	@Autowired
	private Logger log=LoggerFactory.getLogger(getClass());
	
	@Autowired
	JdbcTemplate jdbcTemplate;

	
	public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
		this.jdbcTemplate = jdbcTemplate;
	}
	
	private ResultSetExtractor<Member> extractor = (rs)->{
		if(rs.next())
			try {
				return new Member(rs);
			} catch (Exception e) {
				e.printStackTrace();
			}
		else return null;
		return null;
	};
	

	@Override
	public boolean login(Member member) {
		String sql = "select * from member where email =? and pw=?";
		return jdbcTemplate.update(sql, member.getEmail(), member.getPw())>0;
	}

	@Override
	public boolean sign(Member member) {
		log.debug(member.getName());
		log.debug(member.getPw());
		log.debug(member.getEmail());
		int result = -1;
		String sql = "insert into member values(member_seq.nextval,?,?,?,'m',sysdate)";
		Object[] args = new Object[]{
				member.getEmail(), member.getPw(),member.getName()
			};
			result = jdbcTemplate.update(sql, args);
			
			return result>0;
	}

		@Override
		public boolean check(String email) throws Exception {
			ResultSetExtractor<Integer> extractor = new ResultSetExtractor<Integer>() {
				@Override
				public Integer extractData  (ResultSet rs) throws SQLException, DataAccessException {
					rs.next();
						int count = rs.getInt(1);
					
					return count;
				}
			};
			int count = jdbcTemplate.query("select count(email) from member where email=?", extractor, email);
			return count>0;
		}

		@Override
		public Member info(String email) throws Exception {
			String sql = "select * from member where email=?";
			return jdbcTemplate.query(sql, extractor, email);
		}

	}

