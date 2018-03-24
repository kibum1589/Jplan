package jp.model;

import java.util.List;

import org.springframework.stereotype.Repository;

import jp.bean.Block;

@Repository
public interface BlockDao {
	String check(int mno);
	List<Block> memberBlockList(int sno, int eno) throws Exception;
	List<Block> find(String sort, String keyword, int sno, int eno) throws Exception;
	int getCount();
	int getCount(String sort, String keyword);
}
