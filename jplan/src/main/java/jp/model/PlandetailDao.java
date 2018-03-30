package jp.model;

import java.util.List;

import org.springframework.stereotype.Repository;

import jp.bean.Plandetail;

@Repository
public interface PlandetailDao {

	//하나의 일정에 대한 세부일정의 목록을 구하는 메소드
	List<Plandetail> pdlist(int pno);
	
	//상세일정 만드는 메소드
	void create(Plandetail plandetail);
}