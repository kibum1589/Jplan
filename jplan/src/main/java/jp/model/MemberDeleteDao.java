package jp.model;

import org.springframework.stereotype.Repository;

import jp.bean.Member;

@Repository
public interface MemberDeleteDao {
	//탈뢰(제제)
	boolean MemberDelete(int no);
}
