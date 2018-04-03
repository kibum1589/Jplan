package jp.controller.home;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import jp.bean.Plan;
import jp.bean.Plandetail;
import jp.model.LoveDao;
import jp.model.PlanDao;
import jp.model.PlandetailDao;

@Controller
public class CreateController {
	
		Logger logger = LoggerFactory.getLogger(this.getClass());
	
	
		@Autowired
		PlanDao planDao;
		
		@Autowired
		PlandetailDao plandetailDao;
		
		@Autowired
		LoveDao loveDao;

		@RequestMapping("create")
		public String place() {
			return "create";
		}
		
		@RequestMapping("createPlan")
		public void createPlan(Plan plan, HttpServletResponse res, HttpSession session) throws Exception {
			
			logger.debug("들어온 plan 이름 : {}", plan.getTitle());
			
			plan.setMno((Integer)session.getAttribute("no"));
			int pno = planDao.create(plan);
			
			PrintWriter writer = res.getWriter();
			writer.print(String.valueOf(pno));
			writer.close();
		}
		
		@RequestMapping(value = "createDetail" ,method = { RequestMethod.POST })
		public void createPlanDetail(@RequestBody String strArr, HttpServletResponse res) throws IOException, ParseException {
			
			logger.debug("들어온 장소 arr : {}", strArr);
			JSONParser parser = new JSONParser();
			JSONArray jsonArr =  (JSONArray)parser.parse(strArr);
			logger.debug("변환한 arr : {}", jsonArr);
			
			
			for(int i=0;i<jsonArr.size();i++){

				JSONObject jsonObj = (JSONObject)jsonArr.get(i);

				Plandetail planDetail = new Plandetail();
				
				planDetail.setPno(Integer.valueOf((String)jsonObj.get("pno")));
				planDetail.setId((String)jsonObj.get("id"));
				planDetail.setTurn((int)(long)jsonObj.get("turn"));
				planDetail.setDay((int)(long)jsonObj.get("day"));
				
				plandetailDao.create(planDetail);
				
			}

			
			PrintWriter writer = res.getWriter();
			writer.print("ok");
			writer.close();
			
		}
		
		@RequestMapping("create/lovePlace")
		public void createLovePlace(HttpSession session, HttpServletResponse response) throws IOException {
			logger.debug("좋아하는 장소 호출");
			
			List<String> list =  loveDao.getLovePlace(String.valueOf(session.getAttribute("no")));
			
			JSONArray jsonArr = new JSONArray();
			JSONObject json = new JSONObject();
			
			for(String s : list) {
				jsonArr.add(s);
			}
			
			json.put("lovePlaces", jsonArr);
			
			PrintWriter writer =  response.getWriter();
			writer.print(json);
			writer.close();
			
		}
		
}









