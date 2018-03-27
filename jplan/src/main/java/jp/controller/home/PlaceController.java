package jp.controller.home;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import jp.bean.Love;
import jp.bean.Review;
import jp.model.LoveDao;
import jp.model.ReviewDao;

@Controller
public class PlaceController {
	
		Logger logger = LoggerFactory.getLogger(this.getClass());
	
		@Autowired
		ReviewDao reviewDao;
		
		@Autowired
		LoveDao loveDao;

		@RequestMapping("place")
		public String place() {
			return "place";
		}
		
		// 댓글수, 좋아요수 체크
		@RequestMapping("place/checkLC")
		public void checkLC(String pid, HttpServletResponse response, HttpSession session) throws IOException {
			
			List<Review> list_review =  reviewDao.read(pid);
			List<Love> list_love = loveDao.getLove(pid);
			
			boolean loveFlag = false;
			
			for(Love love: list_love) {
				if(love.getMno()==(Integer)session.getAttribute("no")) {
					loveFlag = true;
					break;
				}
			}
			
			JSONArray jsonArr = new JSONArray();
			JSONObject jsonObj = new JSONObject();
			
			jsonObj.put("list_review", list_review);
			
			jsonObj.put("love_count", list_love.size());
			
			jsonObj.put("loveFlag", loveFlag);
			jsonArr.add(jsonObj);
			
			PrintWriter writer =  response.getWriter();
			writer.print(jsonObj);
			writer.close();
			
		}
		
		// 리뷰작성
		@RequestMapping("place/writeReview")
		public void writeReview(Review review, HttpSession session, HttpServletResponse response) throws IOException {
			logger.debug("댓글내용: {}" ,review.getContent());
			logger.debug("작성자 no: {}" ,(Integer) session.getAttribute("no"));
			logger.debug("장소 id: {}" ,review.getPid());
			review.setMno((Integer) session.getAttribute("no"));
			
			reviewDao.write(review);
			
			PrintWriter writer = response.getWriter();
			writer.print(true);
			writer.close();
		}
		
		// 좋아요 토글
		@RequestMapping("place/loveAction")
		public void loveAction(Love love , boolean loveFlag, HttpSession session) {
			logger.debug("좋아요 전환 상태:  {}", loveFlag);
			logger.debug("들어온 love 장소:  {}",love.getPid());
			
			love.setMno((Integer)session.getAttribute("no"));
			
			if(loveFlag) {
				loveDao.increase(love);
			}
			else {
				loveDao.decrease(love);
			}
			
		}
}

