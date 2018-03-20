package jp.controller.home;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MemberInfoController {
	
	@RequestMapping("/admin/memberinfo")
	public String memberinfo() {
		return "admin/memberinfo";
	}
}
