package jp.model;

import org.springframework.stereotype.Repository;

import jp.bean.Plan;

@Repository
public interface PlanDao {
	//일정 작성 메소드
	int write(Plan plan);
	//일정 조회 메소드
	Plan select(int no);
	//조회수 증가 메소드
	void lookPlus(int no, String email);
	//좋아요 증가 메소드
	void lovePlus(int no, String email);
	
}
