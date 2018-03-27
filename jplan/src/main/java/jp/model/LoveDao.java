package jp.model;

import java.util.List;

import org.springframework.stereotype.Repository;

import jp.bean.Love;

@Repository
public interface LoveDao {

	void increase(Love love);
	
	void decrease(Love love);
	
	List<Love> getLove(String pid);
}
