package jp.model;

import java.util.List;

import org.springframework.stereotype.Repository;

import jp.bean.Member;

@Repository
public interface MemberListDao {
	//회원 리스트 메소드
	List<Member> memberList(int sno, int eno) throws Exception;
	//회원 검색 메소드
	List<Member> find(String sort, String keyword, int sno, int eno);
	//회원 수 구하는 메소드
	int getCount();
	int getCount(String sort, String keyword);
}
