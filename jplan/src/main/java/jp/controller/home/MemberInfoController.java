package jp.controller.home;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import jp.bean.Member;
import jp.model.MemberDao;

@Controller
public class MemberInfoController {

	@RequestMapping("/admin/memberinfo")
	public String memberinfo() {
		return "admin/memberinfo";
	}
	
	private MemberDao memberDao;
	public void setMemberDao(MemberDao memberDao) {
		this.memberDao = memberDao;
	}
	
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String email = request.getParameter("email");
		Member member = memberDao.info(email);
		
		ModelAndView mv = new ModelAndView("/WEB-INF/view/admin/memberinfo.jsp");
		//request.setAttribute("mdto", mdto);
		mv.addObject("mdto", member);
		return mv;
	}
}
