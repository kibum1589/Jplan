package jp.model;

import java.util.List;

import org.springframework.stereotype.Repository;

import jp.bean.Block;

@Repository
public interface BlockDao {
	String check(int mno);
	public List<Block> memberBlockList() throws Exception;

}
