package jp.model;

import java.util.List;

import org.springframework.stereotype.Repository;

import jp.bean.Place;
import jp.bean.Plandetail;

@Repository
public interface PlandetailDao {

	//(select) 하나의 일정에 대한 세부일정의 목록을 구하는 메소드
	List<Plandetail> select(int pno, Place id);
}
