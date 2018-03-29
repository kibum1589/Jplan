package jp.model;

import java.util.List;

import org.springframework.stereotype.Repository;

import jp.bean.Question;

@Repository
public interface QuestionDao {

	int create(Question question);
	Question select(int no);
	List<Question> list(int sno, int eno);
	int getCount();
}
