package jp.controller.home;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

@Controller
@SessionAttributes("email")
public class MemberdeleteController{
	
	private Logger log = LoggerFactory.getLogger(MemberdeleteController.class);

	
	@Autowired
	private jp.model.MemberDeleteDao MemberDeleteDao;
	
	@RequestMapping("/admin/member_delete")
	public String memberdelete(Model model, String eamil , HttpSession session) {
		String email= (String) session.getAttribute("email");
		log.debug("세션 {}",email);
		model.addAttribute("MemberDeleteDao", MemberDeleteDao.memberdelete(email));
		return "admin/member_delete";
	}

}