package jp.model;

import org.springframework.stereotype.Repository;

import jp.bean.Place;

@Repository
public interface PlaceDao {

	void lovePlus(Place place, String email);
	
}
