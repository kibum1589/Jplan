package jp.model;

import org.springframework.stereotype.Repository;

import jp.bean.Member;

@Repository
public interface MemberInfoDao {
	
	public Member memberinfo(String email);

}
