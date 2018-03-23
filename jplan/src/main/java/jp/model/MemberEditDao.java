package jp.model;

import org.springframework.stereotype.Repository;

import jp.bean.Member;

@Repository
public interface MemberEditDao {
	//이름과 비밀번호 수정
	boolean memberedit(Member member);
}
