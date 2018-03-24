package jp.controller.home;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import jp.bean.Plan;
import jp.bean.Plandetail;
import jp.model.PlanDao;
import jp.model.PlandetailDao;

@Controller
public class CreateController {
	
		Logger logger = LoggerFactory.getLogger(this.getClass());
	
	
		@Autowired
		PlanDao planDao;
		
		@Autowired
		PlandetailDao plandetailDao;

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
		
		@RequestMapping("createDetail")
		public void createPlanDetail(Plandetail plandetail, HttpServletResponse res) throws IOException {
			
			logger.debug("들어온 장소 id : {}", plandetail.getId());
			
			plandetailDao.create(plandetail);
			logger.debug("등록완료! plandetail : {}", plandetail.getId());
			PrintWriter writer = res.getWriter();
			writer.print("상세일정 등록 완료");
			writer.close();
			
		}
		
}









