package jp.model;

import java.util.List;

import org.springframework.stereotype.Repository;

import jp.bean.Review;

@Repository
public interface ReviewDao {
	
	// 리뷰 가져오기
	List<Review> read(String pid);
	
	// 리뷰 작성하기
	void write(Review review);
	
	List<Review> getLatest();
}
