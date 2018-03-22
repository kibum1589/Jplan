package jp.controller.home;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import jp.model.MemberListDao;

@Controller
public class MemberListController {
	//logger
	private Logger log = LoggerFactory.getLogger(MemberListController.class);
		
	@Autowired
	private MemberListDao memberListDao;
	
	@RequestMapping("/admin/memberlist")
	public String memberlist(Model model) throws Exception {
		model.addAttribute("memberlist", memberListDao.memberList());
		return "admin/memberlist";
	}
}
