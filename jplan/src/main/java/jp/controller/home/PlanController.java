package jp.controller.home;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
	
//	@Autowired
//	private PlandetailDao plandetailDao;
	
	@RequestMapping("/myplan")
	public String myplan() {
		return "myplan";
	}
	
	@RequestMapping("/planlist")
	public String planlist() {
		return "planlist";
	}

	// 내 일정 상세보기, 일정 조회수 증가 처리
    @RequestMapping(value="select", method=RequestMethod.GET)
    public ModelAndView select(@RequestParam int no, String email) throws Exception{
        // 조회수 증가 처리
        planDao.lookPlus(no, email);
        // 모델(데이터)+뷰(화면)를 함께 전달하는 객체
        ModelAndView mv = new ModelAndView();
        // 뷰를 myplan.jsp로 설정
        mv.setViewName("myplan");
        // 뷰에 전달할 데이터
        mv.addObject("plan", planDao.select(no));
        return mv;
    }
    
    // 일정 리스트 보기
    @RequestMapping("list")
    public ModelAndView list() throws Exception{
        List<Plan> list = planDao.list();
        // ModelAndView - 모델과 뷰
        ModelAndView mv = new ModelAndView();
        // 뷰를 planlist.jsp로 설정
        mv.setViewName("planlist"); 
        // 데이터를 저장
        mv.addObject("list", list);
        // planlist.jsp로 List가 전달된다.
        return mv; 
    }
}







