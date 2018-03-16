package jp.model;

import org.springframework.stereotype.Repository;

import jp.bean.Plan;

@Repository
public interface PlanDao {
	int write(Plan plan);
	//일정 조회 메소드
	Plan select(int no, int mno);
	void lookPlus(int no, String email);
	void lovePlus(int no, String email);
	
}
