package jp.controller.home;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import jp.bean.Plan;
import jp.bean.Plandetail;
import jp.model.PlanDao;
import jp.model.PlandetailDao;

@Controller
public class PlanController {
	
	@Autowired
	private PlanDao planDao;
	
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
    
    
    @RequestMapping(value="/plan", method=RequestMethod.GET)
    public String plan(int no, Model model) throws Exception{
    	model.addAttribute("plan", planDao.select(no));
        return "plan";
    }
   
}