package jp.model;

import java.util.List;

import org.springframework.stereotype.Repository;

import jp.bean.Member;

@Repository
public interface MemberListDao {
	public List<Member> memberList(int sno, int eno) throws Exception;
	int getCount();
}
