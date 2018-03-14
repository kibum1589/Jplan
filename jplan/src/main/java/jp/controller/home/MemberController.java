package jp.controller.home;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import jp.bean.Member;
import jp.model.MemberDao;

//@Controller
public class MemberController {
	
	@Autowired
	MemberDao memberDao;

	public void setMemberDao(MemberDao memberDao) {
		this.memberDao = memberDao;
	}
	
	/**
	 * 
	 * @param member
	 * @param request
	 * @return
	 */
	@RequestMapping
	public String login(Member member,HttpServletRequest request) {
		if(!memberDao.login(member))
			request.getSession().setAttribute("loginFlag", member.getEmail());
			
		return "redirect:home";
	}
	
	/**
	 * 
	 * @param member
	 * @return
	 */
	@RequestMapping
	public String sign(Member member) {
//		if(memberDao.sign(member))
			return "redirect:home";
	}
	
	/**
	 * 
	 * @param member
	 * @return
	 */
//		@RequestMapping
//		public String sign(Member member) {
//			if(memberDao.sign(member))
//				return "redirect:home";
//		}
}
