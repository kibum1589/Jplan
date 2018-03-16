package jp.model;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Repository;

import jp.bean.Place;


@Controller
@Repository("PlaceDao") 
public class PlaceDaoImpl implements PlaceDao{

	private Logger log = LoggerFactory.getLogger(getClass());
	
	private JdbcTemplate jdbcTemplate;
	
	//좋아요 1 증가 메소드
	@Override
	public void lovePlus(Place place, String email) {
		String sql = "update place set love=love+1 where id=?";
		jdbcTemplate.update(sql, place.getId(), email);
	}

	
	
}
