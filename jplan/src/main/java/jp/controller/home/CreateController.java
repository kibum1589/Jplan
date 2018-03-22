package jp.controller.home;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

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
		public void createPlan(Plan plan, HttpServletResponse res) throws Exception {
			
			logger.debug("들어온 plan 이름 : {}", plan.getTitle());
			
			// !!!!!!!!!! 세션에서 얻어오는걸로 바꾸어야함
			plan.setMno(1);
			int pno = planDao.create(plan);
			
			
			PrintWriter writer = res.getWriter();
			writer.print(String.valueOf(pno));
			writer.close();
		}
		
		@RequestMapping("createDetail")
		public void createPlanDetail(Plandetail plandetail) {
			logger.debug
				("들어온 plandetail : {}", plandetail.getId()+"/"+plandetail.getDay()+"/"+plandetail.getPno()+"/"+plandetail.getTurn());
			plandetailDao.create(plandetail);
			logger.debug("등록완료! plandetail : {}", plandetail.getId());
		}
}









