package jp.model;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Repository;

import jp.bean.Plan;

@Repository
public interface PlanDao {
	 // 01. 일정 작성
//    public void create(Plan plan) throws Exception;
    // 02. 일정 상세보기
    public Plan select(int no) throws Exception;
    // 03. 일정 수정
//    public void edit(Plan plan) throws Exception;
    // 04. 일정 삭제
//    public void delete(int no) throws Exception;
    // 05. 일정 전체 목록
    public List<Plan> list() throws Exception;
    // 06. 일정 조회 증가
    public void lookPlus(int no, String email) throws Exception;
    // 07. 일정 좋아요 증가
    public void lovePlus(int no, String email) throws Exception;
}