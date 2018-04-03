package jp.controller.home;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import jp.bean.Plan;
import jp.bean.Plandetail;
import jp.model.PlanDao;
import jp.model.PlandetailDao;

@Controller
public class PlanController {
	
	Logger log = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	private PlanDao planDao;
	
	@Autowired
	private PlandetailDao plandetailDao;
	

    
    //일정 조회
    @RequestMapping(value="/plan", method=RequestMethod.GET)
    public String plan(Plan plan, int no, Model model, HttpSession session) throws Exception{
    	log.debug("들어온 no: {}", no);
    	int mno = (Integer)session.getAttribute("no");
    	
    	planDao.lookPlus(no, mno);
    	
    	plan = planDao.select(no);
    	model.addAttribute("plan", plan);

    	
    	return "plan";
    }
   
}








