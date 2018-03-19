package jp.controller.home;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import jp.bean.Member;
import jp.model.MemberDao;

@Controller
public class MemberListController {
	
	private MemberDao memberDao;
	public void setMemberDao(MemberDao memberDao) {
		this.memberDao = memberDao;
	}
	

	@RequestMapping("/admin/memberlist")
	public String memberlist(Model model) throws Exception {
		List<Member> list = memberDao.list();
		model.addAttribute("list",list);
		return "admin/memberlist";
	}
	
	
	
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
	 	List<Member> list = memberDao.list();
	
	 	ModelAndView mv = new ModelAndView("/WEB-INF/view/admin/memberlist.jsp");
	 	//request.setAttribute("list", list);
	 	mv.addObject("list", list);
	 	return mv;
	}
}
