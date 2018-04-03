package jp.controller.home;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import jp.bean.PageCalculator;
import jp.bean.Plan;
import jp.bean.Plandetail;
import jp.model.PlanDao;
import jp.model.PlandetailDao;

@Controller
public class MyPlanController {
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	PlanDao planDao;
	
	@Autowired
	PlandetailDao plandetailDao;

	// 내 일정보기 포스터 내보내기
	@RequestMapping("myplan")
	public String  myplan(HttpSession session, Model model, HttpServletRequest request) throws Exception {
		
		int mno = (Integer)session.getAttribute("no");
		
		PageCalculator pc = new PageCalculator(request);
		
		int count = planDao.getMyCount(mno);
		
		pc.setCount(count);
		pc.calculate();
		
		List<Plan> list =  planDao.getPlan(mno, pc.getSno(), pc.getEno());
		
//			list = planDao.list(pc.getSno(), pc.getEno()); 
		
		
		
		model.addAttribute("pc", pc);
		model.addAttribute("planList", list);
		
		return "myplan";
	}
	
	// 상세일정 ajax
	@RequestMapping("myplan/detail")
	public void myplanDetail(int pno, HttpServletResponse response) throws IOException {
		logger.debug("들어온 pno {}",pno);
		List<Plandetail> list =  plandetailDao.pdlist(pno);
		
		
		PrintWriter writer = response.getWriter();
		 
		
		if(list.size()==0) {
			writer.print("nothing");
			writer.close();
		} 
		
		else {
			
			JSONArray jsonArr = new JSONArray();
			for(Plandetail plan : list) {
				JSONObject jsonObj = new JSONObject();
				jsonObj.put("no", plan.getNo());
				jsonObj.put("pno", plan.getPno());
				jsonObj.put("pid", plan.getPid());
				jsonObj.put("turn", plan.getTurn());
				jsonObj.put("day", plan.getDay());
				
				jsonArr.add(jsonObj);
			}
			writer.print(jsonArr);
		}
		
		
		
	}
}
