package jp.controller.home;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import jp.bean.PageCalculator;
import jp.bean.Plan;
import jp.model.PlanDao;

@Controller
public class PlanListController {

	@Autowired
	private PlanDao planDao;
	
	 // 일정 리스트 보기
    @RequestMapping("/planlist")
    public String planlist(Model model, HttpServletRequest request) throws Exception{
    	//PageCalculator를 이용하여 페이징 계산을 간편하게 처리
    	PageCalculator pc = new PageCalculator(request);
    	
   	 	int count;
		if(pc.isSearchMode())
			count = planDao.getCount(pc.getSort(), pc.getKeyword());
		else
			count = planDao.getCount();
		
		pc.setCount(count);
		pc.calculate();
	 	
		List<Plan> list;
		if(pc.isSearchMode()){
			list = planDao.find(pc.getSort(), pc.getKeyword(), pc.getSno(), pc.getEno()); 
		}
		else{
			list = planDao.list(pc.getSno(), pc.getEno()); 
		}
    	
		model.addAttribute(pc);
    	model.addAttribute("planlist", list);
        return "planlist";
    }
}






