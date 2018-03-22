package jp.model;

import jp.bean.Member;

public interface MemberDeleteDao {

//	[2] 로그인(login)
//	 - 아이디/비밀번호로 성공 실패 확인
	boolean login(String email, String pw);
	boolean login(Member member);
	
//	[3] 탈퇴(exit)
//	 - 아이디만 가지고 삭제 후 성공 실패 확인
	boolean exit(String email);
	boolean exit(Member member);
}
