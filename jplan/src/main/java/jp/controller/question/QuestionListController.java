package jp.controller.question;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import jp.bean.PageCalculator;
import jp.bean.Question;
import jp.model.QuestionDao;

@Controller
public class QuestionListController {
	
	@Autowired
	private QuestionDao questionDao;
	
	@RequestMapping("/questionlist")
	public String questionlist(Model model, HttpServletRequest request){
		
		//PageCalculator를 이용하여 페이징 계산을 간편하게 처리
    	PageCalculator pc = new PageCalculator(request);
    	
    	int count;
    	count = questionDao.getCount();
    	
    	pc.setCount(count);
    	pc.calculate();
	 	
		List<Question> list;
		list = questionDao.list(pc.getSno(), pc.getEno()); 
		
		model.addAttribute("pc", pc);
		model.addAttribute("questionlist", list);
		
		return "questionlist";
	}
	
}
