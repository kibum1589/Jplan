package jp.model;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Repository;

import jp.bean.Plan;

@Repository
public interface PlanDao {
	 // 일정 작성
    int create(Plan plan) throws Exception;
    // 일정 상세보기
    Plan select(int no) throws Exception;
    // mno로 일정 리스트 가져오기
    List<Plan> getPlan(int mno);
    // 일정 수정
//    public void edit(Plan plan) throws Exception;
    // 일정 삭제
//    public void delete(int no) throws Exception;
    // 일정 전체 목록
    List<Plan> list(int sno, int eno) throws Exception;
    //게시글 검색 메소드
    List<Plan> find(String sort, String keyword, int sno, int eno);
    // 일정 조회 증가
    void lookPlus(int no, int mno) throws Exception;
    // 일정 좋아요 증가
    void lovePlus(int no, int mno) throws Exception;
    //게시글 개수 구하는 메소드
  	int getCount();
  	int getCount(String sort, String keyword);
}