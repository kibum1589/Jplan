package jp.controller.home;

import java.util.List;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import jp.bean.Plan;
import jp.bean.Plandetail;
import jp.model.PlanDao;
import jp.model.PlandetailDao;

@Controller
public class MyplanController {
	
	@Autowired
	private PlanDao planDao;
	
	@Autowired
	private PlandetailDao plandetailDao;
	
	@RequestMapping("/myplan")
	public String myplan() {
		return "myplan";
	}

	@RequestMapping(value = "plan", method = RequestMethod.GET)
	public void plan(@RequestParam int no, Model model){
		
		model.addAttribute("plan", planDao.select(no));
	}
		
	@RequestMapping(value = "plandetail", method = RequestMethod.GET)
	public void plandetail(@RequestParam int pno, Model model) {
		
		model.addAttribute("plandetail", plandetailDao.select(pno));
	}
}







