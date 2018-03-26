package jp.model;

import org.springframework.stereotype.Repository;

import jp.bean.Block;
import jp.bean.Member;


@Repository
public interface AdminMemberListBlockDao {
		//회원제제
		boolean admin_memberlist_block(Block block,int no)throws Exception;
		//관리자 권한으로 관리자 자신의 번호를 가져오는 메서드
		Member powergetno(String power);
		//재재하려는 회원의 번호를 가져오는 메서드
		Member getmno(int no);
}
