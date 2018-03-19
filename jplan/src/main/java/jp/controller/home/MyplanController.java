package jp.controller.home;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import jp.bean.Plan;
import jp.model.PlanDao;
import jp.model.PlandetailDao;

@Controller
public class MyplanController {
	private Logger log = LoggerFactory.getLogger(getClass());
	
	@Autowired
	private PlanDao planDao;
	
	@Autowired
	private PlandetailDao plandetailDao;
	
//	@RequestMapping("/myplan")
//	public String myplan() {
//		return "myplan";
//	}

	@RequestMapping(value = "/myplan", method = RequestMethod.GET)
	public String myplan(@RequestParam("no") int no, Model model){
		
		model.addAttribute("plan", planDao.select(no));
		return "myplan?no="+no;
	}

	
	
}
