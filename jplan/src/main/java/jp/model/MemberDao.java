package jp.model;

import java.util.List;

import org.springframework.stereotype.Repository;

import jp.bean.Member;

@Repository
public interface MemberDao {
	/**
	 * 로그인 메소드
	 * @param member
	 * @return 성공 :true 실패: false
	 */
	
	//회원 로그인 체크
	public boolean loginDAO(Member member);
	//회원 정보보기
	public Member infom(Member member);
	
	//회원가입
	boolean sign(Member member)throws Exception;
	//이메일 중복확인
	boolean check(String email)throws Exception;
	//자신의 정보 보기
	Member info(String email)throws Exception;
	//회원 리스트
	List<Member> list() throws Exception;
	
}
