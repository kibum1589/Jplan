package jplan.bean.member;

import org.springframework.stereotype.Component;

@Component
public interface MemberDao {

	/**
	 * 로그인 메소드
	 * @param member Member 객체
	 * @return 결과값 (성공 : true , 실패 : false)
	 */
	boolean login(Member member);
	
	/**
	 * 회원가입 메소드
	 * @param member Member 객체
	 */
	void sign(Member member);
}
