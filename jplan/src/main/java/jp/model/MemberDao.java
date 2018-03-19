package jp.model;

import org.springframework.stereotype.Repository;

import jp.bean.Member;

@Repository
public interface MemberDao {
	/**
	 * 로그인 메소드
	 * @param member
	 * @return 성공 :true 실패: false
	 */
	boolean login(Member member)throws Exception;
	boolean sign(Member member)throws Exception;
	boolean check(String email)throws Exception;
	Member info(String email)throws Exception;;
	
}
