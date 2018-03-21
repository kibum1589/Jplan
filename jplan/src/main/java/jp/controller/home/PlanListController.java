package jp.controller.home;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import jp.model.PlanDao;

@Controller
public class PlanListController {

	@Autowired
	private PlanDao planDao;
	
	 // 일정 리스트 보기
    @RequestMapping("/planlist")
    public String planlist(Model model) throws Exception{
       model.addAttribute("planlist", planDao.list());
        return "planlist";
    }
}






