package jp.controller.home;

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
	
	@Autowired
	private PlanDao planDao;
	
	@Autowired
	private PlandetailDao plandetailDao;
	
//	@RequestMapping("/myplan")
//	public String myplan() {
//		return "myplan";
//	}

//	내 일정 조회하기, 일정 조회수 증가 처리
//    @RequestMapping(value="/myplan", method=RequestMethod.GET)
//    public String myplan(int no, Model model) throws Exception{
//    	model.addAttribute("plan", planDao.select(no));
//        return "myplan";
//    }
    
    //일정 조회
    @RequestMapping(value="/plan", method=RequestMethod.GET)
    public String plan(int no, Model model) throws Exception{
    	model.addAttribute("plan", planDao.select(no));
//    	model.addAttribute("plandetail", plandetailDao.pdlist());
        return "plan";
    }
   
}