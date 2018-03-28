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
import jp.security.Sha256;

@Controller
public class MemberdeleteController{
	
	private Logger log = LoggerFactory.getLogger(MemberdeleteController.class);

	@Autowired
	private MemberDeleteDao memberDeleteDao;
	
	@Autowired
	private MemberDao memberDao;
	
	@Autowired
	//@RequestMapping(value="/admin/member_delete",method=RequestMethod.GET)
	@RequestMapping("/admin/member_delete")

	public String MemberDelete() throws Exception{
		Logger log = LoggerFactory.getLogger(this.getClass());
//		int no1 = (Integer)session.getAttribute("no");
//		model.addAttribute("MemberDeleteDao", MemberDeleteDao.MemberDelete(no1));
		return "admin/member_delete";
	}
	@RequestMapping(value="/admin/member_delete",method=RequestMethod.POST)
	public String MemberDelete(Model model, HttpSession session, Member member) {
		int no = (Integer)session.getAttribute("no");
		String email = (String) session.getAttribute("email");
		
		//회원탈퇴 를 위한 암호화
		member.setPw(new Sha256().securi(member.getPw()));
		//loginDAO 를 member 로 바꾸었기 때문에 세션의 이메일을 받기위해 set을 사용!
		member.setEmail(email);
		log.debug("회원탈퇴 넘버 = {}",no);
		log.debug("회원탈퇴 이메일 = {}",email);
		
		if(memberDao.loginDAO(member)) {
			log.debug("회원탈퇴 멤버 = {}",member);
			log.debug("회원탈퇴 Dao = {}",memberDao);
			log.debug("탈퇴성공");
			boolean result = memberDeleteDao.MemberDelete(no, email);
			//result = memberDao.loginDAO(member);
			log.debug("회원탈퇴 result = {}",result);
			session.invalidate();
			//session.removeAttribute("no");
			
			return "home";
		}else {
			log.debug("탈퇴실패");
			return "admin/member_delete";
		}
		
		
	}
	

}