package jp.model;

import org.springframework.stereotype.Repository;

import jp.bean.Member;

@Repository
public interface MemberDeleteDao {
	
	//탈퇴
	//아이디만 가지고 삭제 후 성공 실패 확인
	boolean memberdelete(String email);
	boolean memberdelete(Member member);
}
