package jp.model;

import org.springframework.stereotype.Repository;

@Repository
public interface BlockDao {
	String check(int mno);

}
