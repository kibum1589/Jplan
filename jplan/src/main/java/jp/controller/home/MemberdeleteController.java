package jp.controller.home;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import jp.bean.Member;
import jp.model.MemberDao;
import jp.model.MemberDeleteDao;

@Controller
public class MemberdeleteController{
	
	private Logger log = LoggerFactory.getLogger(MemberdeleteController.class);

	@Autowired
	private MemberDeleteDao memberDeleteDao;
	
	@Autowired
	private MemberDao memberDao;
	
	//@RequestMapping(value="/admin/member_delete",method=RequestMethod.GET)
	@RequestMapping("/admin/member_delete")

	public String MemberDelete() throws Exception{
		Logger log = LoggerFactory.getLogger(this.getClass());
//		int no1 = (Integer)session.getAttribute("no");
//		model.addAttribute("MemberDeleteDao", MemberDeleteDao.MemberDelete(no1));
		return "admin/member_delete";
	}
	@RequestMapping(value="/admin/member_delete",method=RequestMethod.POST)
	public String MemberDelete(Model model, HttpSession session,String pw) {
		int no = (Integer)session.getAttribute("no");
		String email = (String) session.getAttribute("email");
		
		
		
		if(memberDao.loginDAO(email, pw)) {
			log.debug("탈퇴성공");
			boolean result = memberDeleteDao.MemberDelete(no);
			log.debug("block = {}",result);
			session.invalidate();
			//session.removeAttribute("no");
			
			return "home";
		}else {
			log.debug("탈퇴실패");
			return "/";
		}
		
		
	}
	

}