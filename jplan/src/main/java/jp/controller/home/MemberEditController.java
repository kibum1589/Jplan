package jp.controller.home;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import jp.bean.Member;
import jp.model.MemberEditDao;

@Controller
public class MemberEditController {
	
	@Autowired
	private MemberEditDao memberEditDao;
	
	public void setMemberEditDao(MemberEditDao memberEditDao) {
		this.memberEditDao = memberEditDao;
	}
	
	@RequestMapping(value="/admin/member_edit",method=RequestMethod.GET)
	public String memberedit() {
		return "admin/member_edit";
	}

	@RequestMapping(value="/admin/member_edit", method=RequestMethod.POST)
	public String memberedit(Model model, HttpServletRequest request, HttpServletResponse response) throws Exception{
		Logger log = LoggerFactory.getLogger(this.getClass());
		log.info("들어옴");
		log.debug("수정세션정보={}",request);
		String email = (String)request.getSession().getAttribute("email");
		log.debug("email세션={}",request);
		
		if(email != null ){
			log.debug("수정성공");
			model.addAttribute("memberedit", memberEditDao);
			return "admin/memberinfo";
		}else{
			log.debug("수정실패");
			model.addAttribute("memberedit", memberEditDao);
			return "admin/member_edit";
		}
		
	}
}
