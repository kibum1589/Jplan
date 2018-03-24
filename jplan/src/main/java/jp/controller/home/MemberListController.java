package jp.controller.home;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import jp.bean.Member;
import jp.bean.PageCalculator;
import jp.bean.Plan;
import jp.model.MemberDao;
import jp.model.MemberListDao;

@Controller
public class MemberListController {
	//logger
	private Logger log = LoggerFactory.getLogger(MemberListController.class);
		
	@Autowired
	private MemberListDao memberListDao;
	
	//회원 리스트 보기
	@RequestMapping("/admin/memberlist")
	public String memberlist(Model model, HttpServletRequest request) throws Exception {
		//PageCalculator를 이용하여 페이징 계산을 간편하게 처리
    	PageCalculator pc = new PageCalculator(request);
    	
    	int count;
		if(pc.isSearchMode())
			count = memberListDao.getCount(pc.getSort(), pc.getKeyword());
		else
			count = memberListDao.getCount();
		
		pc.setCount(count);
		pc.calculate();
	 	
		List<Member> list;
		if(pc.isSearchMode()){
			list = memberListDao.find(pc.getSort(), pc.getKeyword(), pc.getSno(), pc.getEno()); 
		}
		else{
			list = memberListDao.memberList(pc.getSno(), pc.getEno()); 
		}
		 
   		model.addAttribute("pc", pc);
   		model.addAttribute("member", count);
		model.addAttribute("memberlist", list);
		return "admin/memberlist";
	}
}
