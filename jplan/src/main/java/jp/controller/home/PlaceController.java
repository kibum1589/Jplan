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
import jp.model.MemberDao;
import jp.model.ReviewDao;

@Controller
public class PlaceController {
	
		Logger logger = LoggerFactory.getLogger(this.getClass());
	
		@Autowired
		ReviewDao reviewDao;
		
		@Autowired
		LoveDao loveDao;
		
		@Autowired
		MemberDao memberDao;

		@RequestMapping("place")
		public String place(Model model) {
			// 최근 리뷰리스트 반환
			List<Review> reviewList =  reviewDao.getLatest();
			
			JSONArray jsonArr = new JSONArray();
			for(Review r: reviewList) {
				JSONObject jsonObj = new JSONObject();
				jsonObj.put("pid", r.getPid());
				jsonObj.put("content", r.getContent());
				jsonObj.put("reg", r.getReg());
				
				String name = memberDao.getName(r.getMno());
				jsonObj.put("name", name);
				jsonArr.add(jsonObj);
			}
			
			JSONObject jsonObj1 = new JSONObject();
			jsonObj1.put("list", jsonArr);
			model.addAttribute("reviewList",jsonObj1);
			
			// 인기장소 반환
			List<String> hotPlaces =  loveDao.getHotPlace();
			
			JSONObject jsonObj2 = new JSONObject();
			jsonObj2.put("list", hotPlaces);
			
			model.addAttribute("hotPlaces",jsonObj2 );
			
			
			
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
			
			JSONObject json = new JSONObject();
			
			for(Review r : list_review) {
				JSONObject jsonObj = new JSONObject();
				jsonObj.put("content", r.getContent());
				jsonObj.put("reg", r.getReg());
				jsonObj.put("mno", r.getMno());
				jsonArr.add(jsonObj);
			}
			
			
			json.put("love_count", list_love.size());
			json.put("loveFlag", loveFlag);
			json.put("review_list", jsonArr);
			
			
			PrintWriter writer =  response.getWriter();
			writer.print(json);
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
			
			List<Review> list_review =  reviewDao.read(review.getPid());
			
			JSONArray jsonArr = new JSONArray();
			JSONObject json = new JSONObject();
			
			for(Review r : list_review) {
				JSONObject jsonObj = new JSONObject();
				jsonObj.put("content", r.getContent());
				jsonObj.put("reg", r.getReg());
				jsonObj.put("mno", r.getMno());
				jsonArr.add(jsonObj);
			}
			
			json.put("review_list", jsonArr);
			
			
			PrintWriter writer =  response.getWriter();
			writer.print(json);
			writer.close();
			
		}
		
		// 좋아요 토글
		@RequestMapping("place/loveAction")
		public void loveAction(Love love , boolean loveFlag, HttpSession session, HttpServletResponse response) throws IOException {
			logger.debug("좋아요 전환 상태:  {}", loveFlag);
			logger.debug("들어온 love 장소:  {}",love.getPid());
			
			love.setMno((Integer)session.getAttribute("no"));
			
			if(loveFlag) {
				loveDao.increase(love);
			}
			else {
				loveDao.decrease(love);
			}
			
			int loveNum = loveDao.getLove(love.getPid()).size();
			
			PrintWriter writer =  response.getWriter();
			writer.print(loveNum);
			writer.close();
		
		}
		
		
}

