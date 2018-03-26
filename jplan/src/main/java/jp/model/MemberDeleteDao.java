package jp.model;

import org.springframework.stereotype.Repository;

@Repository
public interface MemberDeleteDao {
	//탈뢰(제제)
	boolean MemberDelete(int no, String email);
}
