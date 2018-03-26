package jp.controller.home;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.hibernate.Session;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import jp.bean.Member;
import jp.model.MemberDao;
import jp.model.MemberEditDao;
import jp.model.MemberInfoDao;

@Controller
public class MemberEditController {
	@Autowired
	private MemberDao memberDao;
	
	@Autowired
	private MemberEditDao memberEditDao;
	
	@Autowired
	private MemberInfoDao memberInfoDao;
	
	public void setMemberEditDao(MemberEditDao memberEditDao) {
		this.memberEditDao = memberEditDao;
	}
	
	//자신의 정보를 띄어 주기 위해서
	@RequestMapping(value="/admin/member_edit",method=RequestMethod.GET)
	public String memberedit(HttpSession session) {
		//세션을 추가해서 이메일로 정보를 받아와서 세션에 등록된 이름을 추가해준다.
		String email=(String)session.getAttribute("email");
		Member member=new Member(email);
		member=memberDao.infom(member);
		session.setAttribute("member",member);
		return "admin/member_edit";
	}

	@RequestMapping(value="/admin/member_edit", method=RequestMethod.POST)
	public String memberedit(Model model, HttpServletRequest request, HttpServletResponse response,HttpSession session,
			String pw, String name, String email) throws Exception{
		Logger log = LoggerFactory.getLogger(this.getClass());
		//컨트롤러에서 파라미터이름에 맞춰서 파라미터를 받은다음
		//멤버객체를 하나 만들고 setEmail이런식으로 세팅하고 넘겨주면됨 
		Member member = new Member();
		email=(String)session.getAttribute("email");
		name = request.getParameter("name");
		pw = request.getParameter("pw");
		member.setEmail(email);
		member.setName(name);
		member.setPw(pw);
		
		log.debug("이름={}",name);
		log.debug("수정 하려는 이름{}",name);
		log.debug("수정성공");
		//입력받은 정보를 디비에 넣어주기 위해서 
		model.addAttribute("memberedit", memberEditDao.memberedit(member));
		//받아온 정보를 바로 띄워 주기 위해서 
		model.addAttribute("memberInfoDao",memberInfoDao.memberinfo(email));
		return "admin/memberinfo";

	}
}
