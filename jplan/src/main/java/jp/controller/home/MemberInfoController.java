package jp.controller.home;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import jp.model.MemberInfoDao;

@Controller
@SessionAttributes("email")
public class MemberInfoController {
	
	//logger
		private Logger log = LoggerFactory.getLogger(MemberInfoController.class);
			
		@Autowired
		private MemberInfoDao memberInfoDao;
		
		@RequestMapping("/admin/memberinfo")
		public String memberinfo(Model model, String eamil , HttpSession session) throws Exception {
			System.out.println("memberInfo");
			String email= (String) session.getAttribute("email");
			log.debug("세션 {}",email);
			model.addAttribute("memberInfoDao", memberInfoDao.memberinfo(email));
			return "admin/memberinfo";
		}
}